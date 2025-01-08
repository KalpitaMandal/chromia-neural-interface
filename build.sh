#!/bin/bash

# remove old image
docker rmi -f $(docker images -a -q)

# build using the docker-compose file
docker-compose up --build 