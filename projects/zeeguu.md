<h1><img src="/docs/assets/icons/zeeguu.svg" style="width:40px; margin-right: 0.5em"/>Zeeguu</h1>

Zeeguu is a project that aims to support learners of foreign languages accelerate the acquisition of their vocabulary by a three-pronged approach:
1. Finding relevant articles on the net for them
1. Supporting their reading with translation and pronunciation 
1. Strengthening retention with the use of automatically and personally generated vocabulary exercises

The architecture of Zeeguu includes both a browser extension and a web application that communicate with each other. 

- Source code: [github.com/zeeguu](https://github.com/zeeguu)
- Online: [zeeguu.org](https://zeeguu.org)
- Contributors: many students over the years


## Papers
[**As We May Study: Towards the Web as a Personalized Language Textbook**](/docs/assets/papers/18-AsWeMayStudy.pdf)
	- in this paper we introduce the project
	- we report on a study of using it in a highschool French class in the Netherlands
	- students are **positive about it** and **take advantage of the opportunity of reading on the topics that they like**

[**Bootstrapping an ubiquitous monitoring ecosystem for accelerating vocabulary acquisition**](/docs/assets/papers/16-Bootstrapping.pdf) 
	- a paper that presents a generic ecosystem architecture of which Zeeguu is an instantiation 

[**Analyzing user interactions to estimate reading time in web-based L2 reader applications**](https://research-publishing.net/manuscript?10.14705/rpnet.2022.61.1453) - paper with [Nora Hollenstein](https://norahollenstein.github.io/) - we describe how one can estimate reading time on the web when they study free reading in the wild


## Reports & Theses

[**Audio in Digital Learning Environments**](../docs/assets/reports/22-thesis-audio-exercises.pdf) - a controlled experiment with 22 participants shows that users find zeeguu with audio-focused exercises more **fun** and **increases the likelyhood that they'll use it in the future**

[**Supporting Foreign Language Learning With a Browser Extension**](../docs/assets/reports/22-thesis-browser-extension.pdf) - thesis introducing an architecture for a browser extension for Zeeguu - half of 32 participants **prefer the browser extension which cleans up an article page to the original page**; the extension also adds interactive translation and pronunciation for reading  - the thesis also discusses **challenges with maintaining such a browser extension**

## Future Work
- better and more meaningful progress feedback 
- better and more precise time-measurement on the platform (include exercises, include reviewing words, etc.)
- more diverse exercises: e.g. reorder parts of sentence into whole with drag and drop
- add a social component: allow the learners in a class see each other's activity; allow seeing social feedback on existing articles
- create mobile applications for the various platforms; probably with a cross-platform tech, e.g. Flutter
- research questions that should be answereed
	- how important is the difficulty estimator given that Zeeguu supports the reader also with translations - so they can read texts that are harder than their level; how much harder than their level can they read now? 
	- how to evaluate the efficiency of the exercise scheduling algorithm?
	- 