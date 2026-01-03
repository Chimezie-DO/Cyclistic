# Cyclistic Bike-Share Analysis

🔗 View the full rendered R analysis report:
https://chimezie-do.github.io/Cyclistic/report/cyclistic_analysis.html

## Project Overview
Cyclistic is a bike-share company seeking to increase annual memberships.
This project analyzes behavioral differences between casual riders and annual members to generate insights that inform targeted marketing and growth strategies.

To demonstrate technical versatility, the analysis was conducted using two independent analytical workflows:
	1.	SQL-based workflow using Google BigQuery for data cleaning, feature engineering, and exploratory analysis.
	2.	R-based workflow using RStudio for data processing, statistical analysis, visualization, and reporting.

Both workflows address the same business question using different tools, mirroring real-world analytics environments.

## Business Question
How can Cyclistic convert casual riders into annual members based on observed usage patterns?

## Tools Used
### SQL (Google BigQuery)
	•	Data Standardization: Handled schema differences between 2019 and 2020 datasets using CAST, CASE, and UNION ALL.
	•	Feature Engineering: Created analytical features including ride length, day of week, month, and year.
	•	Data Quality Control: Removed invalid and extreme ride durations to prevent skewed averages and ensure analytical accuracy.
	•	Exploratory Analysis: Performed group-level aggregations and created a reusable, cleaned analytical table (all_trips) within BigQuery to support downstream analysis.

### R (Tidyverse)
	•	Data Processing: Used dplyr for cleaning, transformation, and aggregation.
	•	Visualization: Built descriptive charts with ggplot2 to illustrate rider behavior patterns.
	•	Reporting: Produced a fully rendered HTML report using R Markdown for stakeholder-friendly presentation.

## Data Source
This analysis uses historical bike-trip data from:
	•	Divvy Trips — Q1 2019
	•	Divvy Trips — Q1 2020

The datasets include trip-level details such as ride duration, timestamps, station locations, and rider type.

## Key Insights
	•	Casual riders take significantly longer trips on average, suggesting leisure-oriented usage.
	•	Casual rider activity peaks on weekends, while weekday usage is lower.
	•	Annual members ride more frequently on weekdays with shorter trip durations, consistent with commuting behavior.

## Recommendations
	•	Launch weekend-focused membership promotions targeting casual riders.
	•	Introduce short-term or trial membership options designed for leisure users.
	•	Concentrate in-app and station-level marketing efforts on weekends, when casual rider engagement is highest.

## Limitations
	•	The analysis focuses solely on Q1 data and does not capture full seasonal variability across the year.
	•	External factors such as weather conditions, holidays, and city events were not included and may influence riding behavior.
