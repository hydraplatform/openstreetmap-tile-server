#!/bin/bash
echo "Building the basic Tile server"
docker build --no-cache -t "traning-hydra-osm-tile-server" -f ./Dockerfile.step1 .
