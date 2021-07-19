-- Get the total number of assignment submissions for each cohort.
-- Select the cohort name and total submissions.
-- Order the results from greatest to least submissions.

SELECT 
  c.name AS cohort,
  COUNT(c.name) AS total_submissions
FROM assignment_submissions a_s
JOIN students s
  ON a_s.student_id = s.id
JOIN cohorts c
  ON s.cohort_id = c.id
GROUP BY c.name
ORDER BY total_submissions DESC;