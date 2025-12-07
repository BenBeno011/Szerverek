#!/bin/bash

docker build -t mynginx2:v2 -f ./Dockerfile2 .
docker create -it -v /home/admin/docker:/shared -p 8082:80 --name nginx2 --hostname nginx2 mynginx2:v2
docker start nginx2