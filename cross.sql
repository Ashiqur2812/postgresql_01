CREATE TABLE employees(
    emp_id INT,
    emp_name VARCHAR(20),
    dept_id INT
);

CREATE TABLE departments(
    dept_id INT,
    dept_name VARCHAR(20)
);

INSERT INTO employees VALUES (1,'Jason Roy',101), (2,'Joss Butler',102), (3,'Joe Root',103);
INSERT INTO departments VALUES (101,'Sociology'),(102,'Chemistry'),(103,'Physics');

SELECT * FROM departments;
SELECT * FROM employees;

SELECT * FROM employees
CROSS JOIN departments;

DROP TABLE employees;
DROP TABLE departments;

SELECT * FROM employees
NATURAL JOIN departments;