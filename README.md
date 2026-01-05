# Cyclistic Bike-Share Analysis

🔗 **View the full rendered R analysis report:** [https://chimezie-do.github.io/Cyclistic/report/cyclistic_analysis.html](https://chimezie-do.github.io/Cyclistic/report/cyclistic_analysis.html)

🔗 **SQL Scripts:**
* [01 – Data Cleaning & Standardization](scripts/01_data_cleaning.sql)
* [02 – Feature Engineering](scripts/02_feature_engineering.sql)
* [03 – Exploratory Analysis](scripts/03_exploratory_analysis.sql)

🔗 **Interactive Dashboard (Tableau Public):**  
https://public.tableau.com/app/profile/chimezie.ofaraka/viz/Cyclistic_bike_share_analysis/Dashboard1

## Project Overview
Cyclistic is a bike-share company seeking to increase annual memberships. This project analyzes behavioral differences between casual riders and annual members to generate insights that inform targeted marketing and growth strategies.

To demonstrate technical versatility, the analysis was conducted using two independent analytical workflows to mirror real-world environments:
1. **SQL-based workflow** using Google BigQuery for data cleaning, feature engineering, and exploratory analysis.
2. **R-based workflow** using RStudio for data processing, statistical analysis, visualization, and reporting.

## Business Question
How can Cyclistic convert casual riders into annual members based on observed usage patterns?

## Tools & Methodology

### SQL (Google BigQuery)
* **Data Standardization:** Handled schema differences between 2019 and 2020 datasets using `CAST`, `CASE`, and `UNION ALL`.
* **Feature Engineering:** Created analytical features including ride length, day of week, month, and year.
* **Data Quality Control:** Removed invalid and extreme ride durations (ghost trips) to ensure analytical accuracy.
* **Exploratory Analysis:** Performed group-level aggregations to identify rider trends directly within the database.

### R (Tidyverse)
* **Data Processing:** Used `dplyr` for cleaning, transformation, and aggregation.
* **Visualization:** Built descriptive charts with `ggplot2` to illustrate rider behavior patterns.
* **Reporting:** Produced a fully rendered HTML report using **R Markdown** for stakeholder-friendly presentation.

### Tableau (Public)
* **Data Storytelling:** Designed a dual-axis dashboard to contrast total ride volume against average trip duration across user segments.
* **Interactive Visualization:** Implemented "Day of Week" heat-mapping to visually confirm peak leisure usage vs. commuter cycles.
* **Executive Presentation:** Utilized active titling and annotations to guide stakeholders toward key behavioral findings, such as the 3x duration gap for casual riders.
---

## Data Source
This analysis uses historical bike-trip data from:
* Divvy Trips — Q1 2019
* Divvy Trips — Q1 2020

The datasets include trip-level details such as ride duration, timestamps, station locations, and rider type.

## Key Insights
* **Casual riders** take significantly longer trips on average, suggesting leisure-oriented usage.
* **Casual rider** activity peaks on weekends, while weekday usage remains lower.
* **Annual members** ride more frequently on weekdays with shorter trip durations, consistent with commuting behavior.

## Recommendations
* **Weekend Promotions:** Launch membership promotions specifically targeting weekend casual riders.
* **Trial Memberships:** Introduce short-term or "seasonal" membership options designed for leisure users.
* **Targeted Marketing:** Concentrate station-level marketing efforts on weekends when casual rider engagement is highest.

## Limitations
* The analysis focuses solely on Q1 data and does not capture full seasonal variability across the year.
* External factors such as weather conditions and city events were not included and may influence behavior.
