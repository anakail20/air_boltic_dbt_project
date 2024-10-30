{{ config(materialized='view') }}

SELECT 
    CAST("Customer ID" AS INTEGER) AS customer_id,
    "Name" AS customer_name,
    CAST("Customer Group ID" AS INTEGER) AS customer_group_id,
    "Email" AS customer_email,
    "Phone Number" AS phone_number
FROM {{ source('raw_layer', 'customers') }}