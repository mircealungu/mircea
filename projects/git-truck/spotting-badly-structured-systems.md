### [Git-Truck](../git-truck.md) / [Examples](../git-truck.md#examples-of-usage)

# Using Git-Truck for Spotting Badly Structured Systems

Your students have implemented a beautiful interactive application in React that provides school kids with the opportunity to practice mathematics exercises. It all looks beautiful from a UI POV. You don't have much time to look into the details of the codebase, so you fire up Git-Truck and look at the files that have the most commits. You get the image below. What do you investigate first? 

![](img/maths-camp.png)

Indeed, the `MultipleChoice.js` has by far the largest number of commits. You look into it and discover almost 1K LOC and 109 commits. It is a [God Class](https://wiki.c2.com/?GodClass) if ever was one. It does so much more than model a multiple-choice component should do. It should have been refactored into dozen subcomponents and functions. You use this class to start discussing the codebase with the students. 


## How to replicate this case study?
```
git clone https://github.com/MathsCamp/MathsCamp.git
npx git-truck@latest
```
