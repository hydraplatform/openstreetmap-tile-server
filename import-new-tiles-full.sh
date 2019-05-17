#!/bin/bash
# Usage: ./import-new-tiles-full.sh  <file-relative-path wihtout extension >
# Examples:
# If the file is located in "$osm_root_folder/data" and is named "merged/africa-myanmar-gb-latest.osm.pbf"
# ./import-new-tiles-full.sh  merged/africa-myanmar-gb
#
source ./variables.sh
filename=$1
now=`date +"%Y-%m-%d.%H.%M.%S"`
mkdir -p "$osm_root_folder/logs/$filename"
echo "Created $osm_root_folder/logs/$filename"
echo "Stop Tile Server"
./stop-and-remove-container.sh > "$osm_root_folder/logs/import.$now.log" 2>&1
echo "Remove volumes"
./remove-volumes.sh >> "$osm_root_folder/logs/import.$now.log" 2>&1
echo "Setup new volumes"
./setup-server.sh >> "$osm_root_folder/logs/import.$now.log" 2>&1
echo "Import $filename"
./import-data.sh $filename >> "$osm_root_folder/logs/import.$now.log" 2>&1
echo "Run Tile Server"
./run-server.sh >> "$osm_root_folder/logs/import.$now.log" 2>&1
