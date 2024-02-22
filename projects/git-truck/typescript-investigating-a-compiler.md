# Typescript: Type-checking Is Difficult

![](img/typescript.png)

The Typescript compiler teaches us a few things about the architecture of a language compiler. Image 
- Type-checking can be complicated: `checker.ts` is the most changed file in the project with 7K commits; then again, the type system of Typescript is complicated!
- A large battery of tests is essential - compare the number of files in the tests folder with the files in the compiler folder :)

Highlighting the single author files... shows that there are almost no such files :) This is a heavily collaborative project. 

![](../../docs/assets/Pasted%20image%2020240222134648.png)


## How to replicate this case study?

```
git https://github.com/microsoft/TypeScript.git
npx git-truck@latest
```

Note that cloning the Typescript repository can be slow. It's a big project!