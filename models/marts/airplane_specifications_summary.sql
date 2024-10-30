-- models/marts/airplane_specifications_summary.sql
{{ config(materialized='table') }}

SELECT
    manufacturer,
    AVG(max_seats) AS avg_max_seats,
    AVG(max_weight) AS avg_max_weight,
    AVG(max_distance) AS avg_max_distance,
    COUNT(DISTINCT airplane_model) AS model_count
FROM {{ ref('stg_airplane_models') }}
GROUP BY manufacturer
