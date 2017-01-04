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
  +1;