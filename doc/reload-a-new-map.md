# Refresh the server Data with a new map

## Semi automated process for refreshing the Map servers

If the OSM containers are running:

```bash
  stop-and-remove-container.sh
```

Then we can remove the volumens containing data
```bash
remove-volumes.sh
```

If not done before, download the map
```bash
download-data.sh <name of the map>
```

Then recreate the server
```bash
setup-server.sh
```

Now run the server
```bash
run-server.sh
```

And import the data
```bash
import-data.sh <filename>
```

Now the server contains all the wanted data
