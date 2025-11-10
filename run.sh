#!/bin/bash

docker build -t myfedora-mariadb2:v1 .
docker run -d --env-file db.env -p 3366:3306 --name myfedora-mariadb2 --hostname myfedora-mariadb2 myfedora-mariadb2:v1