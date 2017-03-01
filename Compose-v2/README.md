# Docker-Cloud
An example of use of Docker Cloud balancer

Requirements:
-------------

This requirements is only for the example

* Docker Tools (Engine, Compose, Machine).
* Docker version 1.13
* make


Using Makefile:
---------------

~~~~
$ make install
$ make help (for more commands)
~~~~


Configure Domains:
------------------

* Modify your etc/host adding the development domains

~~~~
$ sudo vim /etc/host
127.0.0.1 web.dev
127.0.0.1 blog.dev
127.0.0.1 web2.dev
~~~~

Testing Balancer Hook:
----------------------
 
 * Uses the make command to down the container

~~~~
$ make down-external-app
~~~~

* Open the domains web2.dev in your browser and verify the server response

* Uses the make command to up the container

~~~~
$ make up-external-app
~~~~


NOTE:
* the hook only listen the container with label: "lb.hook=true" 
* The service monitor is running in the port 1936 and the access is configurated in the docker-compose of the load balancer. 
* you can use "http://127.0.0.1/status" for check the load balancer status.
