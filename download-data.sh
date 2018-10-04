#!/bin/bash
source ./variables.sh
continent=$1
country=$2

file_path="$continent"
current_path=""



get_file_path() {
	local relative_path=$1
	echo "$osm_root_folder/data/$relative_path"
}




mkdir -p $(get_file_path "")
echo "mkdir -p $(get_file_path '')"
echo $country

target_path=$(get_file_path "")

if [[ ! -z $country ]]; then
	target_path=$(get_file_path "$file_path")
	mkdir -p $(get_file_path "$file_path") # If there is country I need the continent folder

	file_path="$file_path/$country"
	current_path=$file_path
fi
cd $target_path
echo "cd $target_path"
file_path="$file_path-latest"
# echo $filename

filepath="$file_path.osm.pbf"
# echo $filepath


echo "Downloading $filepath"
wget "http://download.geofabrik.de/$filepath"
