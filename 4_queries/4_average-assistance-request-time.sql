-- Get the average time of an assistance request.
-- Select just a single row here and name it average_assistance_request_duration

SELECT  
  AVG((completed_at - started_at)) AS average_assistance_request_duration 
FROM assistance_requests;
