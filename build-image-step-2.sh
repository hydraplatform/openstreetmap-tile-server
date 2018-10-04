#!/bin/bash
echo "Building the Tile server final"
docker build --no-cache -t "traning-hydra-osm-tile-server-finale" -f ./Dockerfile.step2 .
