-- Get the average duration of assistance requests for each cohort.
-- Select the cohort's name and the average assistance request time.
-- Order the results from shortest average to longest.

SELECT
  c.name,
  AVG(a_r.completed_at - a_r.started_at) AS average_assistance_time
FROM 
  assistance_requests a_r
JOIN students s 
  ON a_r.student_id = s.id
JOIN cohorts c 
  ON s.cohort_id = c.id
GROUP BY c.name
  ORDER BY average_assistance_time
