# Removing Import Duplications

Programmers, par excellence have to automate repetitive tasks. 
Programming languages are supposed to be good at this.

However, in the languages that I have used until now, there is one boring task that one has to do over and over again. At the top of every file she has to import often the same elements over and over again. 

Take for example React projects. In my experience, in every component one has to import the `useState` and `useEffect` functions from the `react` package. In the UI of [zeeguu](../projects/zeeguu.md), one of my research projects, `useState` is imported in 75 different React components as of 2023 February: 

![](../docs/assets/use_state_imports.png)

Yes, it's important to differentiate the `useState` function from the `react` packckage from another possibly elsewhere defined `useState` function. However, when in hundreds of files in a project one finds themselves always, importing the same old `useState` from `react` it becomes a bit silly.

So I wonder, if a possible solution would be some kind of import visibility inheritance: an import at the top level of a module being visible in the submodules, unless overloaded. From a user's POV, this would save quite a bit of duplicated silly work.

I know that there's IDE support for adding the imports automatically. In my experience that works sometimes and some other times does not work. And it's still a bit ugly.

I wonder if there are languages that do this, or whether there are arguments on why this would not be a good idea. 

