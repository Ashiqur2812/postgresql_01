

EXPLAIN ANALYSE
SELECT * FROM employee_data
WHERE employee_name = 'Glenn Maxwell'; -- 0.034

CREATE INDEX idx_employee
ON employee_data (employee_name);

EXPLAIN ANALYSE
SELECT employee_name FROM employee_data;

DROP INDEX idx_employee;
SHOW data_directory;

SELECT employee_name, department_name FROM employee_data
WHERE salary > 60000
GROUP BY employee_name, department_name;

CREATE INDEX idx_hr_data
ON employee_data (salary);