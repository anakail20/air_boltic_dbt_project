# Airplane Data Analytics Repository

This repository contains dbt models and LookML views for analyzing airplane data, including usage, specifications, and revenue insights.

## Overview

The project transforms raw data into analysis-ready tables and visualizations to facilitate insights into airplane utilization, specifications, and revenue by different models and manufacturers.

## Project Structure

- **models/staging**: Transforms raw JSON and Excel files into clean, usable tables.
- **models/marts**: Aggregates data for usage, revenue, and specifications, providing key KPIs for reporting.
- **LookML**: Defines Looker views and explores to visualize airplane metrics.

## Key Models

1. **Staging Models**: Prepare raw data, normalizing JSON structures and performing basic transformations.
2. **Mart Models**: Aggregate and enhance data for specific insights, including:
   - **`airplane_usage`**: Aggregates usage metrics by model, with trip counts and revenue data.
   - **`airplane_specifications_summary`**: Summarizes specifications by manufacturer, averaging metrics like seat capacity and range.
   - **`trip_analytics`**: Provides insights into demand, revenue, and trip duration by route.
   - **`customer_insights`**: Aggregates customer data, supporting segmentation and profiling.

## Features

- **Partitioned, Modular Design**: Each model uses modular CTEs, ensuring scalability and easy debugging.
- **Data Quality Testing**: dbt tests validate source integrity, with additional range and uniqueness tests using `dbt-expectations`.
- **LookML Documentation**: Descriptions for dimensions and measures in Looker, aiding end-users.

## Future Improvements

1. **Macros for Repeated Code**: Introduce macros for frequent operations (e.g., type casting) to increase code maintainability.
2. **Enhanced Testing**: Expand tests, such as ensuring `price` values are always greater than zero, using `dbt-expectations`.
3. **Optimize Materialization**: Currently, models are materialized as views. For scalability:
   - Use tables or incremental models for frequently accessed or periodically updated data, improving performance in Databricks.
4. **Environment-Specific Configurations**: Use `dbt`’s `vars` block for smooth transitions between environments (e.g., dev and prod), simplifying configurations and managing variables.

This setup supports efficient analysis and reporting of airplane usage and performance metrics, ensuring data quality and flexibility for various use cases in Looker.
