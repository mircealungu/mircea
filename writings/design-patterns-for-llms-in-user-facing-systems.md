
# Motivation
The examples below are based on the open source service called Zeeguu that I’ve been working with students over the past years: [https://mircealungu.com/projects/zeeguu](https://mircealungu.com/projects/zeeguu). The system aims to personalize language learning by recommending personally relevant readings, vocabulary exercises, audio lessons. 

Over the past year I’ve plugged in a few usages of LLMs inside of it, and I think it might be useful if I would document them. 

# Patterns

## Pre-computing Likely-to-be-needed LLM Results

In the case of Zeeguu we use multiple translators. At reading time we want to provide the fastest translation for the reader, the fastest which might not be the best. This is fine when reading, because the idea is that the reader should understand the context.

However, when a word is scheduled to enter the exercises pipeline, suddenly it becomes critical that the translation is the correct one. We do not want people to learn wrong translations. This is a task that the LLMs can do a good job at. However, 

However, one can not do the evaluation when the learner goes to the exercises tab. Then it's too late to ask the LLM to evaluate because it's going to be too slow. What we do in Zeeguu is that we have a cron-job that 

Forces: 

- LLMs can provide valuable data for users
- LLMs are slow and expensive 

Solution:
- have a cron job that estimates the most likely needs of the users and pre-compute them 


## An LLM-Checking-another

In Zeeguu, we've discovered this pattern where an LLM when asked to simplify an article to the beginner level in a target language, it introduces strange spelling mistakes. It's likely that the part of space where the training is coming from is broken. 

To solve this problem we call it once for simplification, and the second time we call it to fix the spelling. 


Forces
- they are imprecise tools
- in some situations they can still be better at correcting than generating

Solution
- have one LLM generate an answer
- have another one correct the generated answer

Warning
- one needs to pay attention, this pattern might not work that well 
  

## Batching Requests
Prompting is expensive

When we want to get a word classified the prompt is long, the payload is short. To not be wasteful we are asking it to  
  

## Mutiplexer - getting fastest answer for interactive UX

- When speed matters - 

- Tradeoff - cost


- We use this for real-time translations – they happen rarely, but we care about speed  


Multiplexer is also important in general: when having dependencies on third party services, one must have alternatives - you can not depend on a single API 


### Alternative - track speed over sliding window
- the last N requests, and dispatch to the most recently fastest … 

  
  
  
  

5. Simple Solution - LLM as backup

- 

  
  

6. LLM as a Wizard of Oz — 

- because they’re general purpose machines, they can be used

**