#!/bin/bash

docker build -t myhttpd:v1 -f ./Dockerfile .
docker create -it -v /home/admin/docker/httpd/html:/usr/local/apache2/htdocs -p 8083:80 --name httpd1 --hostname httpd1 myhttpd:v1
docker start httpd1