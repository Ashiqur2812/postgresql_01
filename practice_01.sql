CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(20),
    department_id INT REFERENCES departments (department_id),
    salary DECIMAL(10, 2),
    hire_date DATE
);

SELECT * FROM employees;

SELECT * FROM departments;

CREATE TABLE departments (
    department_id SERIAL PRIMARY KEY,
    department_name VARCHAR(30)
);

DROP TABLE departments;

DROP TABLE employees;

INSERT INTO
    departments (department_name)
VALUES ('HR'),
    ('Marketing'),
    ('Finance'),
    ('IT'),
    ('Sales'),
    ('Engineering'),
    ('Customer Support'),
    ('Administration'),
    ('Research'),
    ('Quality Assurance');

INSERT INTO
    employees (
        employee_name,
        department_id,
        salary,
        hire_date
    )
VALUES (
        'Jason Roy',
        1,
        60000.00,
        '2022-01-10'
    ),
    (
        'Emily Clark',
        2,
        55000.00,
        '2022-02-15'
    ),
    (
        'Michael Smith',
        3,
        72000.00,
        '2021-12-01'
    ),
    (
        'Sophia Brown',
        4,
        58000.00,
        '2022-03-22'
    ),
    (
        'Daniel Evans',
        5,
        64000.00,
        '2022-04-10'
    ),
    (
        'Olivia Johnson',
        6,
        50000.00,
        '2021-11-05'
    ),
    (
        'Liam Walker',
        7,
        67000.00,
        '2022-06-19'
    ),
    (
        'Emma Wilson',
        8,
        61000.00,
        '2022-07-01'
    ),
    (
        'Noah Davis',
        9,
        54000.00,
        '2022-05-25'
    ),
    (
        'Ava Taylor',
        10,
        56000.00,
        '2022-08-10'
    );

SELECT *
FROM employees AS e
    JOIN departments AS d ON e.department_id = d.department_id;

SELECT * FROM employees JOIN departments USING (department_id);

SELECT round(AVG(salary)) AS avg_salary, department_name
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name;

SELECT
    department_name,
    COUNT(*) AS number_of_employee
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY department_name DESC;

SELECT department_name, ROUND(AVG(salary), 2) AS avg_salary
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY avg_salary DESC
LIMIT 1;

SELECT EXTRACT(YEAR FROM hire_date) AS hire_year, COUNT(*) FROM employees
GROUP BY hire_year;