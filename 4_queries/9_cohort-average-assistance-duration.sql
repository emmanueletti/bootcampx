
SELECT
  AVG(total_durations.total_duration)
FROM (
  SELECT 
    c.name AS cohort,
    SUM((completed_at - started_at)) AS total_duration
  FROM assistance_requests a_r 
  JOIN students s 
    ON a_r.student_id = s.id 
  JOIN cohorts c 
    ON s.cohort_id = c.id 
  GROUP BY c.name
  ORDER BY total_duration
) AS total_durations

