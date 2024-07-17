
exception tracing becomes more complicated when you use containers. 

e.g. from the main container's POV you only see that it could not connect to another container. but there's no stack trace from that one, so you don't know why it crashed. now you have to install the exception capturing also that other container. 

![](../docs/assets/Pasted%20image%2020240325115714.png)
however, now for the same problem you will have two notifications: one failure in each of the containers. it's a small nuisance. but better than not having the info handy.

