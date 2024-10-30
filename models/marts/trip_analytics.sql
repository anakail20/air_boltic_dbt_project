{{ config(materialized='table') }}

WITH trip_details AS (
    SELECT 
        trip_id,
        origin_city,
        destination_city,
        start_timestamp,
        end_timestamp
    FROM {{ ref('stg_trips') }}
),

trip_metrics AS (
    SELECT
        t.trip_id,
        COUNT(o.order_id) AS total_bookings,
        SUM(o.price_eur) AS total_revenue,
        AVG(DATEDIFF('minute', t.start_timestamp, t.end_timestamp) / 60) AS avg_trip_duration_hours
    FROM trip_details AS t
    LEFT JOIN {{ ref('stg_orders') }} AS o ON t.trip_id = o.trip_id
    GROUP BY t.trip_id
)

SELECT
    td.trip_id,
    td.origin_city,
    td.destination_city,
    {{ fill_default('tm.total_bookings', 0) }} AS total_bookings,
    {{ fill_default('tm.total_revenue', 0) }} AS total_revenue,
    {{ fill_default('tm.avg_trip_duration_hours', 0) }} AS avg_trip_duration_hours
FROM trip_details AS td
LEFT JOIN trip_metrics AS tm ON td.trip_id = tm.trip_id
