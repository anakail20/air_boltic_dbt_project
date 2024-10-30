# Airplane Data Analytics Repository

This repository contains dbt models, LookML views, and explores for analyzing airplane data, including usage metrics, specifications, and revenue analysis.

## Overview

The primary goal of this project is to transform raw airplane data into analysis-ready tables and visualizations. We aim to facilitate insights into airplane utilization, specifications, and revenue generation by different airplane models and manufacturers.

### Key Models

1. **Staging Models**: Normalize raw data and handle JSON and Excel sources.
2. **Mart Models**: Aggregate data for usage, revenue, and specifications.
3. **LookML**: Define views and explores to visualize airplane metrics in Looker.

### Project Structure

- **models/staging**: Contains staging models for transforming raw JSON and Excel files into a clean, usable format.
- **models/marts**: Aggregated models for data marts. Each mart model is designed to provide specific insights and KPIs.
- **LookML Example**: LookML view files for defining fields and measures in Looker. Also LookML explore files for joining related views and creating analysis-ready data structures.

### Key Features

- **Partitioned and Modular Design**: Each model is modular, using separate CTEs to handle different stages of transformation. This ensures scalability and ease of debugging.
- **Descriptive LookML Documentation**: Dimensions and measures are documented to provide context and assist end-users in understanding the fields.
- **Source Integrity**: Defined tests for source data to maintain data quality, including `dbt-expectations` for enhanced validation.
