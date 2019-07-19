# Get superuser role
sudo -i

# Access to postgres
sudo -u postgres psql -d gis

# Clean init_tables
delete from planet_osm_line;
delete from planet_osm_nodes;
delete from planet_osm_point;
delete from planet_osm_polygon;
delete from planet_osm_rels;
delete from planet_osm_roads;
delete from planet_osm_ways;
delete from spatial_ref_sys;
