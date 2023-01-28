#draft 

Everybody computes complexity only by looking at the code. LOC, CC, WMC, etc. All are metrics that look at the code and try to "estimate" it's "complexity". 

However, what none of these metrics measure is how meaningful the identifiers in a given piece of code are. You can have perfect structure, if the naming is off, the code will be hard to understand. But even this, omits something essential about complexity: 

> Complexity is in the eye of the beholder

A chess position that's trivial for Magnus Carllson is probably difficult for me. 

Moreover, everybody who is interested in complexity is mostly interested in it as a proxy. What they are really after is "how difficult is this code to understand". Thus, it's important to take the subject that does that understanding into account. Is it supposed to be a new graduate with general programming knowledge. Or a senior developer with already extended experience in DB management systems? 

We must start studying it accordingly.

Ideas in this direction:
- Start by estimating the "level" of the developer comprehension
	- an Elo-like rating of code comprehension (as in chess, rate developers via their interactions with code snippets -- maybe a game that shows them snippets that they have to evaluate? idea came from a discussion with )
	- this becomes even more important in the context of CoPilot and other generative tools - the developer will have to evaluate code snippets much more often

Related topics
- Are front-ends more complicated than backends? Why? What can be done about it? 
- 