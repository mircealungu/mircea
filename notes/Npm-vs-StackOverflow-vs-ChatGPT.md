
# Copilot, ChatGPT, StackOverflow, npm - How to decide whose code to use?

A.D. 2024 a front-end developer will often want to write code to detect whether his application runs on a mobile, or not. There are multiple solutions available to them: 

1. **Asking ChatGPT** how to [detect if a web page runs on mobile](https://chat.openai.com/c/7305bbcc-a0a6-4c64-b263-e6133c69c5d0) will result in a solution that one can copy-paste. It's a short regular expression. 

```
function isMobile() { return /Mobi|Android/i.test(navigator.userAgent); }
```

2. **Asking Copilot to write it** by defining the function name, and letting it auto-complete, results in what seems an exhaustive regular expression. When I've asked for this completion myself a while ago in one of my research projects, I was left with a feeling of deep puzzlement: *"I have no clue how, why, and if this works"*. I tried it on my phone, my tablet, my laptop, and it seemed to work. But I had no confidence that it would work on other devices.

```
function isMobile() {  
  return /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini|Mobi|Android/i.test(  
    navigator.userAgent  
  );  
}
```

4. Finding an [answer on StackOverflow](https://stackoverflow.com/questions/11381673/detecting-a-mobile-browser) with the help of Google Search
5. Searching on SO itself is [not very good](https://stackoverflow.com/search?q=javascript+function+to+detect+if+code+runs+on+mobile%3F&s=2b6050df-922e-4754-a94c-aaca6d996c51) 
6. Finding a library to do this on [npm](https://www.npmjs.com/package/ismobilejs) - 260K downloads / week. The metrics are inflated by the way the npm ecosystem downloads is counted. But the metric still makes sense in context as a way of comparing this package with others.

Which of these is easier? Which of them is more future proof? Which of them is more trustworthy? 

ChatGPT is easy but... can you trust it? What if the answer is a hallucination? The less info about the problem was in the training set, the more likely the answer is wrong. You can ask ChatGPT to explain but can you trust the explanation is not hallucinatory? Same with Copilot. The only way you can trust it is if you already know the answer, and it functions as a reminder. Or if the answer is at the periphery of your knowledge and you can extrapolate from there sufficiently to intuit it's correctness. 

StackOverflow has a reputation system. This is invaluable. You know that the answer of Jon Skeet with 900 votes is more trustworthy than the seventh answer below with 12 votes. Moreover, that topmost answer has a conversation attached to it: a conversation in which the most recent addition is one month ago. And you see an explanation o the solution. Moreover, you can easily fix the traceability of the code by adding a url to the solution in the code. 

In theory, one could create some semblance of traceabiliy with code annotations that would also track the code that was generated together with the context. 

npm is the solution that realizes that each software system is part of a larger ecosystem. This is what the software engineering community has learned to be the best solution we have yet. There is somebody who keeps track of the evolution of the world out there, and when things chance, and browsers change, they will update the package and you will get the updates for free. This is still the easiest solution, and the 


