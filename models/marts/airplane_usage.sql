{{ config(materialized='table') }}

WITH airplane_details AS (
    SELECT 
        a.airplane_id,
        a.airplane_model,
        a.manufacturer,
        am.engine_type
    FROM {{ ref('stg_airplanes') }} AS a
    LEFT JOIN {{ ref('stg_airplane_models') }} AS am
        ON a.airplane_model = am.airplane_model
        AND a.manufacturer = am.manufacturer
),

airplane_metrics AS (
    SELECT
        a.airplane_id,
        COUNT(t.trip_id) AS total_trips,
        SUM(o.price_eur) AS total_revenue
    FROM airplane_details AS a
    LEFT JOIN {{ ref('stg_trips') }} AS t ON a.airplane_id = t.airplane_id
    LEFT JOIN {{ ref('stg_orders') }} AS o ON t.trip_id = o.trip_id
    GROUP BY a.airplane_id
)

SELECT
    ad.airplane_id,
    ad.airplane_model,
    ad.manufacturer,
    ad.engine_type,
    {{ fill_default('am.total_trips', 0) }} AS total_trips,
    {{ fill_default('am.total_revenue', 0) }} AS total_revenue
FROM airplane_details AS ad
LEFT JOIN airplane_metrics AS am ON ad.airplane_id = am.airplane_id
