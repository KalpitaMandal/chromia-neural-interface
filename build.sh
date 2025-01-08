#!/bin/bash

# remove old image
docker rmi -f $(docker images -a -q)

# build using the docker-compose file
docker-compose up --build 

sleep 10 # or whatever makes sense 

echo "Start chatting with chromia AI!"
docker exec -it chromia-neural-interface_chr-node_1 sh -c 'bun run dev'