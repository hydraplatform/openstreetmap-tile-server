#!/bin/bash
echo "Running the Tile server"
docker run -p 80:80 --name hydra-osm-tile-server-container -v openstreetmap-data:/var/lib/postgresql/10/main -v openstreetmap-rendered-tiles:/var/lib/mod_tile -d traning-hydra-osm-tile-server-finale run # overv/openstreetmap-tile-server run

