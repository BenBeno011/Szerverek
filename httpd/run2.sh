#!/bin/bash

docker build -t myhttpd:v2 -f ./Dockerfile2 .
docker create -it -v /home/admin/docker:/shared -p 8084:80 --name httpd2 --hostname httpd2 myhttpd:v2
docker start httpd2