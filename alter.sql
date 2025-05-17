-- Active: 1747416685999@@127.0.0.1@5432@ph
-- SELECT * FROM student_info;

ALTER TABLE student_info
    ADD COLUMN contact VARCHAR(15)
    DEFAULT '01731148314' NOT NULL;

--     INSERT INTO student_info (id, user_name, age, email, contact)
-- VALUES 
-- (8, 'rani', 24, 'rani@gmail.com', '01648868943'),
-- (7, 'nupur', 23, 'nupur@gmail.com', '01643800705'),
-- (6, 'shuchi', 22, 'shuchi@gmail.com', '01348800705');

-- UPDATE student_info
-- SET contact = '';

-- ALTER TABLE student_info
--     alter COLUMN contact type VARCHAR;

-- UPDATE student_info
-- set contact = '01648800705'
-- WHERE id = 1;

CREATE TABLE information (
    id SERIAL,
    name VARCHAR(50) UNIQUE,
    age INTEGER NOT NULL,
    email VARCHAR(50) UNIQUE
);

INSERT INTO information
VALUES (1,'ashiq',24,'ashiqur2812@gmail.com'),(2,'esrafil',21,'esrafil2812@gmail.com'),(3,'murad',25,'murad2812@gmail.com'),(4,'asad',25,'asad2812@gmail.com'),(5,'maleki',25,'maleki2812@gmail.com'),(6,'shuchi',26,'shuchi2812@gmail.com'),(7,'mizan',36,'mizan2812@gmail.com'),(8,'xobaer',4,'xobaer2812@gmail.com') ;

SELECT * FROM information;

ALTER TABLE information
ADD COLUMN contact VARCHAR(15) DEFAULT '01731148314' NOT NULL;

ALTER TABLE information
DROP COLUMN contact;

ALTER TABLE information
RENAME COLUMN age TO person_age;

SELECT person_age FROM information;
SELECT * FROM information;

ALTER TABLE information
ALTER COLUMN name TYPE VARCHAR(30);

ALTER TABLE information
ALTER COLUMN email TYPE VARCHAR(60);

ALTER TABLE information
ALTER COLUMN name SET NOT NULL;

ALTER TABLE information
ALTER COLUMN id DROP NOT NULL;

ALTER TABLE information
ALTER COLUMN name DROP NOT NULL;

ALTER TABLE information
ALTER COLUMN name SET NOT NULL;

ALTER TABLE information
ALTER COLUMN email SET NOT NULL;

ALTER TABLE information
ALTER COLUMN email DROP NOT NULL;

ALTER TABLE information
ADD constraint unique_information_person_age UNIQUE(person_age);

ALTER TABLE information
ADD constraint pk_information_id PRIMARY KEY(id);


ALTER TABLE information
DROP constraint unique_information_person_age;