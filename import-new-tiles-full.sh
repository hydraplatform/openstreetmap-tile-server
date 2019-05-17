#!/bin/bash
source ./variables.sh
filename=$1
now=`date +"%Y-%m-%d.%H.%M.%S"`
mkdir -p "$osm_root_folder/logs/$filename"
./stop-and-remove-container.sh > "$osm_root_folder/logs/import.$now.log" 2>&1
./remove-volumes.sh >> "$osm_root_folder/logs/import.$now.log" 2>&1
./setup-server.sh >> "$osm_root_folder/logs/import.$now.log" 2>&1
./import-data.sh filename >> "$osm_root_folder/logs/import.$now.log" 2>&1
./run-server.sh >> "$osm_root_folder/logs/import.$now.log" 2>&1
