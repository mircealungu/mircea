# Removing Import Duplications

Programmers, par excellence have to automate repetitive tasks. 
Programming languages are supposed to be good at this.

However, in the languages that I have used until now, there is one glaring and mind-numbing repetitive task that a progammer has to do over and over again. At the top of every file she has to import, very often, over and over, the same elements. 

Yes, it's important to differentiate the `useState` function from the `react` packckage from another `useState` function. However, when in 40 files in a project one finds themselves always, importing `useState` from `react` it becomes a nuissance.

So I wonder, are there any languages that have explored with imports at the top level of a module being visible in the submodules, unless overloaded? From a user's POV, this would save quite a bit of duplicated stupid work. 