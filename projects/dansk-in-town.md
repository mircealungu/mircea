# Dansk in Town

![](../docs/assets/dansk-in-town.png)
(Still from the Simpsons episode *Throw Grandpa to the Dane*. A wonderful lighthearted description of Copenhagen). 

*Dansk in town* is a research project in which we aim to understand whether we can augment the experience of foreigners in Denmark in such a way as to make every trip in town a learning experience. It's an app, and a concept. 

A prototype of the system was implemented by Mircea in React, and then Patrycja Zawrotniak, as part of her master thesis, has ported it to React Native and evaluated it with users for several weeks. Based on the discussions with the users, we learned that: 
- many people love the idea
- many learners do like to practice on images uploaded by other users, not only by themselves

## Ideas for Student Projects

To bring the project to the next level, several directions should be investigated:
- How to use **state of the art image analysis techniques to automatically extract the relevant text from an image**; the technical challenge is in UX and AI: how to integrate text extraction APIs with  an interactive app such that the user does not have to type the words they don't know. Then evaluate the impact on user satisfaction of the new feature. 
- In her thesis, Patrycja discovered that **adding a social network element where people can see other users photos is appreciated**. However, we can not let everybody share their pictures with everybody else because of abuse. Investigating a way of allowing users to chose whom they want to follow, would probably be the most scalable thing. Implementing this, and evaluating its impact on user satisfaction would make a nice thesis.
- **Audio vocabulary exercises** are important for learning Danish. Integrating audio exercises with the photos would make the app much more useful for learners. 
- More **gamification**. Would the addition of streaks, and other kinds of gamified feedback increase the engagement of learners? Would the fact that other users find  a given users' uploaded images useful increase motivation? Is there a way to use the geolocation in the uploaded images to improve the playfulness of the app?

## Prototype

Try out the current app on your phone:
![](../docs/assets/qr-codes-dansk-in-town.png)

## Codebase
Code is available as open source [on GitHub](https://github.com/zawropati/dansk_in_town_mobile)

## Reading

The [thesis of Patrycja](../docs/assets/Patrycja-Thesis.pdf) has much more information about the project. 

