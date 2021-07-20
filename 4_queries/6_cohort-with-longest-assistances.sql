-- Get the cohort with the longest average duration of assistance requests.

-- uply and long
-- first created a table of avg durations
-- used the MAX aggregegate on that table to get the highest value
-- used that value to filter a table of average durations and cohort names
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
HAVING AVG(a_r.completed_at - a_r.started_at) >= (
  SELECT
    MAX (aat.average_assistance_time)
  FROM (
    SELECT
      AVG(a_r.completed_at - a_r.started_at) AS average_assistance_time
    FROM 
      assistance_requests a_r
    JOIN students s 
      ON a_r.student_id = s.id
    JOIN cohorts c 
      ON s.cohort_id = c.id
    GROUP BY c.name
      ORDER BY average_assistance_time
  ) AS aat 
);

-- shorter and more elegant (from compass)
SELECT 
  cohorts.name, 
  avg(completed_at - started_at) as average_assistance_time
FROM assistance_requests 
JOIN students 
  ON students.id = assistance_requests.student_id
JOIN cohorts 
  ON cohorts.id = cohort_id
GROUP BY cohorts.name
ORDER BY average_assistance_time DESC
LIMIT 1;
