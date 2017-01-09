-- show
SHOW DATABASES;
USE db_student;
SHOW TABLES;
SHOW TABLE STATUS FROM db_student;
SHOW FULL COLUMNS FROM db_student.student;
SHOW VARIABLES LIKE 'ch%';
SHOW VARIABLES LIKE 'col%';

SHOW CREATE TABLE db_student.student;

SELECT *
FROM db_student.student;

SELECT name, gender, dob
FROM db_student.student;

SELECT *
FROM db_student.student
WHERE id = 1;

SELECT name, dob
FROM db_student.student
WHERE id = 2;

SELECT DISTINCT gender -- 种类不同,\ 与,\ 种类
FROM db_student.student;

UPDATE db_student.student
SET gender = 'Female'
WHERE id = 2;

SELECT *
FROM db_student.student
WHERE age = 18 AND gender = 'Male';

SELECT *
FROM db_student.student
WHERE age = 18 OR gender = 'Male';
