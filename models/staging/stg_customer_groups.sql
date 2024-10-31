{{ config(materialized='view') }}

SELECT 
    CAST("ID" AS INTEGER) AS customer_group_id,
    "Type" AS customer_group_type,
    "Name" AS customer_group_name,
    "Registry number" AS registry_number
FROM {{ source('raw_layer', 'customer_groups') }}
