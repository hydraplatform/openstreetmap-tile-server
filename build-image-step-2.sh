#!/bin/bash
source ./variables.sh
echo "Building the Tile server final"
docker build --no-cache -t "$osm_step_2_image_name" -f ./Dockerfile.step2 .
