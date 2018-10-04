#!/bin/bash
source ./variables.sh
filename=$1
# echo $filename

filepath="$osm_root_folder/data/$filename-latest.osm.pbf"
# echo $filepath
if [[ -e $filepath ]]; then
	echo "Importing $filepath"
   	docker run --rm -v $filepath:/data.osm.pbf -v $osm_data_volume:/var/lib/postgresql/10/main $osm_step_2_image_name import
else
	echo "$filepath Not Found!"
fi
