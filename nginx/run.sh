#!/bin/bash

docker build -t mynginx:v1 -f ./Dockerfile .
docker create -it -v /home/admin/docker/nginx:/usr/share/nginx/html -p 8081:80 --name nginx1 --hostname nginx1 mynginx:v1
docker start nginx1