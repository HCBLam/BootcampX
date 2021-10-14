const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});


// Get the name of all teachers that performed an assistance request during a cohort.

const cohortName = process.argv[2];
const values = [`%${cohortName}%`];

const sqlQuery = `
SELECT DISTINCT cohorts.name AS cohort, teachers.name AS teacher
FROM cohorts
JOIN students ON cohorts.id = cohort_id
JOIN assistance_requests ON students.id = student_id
JOIN teachers ON teachers.id = teacher_id
WHERE cohorts.name LIKE $1
ORDER BY teachers.name;
`
pool.query(sqlQuery, values)
.then(res => {
  res.rows.forEach(row => {
    console.log(`${row.cohort}: ${row.teacher}`);
  })
});











