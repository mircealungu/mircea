*Any other feature by any other name would be as complicated*

You think, requirements are simple: I wants system that allows me to click on a word on a website, get a translation, save it to the database with the time when it was requested; allow the learner to practice the words with exercises based on the past contexts in which they encountered them. 

What could be so hard? 

Well, anybody that has written software for a living will tell you that there

# Click on a word and get a translation

What do you mean by this? It seems clear to you, does it not? Let's see. 

## Click on a word


What happens if the word is part of a link? If you click it, you follow the link?

I guess you could ignore links. But how do you even ignore links? And what if the word you need translated is part of the link? You can’t just ignore them. Maybe have a mode that deactivates links. But can you reactivate  them? Or maybe ctrl+click when on a link? And what about mobile? Would you want your users to use this also on the mobile?

## Get a translation

Hours do you get a translation? Use an API. You pay a bit but it’s fine. However, what do you do if an API is down? It slow? Get multiple. But what to do if they differ? Which is right? Show them all and let the user choose? And if they agree?

A word might have multiple meanings, so you probably want to get the translation that makes sense in that context. But the APIs don’t offer this as an option. You do find a hack… they all support HTML tags. For now you have obtained

What happens if you click on a particle verb. It means nothing. It needs to be understood with its particle. E.g. 

*Wir muss **steigen** der Zug **ab** hier *

What is the translation in this context. How do you even display it? Of over clicks on steigen what do we put above: the meaning of steigen or the meaning of absteigen ? For visual consistency one is better, for contextual the other is.

## Show the translation

Show it transiently and the hide it? Let us insert it at the top of the word. 


What happens if somebody clicks on an adjacent word? Would you translate it separately? It might have a different meaning alone than together with the previous word, so you might want to fuse the two. 


How do you know where the word ends? Some words have strange punctuation in them. E.g. e.g. or Dr. Dre, 

What do you do when a user clicks on the word rising in German in the context in which it is separated by its particle which is at the end of the sentence? Do you translate rising? Do you translate? But then how do you highlight it? 

and what do you do when the user clicks again on the same word? Does it mean they want to remove it? And what do you do when they click again after they close the article and they opened it again? Do you read recently saved word or do you get a translation again? This is easy right? Because as programmer now know that the translation from database is much faster than getting it from the Translation API. 




## Get a translation

Machine translation is not perfect. Different services will often return different translations. Which of them do you show to the user? You could show all of them and force them to choose every time. 

Or you could select the best, and let them see the alternatives only if they are not happy with the first one. 

And what do you do when somebody else has translated the same word?. And what do you do when the machine translation is not correct and the learner realises that is not correct? Can the learner upload their own translation? 



# Save the word in the database together with the translation and the context 

How do you compute the "context"? The current 

How do you save the word in the database? As a tripled: Word, translation, context? Might not be enough, you need to save word, position, context, and translation, because the same word might have a different translation 




