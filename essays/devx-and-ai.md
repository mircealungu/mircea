


# Developer Experience and AI - The Good, the Bad, and the ... Unknown

Feb 1, 2024

![](../docs/assets/good-bad-unknown-attempts.png)
*Three distinct attempts by gencraft.com to generate an image for "the Good, the Bad, and the Unknown". I'm not sure which is best.* 



Source on GH: [https://github.com/mircealungu/mircea/blob/main/essays/devx-and-ai.md](https://github.com/mircealungu/mircea/blob/main/essays/devx-and-ai.md)












## Code Generation and the Dismissal of the Programmer 

> "*The reports of my death have been greatly exaggerated*". (Mark Twain)




### **Code generation is not new to programming** 
And neither are the announcements of dismissal of programming that come together with it. We've seen such announcements with Cobol many years ago. And we've seen them with 4GLs ([cover of App Development w/o Programmers, James Martin, 1982](https://m.media-amazon.com/images/I/71eNJfBFeWL._SX679_.jpg)), model-driven engineering and with low-code platforms. And now we're seeing it with AI. 


### There is an essential difference between the old and the new code generation 
The traditional code generation was generating code in a lower-level *formal* language from a formal higher-level *formal* language. Notice the emphasize on *formal* language. 

This is different with the AI-based generation that fills the news in 2024: ChatGPT, Copilot, llama2, etc. This new kind of code generation can take as input a mix of natural language or code (in the case of automatic code completion) and can generate a mix of natural language and code. 











## The Architecture Of the New Code Generators

The most successful generative AI of the moment is based on large language models (LLMs). These are *statistical* models of language, which originally designed for natural language. The [extensive introduction to ChatGPT by Stephen Wolfram](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/comment-page-1/#comments) is a fantastic introduction to LLMs. It's a blog post but it that will take you several hours. But it's worth all that time.

Indeed, it turns out that when one feeds *"the whole internet"* into such a model, somewhere in the weights of their billions of parameters, correct code can also be generated without ever having specified a parser or a lexer. 

The current generation of such models is based on several conditions: 
- **Transformer architecture** -- highly generalizable way of detecting patters in data at increasing abstraction levels
- **The attention mechanism** - the fact that they don't only take as input the previous few tokens, but they can take into account pertinent tokens that came much earlier 
- **Training on huge amounts of data for very long amounts of time**, e.g. [45TB](https://arxiv.org/pdf/2005.14165.pdf) of compressed plaintext fed to the system for more than one month for GPT3 
- **Very large resulting models** -- trillions of parameters, which seem to have the capability of [compressing the input](https://arxiv.org/pdf/2309.10668.pdf)

These things are ever changing, new architectures appear every year, new models and variants appear every more frequently, so **I'll try to keep this presentation and discourse at the level where things are not changing**. 










## Two User Interfaces

LLMs are trained to predict the next token (i.e., decoder-transformers, e.g. GPT) or to predict the missing token (i.e., encoder-transformer, e.g. BERT). However, in both cases, their strength is generating text and, for the programmer, code. This is why, there are two main ways in which they are integrated in the development process in two variants of user interfaces: 

1. **Auto-complete-like agents.** The developer writes a function definition, and the LLM gets to auto-complete it. If the problem is general enough, and function name is likely clear enough, the most common likely continuation might be exactly what the developer needs. This works especially well and is very useful for boilerplate code, or generic queries.  

2. **Chat-like agents**. With extra training in the form of reinforcement learning with human feedback (RLHF) a large language model (e.g. GPT) can be conditioned to work in the fashion of a chat-like system (e.g. ChatGPT, llama2). In this context, the model completes the next token in such a way as to obtain the most likely continuation of a conversation not a general text. 

Some IDEs such as VSCode integrate the two modes of interaction.











# The Good

There are ways in which these tools are **improving the lives of the developers**:
### 1. Enabling learning from the Ecosystem
LLM extract patterns from other developers and bring this knowledge to the individual Indeed, developers are aware of the DRY principle (don't repeat yourself). However, they can not respect **the *don't repeat others* principle** since they don't know what others are doing. As a community, **Software Engineering has already done work on extracting patterns from the ecosystem** and **mining the version repositories** to help the individual developer, but the new models bring this knowledge to a completely new level.

### 2. Speeding up code creation & reducing interruptions
The homepage of GitHub Copilot reports a [study](https://github.blog/2022-09-07-research-quantifying-github-copilots-impact-on-developer-productivity-and-happiness/) that suggests that when using Copilot, developers are "faster with repetitive tasks" (96%), spending "less time searching" (77%),  "more in the flow" (73%). These very precise numbers have to be taken with a bit of salt but they do suggest a speedup of code generation. 

Can **help writing boilerplate code** much faster. Although it's still written. I'm collecting my own examples of both successes and failures. Sometimes it feels like magic; sometimes it feels like the second coming of Clippy from MS Word. 

Chat-like systems also **help developers avoid interruptions and searching the web** - which these days is a pain. Google and StackOverflow are not going away, but for some kinds of queries, will likely be replaced by LLMs-based systems. 

### 3. Chat-like systems **encourage better definition of the problem**
This in itself is often halfway to the solution. Google has taught all of us to throw a bag of keywords to it and sift through pages filled with ads and junk to collect the valuable snippet. Not unlike developers used to sift through horrible forums before StackOverflow. 
 


# The Bad
There are also things that are rotten in the state of Denmark... 
### 1. Generated code is likely not the best 
The *most likely continuation of a string*  is likely not the best in terms of: 

1. **Quality**. The way biases exist in other kinds of datasets, there will be biases in the programming related data. A recent study attempting to evaluate the quality of the generated code seems to suggest that it's quality is  [**more akin to a passing contributor to a codebase**](https://visualstudiomagazine.com/articles/2024/01/25/copilot-research.aspx)  rather than a senior developer on the team. 

2. **Timeliness** of patterns and libraries - and thus, if you as a customer or employer get yourself a lazy programmer, who relies too much on generated code, you might end up with the patterns of yesterday. Paolo Tell: "*there was a delay of several years required for the community to realize that Singleton, although a design pattern was a bad idea*". Indeed, if generating code in the way it used to be done in the past is easy, why should one learn a new way?

### 2. Training on open knowledge without giving back will backfire
Given that these systems are trained on existing human generated content, they can not exist without it. **At the same time, they represent a strong disincentive for further content generation.** 
	- **When StackOverflow came first developers were enthusiastic.** It put order into a messy web. Remember how forums looked before StackOverflow? SO had a **clean and simple design, and a clever social incentive system** with the help of which, people who wanted to be good citizens could contribute and recognized for their contributions. The key was probably the recognition. 
	- Systems like ChatGPT and Copilot are exactly the opposite. They **do not give credit**. And unfortunately, even even **if it wanted to, they couldn't** because of their architecture. This will **discourage people to contribute** their knowledge freely. 

### 3. Generated code can be less maintainable for the long term

For long-lived systems, where maintainability is important, using code generated by these systems is **[very likely worse than the recommended software engineering practices](../notes/Npm-vs-StackOverflow-vs-ChatGPT.md)**.



### 4. Code generation encourages ignorance

Code generation risks encouraging **ignorance** -- a lack of understanding of the bigger context. 

It  lacks the rich conversations around the questions that are present on StackOverflow for example. These conversations around a question are sometimes even more informative than the actual answer. And the value of the conversations is that they identify and solve also the corner cases. The main answer solves the general problem, the comments often solve the rare exception. 






























# The ... Unknown
As of today, there remain many open questions: 
### 1. What is the impact of this kind of generated code on  system maintainability? 
Indeed, **maintenance** is the longest phase in the life of a system. These days we call it  software evolution exactly to acknowledge its importance and extent.  We have no idea **whether a patchwork of generated code, cobbled together will result in reliable and maintainable** systems.

### 2. *For whom* and *when* are these tools good? 
For what kind of tasks, it is still not clear.  For what kind of developers it is also not clear. Maybe more for juniors. Maybe more for data scientists who are not necessarily that experienced in coding? 

### 3. **Can we use LLMs to improve code understanding?** 
**Developers spend an overwhelming majority of their time reading code rather than writing**; why? Because code understanding is still the hardest part of maintenance. Can we use LLMs to make code more understandable? This would be hugely impactful. 

### 4. **How to do research on this topic**? 
**How do we study these things?** Running after every new version of every new model of every new company is *chasing after wind*. New versions might be much better or decrease in quality as the company needs to cut on operations. From this POV, running one owns' model is more sustainable. But they are not as good as the commercial ones. 
What can we write about it that will still be relevant in 5 years? It can't be dependent on the current version; but how can you not depend on it? 


## Acknowledgements

Thanks to Iulian, Tiago, Adam for feedback on earlier drafts of this. 


## Beyond here lay dragons: Further Notes

- Dave Thomas on [not trusting CoPilot beyond repetitive tasks](https://twitter.com/pragdave/status/1755366157253476707?s=20)
- We should train generative models ethically, or not at all [Brian Merchant on Twitter](https://twitter.com/bcmerchant/status/1750666810633183497)
- Article referring to paywalled article that suggests [downward pressure on code quality](https://visualstudiomagazine.com/articles/2024/01/25/copilot-research.aspx) by generative AI?
- Do we even  have the right to use these things for anything else than ... modeling languages? Why would a language model give you an answer to a question, and why should you believe it?
- A chat system that gives you the most likely continuation of a conversation... is the most boring thing. For me, exactly that a conversation went somewhere where I would have not expected was the value of it. OTOH, the more boring the code one writes, the more likely they will benefit from LLMs. But if they were writing boring code, maybe it's for the best?
- In which other areas besides code writing can we use generative AI?
	- Requirements ? but these models are imprecise - how can they help? Embrace the imprecision? 
	- Architecture - if you need the average architecture, it can help you -- but Amdahl's Law means that this will not make a difference - the effort of architecting is not that large; it's upfront; and can not be replaced with experience
- Can we have open models, the way that we have open source -- models that are not black boxes that belong to a corporation, but rather, that are created and maintained in the open? After all, they are built on the data in the open internet.
- Localized LLM agents instead of the basic search that websites are using nowadays. E.g., StackOverflow search is currently abysmal. Maybe this is why they have announced that they are working on a LLM powered interface. (Still open: how could such a system solve the attribution problem?)
- Is the internet going to be filled with more generated junk? StackOverfow observed that this was a problem already in December 2022. Users started generating answers and pasting them in although they were low-quality. Decreases the quality of the platform. The [discussion thread](https://meta.stackoverflow.com/questions/421831/temporary-policy-generative-ai-e-g-chatgpt-is-banned) illustrates the limitations of ChatGPT... It also acknowledges the problem: detection is not easy.
- How are companies going to ensure the **legality of the generated code**? See the NY Times articles parroted back in full by ChatGPT. What about licensing? The current solution seems to be often to ban the technology all together.
- **Better UIs - Beyond chat and auto-complete** -- some of these companies push towards replacing all the UI with chats. I think we have to go the other way around. We have developed rich user interactions over the recent years; how can we integrate the LLM inside them?
- **Will we have personalized LLM agents**. That learn from the individual, small apprentices that with time learn to write code in the style of their user. Stephen Wolfram writes about training a model with all his past writings. He did write quite a bit, so that model will likely have what to latch on... (Science fiction scenario: Imagine every student training individual LLMs, and having them write their essays. And the final grade would be on the duo's work :)
- **Will reading code become more important than writing code**? State of the art coding tools allow a part of the development flow to be switched from typing to inspecting generated code. 
- Disentangling the truth from the marketing and the noise would be an opportunity for us as researchers. 
