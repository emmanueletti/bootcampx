-- Calculate the average time it takes to start an assistance request.

SELECT 
  AVG(started_at - created_at) AS average_wait_times
FROM assistance_requests
