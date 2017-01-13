SELECT
  max(SAL),
  min(SAL),
  avg(SAL),
  /*average*/
  sum(SAL),
  count(*)
FROM scott.emp;

SELECT count(*)
FROM emp;

/*
SELECT ename
FROM scott.emp
  WHERE max(LENGTH(ENAME)) = length(ENAME)
*/


SELECT max(HIREDATE)
FROM scott.emp;

SELECT avg(HIREDATE)
FROM scott.emp;

SELECT sum(HIREDATE) / count(HIREDATE)
FROM scott.emp;

SELECT *
FROM scott.emp
LIMIT 0, 1;

SELECT *
FROM scott.emp
LIMIT 0, 1;

SELECT
  deptno,
  avg(SAL),
  count(*),
  max(HIREDATE),
  min(ENAME),
  sum(comm)
FROM scott.emp
GROUP BY DEPTNO -- 分组查询
HAVING count(*) > 5; -- 组检索

SELECT *
FROM scott.emp
WHERE SAL > 1500; -- 行检索

SELECT
  job,
  deptno,
  count(*)
FROM scott.emp
GROUP BY JOB, DEPTNO;

SELECT
  deptno,
  count(*),
  group_concat(DISTINCT ENAME ORDER BY ENAME DESC SEPARATOR '|')
FROM scott.emp
GROUP BY DEPTNO;

UPDATE scott.emp
SET ENAME = 'CLARK'
WHERE ENAME = 'miller';

