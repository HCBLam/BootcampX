-- List each assignment with the total number of assistance requests with it.

SELECT assignments.id as id, assignments.name as name, assignments.day as day, assignments.chapter as chapter,
  COUNT(assignment_id) AS total_requests
FROM assistance_requests
JOIN assignments ON assignments.id = assignment_id
GROUP BY assignments.id
ORDER BY total_requests DESC;




-- The solution from Compass

-- SELECT assignments.id, name, day, chapter, count(assistance_requests) as total_requests
-- FROM assignments
-- JOIN assistance_requests ON assignments.id = assignment_id
-- GROUP BY assignments.id
-- ORDER BY total_requests DESC;