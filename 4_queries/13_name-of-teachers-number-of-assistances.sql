
-- super ugly and long solution due to not knowing that we can specify multiply columns in GROUP BY clause
-- instead joined two sub-quieries together to make a frankenstein query 
SELECT t1.teacher, t1.cohort, t2.total_assistances
FROM (
    SELECT
    DISTINCT t.name AS teacher,
    t.id,
    c.name AS cohort 
  FROM assistance_requests a_r
  JOIN students s 
    ON a_r.student_id = s.id 
  JOIN teachers t 
    ON a_r.teacher_id = t.id 
  JOIN cohorts c 
    ON s.cohort_id = c.id 
  WHERE c.name = 'JUL02'
  ORDER BY teacher
) AS t1
JOIN (
  SELECT 
  teacher_id,
  COUNT(*) AS total_assistances
FROM assistance_requests a_r 
JOIN students s 
  ON a_r.student_id = s.id 
JOIN cohorts c 
  ON s.cohort_id = c.id 
WHERE c.name = 'JUL02'
GROUP BY teacher_id
) AS t2
ON t1.id = t2.teacher_id
ORDER BY teacher;


-- YOU CAN "GROUP BY" MULTIPLE COLUMNS!!!
SELECT
  t.name AS teacher,
  c.name AS cohort, 
  COUNT(*) AS total_assistances
FROM assistance_requests a_r
JOIN students s 
  ON a_r.student_id = s.id 
JOIN teachers t 
  ON a_r.teacher_id = t.id 
JOIN cohorts c 
  ON s.cohort_id = c.id 
WHERE c.name = 'JUL02'
GROUP BY teacher, cohort
ORDER BY teacher;

