-- Get all cohorts with 18 or more students.

SELECT 
  c.name AS cohort_name,
  COUNT(c.name) AS student_count
FROM students s
JOIN cohorts c
  ON s.cohort_id = c.id
GROUP BY c.name
HAVING COUNT(c.name) >= 18
ORDER BY student_count;