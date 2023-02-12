# Import Boilerplate

*12 February, 2023*

Programmers, par excellence have to automate repetitive tasks. 
Programming languages are good at supporting this. 

When a programmer has to write the same or very similar code over and over again, we call that *boilerplate code*, and we don't appreciate it. It can be either the fault of the system design, or it might be the fault of the language design. 

In all the modern languages that I have used until now, there is one kind of boilerplate code that is related to import statements, that as far as I can tell, nobody has found a good solution for removing. It's very minor. But it can be anoying. It has to do with the import statements. 

Take for example React projects. In my experience, in every non-trivial component in React, one has to import the `useState` and `useEffect` functions from the `react` package. In the UI of [Zeeguu](../projects/zeeguu.md), one of my research projects, `useState` is imported 75 times in 75 different React components. This is shown in the figure below which highlights the result of running the corresponding grep command, as of February 2023:

![](../docs/assets/use_state_imports.png)

Yes, it's important to differentiate the `useState` function from the `react` packckage from another possibly elsewhere defined `useState` function. However, in this project, the only `useState` function used in all the 75 different components is the one defined in the `react` package. When in dozens of files in a project one finds themselves always importing the same function or class over and over again, it becomes a bit silly. And it's against the ethos of programming, that of automating the repetitive tasks. 

So I wonder, if a possible solution would be some kind of import visibility inheritance: an import at the top level of a module being visible in the submodules, unless overloaded. From a user's POV, this would save quite a bit of duplication and tedious overspecification. 

I know that there's IDE support for adding the imports automatically. In my experience that works sometimes and some other times does not work. And it's still a bit ugly.

I wonder if there are languages that do this, or whether there are arguments on why this would not be a good idea. And obviously, I'm aware that Smalltalk being so far ahead of it's time, does not suffer from this problem, although last time I played with it, namespaces were a bit awkward, and at least in the Cincom VisualWorks version, avoiding conflicts in class names was done by using unique prefixes for every package.