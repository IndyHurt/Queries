drop table if exists results;
create table results (query_name text, value real);


insert into results (query_name, value) values ('km_new_roads', (SELECT sum(ST_Length(way))/1000 AS km_new_roads FROM planet_osm_line where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and osm_version = '1' and osm_id > 0));

insert into results (query_name, value) values ('km_edits_to_existing_roads', (SELECT sum(ST_Length(way))/1000 AS km_edits_to_existing_roads FROM planet_osm_line where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and osm_version > '1' and osm_id > 0));

insert into results (query_name, value) values ('km_new_named_roads', (SELECT sum(ST_Length(way))/1000 AS km_new_named_roads FROM planet_osm_line where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and name is not null and osm_version = '1' and osm_id > 0));

insert into results (query_name, value) values ('km_existing_named_roads', (SELECT sum(ST_Length(way))/1000 AS km_edits_to_existing_named_roads FROM planet_osm_line where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and name is not null and osm_version > '1' and osm_id > 0)); 

insert into results (query_name, value) values ('km_new_oneways', (SELECT sum(ST_Length(way))/1000 AS km_new_oneways FROM planet_osm_line where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and osm_version = '1' and (oneway = 'yes' or oneway = '-1') and osm_id > 0));

insert into results (query_name, value) values ('km_existing_oneways', (SELECT sum(ST_Length(way))/1000 AS km_edits_to_existing_oneways FROM planet_osm_line where highway in ('motorway', 'motorway_link', 'trunk', 'trunk_link', 'primary', 'primary_link', 'secondary', 'secondary_link', 'residential', 'residential_link', 'service', 'tertiary', 'tertiary_link', 'road', 'track', 'unclassified', 'living_street') and osm_version > '1' and (oneway = 'yes' or oneway = '-1') and osm_id > 0)); 

insert into results (query_name, value) values ('building_count', (SELECT COUNT (*) FROM planet_osm_polygon where building is not null and building != 'no' and osm_id > 0));

insert into results (query_name, value) values ('buildings_polygons_with_addresses', (SELECT COUNT (*) FROM planet_osm_polygon where building is not null and building != 'no' and osm_id > 0 and ("addr:housenumber" is not null or "addr:housename" is not null or "addr:street" is not null)));

insert into results (query_name, value) values ('sqkm_buildings', (SELECT sum(ST_Area(way)/1000) as buildingAreaSqKm from planet_osm_polygon where building is not null and building != 'no' and osm_id > 0));

insert into results (query_name, value) values ('aerialway_pois',(select count(*) from planet_osm_point where aerialway is not null));

insert into results (query_name, value) values ('aeroway_pois',(select count(*) from planet_osm_point where aeroway is not null));

insert into results (query_name, value) values ('amenity_pois',(select count(*) from planet_osm_point where amenity is not null));

insert into results (query_name, value) values ('barrier_pois',(select count(*) from planet_osm_point where barrier is not null));

insert into results (query_name, value) values ('highway_pois',(select count(*) from planet_osm_point where highway is not null));

insert into results (query_name, value) values ('historic_pois',(select count(*) from planet_osm_point where historic is not null));

insert into results (query_name, value) values ('leisure_pois',(select count(*) from planet_osm_point where leisure is not null));

insert into results (query_name, value) values ('lock_pois',(select count(*) from planet_osm_point where "lock" is not null));

insert into results (query_name, value) values ('man_made_pois',(select count(*) from planet_osm_point where man_made is not null));

insert into results (query_name, value) values ('natural_pois',(select count(*) from planet_osm_point where "natural" is not null));

insert into results (query_name, value) values ('railway_pois',(select count(*) from planet_osm_point where railway is not null));

insert into results (query_name, value) values ('shop_pois',(select count(*) from planet_osm_point where shop is not null));

insert into results (query_name, value) values ('tourism_pois',(select count(*) from planet_osm_point where tourism is not null));

insert into results (query_name, value) values ('waterway_pois',(select count(*) from planet_osm_point where waterway is not null));

select * from results