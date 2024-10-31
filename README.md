# Airplane Data Analytics Repository

This repository contains dbt models and LookML views to analyze airplane data, including usage, specifications, and revenue insights.

## Overview

The project turns raw airplane data into tables and visualizations to help understand airplane usage, specifications, and revenue by model and manufacturer.

## Project Structure

- **models/staging**: Cleans and prepares raw JSON and Excel files for analysis.
- **models/marts**: Aggregated models for specific insights and reporting.
- **Looker Example**: Looker views and explores for visualizing airplane metrics.

## Key Models

1. **Staging Models**: Prepares raw data, including JSON parsing and data cleanup.
2. **Mart Models**: Provides specific analysis areas:
   - **`airplane_usage`**: Tracks usage by model, showing trip counts and revenue.
   - **`airplane_specifications_summary`**: Summarizes specs by manufacturer, including average seat capacity and range.
   - **`trip_analytics`**: Shows demand, revenue, and trip duration by route.
   - **`customer_insights`**: Aggregates customer data for segmentation and profiling.
   - **`order_summary`**: Combines orders, trips, and airplanes for a full view of revenue and trip details.

> **Note**: `.yml` files are only created for some marts models. Automating `.yml` generation would help with consistency.

## Features

- **Modular Design**: Each model uses separate parts to keep things organized and easy to update.
- **Data Quality Tests**: Tests are added to check for things like unique IDs and valid data ranges.

## Future Improvements

1. **Add More Macros**: Use macros for common operations, like casting, to keep code clean.
2. **Add More Tests**: For example, ensure prices are always greater than zero.
3. **Optimize Materialization**: Currently, models are views. Consider using tables or incremental models for better performance as data grows.
4. **Environment Configurations**: Use dbt’s `vars` block for settings that change between environments (e.g., dev and prod) to simplify management.

This setup supports effective analysis and reporting of airplane data for insights into usage and performance.
