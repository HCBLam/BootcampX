-- Get the total number of assignment_submissions for each student and only return currently enrolled students whose total submissions are less than 100.

SELECT students.name as student, count(assignment_submissions.*) as total_submissions
FROM assignment_submissions
JOIN students ON students.id = student_id
WHERE students.end_date IS NULL
GROUP BY students.name
HAVING count(assignment_submissions.*) < 100
ORDER BY count(assignment_submissions.*)
;