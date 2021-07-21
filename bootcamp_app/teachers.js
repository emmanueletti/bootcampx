const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx',
});

const queryString = `
  SELECT
  DISTINCT t.name AS teacher,
           c.name AS cohort 
  FROM assistance_requests a_r
  JOIN students s 
    ON a_r.student_id = s.id 
  JOIN teachers t 
    ON a_r.teacher_id = t.id 
  JOIN cohorts c 
    ON s.cohort_id = c.id 
  WHERE c.name = $1
  ORDER BY teacher;
    `;
const values = [process.argv[2]];

pool
  .query(queryString, values)
  .then((res) => {
    res.rows.forEach((row) => {
      console.log(`${row.cohort}: ${row.teacher}`);
    });
  })
  .catch((err) => {
    console.log(err.stack);
  });
