#!/bin/bash

echo "Start chatting with chromia AI!"
docker exec -it chromia-neural-interface_chr-node_1 sh -c 'bun run dev'