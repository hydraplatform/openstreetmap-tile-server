#!/bin/bash
filename=$1
# echo $filename

filepath="/home/training/data/$filename.osm.pbf"
# echo $filepath
if [[ -e $filepath ]]; then
	echo "Importing $filepath"
   	docker run -v $filepath:/data.osm.pbf -v $osm_data_volume:/var/lib/postgresql/10/main $osm_step_2_image_name import
else
	echo "$filepath Not Found!"
fi
