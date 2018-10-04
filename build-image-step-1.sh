#!/bin/bash
source ./variables.sh
echo "Building the basic Tile server"
docker build --no-cache -t "$osm_step_1_image_name" -f ./Dockerfile.step1 .
