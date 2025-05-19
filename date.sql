SHOW timezone;

SELECT now();

SELECT * FROM students_data;

CREATE TABLE timezone (
    ts TIMESTAMP without time zone,
    tsz TIMESTAMP with time zone
);

INSERT INTO timezone
VALUES('2024-12-01 10:43:00','2025-03-12 10:30:00');

SELECT CURRENT_DATE;

SELECT now()::DATE;

SELECT now()::TIME;

SELECT now()::TIMESTAMP;

SELECT now() AT TIME ZONE 'GMT+6';

SELECT to_char(now(), 'yyyy/mm/dd');
SELECT to_char(now(), 'dd/mm/yyyy');
SELECT to_char(now(), 'month');
SELECT to_char(now(), 'Month');
SELECT to_char(now(), 'DDD');

SELECT CURRENT_DATE - INTERVAL '1 year';

SELECT age (CURRENT_DATE,'2001-06-12');

SELECT *, age(CURRENT_DATE,last_login) FROM students_data;

SELECT EXTRACT(DAY FROM '2025-05-19'::date);