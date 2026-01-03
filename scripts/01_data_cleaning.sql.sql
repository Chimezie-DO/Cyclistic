/* ============================================================
   STEP 1: DATA CLEANING & STANDARDIZATION
   ============================================================ */

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
  WHERE trip_id IS NOT NULL),

trips_2019_valid AS (
  SELECT *
  FROM trips_2019_clean
  WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0
    AND member_type IS NOT NULL),

trips_2020_clean AS (
  SELECT
    CAST(ride_id AS STRING) AS ride_id,
    CAST(started_at AS TIMESTAMP) AS started_at,
    CAST(ended_at AS TIMESTAMP) AS ended_at,
    start_station_name,
    end_station_name,
    member_casual AS member_type
  FROM `my-first-project-463412.cyclistic.trips_2020`
  WHERE ride_id IS NOT NULL),

trips_2020_valid AS (
  SELECT *
  FROM trips_2020_clean
  WHERE TIMESTAMP_DIFF(ended_at, started_at, SECOND) > 0
    AND member_type IN ('member', 'casual'))

SELECT *
FROM trips_2019_valid
LIMIT 10;

SELECT COUNT(*)
FROM `my-first-project-463412.cyclistic.trips_2020`;


