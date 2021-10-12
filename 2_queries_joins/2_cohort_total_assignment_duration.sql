-- Get the total amount of time that all students from a specific cohort have spent on all assignments.

SELECT SUM(assignment_submissions.duration) AS total_duration
FROM students
JOIN assignment_submissions ON students.id = student_id
JOIN cohorts ON cohort_id = cohorts.id
WHERE cohorts.name = 'FEB12';