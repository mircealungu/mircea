
Apr 15, 24

The [voice of reason](https://www.youtube.com/watch?v=NUb61YMu1_o&ab_channel=DLDConference) shouts on the streets, but nobody pays attention. How is it possible that such an important voice is not listened to?



April 1, 24
#### Where do you save the password for mysqldump such that it can be run non-interactively? 

- in an envvars? Nope! It's called an EnvironmentVariable for a reason. It's about specifying the environment in which you work. all the libraries that your process uses have access to envvars - less secure than a file
- in a file - but then, it's in plaintext; anybody that gets access to your user account, can read them.


#### Which is safer? 
with the port mapping 3456:3456 or without? why? 

![](docs/assets/Pasted%20image%2020240401105007.png)

##### Which is safer? 

push from the old server, that I have since 2years to the new server?
or pull from the new server?
which one do I trust more? 
that one should keep the credentials to the other one. 


