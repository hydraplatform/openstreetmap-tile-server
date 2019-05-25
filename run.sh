#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "usage: <import|run>"
    echo "commands:"
    echo "    import: Set up the database and import /data.osm.pbf"
    echo "    run: Runs Apache and renderd to serve tiles at /tile/{z}/{x}/{y}.png"
    echo "    vacuum: Clean dead data inside the DB"

    echo "environment variables:"
    echo "    THREADS: defines number of threads used for importing / tile rendering"
    exit 1
fi

if [ "$1" = "import" ]; then
    # Initialize PostgreSQL
    service postgresql start
    sudo -u postgres createuser renderer

    sudo -u postgres psql -c "DROP DATABASE IF EXISTS gis;"
    sudo -u postgres createdb -E UTF8 -O renderer gis

    sudo -u postgres psql -d gis -c "CREATE EXTENSION IF NOT EXISTS postgis;"
    sudo -u postgres psql -d gis -c "CREATE EXTENSION IF NOT EXISTS hstore;"
    sudo -u postgres psql -d gis -c "ALTER TABLE geometry_columns OWNER TO renderer;"
    sudo -u postgres psql -d gis -c "ALTER TABLE spatial_ref_sys OWNER TO renderer;"

    # Download Luxembourg as sample if no data is provided
    if [ ! -f /data.osm.pbf ]; then
        echo "WARNING: No import file at /data.osm.pbf, so importing Luxembourg as example..."
        wget -nv http://download.geofabrik.de/europe/luxembourg-latest.osm.pbf -O /data.osm.pbf
    fi
    echo "NEW RUN"
    # Import data
#    sudo -u renderer osm2pgsql -d gis --create --slim -G --hstore --tag-transform-script /home/renderer/src/openstreetmap-carto/openstreetmap-carto.lua -C 128 --number-processes ${THREADS:-4} -S /home/renderer/src/openstreetmap-carto/openstreetmap-carto.style /data.osm.pbf
    sudo -u renderer osm2pgsql -d gis --create --slim -G --hstore --tag-transform-script /home/renderer/src/openstreetmap-carto/openstreetmap-carto.lua -C 12000 --number-processes ${THREADS:-4} -S /home/renderer/src/openstreetmap-carto/openstreetmap-carto.style /data.osm.pbf

    exit 0
fi

if [ "$1" = "run" ]; then
    # Initialize PostgreSQL and Apache
    service postgresql start
    service apache2 restart

    # Configure renderd threads
    sed -i -E "s/num_threads=[0-9]+/num_threads=${THREADS:-4}/g" /usr/local/etc/renderd.conf

    # Run
    sudo -u renderer renderd -f -c /usr/local/etc/renderd.conf

    exit 0
fi

vacuum_db () {
  echo "Vacuum tables"
  sudo -u postgres psql -d gis -c "vacuum full verbose analyze;"
  echo "Reindex DB"
  sudo -u postgres psql -d gis -c "REINDEX DATABASE gis;"
  echo "Finished!"
}

if [ "$1" = "vacuum" ]; then
  # this command clean all PostgreSQL tables to free up space
  service postgresql start

  vacuum_db
  exit 0
fi

echo "invalid command"
exit 1
