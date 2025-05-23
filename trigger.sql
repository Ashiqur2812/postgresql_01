-- Active: 1747416685999@@127.0.0.1@5432@ph

-- Write a PL-SQL code which will insert the data automatically  into 'Backup' table whenever data is deleted from 'Main' table.
CREATE TABLE Main (
    id INT, 
    salary NUMERIC
);

INSERT INTO Main (id, salary) 
VALUES (1, 10000), (2, 12000), (3, 11000), (4, 14000), (5, 13000);

CREATE TABLE Backup (
    id INT, 
    salary NUMERIC,
    log_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

SELECT * FROM Main;

SELECT * FROM Backup;
DROP TABLE Main;

DROP TABLE Backup;


-- CREATE OR REPLACE TRIGGER deleted_data
--     BEFORE DELETE ON Main
--     FOR EACH ROW
-- BEGIN
--     INSERT INTO Backup VALUES(OLD.id, OLD.salary);
-- END;

CREATE OR REPLACE FUNCTION backup_deleted_row()
RETURNS TRIGGER AS
$$
    BEGIN
        INSERT INTO Backup (id, salary)
        VALUES (OLD.id, OLD.salary);

        RAISE NOTICE 'Data is added';

        RETURN OLD;
    END
$$
LANGUAGE PLPGSQL;

CREATE Trigger deleted_data
BEFORE DELETE ON Main
FOR EACH ROW
EXECUTE FUNCTION backup_deleted_row();

DELETE FROM Main
WHERE id = 2;
