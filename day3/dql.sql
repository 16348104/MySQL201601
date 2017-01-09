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