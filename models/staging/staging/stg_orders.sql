{{ config(materialized='view') }}

SELECT 
    CAST("Order ID" AS INTEGER) AS order_id,
    CAST("Customer ID" AS INTEGER) AS customer_id,
    CAST("Trip ID" AS INTEGER) AS trip_id,
    CAST("Price (EUR)" AS FLOAT) AS price_eur,
    "Seat No" AS seat_no,
    "Status" AS status
FROM {{ source('raw_layer', 'orders') }}
