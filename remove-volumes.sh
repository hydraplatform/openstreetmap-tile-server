#!/bin/bash
source ./variables.sh

docker volume rm $osm_data_volume
docker volume rm $osm_tiles_volume
