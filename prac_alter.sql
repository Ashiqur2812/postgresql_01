-- Active: 1747416685999@@127.0.0.1@5432@ph
CREATE Table employe (
    id SERIAL,
    name VARCHAR(30),
    age INT
)

ALTER TABLE employe RENAME TO employee

ALTER TABLE employee ADD COLUMN email VARCHAR(30)

ALTER TABLE employee RENAME COLUMN email TO user_email

ALTER TABLE employee alter COLUMN user_email type VARCHAR(35)

ALTER TABLE employee RENAME COLUMN name to user_name

ALTER TABLE employee alter COLUMN user_name type VARCHAR(60)

ALTER TABLE employee alter COLUMN user_email set NOT NULL;

ALTER TABLE employee alter COLUMN user_email DROP NOT NULL;

INSERT INTO employee (user_name, age) VALUES ('sagor', 22);

ALTER TABLE employee
alter COLUMN user_email
set DEFAULT 'test@gmail.com';

ALTER TABLE employee
ADD constraint unique_employee_email UNIQUE (user_email);

ALTER TABLE employee alter COLUMN user_email DROP DEFAULT

ALTER TABLE employee 
ADD constraint pk_employee_id PRIMARY KEY(id)

ALTER TABLE employee
DROP constraint pk_employee_id;