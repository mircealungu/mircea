### [Git-Truck](../git-truck.md) / [Examples](../git-truck.md#examples-of-usage)

# Typescript: Investigating a Compiler


Let's clone the Typescript compiler and analyze it with Git-Truck: 

```
git https://github.com/microsoft/TypeScript.git
npx git-truck@latest
```

Mapping the number of commits on both the file size and the color intensity results in the view below: 

![](img/typescript.png)

Two things are salient: 
1. `checker.ts` is by far the most changed file in the project with 7K commits. This should not necessarily be surprising though; the type system of Typescript is one of the most complex ones I've seen.  
2. The number of files in the tests folder is so large that they can't even be all rendered. This again, should not be a surprise, but a reminder that tests are essential especially for a compiler. 

Zooming into the `src/` folder and **highlighting the files that have a single author**... shows that there are almost no such files. Another highly collaborative project.

![](../../docs/assets/Pasted%20image%2020240222134648.png)


