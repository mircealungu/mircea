# Software Visualization

The difference between building architecture and software architecture is that in the first case, if one creates a monstrosity -- it is obvious to everybody while in the second, it is very unlikely for anybody to see. 

The fact that monstrous software architectures exist is not an aesthetic judgement or problem. It's an essential mental health and organizational problem. 

Indeed the fact that a software system is a pain to work with can be a strong reason for people leaving: we all know engineers who switched companies rather than working on horrible systems that they were assigned to. Moreover, when maintainability of a system becomes so low that it's evolution is slowed down, this can also impact the company or organization. This happens to both companies and government agencies. The story of the Danish tax code system is a good example.

One way to address this problem is to work on software visualization - the discipline of generating visual representations of software systems that will help with seeing the structure and detecting whether it needs improvement and how. This is not easy, because of the complexity of large software systems and the diversity of technologies that these systems entail. Our solution is to create multiple visual perspectives and views that together can provide insight into the condition of a system.

## Git-Truck

Language Independent Repository Visualization - with projects like [Git-Truck](../projects/git-truck.md)



## ArchLens 

One limitation of all these directions is the fact that the visualization tools are interactive. What I think we need to do for these to become more useful is to allow the customization of the views from source code, such that developers can commit to version control view definitions. This way, the architectural views can become part of a developers daily job. As opopsed to having the views specified in Powerpoint. Ask any developer whether their Powerpoint architectural diagrams are useful for them in their daily life. Or if they are up to date. I'm starting a project in this direction actually with a few interested students. There's also a [paper in progress]() that I'm happy to get feedback on. Please reach out to me if this is something that you think you might be interested in. 

[ArchLens](../projects/ArchLens.md)

