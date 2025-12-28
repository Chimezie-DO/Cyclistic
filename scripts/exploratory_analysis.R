# Cyclistic Bike-Share Analysis
# Script: Exploratory Analysis
# Purpose: Identify behavioral differences between casual riders and annual members

library(tidyverse)

# Load cleaned data
# rides_clean <- read_csv("data/rides_clean.csv")

# -----------------------------
# Ride Length by User Type
# -----------------------------

rides_clean %>%
  group_by(user_type) %>%
  summarise(avg_ride_length = mean(ride_length), 
            median_ride_length = median(ride_length))

# -----------------------------
# Weekly Usage Patterns
# -----------------------------

rides_clean %>%
  group_by(user_type, day_of_week) %>%
  summarise(ride_count = n())

# -----------------------------
# Visualization Examples
# -----------------------------

rides_clean %>%
  ggplot(aes(day_of_week, ride_length, fill = user_type)) +
  geom_boxplot() +
  labs(title = "Ride Length Distribution by User Type", 
       x = "Day of Week", 
       y = "Ride Length (minutes)")
