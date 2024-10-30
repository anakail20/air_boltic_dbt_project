-- models/staging/stg_aeroplane.sql
{{ config(materialized='view') }}

SELECT 
    CAST("Airplane ID" AS INTEGER) AS airplane_id,
    "Airplane Model" AS airplane_model,
    "Manufacturer" AS manufacturer
FROM {{ source('raw_layer', 'airplanes') }}
