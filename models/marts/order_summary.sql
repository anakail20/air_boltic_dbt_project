{{ config(materialized='table') }}

WITH base_orders AS (
    SELECT
        order_id,
        customer_id,
        trip_id,
        price_eur AS order_value,
        status AS order_status
    FROM {{ ref('stg_orders') }}
),

trips AS (
    SELECT
        trip_id,
        origin_city,
        destination_city,
        airplane_id
    FROM {{ ref('stg_trips') }}
),

airplanes AS (
    SELECT
        airplane_id,
        airplane_model,
        manufacturer
    FROM {{ ref('stg_airplanes') }}
)

SELECT
    o.order_id,
    o.customer_id,
    o.trip_id,
    o.order_value,
    o.order_status,
    t.origin_city,
    t.destination_city,
    a.airplane_model,
    a.manufacturer
FROM base_orders AS o
JOIN trips AS t ON o.trip_id = t.trip_id
JOIN airplanes AS a ON t.airplane_id = a.airplane_id
