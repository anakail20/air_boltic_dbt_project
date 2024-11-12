# Airplane Data Analytics Repository

This repository contains dbt models and LookML views to analyze airplane data, including usage, specifications, and revenue insights.

## Overview

The project turns raw airplane data into tables and visualizations to help understand airplane usage, specifications, and revenue by model and manufacturer. ERD has also been created by using Excalidraw.

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


# Part 2

## Ideal CI/CD Process (Unlimited Resources)

With no tooling or resource limitations, the ideal CI/CD process would include the following:

### Environments
1. **Development**: For local testing of changes, developers can work independently on feature branches.
2. **Testing/Staging**: A staging environment mirrors production to validate model changes with real-like data.
3. **Production**: The live environment, where only thoroughly tested changes are deployed.

### Processes and Tools
1. **Automated Testing**
   - **Data Quality Tests**: Tests such as `not_null`, `unique`, and range tests (e.g., prices > 0) validate data integrity.
   - **Integration Tests**: Check end-to-end pipeline functionality, confirming that changes in one model don’t break downstream dependencies.

2. **Data Validation**: Automated comparison checks to verify row counts, summary statistics, and key metrics between the staging and production datasets to ensure consistency.

3. **Version Control and Code Review**: 
   - Implement automated linting for SQL formatting and structure consistency, like sqlfluff

4. **Data Observability and Monitoring**:
   - Monitoring tools (e.g., Validio) to track changes, detect anomalies, and alert for any data issues post-deployment.

### Real-World CI/CD Process (Resource Constraints)

In real-world scenarios where resources and tools may be limited, a streamlined CI/CD process would focus on essential elements:

1. **Simplified Environments**:
   - **Development and Production** only: Use a single development environment with small sample datasets for testing, then deploy directly to production with careful scheduling.
   
2. **Testing**:
   - **Key Tests Only**: Focus on essential tests (e.g., `not_null`, `unique`, range checks) using dbt's in-built testing capabilities.
   
3. **Manual Deployment with Rollback**:
   - Perform deployments manually, at scheduled times to avoid impacting users, with a clear rollback plan for quick recovery if issues arise.

4. **Monitoring & Alerting**:
   - Set up simple alerts (e.g., on key metrics) using basic data dashboards or Looker to catch significant issues.

