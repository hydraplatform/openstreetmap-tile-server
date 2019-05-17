#!/bin/bash
source ./variables.sh

echo "Deleting all DATA"
docker run --rm -v $osm_data_volume:/var/lib/postgresql/10/main
								$osm_step_2_image_name vacuum
