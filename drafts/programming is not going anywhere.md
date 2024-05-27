Alternative subtitles: 

- "Why prompting-LLMs will not render PLs obsolete?" -- This would also be a *positive* framing for the paper




Motivational Quote: 
> Programming languages are the easiest way in which one can specify systems; if there was an easier way, we would have used it. (to find the author)


# Why this paper?

This paper is a thought experiment triggered by the general enthusiasm and high hopes related to generative AI. 

In particular, this is a critique of a particularly strong claim related to Generative AI, that: **an LLM will at some point (usually, "very soon") replace the need for developers to know programming languages**. 

The reasoning of those who make this claim is often syllogistic in nature: 
- in the early days of computing, developers used to write assembly language
- then compilers came and allowed the programmers to write high-level languages and the assembly language was *generated*, thus eliminating the need for programmers to write assembly
- LLMs are going to take this generation to the next level, by automatically eliminating the need for programmers to write code in high-level languages because all the programmer will need to do is to write in natural language what they wish done, and the AI will automatically *generate* the necessary code.

The heavy lifting of the syllogism is done by the overloading of the term *generate* with two completely different meanings:
- in the compiler case, it means code transformation -- a completely deterministic, repeatable, unambiguous, and well understood process
- in the LLM case it means "statistically generation" of text -- a not very well understood \cite{} stochastic process

Many a reader will probably not agree with the conclusion, and thus might not need to read this paper. 

However, for those who are not familiar enough with PL, SE, or LLMs such that they can still believe that LLMs will replace programming as we know it, this paper tries to put the *programming* in the bigger context of software engineering, and follow to it's logical conclusion the assumption that *programmers will only have to write prompts and all the code will be written for them*. \cite{...}

# What methodology does this paper use? 
We are software engineers, and are writing from a position of understanding the challenges that software evolution poses to programming and in this paper we are going to analyze in which way changing programming with *prompting* will address these challenges. 

The method we use in this paper is a principled analysis. Or *gedankenexperiment*. It is not an empirical study; there are many such studies, but the problem with them is that their replicability is difficult: a study that uses ChatGPT or CoPilot can't be replicated once new versions of these systems are released. The results would probably be different. 

In fact, what this paper will have to do to resist the test of time is also address the objection that: **The fact that ChatXYZ 4.0 did not replace the need of PLs is not a proof that version 5.0 will not.**. 

## Software Evolution To the Rescue

The main arguments of this paper are those stemming from software maintenance and evolution. There are other people who have written about the inherent limitations of the LLMs when it comes to trutfulness, and etc. 


## What do we mean by LLMs? 

One of the difficulties of writing about LLMs is the fact that they represent an ever moving target. A critique of *ChattyLLM* 4.0 can always be countered with: *"You just wait to see how ChattyLLM 5.0 will solve this problem"*. 

In order to be able to have a discussion that is not prone to the above *critique* we must discuss a *Very Powerful LLM*, more powerful than any of the known ones, and possibly more powerful than all the ones that are going to exist in the foreseeable future. 

There are multiple possible LLM limitation models
1. for any programmer wish expressed as a prompt in natural language, they will eventually generate code to fulfill it, possibly after multiple "prompts" (or clicking the refresh button in the UI, as it can be done in ChatGPT)
2. there are some wishes that will not be generated

Although 2) is the reality at the moment, and it's likely to never be solved given that , we will work with an LLM model of 1). We assume an LLM that's better than everything that exists at the moment. 

Two more assumptions that we make are: 

### C1. For any wish there can be many programs to satisfy it

- this is also visible in the UI of LLMs these days, as one types a *prompt*, the system returns an answer, but together with the answer one can use a "give me more" button. 

wish(i) => P{i}...P{j} 

This is not surprising, since it is inherent in the architecture of the LLM - every word generated impacts the next words that follow it. 

Also, given the ambiguity of natural language, it follows that the LLM can not know what the user means, so it must be able to generate code for multiple languages. 


### C2. Different versions of an LLM will generate different programs for the same wish

There is no guarantee that a different LLM or a different version of an LLM will generate the same programs in the same order. There is nothing in the architecture of LLMs that suggests that one can expect *backwards compatibility*. In fact, studies seem to suggest that some of the popular ones are clearly changing. 

Formally (do we need this?) this would be written as: 

wish(i, v(LLM) = P{i,v(LLM)} ... P{n,v(LLM)}

### C3. The higher the abstraction level of the "wish", the more possible programs will be generated for it

For simple wishes, there are few possible programs that the LLM will generate. E.g. `provide a fibonacci implementation` . There are few implementations, and all of them have been written a billion times on the internet. 

On the other hand, asking high-level wishes, is fraught with danger. If one asks "generate for me a todo app" there could be potentially thousands of such implementations. And very likely, each one of the implementations, would not be exactly what the asker wants. A bit like the naïve young man from Bedazzled. -


It is hard to see how any future LLM can be generated that does not fall under the two constraints above. These are the only assumptions we will take forward in the analysis. 



## Bricolage: constructing a system from "wishes"

The challenges in Software Engineering are in creating complex systems. Thus, we will assume this for the rest of the discussion. A complex system is one that requires a team to work full time for more than one year. The early version of WhatsApp was such a system. And this should cover more than X0% of all the systems out there. And probably 100% of all the systems that are difficult to create. 

### Challenge: Collaboration 

Collaboration will become a big challenge.

#### Code Review

Assuming that for large systems, one would want to review the wishes, it will be fascinating to see discussions of the form:
- your wish W1 is not clear to me, can you rephrase
- with no guarantee that the rephrased wish still generates the same functionality

By definition Refactoring is out of the window. 

On the bright side, one would argue, this would require a much more solid suite of tests. Indeed, the only way to ensure that a *refactored wish* does the same as the original is to run the tests. However, what are the tests written in? Because we do not assume programming language will be necessary. If they are written in prompts themselves, we end up with an infinite regression of asking: "how do we know that the tests are doing what we want them to do" unless we have tests for them? 

### Code Evolution

Manny Lehman: The law of continuing change. 





Let us think how could we construct programs in the idealized world of very powerful LLMs as described above. 

Thus, if one would construct a bricolage of a system by composing together programs generated by wishes, when it comes the time for evolving them, they would have two choices: 

1. maintain the program now generated in the programming language used; but this is "supposed to not be necessary anymore"
2. given that their system was created by the sequence of wishes 1...n, either 
	- replacing the wish(i) that is the one that needs to be updated and re-run the other wishes unchanged - however, this is not possible because there is no guarantee that a new version of the LLM will 
	- adding another wish asking the LLM to modify the system. this requires that the LLM has to be fed the whole system as a whole as part of the training. so instead of replacing an older wish, one will just amend it. imprecise definitions of program transformations might be possible, but how is the programmer to verify that their imprecise request is fulfilled? in our thought experiment, all they write are "wishes" but to know which of the wishes really are what they want they can't check the generated code. so they are left with the only way to test is "trying out the system" or writing "tests" that ensure that the generated code 







### This system is not sustainable

The LLM works based on examples it finds on the internet. Thus, it can not work on new technologies and languages until they have a critical mass. 


#### The low level wishes are exactly those for which there are better solutions

Take for example the wish *"write a function that detects whether the code runs in a browser"*. The LLM might come back with the following implementation: 

```js
function isMobile() {
	return navigator.userAgent.match (r"Android|iOS")
}
```

The problem with this code is that it is not maintainable. It might work for today, but when new user agents appear, it will be stuck in the past. Compare this with packages, like in `npm`. There, one depending on a package, one gets for free updates. 

The defenders of no-more-programming-needed would probably argue that a new version of the LLM would generate an updated version of this function. However, until the LLM finds sufficient examples of the new code to learn the new pattern, the application that uses it will be broken. Compare this with the alternative:
- the maintainer of the little `isMobile` package finds out that there's a new user agent, updates the regex, pushes an update
- the next morning, all the users of the package get the update

Compare with the delay required by the LLM to update:
- several months required for the new pattern to appear on the net
- several more months for training

Sure, but what if the LLM would generate code that uses the isMobile package. The delay is the same. The isMobile package might have been the most popular at the time of training, but there might be a better implementation that appeared in the meantime. This is again going to result in many months of delay. If the package that is 'better' is just better at detecting mobile agents, the problem is not that big. However, if the package is better because it fixes vulnerabilities, then this is a problem. 

Sure, one would argue, why not use semantic versioning in the source code? Yes, that could be the case, but then the developers have to look again at the code. No. They only have to let the LLM know that they want a solution with another package than the one that has a vulnerability. But then delay. Ok, they can modify it by hand. Sure, but... they are programming now. And programming was supposed to be not necessary anymore. 

Well, it's a small exception. Updating little snippets that use libraries is not too much of a trouble. Indeed. However, not all dependencies are of the same caliber as `isMobile`. Others are cross-cutting through the whole system. 

Ok, you're just not getting it. People will not have to look under the hood. The code generated by the LLM will be as good as isMobile. So packages are going away. 

Yes... Nope. That is not a better system. 



### So if the abstract wishes are hared to maintain, and the low-level wishes have better alternatives, what is left?

One thing that is left is boilerplate. 
And detecting latent patterns in the code.

Indeed, the LLMs will eventually, very likely converge into being the next thing after auto-completion. Indeed, they can do more than 




## So What Are these systems good for then?

Let us remember what they are. 
They are models of language. 
They predict the most likely next token.
So in the measure in which one tries to write the "average" program that has been written before many times, they might be able to use the LLM. 
It is unlikely that 







### Data-driven haphazard model-driven engineering

- is there something to learn from model-driven engineering?
- the limitations of code generated 



# Topics to think about

- some programmers are not even good at english


# Other Topics Not Discussed

### 2. there is no guarantee that the program selected for implementing a wish is correct

This might be the case for simple programs.
And might be the case for the current version.
But one can never be sure that 


