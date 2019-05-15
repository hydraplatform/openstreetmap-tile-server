# Refresh the server Data with a new map

## Semi automated process for refreshing the Map servers

Download the map
```bash
download-data.sh <name of the map with eventual continent prefix, example: europe great-britain>
```

If the OSM containers are running:
```bash
stop-and-remove-container.sh
```

Then we can remove the volumes containing data
```bash
remove-volumes.sh
```

Then recreate the server
```bash
setup-server.sh
```

And import the data
```bash
import-data.sh <filename with prefix, example: europe/great-britain>
````
Now the server contains all the wanted data

We can now run the server
```bash
run-server.sh
```
