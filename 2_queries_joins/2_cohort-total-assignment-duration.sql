-- Get the total amount of time that all students from a specific cohort have spent on all assignments.
-- This should work for any cohort but use FEB12 for now.
-- Select only the total amount of time as a single column.

SELECT SUM(a_s.duration)
FROM assignment_submissions a_s
JOIN students s
ON a_s.student_id = s.id
JOIN cohorts c
ON s.cohort_id = c.id
WHERE c.name = 'FEB12'