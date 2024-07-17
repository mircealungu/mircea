
---

Q: How do I build an image and give it a name? If I only say `docker build .` it gets now name. 

A: -t stands for tag
`docker build -t <name>:<tag> .`

---

Q: How do I enter this image that I just built, to investigate what's inside? 

`docker run -it zapi /bin/bash`

However, if your tag is not `:latest` you can't login to it w/o specifying the tag. Thus, it's better when building it to use `:latest`. 

---

Q: Why do I have to always do sudo docker ...? 


---

Q: How to get the latest version of the images?

A: `docker-compose pull`

---

Q: I have a container that is based on `mysql`: I want to recreate it with a different username/password combination. 

If I restart, nothing changes. I guess, I could - remove the volume and then restart? This is where the data should be saved. 

A: This [SO answer](https://stackoverflow.com/questions/59958574/why-isnt-force-recreate-rebuilding-my-docker-mysql-image) suggests 

```
docker-compose down --rmi all --volumes
```

Trying the following: 

```
docker-compose down --volumes
```

Does not allow me to change the DB password. Trying the option with `--rmi all` in the hope that I can get a mysql with different credentials. And I also deleted the /zeeguu-data/mysql folder. 

Yes. This worked. 

---

Q: `docker-compose` : what is the difference between `down` and `stop`?

A: `down` is for removing containers and networks and everything. Stop just stops a container. Elaborate [answer on SO](https://stackoverflow.com/questions/46428420/docker-compose-up-down-stop-start-difference). 



---

Q: In `docker-compose.yml` mapping , e.g. `"8081":"8080"`, which is the host side and which is the container side? 

A: LHS is host.

---

Q: How to add a new volume to an already existing service? E.g. I want to add the `/backup` volume to the mysql service.

- add the volume in docker compose
- run `docker compose up -d` 

This will only recreate the corresponding container. 

False friend: trying `docker restart api_mysql`  will not mount the new volumes!







