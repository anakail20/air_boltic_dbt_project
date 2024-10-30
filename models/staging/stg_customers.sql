{{ config(materialized='view') }}

SELECT 
    CAST("Customer ID" AS INTEGER) AS customer_id,
    "Name" AS customer_name,
    CAST("Customer Group ID" AS INTEGER) AS customer_group_id,
    {{ safe_column("Email" "No email provided") }} AS email,
    {{ safe_column("Phone Number", "No phone number provided") }} AS phone_number
FROM {{ source('raw_layer', 'customers') }}