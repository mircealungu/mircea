# Notable Stuff I Read Online

Currently Reading
- Dominion, by Tom Holland

# 5 / 2024
- Collin Wright - A [lecture](https://www.realityslaststand.com/p/the-sex-binary-what-it-is-and-why?utm_source=substack&utm_medium=email&utm_campaign=email-half-post&r=lbgxq) on the sex binary is, as he says, sanity affirmation therapy. It is so strange how satisfying to so hear somebody who makes sense. Who *makes sense for you* that is. I would like to see the equivalent talk from the people who argue that sex is a continuum? 
- Stephen Wolfram - [What is ChatGPT Actually Doing](https://writings.stephenwolfram.com/2023/02/what-is-chatgpt-doing-and-why-does-it-work/comment-page-1/#comments) - extensive and clear introduction to neural nets, classification, and large language models


## 4
- the difference in code between GPT2, 3, and 3.5(4?) is not much in the architecture; it's much more in the amount of data that these models have been trained with. 
- the difference between ChatGPT and GPT is the extra >40man years of effort spent in training a model that can filter out outrageous answers
- about layoffs then and [now](https://www.linkedin.com/posts/carlos-arguelles-6352392_layoffs-google-microsoft-activity-7022670866874331136--soJ?utm_source=share&utm_medium=member_desktop) - a story from somebody who got laid off from MSFT 10 years ago in a humane way comparing with the way some people are laid off today at GOOG with their emails / access badges simply not working anymore  
- is PhD training fit for the times? [article](https://www.nature.com/articles/d41586-023-00084-3?fbclid=IwAR0mvwfB4IE6ZMWB9F5SVxgpjoNOfg1V_GcIbygX8QH_FPfTs3mjLn7ZMgc) in Nature talks about how a PhD used to be a student that apprenticed to learn the job from a professor but today's reality is that it's more likely they'll end up working in industry in a team
- bent flybert observing that one of his most cited papers was [initially written as a note to self](https://www.linkedin.com/feed/update/urn:li:activity:7016515623258054656?utm_source=share&utm_medium=member_desktop) (linkedIn)
- #todo #softwarearchitecture Erik Wilde - youtube [talk](https://www.youtube.com/watch?v=-vKcUVJIRVI&ab_channel=ErikWilde) on GraphQL vs REST APIs 
- if you update the #docker-compose config file with an evvar you need to `docker compose up -d` and the updated definition will be reflected in a new container #zeeguu 
- #memento: when running a #flask service inside of a docker container, [one must bind to 0.0.0.0 instead of localhost](https://stackoverflow.com/a/30329547/1200070) - otherwise the service is not available from outside #zeeguu 
- #nltk can have it's data folder configured [either via an envvar or programmatically](https://stackoverflow.com/questions/3522372/how-to-config-nltk-data-directory-from-code) #zeeguu 
- #docker pattern: specifying the `VOLUME` in the Dockerfile only to mount it later in a `docker-compose.yml`
- #docker pattern: only copying the `requirements.txt` and `setup.py` for development, such that the actual code is mapped in the volume at runtime.  
- #docker insight: a volume specified in the Dockerfile will be generated anew for each container, unless an explicit mapping is provided when container is run
- #docker connecting from within a container to a mysql service on the host - use `host.docker.internal`
- scrum is a general management process - could be about anything, not only software / agile is about programming (because it talks about "running code" over documentation / XP is about focusing on the programming part to the extreme / and also, as ronjeffries says: [scrum is not an agile framework](https://ronjeffries.com/articles/018-01ff/scrum-not-asd-1/) 
- it's funny to see how the "values" of many of the methodologies are just "human" values; in some sense, if your methodology requires you to list that "courage" is a value, then either you're not specific enough; scrum, xp, i'm looking at you, or 
- book [review](https://www.goodreads.com/review/show/2155621288?rto=friend_update_weekly_row&ref_=pe_42146500_693361700_review) reminding me that I want to re-read HTWFAIP 
- note to self: always bring a little power chord extender when travelling on a long journey on a train; the train models that have the power plug at the top rarely can hold the heavy power adapter from the mac; or bring duct tape
- #docker pattern: use `docker-compose run <image>` to [open an interactive shell](https://stackoverflow.com/a/36265910/1200070) 
- #db design - [pros and cons](https://dba.stackexchange.com/questions/7900/pros-and-cons-of-having-one-table-per-entity-vs-having-a-shared-table-with-an-e) for having a table per entity 
- "if you love me, i'll always be in your heart / if you hate me, i'll always be in your mind"
- ncdu - wonderful little command line tool for finding the largest files in a given folder #terminal 

