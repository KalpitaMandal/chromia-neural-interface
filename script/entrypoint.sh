#!/bin/sh
set -e

# echo "Installing dependencies..."
# bun install
# echo "Dependencies installed!"

# echo "Building the Chromia node"
# chr build
# echo "Chromia node build ready!"

echo "Starting Chromia node and bun dev server.."
# chr node start --wipe 
# echo "Chromia node started!"

# starting supervisord
supervisord -n 