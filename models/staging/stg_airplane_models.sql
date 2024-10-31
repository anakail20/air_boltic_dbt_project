{{ config(materialized='view') }}

WITH raw_json AS (
    -- Load the JSON source data as a JSON object from the source definition
    SELECT parse_json('{{ source("raw_layer", "aeroplane_model") }}') AS airplane_data
),

flattened AS (
    -- Flatten the JSON structure to extract manufacturer and model details
    SELECT 
        manufacturer.key AS manufacturer,
        model.key AS airplane_model,
        model.value:max_seats::integer AS max_seats,
        model.value:max_weight::integer AS max_weight,
        model.value:max_distance::integer AS max_distance,
        model.value:engine_type::string AS engine_type
    FROM raw_json,
         LATERAL FLATTEN(input => airplane_data) AS manufacturer,
         LATERAL FLATTEN(input => manufacturer.value) AS model
)

SELECT * FROM flattened
