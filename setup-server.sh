#!/bin/bash
source ./variables.sh

docker volume create $osm_data_volume
docker volume create $osm_tiles_volume
