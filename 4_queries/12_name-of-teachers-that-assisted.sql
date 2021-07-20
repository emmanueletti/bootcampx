-- Get the name of all teachers that performed an assistance request during a cohort.
-- Select the instructor's name and the cohort's name.
-- Don't repeat the instructor's name in the results list.
-- Order by the instructor's name.
-- This query needs to select data for a cohort with a specific name, use 'JUL02' for the cohort's name here.

SELECT
  DISTINCT t.name AS teacher,
  c.name AS cohort 
FROM assistance_requests a_r
JOIN students s 
  ON a_r.student_id = s.id 
JOIN teachers t 
  ON a_r.teacher_id = t.id 
JOIN cohorts c 
  ON s.cohort_id = c.id 
WHERE c.name = 'JUL02'
ORDER BY teacher;