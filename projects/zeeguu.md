<h1><img src="/docs/assets/icons/zeeguu.svg" style="width:40px; margin-right: 0.5em"/>Zeeguu</h1>
Almost 20,000 people [were enrolled](https://cphpost.dk/2021-12-15/news/huge-spike-in-people-learning-danish/) in Danish classes in 2021. At the global level more than 1.2 billion are learning a new language at any given moment.


Zeeguu is a project that aims to support learners of foreign languages accelerate the acquisition of their vocabulary by a three-pronged approach:
1. Automatically finding relevant materials on the Internet for them
1. Supporting their reading with translation and pronunciation 
1. Strengthening retention with the use of automatically and personally generated vocabulary exercises

The architecture of Zeeguu includes both a browser extension and a web application that communicate with each other. 

- Source code: [github.com/zeeguu](https://github.com/zeeguu)
- Online: [zeeguu.org](https://zeeguu.org) (try it with the `zeeguu-beta` invite code)
- Mobile: [iOS](https://apps.apple.com/us/app/zeeguu-news-for-learners/id6756917355) (since January 2026) and [Android](https://play.google.com/store/apps/details?id=org.zeeguu.app) (since February 2026)
- Contributors: [many students over the years](https://zeeguu.org/about)


## Presentations 

2026: **Doubly-Personalised Language Learning: Matching Topic and Difficulty in Reading and Listening**
- Talk at the [IATEFL LTSIG](https://ltsig.iatefl.org/) event *Green Intelligence: AI and Sustainable Paths in Language Learning* in Limassol, Cyprus

2026: **Inside a Free Reading App: Eight Years of Learners, One Year of LLMs, and How Neither Behaves as You'd Expect**
- Talk at the MALL SIG at EuroCALL in Belfast, Northern Ireland

2026: **The Words They Don't Look Up: Inferring Vocabulary from Reading Behavior**
- Talk at the [EuroCALL](https://eurocall-languages.org/) conference in Belfast, Northern Ireland

2025: [**Zeeguu - Personalized Learning Paths Through the Internet**](assets/EuroCALL-2025-Presentation.pdf) 
- [Workshop](https://whova.com/embedded/event/zb%40pE5K9UuizkCJvdbtpWMe0OdQAkB2XxdT7ACOafDs%3D) at EuroCALL in Milano, Italy

2025: **How Polyglots Can Benefit from A Platform for Multilingual Free Reading and Vocabulary Learning**
- Workshop at the [Polyglot Gathering](https://www.polyglotgathering.com/2025/en/program/) in Brno, Czech Republic

2022: [**Can We Make Learning New Languages More Personalized?**](assets/Can-We-Make-Learning-New-Languages-More-Personalized.pdf)
- Invited talk at University of Lausanne 

2021: [**Lessons Learned Developing a Personalized Language Learning System**](assets/EASEAI-Keynote-Lessons-Learned.pdf)
- Keynote at [EASEAI](https://easeai.github.io/): International Workshop on Education, Software Engineering, and AI 

2020: **Workshop about Zeeguu** at the EuroCALL conference

2019: **Talk about Zeeguu** at the EuroCALL conference



## Papers
[**Architectural Patterns for Integrating LLMs into User-Facing Applications**](https://llm-patterns.mircealungu.com/paper.pdf) - accepted at PLoP 2026 in Canada
	- a catalogue of the recurring patterns that emerge when an LLM becomes a component inside an interactive application that is expected to be **fast, reliable, and trustworthy** while the model is **slow, costly, non-deterministic, and imprecise**
	- grouped in three families: *using the LLM efficiently*, *trusting LLM output*, and *managing change over time*
	- the patterns are grounded in the experience of integrating LLMs into Zeeguu

[**As We May Study: Towards the Web as a Personalized Language Textbook**](/docs/assets/papers/18-AsWeMayStudy.pdf)
	- in this paper we introduce the project
	- we report on a study of using it in a highschool French class in the Netherlands
	- students are **positive about it** and **take advantage of the opportunity of reading on the topics that they like**

[**Bootstrapping an ubiquitous monitoring ecosystem for accelerating vocabulary acquisition**](/docs/assets/papers/16-Bootstrapping.pdf) 
	- a paper that presents a generic ecosystem architecture of which Zeeguu is an instantiation 

[**Analyzing user interactions to estimate reading time in web-based L2 reader applications**](https://research-publishing.net/manuscript?10.14705/rpnet.2022.61.1453) - paper with [Nora Hollenstein](https://norahollenstein.github.io/) - we describe how one can estimate reading time on the web when they study free reading in the wild

[**Aiki: Turning Procrastination into Microlearning**](../docs/assets/papers/Aiki-CHI21.pdf) - accepted at CHI 2021 - a paper that uses Zeeguu to teach vocabulary in the moments of online procrastination - see the [Aiki](/projects/aiki) project page for details


## Reports & Theses


[**Audio in Digital Learning Environments**](../docs/assets/reports/22-thesis-audio-exercises.pdf) - a controlled experiment with 22 participants shows that users find zeeguu with audio-focused exercises more **fun** and **increases the likelyhood that they'll use it in the future**

[**Supporting Foreign Language Learning With a Browser Extension**](../docs/assets/reports/22-thesis-browser-extension.pdf) - thesis introducing an architecture for a browser extension for Zeeguu - half of 32 participants **prefer the browser extension which cleans up an article page to the original page**; the extension also adds interactive translation and pronunciation for reading  - the thesis also discusses **challenges with maintaining such a browser extension**



## Milestones

**2026** - the [iOS](https://apps.apple.com/us/app/zeeguu-news-for-learners/id6756917355) app is released in the App Store (January), followed by the [Android](https://play.google.com/store/apps/details?id=org.zeeguu.app) app on Google Play (February)

**2024** - Tiago implements an automatic multilingual topic classifier that works with seven top-level topics; articles similar to the ones a learner liked in the past start being recommended

**2023** - Mircea is awarded a **Villum Experiment** grant to improve the infrastructure and run a longitudinal study with 1000 users over six months; Tiago Ribeiro joins as the first researcher to work full-time on Zeeguu

**2022** - more than 1000 users have studied French with Zeeguu; together they interacted with more than 10.000 articles and translated more than 250.000 words

**2021** - Pernille Hvalsoe obtains funding from The Danish Agency for International Recruitment and Integration for a [project which uses Zeeguu to study how to increase personalization](https://cip.ku.dk/english/projects-and-collaborations/towards-a-personalised-textbook---new-tools-and-new-methods/) in Danish language courses; the beta-testers pass 200.000 translations

**2020** - a highschool in Rotterdam starts using Zeeguu in their language classes; the beta-testers reach 40.000 distinct words practiced in exercises

**2019** - a highschool in Amsterdam starts using Zeeguu in the French courses; the beta-testers pass 100.000 translations

**2018** - students at the Language Center of the University of Groningen use Zeeguu in their Dutch classes

**2017** - students at the Gomarus College in the Netherlands start using Zeeguu in their French classes

**2016** - Zeeguu is online and ready to welcome its first beta-testers

## Student Projects

All the projects below are going to be in two parts: 1. implementation and 2. evaluation. They are grouped largely by 

### Recommendation System Improvements

- [Duplicate Article Detection and Clustering](https://github.com/zeeguu/api/discussions/413) #priority
- [Enhanced Content Personalization](https://github.com/zeeguu/api/discussions/414)
- [Cross-Language News Following](https://github.com/zeeguu/api/discussions/415)
- [Language-independent paywall detection](https://github.com/zeeguu/api/discussions/416)

### New Features 

- Crowdsourcing Translation Correctness #high-impact  
- [Interactive Conversation Practice](https://github.com/zeeguu/api/discussions/417) #high-impact
- [Native Mobile Applications](https://github.com/zeeguu/api/discussions/418) #high-impact 
- [eBook Reader](https://github.com/zeeguu/api/discussions/419)
- [PDF Document Support](https://github.com/zeeguu/api/discussions/420)
- [Post-Reading Knowledge Assessment](https://github.com/zeeguu/api/discussions/421) #high-impact 


### Language Education Enhancements

- [Morphological Awareness System](https://github.com/zeeguu/api/discussions/422)
- [Smarter Exercise Scheduling](https://github.com/zeeguu/api/discussions/423)
- [Comprehensive Progress Tracking](https://github.com/zeeguu/api/discussions/424)
- Comprehensive time tracking on the platform

# Resources

- For polyglots, the native language is still [more special than all the others](https://news.mit.edu/2024/mit-study-polyglots-brain-processing-native-language-0310) in that 
