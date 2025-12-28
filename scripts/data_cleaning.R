# Cyclistic Bike-Share Analysis
# Script: Data Cleaning
# Purpose: Clean and prepare trip data for analysis
# Load required libraries
library(tidyverse)
library(lubridate)

# -----------------------------
# Load Data
# -----------------------------

# Note: Raw data files are not stored in this repository due to size.
# Update file paths as needed when running locally.

q1_2019 <- read_csv("path_to_data/Divvy_Trips_2019_Q1.csv")
q1_2020 <- read_csv("path_to_data/Divvy_Trips_2020_Q1.csv")

# -----------------------------
# Standardize Column Names
# -----------------------------

q1_2019 <- janitor::clean_names(q1_2019)
q1_2020 <- janitor::clean_names(q1_2020)

# -----------------------------
# Combine Datasets
# -----------------------------

rides <- bind_rows(q1_2019, q1_2020)

# -----------------------------
# Data Cleaning
# -----------------------------

rides_clean <- rides %>%
  # Remove missing values
  drop_na(start_time, end_time, user_type) %>%
  
  # Convert timestamps
  mutate(start_time = ymd_hms(start_time), 
         end_time   = ymd_hms(end_time), 
         ride_length = as.numeric(difftime(end_time, start_time, units = "mins"))) %>%
  
  # Remove invalid ride durations
  filter(ride_length > 0) %>%
  
  # Create additional features
  mutate(day_of_week = wday(start_time, label = TRUE), 
         month = month(start_time, label = TRUE))

# -----------------------------
# Save Cleaned Data (Optional)
# -----------------------------

# write_csv(rides_clean, "data/rides_clean.csv")
