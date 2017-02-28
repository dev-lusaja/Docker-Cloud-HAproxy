# Docker-Cloud
An example of use of Docker Cloud balancer

Requirements:
-------------

This requirements is only for the example

* Docker Tools (Engine, Compose, Machine).
* Docker version 1.13

>

Commands:
---------

* First create the external app

>

    $ cd external_app/
    $ docker-compose -p externalproject up -d

* Second create the load balancer

>

	$ cd load-balancer/
	$ docker-compose up -d

* Now verify the created containers

>

	$ docker ps

* Modify your etc/host adding the development domains

>

	$ sudo vim /etc/host
	127.0.0.1 web.dev
	127.0.0.1 blog.dev
	127.0.0.1 web2.dev

* Open the domains in your browser and verify the server response

NOTE: 

* The service monitor is running in the port 1936 and the access is configurated in the docker-compose of the load balancer. 
* you can use "http://127.0.0.1/status" for check the load balancer status.