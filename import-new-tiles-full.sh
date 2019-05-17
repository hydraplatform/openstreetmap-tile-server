#!/bin/bash
filename=$1

./stop-and-remove-container.sh
./remove-volumes.sh
./setup-server.sh
./import-data.sh filename
./run-server.sh
