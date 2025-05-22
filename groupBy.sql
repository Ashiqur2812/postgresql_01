SELECT department, COUNT(*)
FROM students_data
WHERE
    department = 'Sociology'
GROUP BY
    department;

SELECT status, COUNT(*)
FROM students_data
WHERE
    status = 'A+'
GROUP BY
    status;

SELECT department FROM students_data GROUP BY department;

SELECT status FROM students_data GROUP BY status;

SELECT name, status FROM students_data GROUP BY name, status;

SELECT department, COUNT(*), AVG(age), SUM(score)
FROM students_data
GROUP BY
    department
HAVING
    avg(age) > 22;

SELECT department, COUNT(*), AVG(age)
FROM students_data
GROUP BY
    department
HAVING
    AVG(age) > 22;

ALTER TABLE students_data ADD COLUMN dob DATE;

UPDATE students_data SET dob = '2001-06-12' WHERE id = 1;

UPDATE students_data SET dob = '2001-02-22' WHERE id = 2;

UPDATE students_data SET dob = '2000-11-11' WHERE id = 3;

UPDATE students_data SET dob = '2002-03-20' WHERE id = 4;

UPDATE students_data SET dob = '2001-12-19' WHERE id = 5;

UPDATE students_data SET dob = '2004-03-21' WHERE id = 6;

UPDATE students_data SET dob = '2003-01-02' WHERE id = 7;

UPDATE students_data SET dob = '2005-01-30' WHERE id = 8;

UPDATE students_data SET dob = '2001-07-26' WHERE id = 9;

UPDATE students_data SET dob = '2003-11-08' WHERE id = 10;

UPDATE students_data SET dob = '2000-09-29' WHERE id = 11;

UPDATE students_data SET dob = '2000-11-18' WHERE id = 12;

UPDATE students_data SET dob = '2000-06-18' WHERE id = 13;

UPDATE students_data SET dob = '2001-02-05' WHERE id = 14;

UPDATE students_data SET dob = '2003-06-12' WHERE id = 15;

UPDATE students_data SET dob = '2005-06-29' WHERE id = 16;

UPDATE students_data SET dob = '2001-12-25' WHERE id = 17;

UPDATE students_data SET dob = '2004-09-18' WHERE id = 18;

UPDATE students_data SET dob = '2001-08-15' WHERE id = 19;

UPDATE students_data SET dob = '2001-12-24' WHERE id = 20;

SELECT EXTRACT(YEAR FROM dob) as birth_year, COUNT(*) FROM students_data
GROUP BY birth_year;