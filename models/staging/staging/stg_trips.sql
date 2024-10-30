{{ config(materialized='view') }}

SELECT 
    CAST("Trip ID" AS INTEGER) AS trip_id,
    "Origin City" AS origin_city,
    "Destination City" AS destination_city,
    CAST("Airplane ID" AS INTEGER) AS airplane_id,
    TIMESTAMP("Start Timestamp") AS start_timestamp,
    TIMESTAMP("End Timestamp") AS end_timestamp
FROM {{ source('raw_layer', 'trips') }}
