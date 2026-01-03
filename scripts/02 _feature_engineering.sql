/*==========================================================================
STEP 2 FEATURE ENGINEERING
- RIDE LENGTH
- YEAR
- MONTH
- DAY OF WEEK
==========================================================================*/

WITH trips_2019_clean AS (
  SELECT
    CAST(trip_id AS STRING) AS ride_id,
    CAST(start_time AS TIMESTAMP) AS started_at,
    CAST(end_time AS TIMESTAMP) AS ended_at,
    CAST(from_station_name AS STRING) start_station_name,
    CAST(to_station_name AS STRING) end_station_name,
    CASE
      WHEN usertype = 'Subscriber' THEN 'member'
      WHEN usertype = 'Customer' THEN 'casual'
    END AS member_type
  FROM `my-first-project-463412.cyclistic.trips_2019`
  WHERE trip_id IS NOT NULL
),

trips_2019_valid AS (
  SELECT *
  FROM trips_2019_clean
  WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0
    AND member_type IS NOT NULL
),

trips_2020_clean AS (
  SELECT
    CAST(ride_id AS STRING) AS ride_id,
    CAST(started_at AS TIMESTAMP) AS started_at,
    CAST(ended_at AS TIMESTAMP) AS ended_at,
    start_station_name,
    end_station_name,
    member_casual AS member_type
  FROM `my-first-project-463412.cyclistic.trips_2020`
  WHERE ride_id IS NOT NULL
),

trips_2020_valid AS (
  SELECT *
  FROM trips_2020_clean
  WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0
    AND member_type IN ('member', 'casual')),

/*--------------------------------------------------------------------------
Feature Engineering
--------------------------------------------------------------------------*/

trips_2019_features AS ( 
  SELECT 
  *, 
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes, 
  EXTRACT(YEAR FROM started_at) AS year, 
  EXTRACT(MONTH FROM started_at) AS month,   
  CASE EXTRACT(DAYOFWEEK FROM started_at) 
   WHEN 1 THEN 'Sunday' 
   WHEN 2 THEN 'Monday' 
   WHEN 3 THEN 'Tuesday' 
   WHEN 4 THEN 'Wednesday' 
   WHEN 5 THEN 'Thursday' 
   WHEN 6 THEN 'Friday' 
   WHEN 7 THEN 'Saturday'
 END AS day_of_week
FROM trips_2019_valid),

trips_2020_features AS ( 
  SELECT 
  *, 
  TIMESTAMP_DIFF(ended_at, started_at, MINUTE) AS ride_length_minutes, 
  EXTRACT(YEAR FROM started_at) AS year, 
  EXTRACT(MONTH FROM started_at) AS month,   
  CASE EXTRACT(DAYOFWEEK FROM started_at) 
   WHEN 1 THEN 'Sunday' 
   WHEN 2 THEN 'Monday' 
   WHEN 3 THEN 'Tuesday' 
   WHEN 4 THEN 'Wednesday' 
   WHEN 5 THEN 'Thursday' 
   WHEN 6 THEN 'Friday' 
   WHEN 7 THEN 'Saturday'
 END AS day_of_week
FROM trips_2020_valid),

/*--------------------------------------------------------------------------
Combine datasets
--------------------------------------------------------------------------*/

all_trips AS ( 
  SELECT*
  FROM (
  SELECT * FROM trips_2019_features
  UNION ALL 
  SELECT * FROM trips_2020_features)
  WHERE ride_length_minutes BETWEEN 1 AND 1440)

/*--------------------------------------------------------------------------
Output Check
--------------------------------------------------------------------------*/

SELECT * 
FROM all_trips
 
