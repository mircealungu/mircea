<h1><img src="/docs/assets/icons/zeeguu.svg" style="width:40px; margin-right: 0.5em"/>Zeeguu</h1>
Almost 20,000 people [were enrolled](https://cphpost.dk/2021-12-15/news/huge-spike-in-people-learning-danish/) in Danish classes in 2021. At the global level more than 1.2 billion are learning a new language at any given moment.


Zeeguu is a project that aims to support learners of foreign languages accelerate the acquisition of their vocabulary by a three-pronged approach:
1. Automatically finding relevant materials on the Internet for them
1. Supporting their reading with translation and pronunciation 
1. Strengthening retention with the use of automatically and personally generated vocabulary exercises

The architecture of Zeeguu includes both a browser extension and a web application that communicate with each other. 

- Source code: [github.com/zeeguu](https://github.com/zeeguu)
- Online: [zeeguu.org](https://zeeguu.org) (try it with the `zeeguu-beta` invite code)
- Contributors: many students over the years


## Presentations 

2025: **Zeeguu - Personalized Learning Paths Through the Internet**
- [Workshop](https://whova.com/embedded/event/zb%40pE5K9UuizkCJvdbtpWMe0OdQAkB2XxdT7ACOafDs%3D) at EuroCALL in Milano, Italy

2025: **How Polyglots Can Benefit from A Platform for Multilingual Free Reading and Vocabulary Learning**
- Workshop at the [Polyglot Gathering](https://www.polyglotgathering.com/2025/en/program/) in Brno, Czech Republic

2022: [**Can we make learning foreign languages more personalized?**]()
- Invited talk at University of Lausanne 

2021: [**Lessons Learned Developing a Personalized Language Learning System**]()
- Keynote at EASEAI: International Workshop on Education, Software Engineering, and AI 



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

## In Progress


- More diverse exercises: e.g. reorder parts of sentence into whole with drag and drop
- Better personalized recommendations
- Improved difficulty recommendation
- Better topic assignment to articles



## Roadmap

### Recommendation System Improvements

#### Duplicate Article Detection and Clustering

#high-impact 

**Problem**: Multiple articles covering the same news event lead to redundant recommendations, especially problematic when users mark content as uninteresting.

**Proposed Solution**: 
- Use embeddings to detect semantically similar articles describing the same event
- Implement clustering to group related articles together
- Select the highest-quality article from each cluster for recommendation

**Optional, more challenging path**
- When multiple articles map on the same topic summarize all of them
- Show the learner all the possible sources for a given topic (as google news does)

**Implementation Considerations**:
- Embedding-based similarity detection is cost-effective compared to LLM pairwise comparisons
- Need threshold tuning to balance over-clustering vs under-clustering
- Consider temporal factors (articles published within similar timeframes about the same topic)

#### Enhanced Content Personalization

**Current State**: Seven broad topic categories

**Goal**: Enable granular topic specification for personalized recommendations

**Possible approaches:**
- Tag-based topic selection
- User interest weighting system
- Feedback loop for continuous personalization improvement

#### Cross-Language News Following

**Use Case**: Users wanting to follow German news in Italian.

**Challenge**: Translation costs for all language combinations

**Suggested Approach**:
- Implement on-demand translation rather than pre-translation
- Use caching for popular language pairs
- Consider tiered service (premium feature for less common combinations)

### Missing Features

#### Interactive Conversation Practice

#high-impact 

**Concept**: Context-driven conversational practice based on recently read articles

**Feature Flow**:
1. User selects situation/topic (optionally they can start a conversation from within an article which would imply that article to be the topic)
2. System generates conversation starter with individually translatable words
3. User responds via:
   - Multiple choice selection
   - Word unscrambling exercise
4. Conversation continues dynamically
5. Optional conversion to audio lesson once the conversation is finished


#### Native Mobile Applications

#high-impact 

**Goal**: Improve mobile accessibility to address the current PWA limitations

**Analysis**:
- **Pros**: Better user adoption, push notifications, app store visibility
- **Cons**: Development/maintenance overhead, platform-specific requirements
- **Recommendation**: Start with hybrid approach (WebView wrapper) for MVP
- **iOS Consideration**: Apple's guidelines may require more native functionality

#### eBook Reader 
**Concept**: Foreign language ebook reading with interactive translations and vocabulary building

**Technical Challenges**:
- Parsing popular ebook formats (e.g. EPUB, pdf)
- Pagination and text reflow
- Bookmark synchronization across devices


#### PDF Document Support

**Use Case**: Users studying personal materials in foreign languages
**Implementation**: File upload → text extraction → interactive translation layer

#### Universal Web Extension

**Problem**: Current extension doesn't work on all page types (forums, etc.)

**Solution**: Develop more robust content detection and make the content that is detected to be in the learned language interactive with a button click from the extension. 

#### Post-Reading Knowledge Assessment

#high-impact 

**Concept**: Interactive comprehension testing after article completion

**Benefits**: Reinforces learning, provides progress metrics


### Language Education Enhancements

#### Morphological Awareness System

#high-impact 

**Problem**: Inflected forms (e.g., Danish "god" vs "godt") are currently treated as separate words
**Solution**: Integrate grammatical knowledge to recognize word relationships

**Implementation Strategy**:
- Use morphological analyzers for supported languages
- Group related word forms in vocabulary learning
- Adjust difficulty based on morphological complexity
- Propose an updated DB model for supporting morphological relations between 

#### Smarter Exercise Scheduling

**Current Issue**: All words follow identical 8-exercise progression regardless of difficulty

**Proposed Improvement**: 
- Start with complex exercises for assessment
- Adapt progression based on performance
- Implement research-backed spaced repetition intervals
- Consider A/B testing different algorithms for evaluating the various alternatives (allow learners to choose?)


#### Comprehensive Progress Tracking
**Goal**: Meaningful feedback on learning journey

**Metrics to Consider**:
- Words learned over time
- Reading comprehension improvement
- Goal achievement tracking (e.g., 3 days/week usage)
- Streak maintenance

**Inspiration**: FitBod has quite a good positive reinforcement model
**Implementation**: Dashboard with visualizations and achievement system

#### More comprehensive activity tracking on the platform

- In the past zeeguu tracked learner's interactions with exercises and articles read
- However, the latest versions have other contexts in which the learner can still be consider5ed to be active (e.g. , browsing interactive summaries, or swiping through them)



# Resources

- For polyglots, the native language is still [more special than all the others](https://news.mit.edu/2024/mit-study-polyglots-brain-processing-native-language-0310) in that 
