-- List each assignment with the total number of assistance requests with it.
-- Select the assignment's id, day, chapter, name and the total assistances.
-- Order by total assistances in order of most to least.

SELECT
  a.id,
  a.name,
  a.day,
  a.chapter,
  COUNT(*) AS total_requests
FROM assistance_requests a_r 
JOIN assignments a
  ON a_r.assignment_id = a.id 
GROUP BY a.id
ORDER BY total_requests DESC