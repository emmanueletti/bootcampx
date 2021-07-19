-- Get the students who's average time it takes to complete an assignment is less than the average estimated time it takes to complete an assignment.
-- Select the name of the student, their average completion time, and the average suggested completion time.
-- Order by average completion time from smallest to largest.
-- Only get currently enrolled students.

-- get stats on each individual assignment

-- avg estimate time to complete an assignment
SELECT 
  s.name AS student,
  AVG(a_s.duration) AS average_assignment_duration,
  AVG(a.duration) AS average_estimated_duration
FROM assignment_submissions a_s 
JOIN assignments a
  ON a_s.assignment_id = a.id
JOIN students s 
  ON a_s.student_id = s.id
WHERE s.end_date IS NULL
GROUP BY student
HAVING AVG(a_s.duration) < AVG(a.duration)
ORDER BY average_assignment_duration;

