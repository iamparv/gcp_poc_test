-- Contact: parvinder.singh@centurylink.com
CREATE DATABASE IF NOT EXISTS default_autotestbqdb9 LOCATION 'gs://dataproc-staging-us-central1-788915459809-fk8wm6rc/HQL/';

USE default_autotestbqdb9;

CREATE EXTERNAL TABLE IF NOT EXISTS
  DEFAULT.chicago_taxi_trips_parquet_autotestbq9(unique_key STRING,
    taxi_id STRING,
    trip_start_timestamp STRING,
    trip_end_timestamp STRING,
    trip_seconds STRING,
    trip_miles STRING,
    pickup_census_tract STRING,
    dropoff_census_tract STRING,
    pickup_community_area STRING,
    dropoff_community_area STRING,
    fare STRING,
    tips STRING,
    tolls STRING,
    extras STRING,
    trip_total STRING,
    payment_type STRING,
    company STRING,
    pickup_latitude STRING,
    pickup_longitude STRING,
    pickup_location STRING,
    dropoff_latitude STRING,
    dropoff_longitude STRING,
    dropoff_location STRING) STORED AS PARQUET location 'gs://dataproc-staging-us-central1-788915459809-fk8wm6rc/HQL/PARQUET/';
	
CREATE EXTERNAL TABLE IF NOT EXISTS
  DEFAULT.chicago_taxi_trips_csv_autotestbq9( unique_key STRING,
    taxi_id STRING,
    trip_start_timestamp STRING,
    trip_end_timestamp STRING,
    trip_seconds STRING,
    trip_miles STRING,
    pickup_census_tract STRING,
    dropoff_census_tract STRING,
    pickup_community_area STRING,
    dropoff_community_area STRING,
    fare STRING,
    tips STRING,
    tolls STRING,
    extras STRING,
    trip_total STRING,
    payment_type STRING,
    company STRING,
    pickup_latitude STRING,
    pickup_longitude STRING,
    pickup_location STRING,
    dropoff_latitude STRING,
    dropoff_longitude STRING,
    dropoff_location STRING)ROW FORMAT DELIMITED FIELDS TERMINATED BY ',' STORED AS TEXTFILE location 'gs://dataproc-staging-us-central1-788915459809-fk8wm6rc/HQL/CSV_table/';

INSERT INTO
  TABLE DEFAULT.chicago_taxi_trips_parquet_autotestbq9
SELECT
  *
FROM
  DEFAULT.chicago_taxi_trips_csv_autotestbq9;
