-- Active: 1747416685999@@127.0.0.1@5432@ph
CREATE Table students(
    id SERIAL PRIMARY KEY,
    fName VARCHAR(20),
    lName VARCHAR(20),
    age INT,
    grade CHAR(2),
    course VARCHAR(20),
    email VARCHAR(30),
    dob DATE,
    blood_group VARCHAR(5),
    country VARCHAR(20)
);

ALTER TABLE students
ALTER COLUMN id SET NOT NULL;

ALTER TABLE students
ADD CONSTRAINT check_students_age
CHECK (age>=18);

ALTER TABLE students
ALTER COLUMN fName SET NOT NULL;
ALTER TABLE students
ALTER COLUMN lName SET NOT NULL;

ALTER TABLE students
ADD CONSTRAINT unique_information_email
UNIQUE(email);

SELECT * FROM students;

INSERT INTO students (fName, lName, age, grade, course, email, dob, blood_group, country)
VALUES
('ashiqur', 'rahman', 23, 'A+', 'sociology', 'ashiqur2812@gmail.com', '2001-12-12', 'B-', 'Bangladesh'),
('esrafil', 'sagor', 20, 'A-', 'criminology', 'sagor@gmail.com', '2003-09-12', 'A-', 'Bangladesh'),
('sawad', 'sazid', 20, 'A', 'ict', 'sazid@gmail.com', '2005-02-17', 'AB-', 'Bangladesh'),
('mizanur', 'rahman', 35, 'B', 'chemistry', 'mizan@gmail.com', '1990-04-22', 'A+', 'Bangladesh'),
('kawser', 'ahmad', 23, 'A+', 'physics', 'sabuj@gmail.com', '1994-02-12', 'B-', 'Bangladesh');


INSERT INTO students (fName, lName, age, grade, course, email, dob, blood_group, country)
VALUES
('nahid', 'hossain', 21, 'B+', 'mathematics', 'nahid@gmail.com', '2002-03-11', 'O+', 'Bangladesh'),
('tania', 'akter', 22, 'A', 'sociology', 'tania@gmail.com', '2001-06-14', 'A+', 'Pakistan'),
('rifat', 'karim', 24, 'B-', 'ict', 'rifatkarim@gmail.com', '2000-11-22', 'B+', 'Bangladesh'),
('sabbir', 'ahmed', 26, 'C+', 'english', 'sabbir@gmail.com', '1998-08-10', 'A-', 'Bangladesh'),
('mehzabin', 'sultana', 25, 'A-', 'history', 'mehzabin@gmail.com', '1999-05-05', 'AB+', 'Bangladesh'),
('asif', 'iqbal', 23, 'A+', 'physics', 'asif@gmail.com', '2002-01-25', 'O-', 'China'),
('maisha', 'tasnim', 22, 'B', 'philosophy', 'maisha@gmail.com', '2001-07-30', 'B+', 'Bangladesh'),
('sumaiya', 'rahman', 21, 'A', 'law', 'sumaiya@gmail.com', '2002-09-17', 'O+', 'Russia'),
('rakib', 'hasan', 24, 'A-', 'chemistry', 'rakib@gmail.com', '2000-03-03', 'A-', 'Bangladesh'),
('sajid', 'khan', 23, 'B+', 'criminology', 'sajidkhan@gmail.com', '2001-04-09', 'AB-', 'Bangladesh'),
('nishi', 'islam', 22, 'A', 'sociology', 'nishi@gmail.com', '2002-06-20', 'B+', 'Bangladesh'),
('fahim', 'rahman', 21, 'A+', 'ict', 'fahim@gmail.com', '2003-01-15', 'O-', 'Bangladesh'),
('sadia', 'kabir', 20, 'A-', 'political science', 'sadia@gmail.com', '2003-10-01', 'A+', 'Bangladesh'),
('arif', 'uzzaman', 26, 'B', 'economics', 'arif@gmail.com', '1998-12-18', 'B-', 'Bangladesh'),
('sanzida', 'akter', 23, 'A+', 'statistics', 'sanzida@gmail.com', '2001-11-11', 'O+', 'Bangladesh');

SELECT * FROM students;


SELECT email, age, blood_group FROM students;

SELECT email AS student_email FROM students;

SELECT email AS "Student Email" FROM students;

SELECT * from students ORDER BY fName ASC;
SELECT * from students ORDER BY course ASC;


SELECT * from students ORDER BY grade ASC;

SELECT * FROM students ORDER BY lName DESC;

UPDATE students
SET country = 'Australia'
WHERE id = 2;

UPDATE students
SET country = 'England'
WHERE id = 3;

SELECT * FROM students ORDER BY id ASC;

SELECT country FROM students;
SELECT DISTINCT country FROM students;
SELECT DISTINCT blood_group FROM students;

SELECT * FROM students
WHERE country = 'Bangladesh';

SELECT * FROM students
WHERE grade = 'A+' AND course = 'physics';

SELECT * FROM students
WHERE blood_group = 'A+';

SELECT * FROM students
WHERE country = 'Bangladesh' OR country = 'China';

UPDATE students
SET country = 'USA'
WHERE id = 1;

UPDATE students
SET country = 'New Zealand'
WHERE id = 4;

UPDATE students
SET country = 'Scotland'
WHERE id = 14;
UPDATE students
SET country = 'Denmark'
WHERE id = 15;
UPDATE students
SET country = 'Malaysia'
WHERE id = 16;
UPDATE students
SET country = 'Singapore'
WHERE id = 17;
UPDATE students
SET country = 'Finland'
WHERE id = 18;

SELECT * FROM students
WHERE country = 'Bangladesh' AND country = 'China' OR age = 20;

SELECT * FROM students
WHERE age = 22;

SELECT * FROM students
WHERE age > 20;

SELECT * FROM students
WHERE age < 25;

SELECT * FROM students
WHERE age != 20;

SELECT * from students
WHERE country != 'Bangladesh';

SELECT upper(fName)  FROM students;
SELECT upper(lName) FROM students;
SELECT upper(lName) as last_name_uppercase FROM students;

SELECT concat(fName, ' ', lName) as full_name FROM students;

SELECT LENGTH(fName) FROM students;

SELECT AVG(age) FROM students;

SELECT MAX(age) FROM students;

SELECT MIN(age) FROM students;

SELECT SUM(age) FROM students;

SELECT COUNT(*) FROM students;

SELECT * FROM students
WHERE NOT country = 'Australia';

SELECT * from students
WHERE country != 'Bangladesh';

SELECT * FROM students
WHERE email IS NULL;

SELECT * FROM test_03;

SELECT COALESCE(dob::TEXT, 'DOB not provided') as "Date of Birth" FROM test_03;

SELECT COALESCE(first_name, 'First_name_not_given') as "First Name" from person;

SELECT * FROM students
WHERE country IN ('Scotland', 'Australia', 'England');

SELECT * FROM students
WHERE course IN ('chemistry', 'sociology', 'physics');

SELECT * from students
WHERE country NOT IN ('Bangladesh', 'China', 'USA');

SELECT * FROM students
WHERE age BETWEEN 20 AND 23;

SELECT * FROM students
WHERE dob BETWEEN '2000-01-01' AND '2005-01-01' ORDER BY dob;

SELECT * FROM students
WHERE fName LIKE '%ur';

SELECT * FROM students
WHERE fName LIKE 'r%';


SELECT * FROM students
WHERE lName LIKE '___i_'; -- like is case sensitive

SELECT * FROM students
WHERE lName ILIKE '%a';

SELECT * FROM students
ORDER BY id DESC
LIMIT 5;


SELECT * FROM students
ORDER BY id ASC
LIMIT 10;

SELECT * FROM students
WHERE country = 'Bangladesh'
LIMIT 5 OFFSET 2;




SELECT * FROM students;