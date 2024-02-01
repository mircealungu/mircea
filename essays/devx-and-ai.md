# Developer Experience and AI - The Good, the Bad, and the ... Unknown

![](../docs/assets/good-bad-unknown-attempts.png)
*Three distinct attempts by Gencraft.com at generating an image from the prompt "The Good, the Bad, and the Unknown". I'm not sure which one I like best.* 

## Code Generation and the Dismissal of the Programmer 

> The reports of my death are greatly exaggerated (Mark Twain)

**Code Generation is not new to Software Engineering.** And neither are the announcements of dismissal of programming that come together with it. We've seen such announcements with Cobol many years ago. And we've seen them with 4GLs ([cover of App Development w/o Programmers, James Martin, 1982](https://m.media-amazon.com/images/I/71eNJfBFeWL._SX679_.jpg)), model-driven engineering and with low-code platforms. And now we're seeing it with AI. 

**However, there is a difference between the old and the new code generation**. Then, old code generation was generating code in a lower-level *formal* language from a formal higher-level *formal* language. Notice the emphasize on *formal* language. 

This is different with the AI-based generation that fills the news in 2024: ChatGPT and Copilot. This new kind of code generation can take as input a mix of natural language or code (in the case of automatic code completion) and can generate a mix of natural language and code. 

The most successful generative AI of the moment is based on large language models (LLMs). These are *statistical* models of language, which originally designed for natural language. The [extensive introduction to ChatGPT by Stephen Wolfram](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/comment-page-1/#comments) is a fantastic introduction to LLMs. It's a blog post but it that will take you several hours. But it's worth all that time.

Indeed, it turns out that when one feeds *"the whole internet"* into such a model, somewhere in the weights of their billions of parameters, correct code can also be generated without ever having specified a parser or a lexer. 

The current generation of such models is based on several conditions: 
- **Transformer architecture** -- highly generalizable way of detecting patters in data at increasing abstraction levels
- **The attention mechanism** - the fact that they don't only take as input the previous few tokens, but they can take into account pertinent tokens that came much earlier 
- **Training on very large amounts of data** -- e.g. [45TB](https://arxiv.org/pdf/2005.14165.pdf) of compressed plaintext for GPT3
- **Very large resulting models** -- trillions of parameters, which have the capability of [compressing the input](https://arxiv.org/pdf/2309.10668.pdf)

These things are ever changing, new architectures appear every year, new models and variants appear every more frequently, so I'll try to keep this presentation and discourse at the level where things are not changing. 

## One Architecture, Two User Interfaces

LLMs are trained to predict the next token (e.g. GPT) or to predict the missing token (e.g. BERT). In both cases, their strength is generating text and, for the programmer, code. This is why, there are two main ways in which they are integrated in the development process in two variants of user interfaces: 

1. **Auto-complete-like agents.** The developer writes a function definition, and the LLM gets to auto-complete it. If the problem is general enough, and function name is likely clear enough, the most common likely continuation might be exactly what the developer needs. This works especially well and is very useful for boilerplate code, or generic queries.  
2. **Chat-like agents**. With extra training in the form of reinforcement learning with human feedback (RLHF) a large language model (e.g. GPT) can be conditioned to work in the fashion of a chat-like system (e.g. ChatGPT, llama2). In this context, the model completes the next token in such a way as to obtain the most likely continuation of a conversation not a general text. 

Some IDEs such as VSCode integrate the two modes of interaction. 

# The Good

The homepage of GitHub Copilot reports a [study](https://github.blog/2022-09-07-research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/) that suggests that when using Copilot, developers are "faster with repetitive tasks" (96%), spending "less time searching" (77%),  "more in the flow" (73%). 

These very precise numbers have to be taken with a bit of salt. But it is true that there are ways in which these tools are **improving the lives of the developers**. 
1. Chat-like systems might **help them avoid interruptions and googling** - which these days is a pain - but it's a necessity - the complexity of the tech world is so large that one can not keep everything in their mind. Google and StackOverflow are not going away, but will likely be replaced for some tasks by LLMs. For what kind of tasks, it is still not clear. For long-lived systems, where maintainability is important, using code generated by these systems is [very likely worse than the alternatives](../notes/Npm-vs-StackOverflow-vs-ChatGPT.md).
2. Chat-like systems **encourage better definition of the problem query** - which in itself is often halfway to the solution. Google has taught all of us to throw a bag of keywords to it and sift through pages filled with ads and junk to collect the valuable snippet. Not unlike developers used to sift through horrible forums before StackOverflow. 
3. Autocomplete-like interfaces might be **able to avoid writing boilerplate code** (although it's still written, only that much faster). I'm collecting my own examples of both successes and failures; sometimes it feels like magic; sometimes it feels like the second coming of Clippy from MS Word.
4. If trained on the whole Internet, an LLM can extract patterns from other developers and help the individual be faster in **writing code that was written before** *by (many) others*. Indeed, developers are proud and aware of the DRY principle (Don't repeat yourself). However, they can not always respect the *don't repeat others* principle (DRO?) since they don't know what others are doing. As a community, Software Engineering has already done the work on extracting patterns from the ecosystem and mining the version repositories to help the individual developer, but the new models are more general and we still have to learn at what are they good and at what not.


# The Bad

1. The **internet will end up being filled with generated junk**. StackOverfow observed that this was a problem already in December 2022. Users started generating answers and pasting them in although they were low-quality. Decreases the quality of the platform. The [discussion thread](https://meta.stackoverflow.com/questions/421831/temporary-policy-generative-ai-e-g-chatgpt-is-banned) illustrates the limitations of ChatGPT... It also acknowledges the problem: detection is not easy.

2. The "most likely continuation of a query" that an LLM generates
	- **might not be the best** (e.g. the way biases exist in other kinds of datasets, there will be biases in the programming related data)
	- **will not exist for the most recent versions** of libraries - and thus, if you as a customer or employer get yourself a lazy programmer, you might end up with the patterns of yesterday. (Paolo Tell: "there was a delay of several years required for the community to realize that Singleton, although a design pattern was a bad idea")

3. **Companies pushing LLM-based systems might be killing the golden goose**.  Given that these systems are trained on existing human generated content, they can not exist without it. **At the same time, they represent a strong disincentive for further content generation.** 
	- When StackOverflow came first developers and researchers, we were all enthusiastic. What it did was put order into a messy web. Remember how forums looked before StackOverflow? SO had a clean design, and a clever social incentive system with the help of which, people who wanted to be good citizens could contribute and recognized for their contributions. The key was probably the recognition. 
	- The new system is exactly the opposite. It does not give credit and unfortunately, it couldn't even if it wanted to. It thus, does not encourage people to contribute. 
	- It also encourages a lack of understanding of the bigger context. It  lacks the rich conversations around the questions that are present on SO. These conversations around a question are sometimes even more informative than the actual answer. And the value of the conversations is that they identify and solve also the corner cases. The main answer solves the general problem, the comments often solve the rare exception. 


# The ... Unknown

There are still many open questions: 
- How can these things be used by data scientists? They might stand to benefit more? In fact, I think people who code rarely, or have less experience, are exactly those who benefit most from a system that has seen all the code out there and derived patterns from it. Still when to use it, and when not to, needs to be studied. 
- **Will reading code become more important than writing code**? State of the art coding tools allow a part of the development flow to be switched from typing to inspecting generated code. 
- What is the **impact of this kind of generated code on the maintainability of systems**? Indeed, **maintenance** is the longest phase in the life of a system. These days we call it  software evolution exactly to acknowledge its importance and extent. 
	- We have no idea whether this patchwork of generated cobbled together will result in reliable and usable systems
	- The role of the senior who does code review becomes even more important -- there has to be a grown-up in the house 
	- How to ensure that you understand the system sufficiently well to change it
	- How do we trace the generated code? 
- How are companies going to ensure the **legality of the generated code**? See the NY Times articles parroted back in full by ChatGPT. What about licensing? The current solution seems to be often to ban the technology alltogetehr.
- **Can we have open models, the way that we have open source** -- models that are not black boxes that belong to a corporation, but rather, that are created and maintained in the open? After all, they are built on the open internet.
- **Localized LLM agents** instead of the basic search that websites are using nowadays. E.g., StackOverflow search is currently abysmal. Maybe this is why they have announced that they are working on a LLM powered interface. (Still open: how could such a system solve the attribution problem?)
- **Personalized LLM agents**. That learn from the individual, small apprentices that with time learn to write code in the style of their user. Stephen Wolfram writes about training a model with all his past writings. (SF: Imagine every student training individual LLMs, and having them write their essays. And the final grade would be on the duo's work :)
- **Better UIs - Beyond chat and auto-complete** -- some of these companies push towards replacing all the UI with chats. I think we have to go the other way around. We have developed rich user interactions over the recent years; how can we integrate the LLM inside them?
- How do you study these things? How do you compare? Running after every new version of every new model of every new company is useless. New versions might decrease in quality as the company needs to cut on operations. From this POV, running one owns' model is more sustainable. 
- In which other areas can we use generative AI?
	- **Code understanding** - still the hardest part of maintenance -- developer spend 80% of their time reading code rather than writing; why? because this is hard. If we can use LLMs to make code more understandable, this would be a very good thing (TM)!
	- Requirements ? but these models are imprecise - how can they help? Embrace the imprecision? 
	- Architecture - if you need the average architecture, it can help you -- but Amdahl's Law means that this will not make a difference - the effort of architecting is not that large; it's upfront; and can not be replaced with experience





# ------ ------ ------ ------ ------ ------ 
### Beyond here lay dragons - Notes

**Our Role as Researchers**
- disentangling the truth from the marketing and the noise

**Limitations**
- The most likely continuation... is just that. The most likely continuation. There is no creativity in it. 
- A chat system that gives you the most likely continuation of a conversation... is the most boring thing. For me, exactly that a conversation went somewhere where I would have not expected was the value of it. The more boring the code you write, the more likely you will benefit from this

I've already argued long time ago that ecosystem analysis should enrich the developer experience.

**Beyond General Queries and Completion**
There is one extra hope: that the general LLM model, trained on the whole internet, will be able to adapt to a given's codebase, such that it can answer individual questions about that codebase.


Integration with CI/CD ... can they help with integration -- could use Chat interfaces to run ops? too far fetched... 

