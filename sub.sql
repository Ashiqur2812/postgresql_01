-- Active: 1747416685999@@127.0.0.1@5432@ph
CREATE TABLE employee_data (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(20) NOT NULL,
    department_name VARCHAR(30),
    salary DECIMAL(10, 2),
    hiring_date DATE
);

INSERT INTO
    employee_data (
        employee_name,
        department_name,
        salary,
        hiring_date
    )
VALUES (
        'Quinton de Cock',
        'HR',
        60000.00,
        '2022-01-10'
    ),
    (
        'Emily Clark',
        'Finance',
        55000.00,
        '2022-02-15'
    ),
    (
        'Michael Smith',
        'IT',
        72000.00,
        '2021-12-01'
    ),
    (
        'Sophia Brown',
        'Marketing',
        58000.00,
        '2022-03-22'
    ),
    (
        'Daniel Evans',
        'Sales',
        64000.00,
        '2022-04-10'
    ),
    (
        'Olivia Johnson',
        'HR',
        50000.00,
        '2021-11-05'
    ),
    (
        'Liam Walker',
        'IT',
        67000.00,
        '2022-06-19'
    ),
    (
        'Emma Wilson',
        'Operations',
        61000.00,
        '2022-07-01'
    ),
    (
        'Noah Davis',
        'Finance',
        54000.00,
        '2022-05-25'
    ),
    (
        'Ava Taylor',
        'Marketing',
        56000.00,
        '2022-08-10'
    ),
    (
        'Elijah Lewis',
        'Sales',
        69000.00,
        '2022-09-12'
    ),
    (
        'Mia Hall',
        'HR',
        52000.00,
        '2022-10-18'
    ),
    (
        'James Allen',
        'IT',
        75000.00,
        '2022-11-01'
    ),
    (
        'Isabella Young',
        'Finance',
        60000.00,
        '2022-12-24'
    ),
    (
        'Benjamin Scott',
        'Operations',
        73000.00,
        '2023-01-05'
    ),
    (
        'Charlotte Green',
        'Marketing',
        58000.00,
        '2023-02-14'
    ),
    (
        'William Adams',
        'Sales',
        71000.00,
        '2023-03-09'
    ),
    (
        'Amelia Baker',
        'HR',
        56000.00,
        '2023-04-27'
    ),
    (
        'Henry Wright',
        'IT',
        62000.00,
        '2023-05-30'
    ),
    (
        'Harper Nelson',
        'Finance',
        53000.00,
        '2023-06-11'
    ),
    (
        'Alexander Moore',
        'Operations',
        76000.00,
        '2023-07-20'
    ),
    (
        'Evelyn Perez',
        'Marketing',
        55000.00,
        '2023-08-13'
    ),
    (
        'Jackson Turner',
        'Sales',
        68000.00,
        '2023-09-05'
    ),
    (
        'Abigail Campbell',
        'HR',
        60000.00,
        '2023-10-17'
    ),
    (
        'Sebastian Parker',
        'IT',
        72000.00,
        '2023-11-29'
    ),
    (
        'Elizabeth Murphy',
        'Finance',
        59000.00,
        '2023-12-08'
    ),
    (
        'Mate Rivera',
        'Operations',
        64000.00,
        '2024-01-15'
    ),
    (
        'Sofia Reed',
        'Marketing',
        51000.00,
        '2024-02-21'
    ),
    (
        'Logan Cook',
        'Sales',
        66000.00,
        '2024-03-06'
    ),
    (
        'Avery Morgan',
        'HR',
        57000.00,
        '2024-04-10'
    );

SELECT MAX(salary) AS highest_salary
FROM employee_data
WHERE
    department_name = 'HR';

-- Retrieve all employees whose salary is greater than the highest salary of HR department
SELECT *
FROM employee_data
WHERE
    salary > (
        SELECT MAX(salary) AS highest_salary
        FROM employee_data
        WHERE
            department_name = 'HR'
    );

SELECT *, (
        SELECT SUM(salary) AS total_salary
        FROM employee_data
    )
FROM employee_data;

SELECT department_name, SUM(salary)
FROM employee_data
GROUP BY
    department_name;

SELECT * FROM employee_data;

SELECT employee_name, salary, (
        SELECT ROUND(AVG(salary), 2) AS avg_salary
        FROM employee_data
    )
FROM employee_data;

SELECT ROUND(AVG(salary), 2) AS avg_salary FROM employee_data;

SELECT department_name, ROUND(AVG(salary), 2) AS avg_salary
FROM employee_data
GROUP BY
    department_name;

SELECT *
FROM (
        SELECT department_name, ROUND(AVG(salary), 2) AS avg_salary
        FROM employee_data
        GROUP BY
            department_name
    ) AS dept_avg
WHERE
    avg_salary > 65000;

SELECT *
FROM employee_data
WHERE
    salary = (
        SELECT max(salary) AS highest_salary
        FROM employee_data
    );

SELECT department_name
FROM employee_data
WHERE
    department_name LIKE '%R%'

SELECT employee_name, department_name
FROM employee_data
WHERE
    department_name IN (
        SELECT department_name
        FROM employee_data
        WHERE
            department_name like '%R%'
    );

SELECT
    department_name,
    COUNT(*) AS total_employee
FROM employee_data
GROUP BY
    department_name;

CREATE VIEW dept_avg_salary AS
SELECT department_name, ROUND(AVG(salary),2) AS avg_salary, COUNT(*) AS total_number FROM employee_data
GROUP BY department_name;

DROP VIEW dept_avg_salary;

SELECT * FROM dept_avg_salary;

SELECT * FROM employee_data;

DROP VIEW hr_employees;

CREATE VIEW hr_employees AS
SELECT * FROM employee_data
WHERE department_name = 'HR';

SELECT * FROM hr_employees;

CREATE VIEW employee_salary_info AS
SELECT 
    e.employee_id,
    e.employee_name,
    e.salary,
    d.department_name
FROM employee_data AS e
JOIN departments AS d ON e.department_name = d.department_name;

SELECT * FROM employee_salary_info;
DROP VIEW employee_salary_info;

CREATE VIEW dept_avg_salary AS
SELECT department_name, ROUND(AVG(salary),2) as avg_salary FROM employee_data
GROUP BY department_name;

DROP VIEW dept_avg_salary;

SELECT * FROM dept_avg_salary;

CREATE VIEW public_employee_info AS
SELECT employee_name, department_name FROM employee_data;

SELECT * FROM public_employee_info;
DROP VIEW public_employee_info;
