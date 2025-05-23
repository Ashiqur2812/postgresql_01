-- Active: 1747416685999@@127.0.0.1@5432@ph
SELECT * FROM employee_data;

CREATE OR REPLACE FUNCTION emp_count()
RETURNS INT
LANGUAGE SQL AS
$$
    SELECT COUNT(*) FROM employee_data
$$;

SELECT * FROM emp_count ();

CREATE OR REPLACE FUNCTION employee_info()
RETURNS TABLE(
    department_name TEXT,
    total_employee INT
)
LANGUAGE SQL AS
$$
    SELECT department_name, COUNT(*) AS total_employee FROM employee_data
    GROUP BY department_name
$$;

SELECT * FROM employee_info ();

SELECT
    employee_id,
    employee_name,
    salary
FROM employee_data
WHERE
    department_name = 'HR';

CREATE OR REPLACE FUNCTION hr_dept_info()
RETURNS TABLE (
    employee_id INT,
    employee_name TEXT,
    salary DECIMAL(10, 2)
)
LANGUAGE SQL AS
$$
SELECT
    employee_id,
    employee_name,
    salary
FROM employee_data
WHERE department_name = 'HR'
$$;

SELECT * FROM hr_dept_info ();

DROP FUNCTION hr_dept_info ();

CREATE OR REPLACE PROCEDURE emp_remove()
LANGUAGE plpgsql AS
$$
    DECLARE
    test_var INT;
    BEGIN
        SELECT employee_id INTO test_var FROM employee_data WHERE employee_id = 29;
        DELETE FROM employee_data
        WHERE employee_id = test_var;
    END
$$

CALL emp_remove ();

SELECT * FROM employee_data;

CREATE OR REPLACE PROCEDURE remove_emp()
LANGUAGE plpgsql AS
$$
    DECLARE 
    test_var INT;
    BEGIN
        SELECT employee_id INTO test_var FROM employee_data WHERE employee_id = 27;
        DELETE FROM employee_data
        WHERE employee_id = test_var;
    END
$$

CALL remove_emp ();

SELECT * FROM employee_data;

CREATE OR REPLACE PROCEDURE hr_employees_data()
LANGUAGE plpgsql AS
$$
    BEGIN
        INSERT INTO employee_data (employee_id, employee_name, department_name, salary, hiring_date) 
        VALUES (27, 'Aron Finch', 'IT', '56000.00', '2022-12-08');
    END
$$

CALL hr_employees_data ();
