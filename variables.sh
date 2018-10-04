#!/bin/bash

# Shared variables
osm_step_1_image_name="traning-hydra-osm-tile-server"
osm_step_2_image_name="traning-hydra-osm-tile-server-finale"
osm_container_name="hydra-osm-tile-server-container"
osm_data_volume="openstreetmap-data"
osm_tiles_volume="openstreetmap-rendered-tiles"
osm_root_folder=$(cd && pwd)
