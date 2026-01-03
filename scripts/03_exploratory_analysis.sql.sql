/* ============================================================
   STEP 3A: MEMBER VS CASUAL — OVERALL
 ============================================================ */

SELECT
  member_type,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `my-first-project-463412.cyclistic.all_trips`
GROUP BY member_type
ORDER BY member_type;

/* ============================================================
   STEP 3B: RIDING PATTERNS BY DAY OF WEEK
   ============================================================ */

SELECT
  member_type,
  day_of_week,
  COUNT(*) AS total_rides,
  ROUND(AVG(ride_length_minutes), 2) AS avg_ride_length_minutes
FROM `my-first-project-463412.cyclistic.all_trips`
GROUP BY member_type, day_of_week
ORDER BY member_type, total_rides DESC;