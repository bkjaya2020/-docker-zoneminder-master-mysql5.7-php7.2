# bkjaya1952/docker-zoneminder-master-mysql5.7-php7.2
Zoneminder-master , latest. docker image with Mysql5.7 &amp; MSMTP

Based on Isaac Connor's ZoneMinder Master Snapshots at https://launchpad.net/~iconnor/+archive/ubuntu/zoneminder-master


This image has been created on ubuntu:bionic with zoneminder-master/ubuntu bionic main
To pull the Repository from the dockerhub
please refer the following link

https://hub.docker.com/repository/docker/bkjaya1952/docker-zoneminder-master-mysql5.7-php7.2


Usage :

To create a Zonminder-master docker container (name zm)with mysql 8 & msmtp

On the Ubuntu terminal enter the following commands

<code>sudo docker create -t -p 8080:80 --name zm --privileged=true -e TZ=Asia/Colombo bkjaya1952/docker-zoneminder-master-mysql5.7-php7.2</code>

Note:- Replace Asia/Colombo  with your Time Zone 

<code>sudo docker start zm</code>

Configuring mysql for the first run only 

<code>sudo docker exec -t -i zm /bin/bash</code>

Now you are inside of zm container

<code>updatemysql.sh </code>

<code>exit</code>
