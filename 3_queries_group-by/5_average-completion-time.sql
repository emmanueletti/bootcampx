-- Get currently enrolled students' average assignment completion time.
-- Select the students name and average time from assignment submissions.
-- Order the results from greatest duration to least greatest duration.

SELECT 
  s.name,
  AVG(a_s.duration) AS average_assignment_duration 
FROM students s
JOIN assignment_submissions a_s 
  ON s.id = a_s.student_id
WHERE s.end_date IS NULL
  GROUP BY s.name
ORDER BY average_assignment_duration DESC