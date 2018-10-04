#!/bin/bash
source ./variables.sh
docker stop  $osm_container_name && docker rm  $osm_container_name
