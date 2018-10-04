#!/bin/bash
filename=$1
# echo $filename

filepath="/home/training/data/$filename.osm.pbf"
# echo $filepath
if [[ -e $filepath ]]; then
	echo "Importing $filepath"
   	docker run -v $filepath:/data.osm.pbf -v openstreetmap-data:/var/lib/postgresql/10/main overv/openstreetmap-tile-server import
else
	echo "$filepath Not Found!"
fi
