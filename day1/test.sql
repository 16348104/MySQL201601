-- a SQL statement
# comment
/*
a
b
c
*/

# test
SELECT *
FROM mysql.user;

SELECT *
FROM mysql.user;

SELECT 1 + 1; # comment...
SELECT 1 + 1; -- comment...

SELECT 1 + /*comment...*/ 1;

SELECT 1
       /*
       a
       b
       c
       */
       + 1;

DROP DATABASE test;

CREATE DATABASE test;

USE test;
SHOW TABLES;

CREATE TABLE test.user (
  id   INT,
  name VARCHAR(255)
);

SELECT * FROM test.user;

INSERT INTO test.user VALUES (5, '张三');

UPDATE test.user SET name = '王二' WHERE id = 5;

-- CRUD

DELETE FROM test.user WHERE id = 5;