-- Active: 1747416685999@@127.0.0.1@5432@ph
CREATE TABLE students_data (
    id SERIAL,
    roll INT,
    name VARCHAR(20),
    age INT,
    department VARCHAR(20),
    score INT,
    status VARCHAR(20),
    last_login DATE
);

INSERT INTO
    students_data (student_email)
VALUES ('ashiq@gmail.com'),
    ('rahim@gmail.com'),
    ('karim@gmail.com'),
    ('anika@gmail.com'),
    ('shuvo@gmail.com'),
    ('mim@gmail.com'),
    ('tania@gmail.com'),
    ('nabil@gmail.com'),
    ('sabil@gmail.com'),
    ('farah@gmail.com'),
    ('rafi@gmail.com'),
    ('niloy@gmail.com'),
    ('arifa@gmail.com'),
    ('fahim@gmail.com'),
    ('rifa@gmail.com'),
    ('rima@gmail.com'),
    ('sadia@gmail.com'),
    ('jony@gmail.com'),
    ('salma@gmail.com'),
    ('mursalin@gmail.com');

ALTER TABLE students_data DROP COLUMN student_email;

ALTER Table students_data
ADD constraint student_id_pk PRIMARY KEY (id);

ALTER TABLE students_data ADD COLUMN email VARCHAR(20);

ALTER TABLE students_data RENAME COLUMN email TO student_email;

ALTER TABLE students_data
ADD constraint student_email_unique UNIQUE (student_email);

ALTER TABLE students_data ADD COLUMN courses VARCHAR(20);

ALTER TABLE students_data DROP COLUMN courses;

SELECT * FROM students_data WHERE score > 80 AND score IS NOT NULL;

SELECT *
FROM students_data
WHERE
    department != 'CSE'
    AND department <> 'EEE';

SELECT * FROM students_data WHERE name LIKE '%a';
--case sensitive

SELECT * FROM students_data WHERE name ILIKE 'f%';
--case insensitive

SELECT * FROM students_data WHERE age BETWEEN 20 AND 22;

SELECT * FROM students_data WHERE roll IN (101, 102, 103);

SELECT *
FROM students_data
WHERE
    roll = 104
    OR roll = 105
    OR roll = 106;

SELECT COUNT(*) FROM students_data;

SELECT MAX(score) FROM students_data;

SELECT MIN(score) FROM students_data;

SELECT * FROM students_data LIMIT 5 OFFSET 2;

SELECT * FROM students_data LIMIT 5 OFFSET 5 * 0;

SELECT * FROM students_data LIMIT 5 OFFSET 5 * 1;

SELECT * FROM students_data LIMIT 5 OFFSET 5 * 2;

SELECT * FROM students_data LIMIT 5 OFFSET 5 * 3;

SELECT AVG(score) FROM students_data WHERE department = 'EEE';

SELECT AVG(score) FROM students_data;

SELECT AVG(score) FROM students_data WHERE department = 'Sociology';

SELECT SUM(score) FROM students_data WHERE department = 'Sociology';

SELECT MAX(age) from students_data;

SELECT MIN(age) from students_data;

UPDATE students_data SET status = 'A' WHERE score < 80;

UPDATE students_data SET status = 'A+' WHERE score >= 80;

DELETE FROM
students_data WHERE last_login < '2024-01-01';

DELETE FROM
students_data WHERE id IS NULL;

DELETE FROM
students_data WHERE roll IS NULL;

DELETE FROM
students_data WHERE name IS NULL;

DELETE FROM
students_data WHERE age IS NULL;

DELETE FROM students_data 
WHERE department IS NULL;

DELETE FROM students_data 
WHERE score IS NULL;

DELETE FROM students_data 
WHERE status IS NULL;

DELETE FROM
students_data WHERE last_login IS NULL;

SELECT * FROM students_data
GROUP BY id 
ORDER BY id ASC;