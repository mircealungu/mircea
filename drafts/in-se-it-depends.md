# The _"In Software It Depends"_ Course

Alternative titles

- Skeptical Software Engineering

These are some notes about a potential master's course where we look at software technologies and discuss when do they make sense and when do they do not. The focus will be heavily on discussing pros and cons. 

The reason for this is that, in SE, a lot of the times, a new technology is proposed, is marketed well, and then the whole community falls heads over heels for it, and starts applying it everywhere. A bit like lemmgings. 

One sometimes also sees cargo-cult beliefs: if Google uses it, then we should also use it too. Even if the thinking should be exactly the opposite: if Google needs it, then very very likely, your little company does not need it. 

Sometimes it's because of marketing. Sometimes it's because technology-for-technology's sake. Sometimes is that, because the domain is so complex, any promise of help is met with a lot of hope. It might be because that extremely complex problems attract snake-oil-like simplistic solutions. And for many other reasons. But what's for sure is that, in the history of SE, a _hype-du-jour_ followed another. 

- UML
- Object-Oriented Programming (<-- this is the one I started with!)
- Map-Reduce
- ORMs
- NoSQL
- Microservices
- GraphQL
- The Blockchain
- The cloud
- GenAI for SE

Each one of the above, was a wonderful technology. Each one came with a simple promise. A great example. A super convincing "hello world". But as soon as you get outside of the beaten path of the given technology, as soon as you move away from the main use case. Probably a recommended reading here would be the *Spolsky* essay on *The Law of Leaky Abstractions*. 

These wonderful inventions and discoveries, can make your life better if applied in the right context, and can make your life much harder if applied where they don't belong. 

I guess if we were more accustomed with the Brooks essay, *"No Silver Bullet -- Essence and Accident in SE"* we might be a bit more skeptical of exaggerated claims. 

Or, if we were aware of ancient philosophy, we could use some info also from - Ancient Greece 
- Aristotle - the virtuous life is the middle way between extremes; 
- The cynics - they could argue for anything very convincingly; those philosophers that went to Rome and gave a lecture one evening about how the empire was the greatest; and the next evening about how it was the worst

## Goal

Teach the students to disentangle the exaggeration from the actually useful. Given them the chance to think for themselves, critically, against the mainstream opinion. 

## Why is SE prone to this kind of hype?

A game of incentives
 - complex problems attract easy solution salesman
 - hoping that by imitating 
 - developers like to tinker
 - attracting talented developers who want to work on cool stuff 
 - using well-known tech 

Proving things empirically is hard. Every case is different. 


## For whom is this?

This is for the CTO that wants to take the right decision for the long term. Not for the curious who wants to learn a new technology. 

However, you will need to be able to investigate, and decide, and convince.





## Case Studies


- Historical: Object Oriented Programming
- Types vs. No-types = Stefan Hanneberg readings
- Map-Reduce - 
- GraphQL: 
	- [Discussion about GraphQL](https://x.com/strzibnyj/status/1796442096355905542/photo/1, etc.) on Reddit
- **Microservices**
	- Amazon Prime team [switches to monolith from microservices](https://thenewstack.io/return-of-the-monolith-amazon-dumps-microservices-for-video-monitoring/) 
	- [Podcast](https://www.hanselminutes.com/847/engineering-stack-overflow-with-roberta-arcoverde) with a Roberta Arcoverde from StackOverflow about not going down the path to microservices ([somebody wrote an overview about this case](https://www.linkedin.com/pulse/decoding-stack-overflows-on-premises-monolith-dive-zia-tahir/)) 
	- Talk at JUG Zurich: migrating away from microservices: https://www.jug.ch/html/events/2025/from_many_to_one_zh.html
	- DHH Essay: [How to Recover from Microservices](https://world.hey.com/dhh/how-to-recover-from-microservices-ce3803cc)
		- 10min read
		- he talks about "it depends" - sure, but know your it depends
	- Migration to Monlith - Leotrim Zulfiu (https://www.jug.ch/html/events/2025/from_many_to_one_zh.html). Just talk title; no video :( 
- **Cloud Infrastructure**
	- The lichess case study
	- The 37 Signals Case Study
		- [We have left the Cloud](https://world.hey.com/dhh/we-have-left-the-cloud-251760fb), DHH
			- 7min read
		- [We stand to save 7m over five years for cloud exit](https://world.hey.com/dhh/we-stand-to-save-7m-over-five-years-from-our-cloud-exit-53996caa), DHH. 
			- 5min read
			- the cost of running the infra is so much higher than buying it!
		- [37Signals Cloud Spend in '22](https://dev.37signals.com/our-cloud-spend-in-2022/)
			- the cost of the relational database!
		- [Podcast discussion](https://37signals.com/podcast/leaving-the-cloud/)
		
- Blockchain
- Gen AI
	- The airline company that deployed ChatBots with their customer service and had to rollback 
- Single Page Applications


Further possible technologies: 
- "serverless", lambda functions, Elixir, Typescript
- whatever is at the top of the Gartner Hype Cycle now? 




# Project

- choose one of the technologies du jour, explain it, show where it works well, and write a critique, with counter-examples; e.g., going to the cloud <- coming from the cloud, lambda functions, etc.; find a case study, either online, or in an actual company where there was a need to backtrack from applying the wrong technology
- critically analyze an over-hyped technology's website or presentation...
- optional: prototype / find realistic case study

# Readings

- No Silver Bullet
- [The Law of Leaky Abstractions](https://www.joelonsoftware.com/2002/11/11/the-law-of-leaky-abstractions/), Spolsky
	- 15min read; a bit hard to understand for today's audience; we need fresh examples
	- assignment after reading; group spends 15min thinking of another and sends PR with their written example? my suggestions: terraform, docker
	- next time class discussion we spend time going through examples
	- lessons learned: importance of still understanding what's happening under the hood; 
		- reference to A Deepness in the Sky
- [The Majestic Monolith](https://signalvnoise.com/svn3/the-majestic-monolith/), DHH 
	- 10min read
	- to think about
		- *cargo-culting*
		- how to write code that makes us smile while we write it?
		- it's easy to silo knowledge in smaller systems?
	- to investigate
		- does FB really have a monolith?
	- 

- [Learning from the Object-Oriented Mania](https://lemire.me/blog/2024/05/14/learning-from-the-object-oriented-mania/) Short essay on Daniel Lemire's blog


# Further Ideas

- A special module of that course would be the "It is not new, anyway" module, in which we take one of the modern techniques, and show that very likely, there was a predecessor about 40 years ago, that everybody forgot about it (e.g. deep learning, server side rendering, document databases, etc.)
- A paired course, like Paolo's - where older CS students provide code-focused feedback to the beginners writing code


## To Investigate

- [Podcast w/ Dana Lawson](https://www.digitale-leute.de/interview/podcast-episode-18-dana-lawson-vp-engineering-at-github/) - Why new technologies don’t make companies smaller yet. [00:38:10]
- That Smalltalk elderly people team


## Learning Objectives

- arguing and debating both pro and con for a technology
- finding case studies for it
- the only way to be able to really argue for the cons, is to understand the tech well enough in the first place



## Notes

We as a professoin are iconoclasts. We like to break things and start again.

The problem is not these technologies. They are beautiful in it's own way. Each of them. I love OOP. I love the concept of the blockchain. But my theory is that there's a tendency to follow bandwagons and to apply the new thing everywhere. 

What was the story: google introduced map reduce; everybody is using map-reduce; later we find out: Google has stopped using it a while ago, because it did not work for them. 

Steve Jobs: https://fb.watch/tyXoiK310s/ - start with customer experience. 

Helge: Do you need a container when you're using Rust? Or a banana container?
![](../docs/assets/Pasted%20image%2020240726130135.png)

Can you believe everything that's claimed on the Xamarin homepage?