There are periods when I'm addicted to social media, to the point where I involuntarily would open a new tab, type face, wait for 100ms for the browser to auto-complete, and then press enter to discover myself again on facebook. 

In the past we've created a nice browser extension for redirecting, but it does not work on Safari. 

So here's a very basic solution to the issue: 


Redirect your /etc/hosts to localhost (cf. here: https://gist.github.com/djaiss/85a0ada83e6bca68e41e)



    ➜  ~ httpd -t -D DUMP_INCLUDES

	Included configuration files:
	  (*) /private/etc/apache2/httpd.conf
	    (509) /private/etc/apache2/extra/httpd-mpm.conf
	    (515) /private/etc/apache2/extra/httpd-autoindex.conf
	    (555) /private/etc/apache2/other/mpm.conf
	    (555) /private/etc/apache2/other/php7.conf
	AH00558: httpd: Could not reliably determine the server's fully qualified domain name, using Mirceas-MacBook-Pro-2.local. Set the 'ServerName' directive globally to suppress this message


Then 
```
~ cat /private/etc/apache2/httpd.conf | grep DocumentRoot

**DocumentRoot** "/Library/WebServer/Documents"

```

Then put your `index.html` page there, something like:
```
<meta http-equiv="refresh" content="0; URL=https://www.zeeguu.org/exercises" />
```

Then change the permissions of the folder to add (+)  *execute* (x) to *others* (o)

```
sudo chmod -R o+x /Library/WebServer/Documents

```

Then start the web server at startup

```
sudo launchctl load -w /System/Library/LaunchDaemons/org.apache.httpd.plist
```

(cf. https://www.simplified.guide/apache/macos-start-on-boot)



The thing does not work... it blocks but does not redirect:

https://superuser.com/questions/1803780/etc-hosts-blocks-instead-of-redirecting

Could be because 


cd /private/etc/apache2
mkdir certs
cd certs
mkcert localhost

vi /private/etc/apache2/httpd.conf


continuing from here: https://getgrav.org/blog/macos-ventura-apache-ssl

The first step is to make some modifications to your `httpd.conf`:

```bash
code /opt/homebrew/etc/httpd/httpd.conf
```

Copy

In this file you should uncomment both the `socache_shmcb_module`, `ssl_module`, and also the include for the `httpd-ssl.conf` by removing the leading `#` symbol on those lines:

```apache
LoadModule socache_shmcb_module lib/httpd/modules/mod_socache_shmcb.so
...
LoadModule ssl_module lib/httpd/modules/mod_ssl.so
...
Include /opt/homebrew/etc/httpd/extra/httpd-ssl.conf
```

If your host doesn't have a registered DNS name, enter its IP address here...  We use localhost

ServerName localhost:80


Adding the following in the VirtualHost in the /private/etc/apache2/extra/httpd-ssl.conf

```

Header always set Strict-Transport-Security "max-age=63072000; includeSubDomains"
```





Restarting
```xml
sudo apachectl restart
```

https://apple.stackexchange.com/questions/16781/how-to-control-apache-service-on-os-x-start-stop-restart-graceful-restart


