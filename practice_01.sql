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

SELECT EXTRACT(
        YEAR
        FROM hire_date
    ) AS hire_year, COUNT(*)
FROM employees
GROUP BY
    hire_year;

SELECT EXTRACT(
        MONTH
        FROM hire_date
    ) AS hire_month, COUNT(*)
FROM employees
GROUP BY
    hire_month;

SELECT department_name, ROUND(AVG(salary), 2) as avg_salary
FROM employees
    JOIN departments USING (department_id)
GROUP BY
    department_name
ORDER BY avg_salary DESC
LIMIT 1;

SELECT EXTRACT(
        YEAR
        FROM hire_date
    ) AS hire_year, COUNT(*)
FROM employees
GROUP BY
    hire_year;

SELECT hire_date::DATE AS hire_day, COUNT(*)
FROM employees
GROUP BY
    hire_day;

SELECT COUNT(*), EXTRACT(
        YEAR
        FROM hire_date
    ) AS hired_standard
FROM employees
GROUP BY
    hired_standard;

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    total_amount DECIMAL(10, 2)
);

INSERT INTO
    orders (
        customer_id,
        order_date,
        total_amount
    )
VALUES (1, '2005-01-23', 100.05),
    (2, '2005-02-23', 100.10),
    (3, '2005-03-23', 100.20),
    (4, '2005-04-21', 100.30),
    (1, '2005-04-20', 100.40),
    (2, '2006-04-27', 100.50),
    (3, '2007-04-23', 100.60),
    (4, '2022-04-23', 100.70),
    (1, '2022-04-17', 100.80),
    (2, '2022-02-10', 100.90);

SELECT * FROM orders;

DROP TABLE orders;

-- Find customers who have placed more than two orders and calculate the total amount spent by each of these customers

SELECT
    customer_id,
    COUNT(order_id) AS place_order,
    SUM(total_amount) AS amount_of_money
FROM orders
GROUP BY
    customer_id
HAVING
    COUNT(order_id) > 2;

-- Find the total amount of orders placed each month in the year 2022
SELECT * FROM orders;

SELECT
    EXTRACT(MONTH FROM order_date) AS getMonth,
    EXTRACT(YEAR FROM order_date) AS getYear,
    SUM(total_amount) AS amount_of_money
FROM orders
WHERE EXTRACT(YEAR FROM order_date) = 2005
GROUP BY getMonth, getYear
ORDER BY getMonth;



