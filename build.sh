#!/bin/bash

# remove old images
docker rm $(docker ps -a)
docker rmi -f $(docker images -a -q)

# build using the docker-compose file
docker-compose up --build 