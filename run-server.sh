#!/bin/bash
source ./variables.sh
echo "Running the Tile server"
docker run --rm -p 8190:80 --name $osm_container_name \
                    -v $osm_data_volume:/var/lib/postgresql/10/main \
                    -v $osm_tiles_volume:/var/lib/mod_tile -d \
                    $osm_step_2_image_name run # overv/openstreetmap-tile-server run
