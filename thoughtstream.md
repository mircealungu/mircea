**May 27**

You must accept reality. You have to dance with the reality. You have to improvise with it. Yes-and it. 

**May 23** 

beating addiction with addiction: went with the colleagues for ice cream but got coffee instead :)

**May 22**

Now Sam Altman is not cool. Yesterday he was the savior. Today Musk is not cool. Yesterday he was the savior. Elisabeth Holmes. Sam Bankman-Fried. At some point the whole media ecosystem sings to one of these praises. At the next point we realize: they're not supermen, superwomen, or the prophets. In fact, they're as flawed as everybody. Sometimes more.

OO programming is all you need. Map-reduce is all you need. Bitcoin is all you need. Microservices is all you need. Generative AI is all you need. (Literally, there are people who believe that we won't need programming languages anymore. I must really get writing that paper about prompt engineering teams replacing of software engineering teams..). Each new technological end of the world turns out to be just another phase in our quest for the ultimate silver bullet. 

The same pattern over and over again with both people and technologies. 

How does the world not learn? I guess there's an eternal stream of naïve hopeful-hearted young people that are willing to believe. By the time they get older, and learn a thing or two, the new avalanche of youngsters fall into the same: personality cults, ponzi schemes, and techno-savior schemes. And the problem is that the *distributed society* has very little respect for experience. In the old days, there was respect for the elderly, so they might have not fallen so easily into the last hype. But that is not part of our societal fundamentals anymore. Still happens individually here and there, but I guess that's the patriarchy and matriarchy that we've done with. 

Sure, I do not think it was fun to live in a patriarchal society. It's too much waiting till one gets to have an opinion and freedom there. Then again, in a world as complex as ours, that might be good sometimes? Still... Jiro at 90 still does not leave the business to his son who's almost 70... he is still *not ready*... he still has to learn :)

**May 18**

*Uncopenhagenly* sunny today.  

**May 17**

Watched The Cowboy and the Frenchman with friends tonight. David Lynch is a dork. 


**May 16**

Lunch discussion. C. thinks that free will is a model from the point of view of a limited agent. Basically, from my point of view, C has free will because I can never predict his internal states and the way they will interact with the environment. Thus, for all the practical purposes, from the outside, for me, he has full control of his choices. 

This aligns with my understanding. From the society's POV it's exactly the same. Society also does not know anybody's internal state. So for all practical purposes, everybody has free will. The benefit of this? It allows us to have a legal system and build a civilization. Not a bad deal, you must admit :)

This also implies that an omniscient agent might not perceive us as having free will. I guess this is what Calvin was also trying to say? So Calvin was writing from the POV of God (and Arminius from the POV of humanity... and when you're human, it's really stupid to write from the POV of God. Thus, Arminius beats Calvin any day for breakfast). 

** 

Could an omniscient agent that knows the internal state of everybody not feel what everybody feels? And then, if it felt simultaneously all the feelings of all living, could it make anything of it? All the joy and the pain in the world at the same time. Impossible to imagine.  

**

In the same way in which free will is an assumption, the fact that we can be construed as individuals, is also an assumption. 



**May 15**

What makes us human? 

Discussing with a sociologist whom I tried to convince of my definition: not acting on our instincts and thinking about the future. Indeed, she countered with: lions do not act on their instincts even when, e.g, whey they get upset by their cubs who bite their tail, they don't kill them. I guess that's arguable. And the difference is in doing the things consciously. 

I think Peterson would say: sacrificing the present for the future consciously. 

In any case, her view was that creating meta-tools is something that no animal has ever been observed to do. Some animals use tools to do stuff, but that's it, but we never recorded an animal creating tools to create tools.

Then the discussion went to cultures and how different cultures 

So then I proposed that we might be able to use this most human trait to compare cultures. Isn't a culture that creates more meta-tools more advanced, and more human than another one? 



**May 5**

The joy of spring. 

The melancholy of knowing that the number of springs in your life is limited. 

The realization that their *limitness* is actually necessary for the joy.

** 

Orthodox Easter today. 

The ultimate message of christianity is one of hope. The story of Christ says that, not even after death one should give up hope. Hope is greater than death. 

And *"love is greater than hope"*. The arithmetic of christianity :)


**May 4**

Mesopotamia = ancient greek for *the land between the rivers*

Hippopotamus = ancient greek for *river horse*

Now, guess how does one say river in ancient greek. 

** 

Culture is the stories you tell. 

Nobody reads the law to learn how to live.
And virtually nobody reads philosophy for this purpose either.
Most will not remember twenty distinct principles from Marcus Aurelius. In fact many will probably not even finish the meditations. I know I tried multiple times.

But everybody can remember twenty essential stories.
This is why, culture is built on stories.

**May 3**

We teach scalability. We should teach downscaling. Otherwise we end up with everybody doing gigantic systems when they don't need to. Possible topic for the *In Software It Depends* Course. Will fit the lichess case study. 

Another topic that I'd like to teach would be profiling. People talk about profilers as magic. Only after you implement your own you can be less impressed. A bit like that company that was paying a ton of money for an off-the-shelf *feature flag* infrastructure.  

**

If you use Kubernetes then you can not be doing devops. 

**May 2**

I don't think people realize how complex UI development is. Aaln average react app is more complicated than a balancing a red-black tree. I would like to be able to prove this empirically. 

**April 20**

*Dark mode* is such a funny preference. One must be born after 2000 to enjoy it I think.


**April 18**

No interesting system has only one "AI" inside it. There is no ghost in *this* shell. 

In a complex system, you might need several AI, ML, and in general statistical sub-components, each one specific to its task. These stochastic components are each specialized in doing it's own thing. And because all these sub-components, by their nature, are sometimes going to mis-predict or mis-classify, you need to build carefully the system around their imprecision. And you always have to allow the user to provide the final decision on whether the statistical component is right or wrong. This is why you never deploy such a system in a critical component (e.g. in the steering subsystem for a car).


A better view on these models is that they are the liabilities of those systems, they are the weak links not the *holy graals* actually. Why do I say this? Think about it: we value software systems for their predictability and the comfort that their automation give to our lives. I type `git push` and this text is updated on the server. I turn off the car engine and the automatic break is deployed. Always. How would it feel if your mail client would be advertised as having an F1 score of 90%, meaning that *most of the emails will be sent to mostly the right recipient most of the time*? Or the breaks of your car would have a 99% precision? You would not pay much for that, would you? 

Adding AI models in a system is a last resort step that we do because we don't have a perfect solution or because the problem is indeed too big (e.g. labeling all the images of muffins on the web, spying on all the phone conversations that are intercepted by the NSA). But these statistical components are always imprecise, and they are only useful in those situations where there is no better or cost-efficient alternative. But I think we should see these components, as an evil we have to live with, rather than unalloyed good. 

In a few years, everybody will understand this, when the disappointment between the over-hyped expectations and reality with respect to AI settles in. Although everybody will be busy hyperventilating over the next *big thing*. As a wise man said, *nothing's new under the sun.*





**April 15** 

Obsidian. This application feels like a labor of love. What if we all worked to create the same kind of user-friendliness? #interactiondesign

**

I pulled a muscle in my calf probably because I didn't warm up sufficiently at practice last week. It's got better and I think I can play already if I'm careful, but it still feels a bit tender and I'm afraid of reinjury. So I'm thinking: if I really love this sport I should not play yet. Otherwise for the joy of today, I might endanger future opportunities of play and practice. 

Is this some kind of general life lesson? When you really love something you have to  distance yourself from it sometime?

**

The instinct of getting the phone out when somebody else does it. This is addiction.

**April 13**

Little pockets of meaning in a cold universe





**April 11**

Achievement unlocked: ironing shirts without music, podcasts, or audiobooks. Just me and my thoughts. Clearer mind. Unwrinkled shirts.  Mircea - Entropy: 2 - 0, this morning. 

**

There should be a word for that moment when the first meandering molecule of smoke reaches your olfactory receptors and instantly conjures in your mind the image of the food that is now burnt on the stove because you left it there "only for two minutes"... while quickly doing this other thing in this other room. 

** 

Following up on one of yesterday's ideas: Alexis Zorba and Atticus Finch are both following their own conscience, as far as I can tell. With very different results.

**

The world would be a better place if every now and then an academic would remove one of their old papers from the internet, instead of writing yet another one. 


**April 10**

To value so much your own life that you prefer it to scrolling the internet. 

**

To live up to the exigence of your own conscience. Not even God would ask more. 


**April 9**

Trolling technical debt people: introducing the concept of technical *depth* :)



**April 8**

Yesterday, at lunch with M, I remember that I have promised more than one year ago to try an experiment, that I never really started. Experiment is simple: at every salary, I take three times 10% and I use them in three different ways:

- 10% invest in stocks
- 10% put in the savings account
- 10% donate to somebody in need, or put aside for a future donation

Then, one year, five years, ten years down the line, look back and figure out: which of the three tithes will have represented the best use of my money. As M says: think of yourself as an administrator of your money. Shared this commitment also with my friend A. Now there's more people to hold me accountable :)

**

Sometimes you do the stupid thing, and it still turns out right. What if Google super-botched release of their hyper-woke conversational AI has shown the world how bad these things actually are, and will indirectly hit their main competitor: microsoft with chatgpt. 

**

With microsoft betting it all on AI they might actually lose quite a bit when everybody realizes that it's still a solution looking for a problem. I see a few months to years of slow growth if not even decline for microsoft. However, for the long term I would still bet on them: they are a fair company, in the sense that they make their business by selling software. As opposed to selling ads, which I think is less ethical a business. 

**

I'm thankful for Obsidian and GH Pages. Obsidian makes editing and GHP makes publishing my homepage so easy. Still the GH Pages part I have to move away from. Why do I depend on their infra to host my text? And why do I have to wait for a few minutes for the text to be updated? Why do I need to have a build interrupted email message when I push a correction, and why do I have to have a new commit for every little typo fix. No wonder that one of our students found out I'm one of the "top committers" on GitHub from Denmark :))

**

April 7

If we are serious about sustainability, we will have to encourage people to read more. It should not be necessary to create a series with 30 episodes, that costs more 150 million dollars just in order to re-tell the story from one book. Why do you need to see the story on screen, when you could read and see it in your mind's eye? What's wrong with imagination?

**

One more argument for reading? It separates us humans from animals. Reading, writing, and controlling our urges. Feelings, kindness, playfulness, desires: most of the mammals have them too. A dog can watch TV and cats can play tablet games. Chimps can scroll through pictures and movies. But reading and writing, this only humans do. And controlling our instincts. To the degree in which we succeed. 

April 5

my iphone reminds me very often of beautiful memories.
it takes away attention from my immediate life.
but it gives a bit of attention to my past life.
sure, most of the attention is still redirected to consuming digital entertainment. 
but for this little bit that's redirected to past memories, i'm thankful. 

**

a book on "how would famous people" program. Dalai Lama: he would certainly not get angry with ugly code. Jesuss: would spend 50% of the time thinking about the reader of his code (love the other as you would love yourself). LR is interested in becoming a co-author :)

April, 4th

Even before GenAI and for sure after, the web is becoming such a cesspool of junk that we might actually be tempted by the imperfect but clean chatGPT-like answers to our questions. Alternatively, being able to have an authority to ask, e.g. WebMD will become much more important. Or maybe a SV startup will reinvent the equivalent of Yahoo Directories soon :)



April, 2th

#### The _"In Software It Depends"_ Course

I'd love to have a software engineering master's course where we look at modern technologies, especially the _hype-du-jour_, and discuss when do they make sense and when do they do not. And teach the students to disentangle the exaggeration from the actually useful.

Motivational lecture

- historical consensuses that everybody believed, where everybody was onboard that later turned out that were not like that (formal verification, scrum, object-orientation, supercomputers, Map-Reduce, ORM, no sql, etc.)
- my own excitement about UML when I was a student. believe you me, it was exciting at that time!

Topics

- microservices, generative AI, lambda functions, Elixir, statically typed Javascript (e.g. Typescript)

Project

- choose one of the technologies du jour, explain it, show where it works well, and write a critique, with counter-examples; e.g., going to the cloud <- coming from the cloud, lambda functions, etc.
- critically analyze an over-hyped technology's website or presentation...
- optional: prototype / find realistic case study

Readings

- Amazon [switches to monolith from microservices](https://thenewstack.io/return-of-the-monolith-amazon-dumps-microservices-for-video-monitoring/) for Amazon Prime

P.S. A special module of that course would be the "It is not new, anyway" module, in which we take one of the modern techniques, and show that very likely, there was a predecessor about 40 years ago, that everybody forgot about it (e.g. deep learning, server side rendering, document databases, etc.)



#### Software engineering: forever reinventing of the wheel or an eternal ascending spiral?

I always thought that I should write a book about "the eternal return of computer science" in which I talk about how there's this eternal "reinvention of the wheel". Fat client - thin client - fat client - ... No types - strong types - no types - strong types... etc.

However, I wonder if it would be more polite and more optimistic to phrase it as the _eternal spiral_. The benefit of the spiral metaphor is that it allows for learning, it allows for a progression. It's also more humble and less judgemental and less fatalistic: computer science progress is not an eternal groundhog day. It's more like the solar system where the planets rotate around the sun and together with the sun they travel around the universe :)

#### Day #1 of No-Sugar Fasting

Re-starting my no-artificial sugar challenge today. I started together with my sister, she completed it and i failed in the middle.

So today, after having a cookie with my father in the morning for coffee, I restarted. I will try to not have any stuff that contains sugars or sweeteners for the next 40 days.
I've failed to keep the fastelavn with the danes. Maybe I'll be able to (mostly) align myself with the orthodox now, who already started and will fast for the next month.
Rules of the engagement: no artificial sugars in food or drinks. Including no exaggeratedly sweetened home-made smoothies, e.g. two bananas in a smoothie is too much. In general, it's the sugar taste that I feel cravings for and I must learn to let go of. Thus, even if it's made of fruits, if it's too sweet (e.g., fresh pressed fruit juice) it's still a no go. That would be cheating. So that's excluded too. Sweeteners are also off the table.

In case I fail, I restart counting.

P.S. Also, will try also no gluten to the best of my ability: there's the story with Djokovic improving his athletic performance when doing that. I would like to improve mine too. I guess this is a test of how much I want that improvement.

#### Equity = The Opposite of Equality of Outcomes

I don't understand the culture wars.

Equity, cf to the dictionary on my machine, is _the quality of being fair and impartial_. Now, given that we know that each human has their preferences and capabilities, will inevitably lead to different outcomes. However, as far as I can tell, people who claim they want equity, refer to equality of outcomes. I guess it's a technique taken from advertising: claim that you deliver something that you absolutely do not do (e.g. airlines - comfort, detergents - family happiness, etc.)

Turns out I'm in select company. Solzhenitsyn: _"Human beings are born with different capacities. If they are free, they are not equal. And if they are equal, they are not free"_.

31 March '24

#### Maybe we should throw our phones into a lake of fire

Our relationship with our phones is very similar to the one of Frodo and the ring. The ring in his pocket would always call for him, and he would always feel the compulsion to take it out and try it on. Also, when he would put it on, he would see crazy stuff (if I remember correctly scenes from the movie... I also read the book, but I don't remember that part from reading. Would the fact that you remember different things be an argument for both reading and watching the same novel?)

Our relationship with the social media is of a very similar nature. It also calls to us from our pocket, and we also see crazy stuff when we connect to it. The combination of having in our pocket both the phone and social media on it, makes the combo twice more addictive. Frodo was right to destroy the ring by throwing it in the fire. The device in our pockets, on the other hand, seems to be there to stay.

Ah, and too much exposure to the ring made a monster out of Gollum!

#### Why a personal God?

Why do religions imagine gods as persons?

Because we're a social species and thinking in terms of other persons comes naturally to us. And things, but I guess things are out of the question for this one.

Thinking about God as a person enables us to have a object for our feelings of "thankfulness" and "anger". It would be meaningless to be thankful to the universe. Or the multiverse. Also, one can not be angry with the universe when, say, their child dies (see Decalog by Kieslovski, Ep.1). In a sense, believing in a personal God allows one to be more expressive with their feelings than otherwise.

#### Does _mostly_ empty space have free will?

We have no free will is the same as saying: humans are mostly made out of empty space. Indeed, both might be true at the microscopic level, but it's the wrong abstraction level when you talk about humans.

Indeed, because the electrons and the nucleus are so smal and the forces between them so strong, most of the space in the atom is actually empty. And thus, every human is _mostly empty space_. But at the societal level, that level of analysis is meaningless.

The same with free will. Even if the universe were deterministic at the atomic level, talking about how humans are made of atoms when discussing ethics and society is meaningless. It would be like when an individual punches another in the nose, we would say: it does not matter, it's mostly empty space pushing on other mostly empty space. No, it's not empty space hitting empty space. It's a person, who _decided_ to punch the other one. And at the level of ethics, we judge that act as it were the will of the puncher. Not the turning of some atomic clockwork.

Also, there's quantum uncertainty at the atomic level.

P.S. (Apr 2) Or could I accept that both facts are true? The wisdom of the Rabbi who told everybody that they were right?

P.P.S.  Writing does not exist. Just atoms of my hands kicking other atoms of a keyboard. There's a proper level of analysis for everything and a purpose for every level of analysis.

#### Artificial Wisdom

I recently developed a love for volleyball and I play in the lowest men's danish league. My role in the team, middle blocker, requires a lot of jumping, and my knee is starting to hurt a bit sometimes after a long match. I really wish that as a society we would prioritize much more working on artificial knees than artificial intelligence. But there’s not enough wisdom in Sillicon Valley to realize that. And unfortunately nobody is working on artificial wisdom either.

#### My own short text and idea timeline

Why not maintain my own timeline of silly little thoughts? I used to try to contribute my thoughts to Twitter. But that's a cacophony of everything, thoughts, the most outrageous recent things, advertising in your face, and covert. And Elon holds the button that turns craziness up and down there too.
