
#Dockerized Tomcat

A simple dockerfile that show how to create a minimal version of Tomcat7 using Java7.
It downloads Tomcat7 from Apache website and places it under /opt/tomcat folder

**WARNING!**
Dockerfile.tomcat6 is an alternative, it is provided to install Tomcat6. To show the power of docker this is radically different form Tomcat7 Dockerfile.

Main differences:

* use an existing image having Ubuntu / Java 6
* install Tomcat from Ubuntu repositories
* allow to create a "tomcat6" user, an map to a user on host machine
(this may be useful)

##Prerequisites

* [Docker](https://docs.docker.com/installation/mac/)
* [Docker Compose](https://docs.docker.com/compose/) (opt.)

Replace configuration files with yours. In particular modify tomcat-users.xml file which contains user/pwd for Tomcat Manager. Default credentials are:

**admin/passoword**

This project suppose that you create a Tomcat container. You can place your webapp *.war file in three way:

* via Tomcat Manager
* via -v parameter via command line docker run
* via docker-compose by editing docker-compose.yml file


##Examples

Build & Run:
    [docker-compose] docker-compose up -d

Building:

    [docker-compose] docker-compose build
    [traditional] docker build -t tomcat .

Running:

    [docker-compose] docker-compose run -d tomcat
    [traditional] docker run -v <webapp_local_path>:/opt/tomcat/webapps/webapp.war -p 8080:8080 --name tomcat1 tomcat

Running (con bash interattiva):

    [docker-compose] docker-compose run tomcat
    [traditional] docker run -v <webapp_local_path>:/opt/tomcat/webapps/webapp.war -p 8080:8080 --name tomcat1 -i -t tomcat /bin/bash
    
Stopping or removing running container:

    [docker-compose] docker-compose stop
    [docker-compose] docker-compose rm --force        
    [traditional] docker rm -f tomcat1

##Credits

[giuseppevavala](https://github.com/giuseppevavala): for pair programming and for being a good friend
