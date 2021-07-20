-- Get the total number of assistance_requests for a teacher.
-- Select the teacher's name and the total assistance requests.
-- Since this query needs to work with any specific teacher name, use 'Waylon Boehm' for the teacher's name here.

SELECT 
  COUNT(*) AS total_assistances,
  t.name
FROM assistance_requests a_r 
JOIN teachers t
  ON a_r.teacher_id = t.id
WHERE t.name = 'Waylon Boehm'
  GROUP BY t.name