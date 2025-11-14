-- Active: 1747416685999@@127.0.0.1@5432@ph
CREATE TABLE Learner (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(30) NOT NULL,
    last_name VARCHAR(30) NOT NULL,
    age INT,
    grade CHAR(2),
    course VARCHAR(40),
    email VARCHAR(100) UNIQUE,
    dob DATE,
    blood_group VARCHAR(3),
    country VARCHAR(40)
);

DROP TABLE Learner;

INSERT INTO Learner (first_name, last_name, age, grade, course, email, dob, blood_group, country) VALUES
('Jason','Roy',30,'A','Sociology','jason@gmail.com','2003-07-20','B-','England'),
('Emily','Brown',22,'B','Psychology','emily.brown@gmail.com','2002-01-15','O+','Canada'),
('Michael','Smith',25,'A','Political Science','michael.smith@gmail.com','2000-09-12','A+','USA'),
('Sophia','Johnson',21,'A','Economics','sophia.johnson@gmail.com','2003-05-25','B+','Australia'),
('Liam','Anderson',23,'B','Sociology','liam.anderson@gmail.com','2001-02-18','O-','New Zealand'),
('Olivia','Miller',24,'A','Anthropology','olivia.miller@gmail.com','2000-11-08','AB+','England'),
('Ethan','Wilson',27,'C','History','ethan.wilson@gmail.com','1998-03-02','A-','USA'),
('Ava','Moore',26,'B','Sociology','ava.moore@gmail.com','1999-07-10','B+','Scotland'),
('Noah','Taylor',29,'A','Political Science','noah.taylor@gmail.com','1996-12-01','O+','Ireland'),
('Isabella','Thomas',28,'B','Economics','isabella.thomas@gmail.com','1997-06-20','A+','USA'),
('James','Harris',22,'A','Anthropology','james.harris@gmail.com','2002-03-30','B-','England'),
('Mia','Clark',24,'A','Sociology','mia.clark@gmail.com','2000-05-14','O+','Canada'),
('Benjamin','Lewis',23,'C','Psychology','benjamin.lewis@gmail.com','2001-01-21','AB-','USA'),
('Charlotte','Walker',27,'B','Economics','charlotte.walker@gmail.com','1998-10-05','A-','Australia'),
('Elijah','Hall',21,'A','History','elijah.hall@gmail.com','2003-08-11','B+','New Zealand'),
('Amelia','Allen',22,'A','Sociology','amelia.allen@gmail.com','2002-06-18','O-','England'),
('William','Young',23,'A','Political Science','william.young@gmail.com','2001-09-25','A+','Ireland'),
('Harper','King',25,'B','Sociology','harper.king@gmail.com','2000-02-03','B+','Canada'),
('Lucas','Wright',26,'A','Anthropology','lucas.wright@gmail.com','1999-04-22','O+','USA'),
('Evelyn','Scott',27,'B','Economics','evelyn.scott@gmail.com','1998-01-19','A-','Australia'),
('Alexander','Green',28,'A','Sociology','alexander.green@gmail.com','1997-11-02','B+','New Zealand'),
('Ella','Adams',22,'B','Psychology','ella.adams@gmail.com','2002-07-09','O-','England'),
('Daniel','Baker',24,'A','Sociology','daniel.baker@gmail.com','2000-05-27','A+','Canada'),
('Grace','Nelson',21,'A','History','grace.nelson@gmail.com','2003-09-16','AB+','USA'),
('Henry','Carter',23,'B','Economics','henry.carter@gmail.com','2001-02-14','B+','Australia'),
('Aria','Mitchell',25,'A','Political Science','aria.mitchell@gmail.com','2000-06-05','O+','Ireland'),
('Matthew','Perez',26,'B','Sociology','matthew.perez@gmail.com','1999-08-23','A-','England'),
('Roman','Roberts',27,'A','Psychology','roman.roberts@gmail.com','1998-03-19','O+','USA'),
('David','Turner',29,'B','Anthropology','david.turner@gmail.com','1996-12-10','B+','Canada'),
('Luna','Phillips',24,'A','Sociology','luna.phillips@gmail.com','2000-09-03','AB+','Australia');

SELECT * FROM Learner;

SELECT first_name, last_name, grade, age, blood_group, country FROM Learner
ORDER BY first_name DESC;

SELECT DISTINCT course from Learner;

SELECT * FROM learner
WHERE course = 'Sociology';

SELECT age, blood_group, course from Learner
WHERE country = 'USA';

SELECT DISTINCT grade from Learner
WHERE course = 'Sociology';

SELECT * FROM Learner
WHERE blood_group = 'B-';

SELECT first_name, last_name, age, blood_group, country FROM Learner
WHERE (grade = 'A' or grade = 'B') AND (course = 'Economics' or course = 'Psychology')

SELECT first_name, last_name, age, country, blood_group, course FROM Learner
WHERE (course = 'Sociology' or course = 'Anthropology') AND age >= 20

SELECT first_name, last_name, age, course, blood_group, country FROM Learner
WHERE country <> 'England';

SELECT DISTINCT age FROM Learner;

SELECT first_name, last_name, age, course, blood_group, grade FROM Learner
WHERE age BETWEEN 20 AND 25;

SELECT * FROM Learner
WHERE country IN ('Australia', 'USA');
