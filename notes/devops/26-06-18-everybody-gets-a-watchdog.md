
Today I see the last Danish article is three days old. Something is not right. I look in the DB. No new articles have been received since three days indeed. I look at the running processes on the server. The `crawler_de` is stuck trying to download an article. And since the crawlers are run in sequence, one at a time, none of the other crawlers gets the chance to do anything.

## The lock

It's worse than "in sequence". Every crawl — the hourly `da fr de` job, the thrice-daily batch for the other eight languages — runs under the same guard:

```
flock -n /tmp/zeeguu-crawl.lock $CRAWLER ...
```

One lock file. The `-n` means *non-blocking*: if someone already holds the lock, don't wait — just give up. That's a sensible guard against two crawls overlapping. 

But it has a failure mode I hadn't thought about: if a crawl gets **stuck** instead of finishing, it never releases the lock, and every scheduled run after it does `flock -n`, finds the lock held, and exits **silently**. No crash. No error. No email. Just three days of nothing, while the DB quietly stops growing.

The process table tells the whole story — a single tree, three days old:

```
flock -n /tmp/zeeguu-crawl.lock crawl_all_in_parallel.sh da fr de   (3 days)
 └─ docker compose run --name crawler_de ... crawl.py de --max-time 1500
     └─ python crawl.py de        ← alive, blocked, holding the lock
```

## Why it could hang forever

The crawler *does* have a time limit — `--max-time 1500` (25 minutes). But it's only checked **between** articles, at the top of the loop. The hang wasn't between articles; it was **inside** one. The German crawl downloaded a chip.de article and started the post-download pipeline, and somewhere in there a network call with no timeout of its own simply never returned. The loop never came back around to check the clock. The 25-minute budget never got the chance to trip.

Here's the part that still makes me laugh. Afterwards I audited every outbound call in that pipeline. The *heavyweight* ones — the readability server, the stanza tokenizer, the LLM that rewrites each article into two difficulty levels — **all had timeouts already.** The one that didn't was the throwaway step: fetching the article's lead image to check it isn't a tiny icon. A bare `requests.get(top_image)`, no timeout. The chip.de image host accepted the connection and then never sent a single byte of the body, and that one disposable line — not the LLM, not the tokenizer — is what froze the entire crawler for three days. The cheapest call in the pipeline took the whole thing down.

So the rule was real but toothless: a deadline you only check when you're already making progress is no deadline at all.

## Everybody gets a watchdog

The fix is two timeouts, layered — *everybody gets a watchdog*.

**1. Every article gets one.** A `SIGALRM` armed around each single article (180 seconds). If one article blocks past the ceiling, the alarm fires *inside* the stuck call, we abandon **that one article** — roll back its half-written transaction, log it, report it to Sentry — and the crawl moves straight on to the next. One bad article is now a skipped line in the log, not a three-day outage.

**2. Every crawl gets one too** — a backstop, in case a hang is so deep even SIGALRM can't interrupt it. Each language's container runs wrapped in `timeout`, escalating: **SIGTERM** at the ceiling → **SIGKILL** if it ignores that → `docker rm -f` to sweep up the corpse. So no crawl can hold the lock for longer than its ceiling, no matter how it dies.

The first layer keeps healthy crawling flowing. The second guarantees the lock is *always* released. Either one alone would have prevented this; together they're belt and suspenders.

## The pattern, in code

The per-article watchdog is a small, old Unix trick: `signal.alarm`. You ask the kernel to deliver a `SIGALRM` after N seconds; your handler turns that signal into a normal Python exception, which then unwinds the stack straight out of whatever call was stuck.

```python
import signal

class ArticleTimeout(Exception):
    pass

# runs in the main thread when SIGALRM fires
def _on_alarm(signum, frame):        
    raise ArticleTimeout()

# install the handler once
signal.signal(signal.SIGALRM, _on_alarm)     



for item in feed_items:
    
    # arm: "this article gets 180 seconds"
    signal.alarm(180)                    
    try:
        article = download_and_process(item) # ← the step that hung for 3 days
        
        # finished in time — disarm NOW, so the
        # alarm can't roll back what we just saved
        signal.alarm(0)                  
        index_in_elasticsearch(article) 
    
    except ArticleTimeout:
        session.rollback()                   # abandon just this one, leave the session clean
        log("article exceeded its budget; skipping")
        continue                             # ...and on to the next article
    finally:
        signal.alarm(0)                      # always disarm, on every path out
```

The thing that makes this *work* where the old between-articles time check didn't: when the alarm fires, the kernel interrupts the blocked syscall (the network read that was never going to return), Python runs `_on_alarm`, and the `raise` propagates up through the stuck call into our `except`. A deadline that can fire *while you're blocked*, not only while you're looping.

Two subtleties, both of which I got wrong first and a review caught:

- **Disarm the instant the risky part finishes** — that `signal.alarm(0)` before `index_in_elasticsearch`. Otherwise a near-180s article could be fetched and saved, and *then* the alarm fires during indexing, and the `except` rolls back an article we'd already successfully stored.
- **Disarm in `finally`, every path.** A leftover armed alarm from one iteration would otherwise fire in the middle of the *next* one.

And the catch that's the whole reason layer 2 exists: `signal` only works on the **main thread**, and it can only interrupt things that are *interruptible*. A C-extension spinning without releasing the GIL, or a truly uninterruptible syscall, sails right past `SIGALRM` — which is exactly why there's a blunt `timeout` wrapping the whole container underneath it.

## But why not just give every call a timeout?

That was my first instinct too, and it *is* the proper root-cause fix: a timeout on each outbound call fails fast with a real error ("readability timed out") and abandons only the slow *step*, not the whole article. We should do it — there's already at least one bare `requests.get` in there with no timeout at all. But it isn't enough on its own. "Every call has a timeout" is an invariant you have to maintain *forever*, across every library and every future line of code — miss one and the hole silently reopens. And a per-call timeout isn't even a real bound: clients retry internally (10s × 5 retries is still minutes), and not every hang is a socket read — connection-pool exhaustion, a stuck DNS lookup, a deadlock, a C-extension spinning all sail right past it.

So: per-call timeouts are the precision instrument, the watchdog is the net under the trapeze. You want both — the net is what turns a missed timeout into a *skipped article* instead of a *three-day outage*.

## Getting it running again

The immediate cure was manual: `docker rm -f crawler_de` to kill the wedged container, then kill the `flock`/script tree to release the lock. The moment the lock was free, a manual crawl picked straight back up — **31 fresh Danish articles within twenty minutes**, Politiken and DR flowing again, and the other languages following on the next scheduled batch.

The permanent cure is the watchdogs above: [zeeguu/api#653](https://github.com/zeeguu/api/pull/653).

## The scarier part: three days of silence

The hang is one thing. The *three days* is another. How does an entire content pipeline stop, and nobody hears about it?

There *was* a monitor — `feed_health_check.py`, running nightly, built to warn about stale feeds. It never said a word. When I dug in, it had failed at three separate layers, each quietly:

1. **Wrong question.** It checks individual feeds against a *3-day* staleness threshold. Our feeds had been frozen only ~2.5 days when it ran each night — *under* the line. It wouldn't have flagged anything until day four.
2. **Dead channel #1.** Its whole design is "print a warning to stdout, let cron email it." But every cron job goes through a wrapper, `run_task.sh`, whose last line redirects stdout *and* stderr into a log file. The warnings it dutifully printed landed in `/var/log/zeeguu/…` and died there — for months.
3. **Dead channel #2.** Even if cron *had* seen the output, mail doesn't leave the host. `echo … | mail …` exits 0 and nothing ever arrives. Two dead channels stacked back to back.

So the alarm wasn't *too quiet*. It was a speaker with no cone, wired to an amp with no power.

The fix is a second monitor that asks the *right* question through a channel that *works*: a **liveness heartbeat**. Every couple of hours it asks one thing — "what's the newest article we've crawled across *all* feeds?" — and if the answer is more than a few hours old, the whole crawler is presumed dead. Crucially, it sends the alert the only way that actually reaches a human here: through the app's *own* SMTP (the same code that already sends verification and report emails), not the host's mail, not cron's swallowed stdout. While I was in there I rewired the old `feed_health_check` onto that same path, so it finally has a voice too.

Heartbeat + a working channel: [zeeguu/api#654](https://github.com/zeeguu/api/pull/654); the cron entry lives in the ops repo.

## The lesson

Any unbounded wait sitting behind a shared lock is a time bomb. The timeout isn't a nice-to-have — it's the single thing that decides whether one stuck network call becomes *"one article got skipped"* or *"the whole system was silently dead for three days and nobody noticed."* And a deadline is only a deadline if it can fire **while you're stuck**, not only while you're making progress.

And a monitor you never see fire is not a monitor — it's a comforting decoration. Make sure your alarms can actually reach you, because the day you need them is the worst possible day to discover they can't.

## Future work: why it's still single-file

The crawlers run one language at a time, in sequence. It's tempting to read that as timidity, but it's deliberate — and the reason isn't the feeds. There's no politeness delay in the loop; we hit sources as fast as we can. The real constraint is downstream: every article gets tokenized by a shared **Stanza** service that the *live* app also leans on (opening an article, My Articles). Run crawls in parallel and they saturate the tokenizer, and suddenly readers feel it. The `flock` that bit us in the first place exists precisely to keep one crawl from stepping on the next.

So if we ever want to go faster, the bottleneck to widen is the tokenizer, not the orchestration — and the *shape* of "faster" matters. Multiple crawler **processes** (one per language) would each keep their own main thread, so the `SIGALRM` watchdog above keeps working per-process; we'd just be trading the `flock` for a pool sized to whatever Stanza can actually take. Going parallel with **threads** instead is the seductive trap: it's less code, but `signal.alarm` is main-thread-only, so the per-article watchdog silently evaporates and every hang has to be caught by per-call timeouts instead. Which loops us right back to the lesson of this whole episode — the day you reach for threads is the day the net under the trapeze quietly disappears, so you'd better have already put a timeout on every single call. Starting, apparently, with the one that fetches a thumbnail.

