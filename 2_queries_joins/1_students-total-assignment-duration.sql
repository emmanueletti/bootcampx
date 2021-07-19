-- Get the total amount of time that a student has spent on all assignments.
-- This should work for any student but use 'Ibrahim Schimmel' for now.
-- Select only the total amount of time as a single column.

SELECT SUM(a_s.duration) AS total_duration
FROM assignment_submissions a_s
JOIN students s
ON a_s.student_id = s.id
WHERE s.name = 'Ibrahim Schimmel'