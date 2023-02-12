# Removing Import Duplications

Programmers, par excellence have to automate repetitive tasks. 
Programming languages are supposed to be good at this.

However, in the languages that I have used until now, there is one glaring and mind-numbing repetitive task that a progammer has to do over and over again. At the top of every file she has to import, very often, over and over, the same elements. 

Yes, it's important to differentiate the `useState` function from the `react` packckage from another possibyl elsewhere defined `useState` function. However, when in hundreds of files in a project one finds themselves always, importing the same old `useState` from `react` it becomes a stupid...

So I wonder, if a possible solution would be some kind of import visibility inheritance: an import at the top level of a module being visible in the submodules, unless overloaded. From a user's POV, this would save quite a bit of duplicated stupid work. 

I wonder if there are languages that do this, or whether there are arguments on why this would not be a good idea. 

