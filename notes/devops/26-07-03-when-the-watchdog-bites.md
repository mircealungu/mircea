
Someone mentions that opening **Settings → Scheduling** takes fifteen seconds. By the time I go to look, it's fast again. A heisenbug: the kind that's already gone by the time you arrive, which makes you doubt it was ever real. But fifteen seconds is too specific to be nothing, so I go digging through the logs.

## Not the page, and not its endpoint

The Scheduling page barely does anything. On open it fetches one thing — `user_preferences` — and shows a spinner until it comes back. So I check that endpoint on the server. It's returning `200` in well under a second, a 200-byte payload, every single time. The other call the page fires on every navigation, `count_of_user_words_recommended_for_practice`, is just as quick.

So I go looking for slow requests in the access log directly — and here's the first trap. Our gunicorn access log writes its timestamp *when the response finishes*, and there's no duration field. A request that took fifteen seconds and one that took fifteen milliseconds look identical in that log. I spent a good while convinced nothing was slow, because by that measure nothing ever is. The access log can tell you *what* was served and *whether* it succeeded, but not *how long it took*. For latency it's blind.

## The log that could actually see

The signal was one layer up, in nginx's `error.log`:

```
upstream timed out (110: Connection timed out) while reading response header
  from upstream ... request: "GET /count_of_user_words_recommended_for_practice"
upstream timed out ... request: "GET /user_articles/recommended"
upstream timed out ... request: "POST /translate_word/de/en"
```

Three *different* endpoints, timing out within the same minute, across several users. That's the tell. When one endpoint is slow, you suspect that endpoint. When endpoints that have nothing to do with each other all stall at once — a preferences read, an article list, a translation — nothing is wrong with any of them individually. What's wrong is *underneath* them: the API had run out of workers. Every worker was stuck on the same thing, and everything else was queued behind them, waiting for a free one that never came until nginx gave up.

Stuck on what? Every one of those endpoints eventually needs the **Stanza** tokenizer. And at the exact minutes of the timeouts, the API log was full of `Failed to resolve 'stanza'`, `NewConnectionError`, `Max retries exceeded`. Stanza was gone. Not slow — *gone*, mid-restart, for the fifteen to thirty seconds it takes to come back and reload its models. While it was down, the API's handful of workers all blocked waiting for it, and the whole app went quiet.

## Who keeps killing Stanza?

The restart was a clean `SIGTERM`, not a crash — `OOMKilled: false`, exit 0. Something was *deliberately* stopping the container. The autoheal log gave it away, and the timestamps matched the restarts to the second:

```
15-06-2026 08:07:45  Container /api-stanza-1 found to be unhealthy - Restarting
14-06-2026 08:14:39  Container /api-stanza-1 found to be unhealthy - Restarting
```

And here's the part that made me put my head on the desk. Last month I wrote a whole post about how [everybody gets a watchdog](26-06-18-everybody-gets-a-watchdog) — timeouts and restarts as the net under the trapeze. This is the same idea wearing the black hat. `autoheal` watches every container's health check and restarts anything that goes unhealthy. Exactly what you want — until the health check lies.

Live Stanza runs a **single** gunicorn worker (tokenization is CPU-bound and each worker holds gigabytes of models, so the count was kept low). Its health check is a plain `curl -f localhost:5001/health` with a **five-second timeout**, three strikes, thirty seconds apart. With one worker, a single in-flight tokenize *is* the whole service — while it's tokenizing a long text, `/health` sits in the same queue and can't answer. Five seconds pass. Strike. Three strikes over ninety seconds and Docker declares the container unhealthy, and autoheal, doing precisely its job, shoots it.

The container wasn't sick. It was **busy**. And the cure — a thirty-second restart with a full model reload — was far worse than the "disease" of a health ping arriving late.

## I was sure it was the crawl. The data said otherwise.

The unhealthy windows clustered each morning, right after the `06 10 * * *` cron — an eight-language crawl. So I had my culprit. We run two Stanza containers precisely so batch work can't hurt live traffic (`stanza` for the app, `stanza_crawl` for the crawler), but they share one sixteen-core box with no CPU limits between them, and the story wrote itself: the morning crawl saturates the CPU, the live Stanza's one worker can't get a timeslice to answer a health ping within five seconds, and the trap springs. It fit the timing perfectly. I even started throttling the crawl's CPU share to fix it.

Then I did the thing I should have done first, and looked at the numbers. I pulled a week of `node_exporter` and `cadvisor` history and correlated host load against per-container CPU — and the story fell apart. At the single busiest moment in seven days the host was **fifty-three per cent** CPU-busy — eight of sixteen cores — with essentially zero I/O wait. `stanza_crawl` never exceeded **one or two cores**. It *can't*, really: the crawl runs one language at a time (a `flock`, the very one from last month's post), its tokenizer is single-worker, and most of its wall-clock is spent waiting on the network — article downloads and LLM calls. It is structurally incapable of saturating this machine. The load average had fooled me: it read twelve-point-eight at the peak, but load average counts processes *waiting*, not cores *burning*, and only half the cores were actually warm.

So the crawl never ate the CPU out from under live Stanza — there was no contention to speak of. The morning clustering was a coincidence of *traffic*, not load: mornings simply bring more readers, more articles opened, more big-text tokenizes, and it only takes one nine-thousand-character article landing on the single worker to block `/health` past five seconds. The cause was never the crawl. It was the same single-worker-plus-tight-timeout fragility, tripped by nothing more exotic than a long article at a busy hour — and the CPU-throttling I'd so smugly added was defending against a contention that doesn't occur. I tore it back out.

That's its own lesson, filed next to the rest: an intuition that fits the timing is not a measurement, and "it clusters with the crawl" is a hypothesis, not a cause. The monitoring I'd bolted on to *confirm* the story is the thing that killed it — the best argument I know for measuring before you fix, not after.

## The fix, in two parts

**Give the health check a way to be answered.** Live Stanza gets a second worker (`GUNICORN_WORKERS: "2"`), so a single tokenize no longer monopolises the whole service — while one worker is deep in a text, the other can still answer `/health`. This isn't a *guarantee* of a free worker, and it's worth being honest about why: the live API runs four workers of its own and can drive several tokenizes at Stanza simultaneously, so under a real spike both workers can be busy at once. What the second worker buys isn't "always idle" — it's turning "one slow tokenize blocks the probe" into "you'd need several slow tokenizes overlapping for the whole detection window." It isn't free, either: `preload_app` is off (it hangs after fork), so workers don't share model memory, and a warmed worker with all fifteen language pipelines loaded measures ~5.9 GB — so a second worker means raising the container's memory ceiling to 16 GB, not squeezing two into the old ten. Every worker is a full copy of the models, which is exactly why "just add workers" is a surprisingly expensive way to buy a spare — and why decoupling the health probe from the worker pool entirely is the better long-term answer.

**Give the busy worker a little slack — but pick the number from data.** My first instinct was to loosen the probe generously — thirty-second timeout, five retries — and that's the opposite mistake: at thirty-by-five a container that's *genuinely* dead takes two and a half minutes to be noticed, because "unhealthy" means `retries × interval` of consecutive failures. My second instinct was ten seconds, chosen by feel. Then I remembered the service records how long each tokenize takes, and I went and looked instead of guessing. Across ~41,000 real requests, only 0.11% took longer than five seconds — so five seconds wasn't a generous ceiling at all, it was roughly the *p99.9*, and the original health check was tripping on the fat end of normal. The legitimate slow tail — big articles, nine to twenty-eight thousand characters — ran up to about twelve seconds. That's the number that matters: a timeout has to clear real work, not the median. So the per-probe timeout lands at **fifteen seconds** — comfortably above the twelve-second tail, comfortably below anything that would mean the thing is actually wedged. I keep the standard thirty-second interval and three retries, so a real outage is still caught in sixty to ninety seconds (three consecutive failures, thirty seconds apart, plus wherever the failure falls in the probe cycle) — same as before, since I only widened the single-probe ceiling. The retries were never the fix anyway; the extra worker is. Not because it guarantees an idle worker — the live API has four workers of its own and can fire several tokenizes at once — but because the probe now only has to wait out whatever tokenizes happen to be in flight, each of them fast, instead of sitting behind the one and only worker there used to be. For the probe to miss three times running, Stanza would have to be saturated *and* slow for a solid ninety seconds — and that isn't a false alarm, it's a real problem worth restarting.

And that's the whole fix — no CPU throttling, no crawl in the story at all. Two knobs on one container: a second worker so the probe has someone to answer it, and a timeout set from the actual latency the service produces. The most durable version of that second knob isn't even about worker counts — it's about not asking a busy worker to answer liveness at all, which is where this is headed next.

The changes: [zeeguu-ops#10](https://github.com/mircealungu/zeeguu-ops/pull/10) for the compose file, [zeeguu/api#662](https://github.com/zeeguu/api/pull/662) for the Dockerfile's health check, and [zeeguu/api#663](https://github.com/zeeguu/api/pull/663) for a tokenize-latency histogram — so the *next* timeout gets tuned from data too.

## The lesson

A health check answers one question — *is this container alive?* — and the whole system trusts the answer enough to kill and rebuild on it. So the question had better distinguish **broken** from **busy**, because those are opposites: one you want to restart, the other you want to leave alone to finish. A single-worker service can't tell them apart at all, because the one thing that proves it's alive — serving a request — is the same thing that stops it from answering the health probe. The timeout that felt "snappy" was really an instruction to shoot anything that dared to be under load.

And the watchdog itself is only ever as good as the question you point it at. Last time the moral was *add the watchdog* — the net that turns a stuck call into a skipped article. This time it's the mirror image: a watchdog wired to a bad signal doesn't just fail to help, it manufactures the outage it was installed to prevent. Same tool, opposite outcome, and the only difference is whether the thing it's watching can actually tell it the truth.
