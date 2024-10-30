{{ config(materialized='table') }}

WITH base_customers AS (
    SELECT
        customer_id,
        customer_name,
        email,
        phone_number,
        customer_group_id
    FROM {{ ref('stg_customers') }}
),

customer_groups AS (
    SELECT
        customer_group_id,
        customer_group_name,
        customer_group_type,
        registry_number
    FROM {{ ref('stg_customer_groups') }}
),

customer_orders AS (
    SELECT 
        customer_id,
        COUNT(order_id) AS total_orders,
        SUM(price_eur) AS total_spend
    FROM {{ ref('stg_orders') }}
    GROUP BY customer_id
)

SELECT
    c.customer_id,
    c.customer_name,
    c.email,
    c.phone_number,
    cg.customer_group_name,
    cg.customer_group_type,
    cg.registry_number,
    {{ fill_default('co.total_orders', 0) }} AS total_orders,
    {{ fill_default('co.total_spend', 0) }} AS total_spend
FROM base_customers AS c
LEFT JOIN customer_groups AS cg ON c.customer_group_id = cg.customer_group_id
LEFT JOIN customer_orders AS co ON c.customer_id = co.customer_id
