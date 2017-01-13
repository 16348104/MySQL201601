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

SELECT abs(-100);

SELECT hex(sal)
FROM scott.emp;

SELECT round(pi(), 3);

SELECT ascii('a');

SELECT bit_length('abc');

SELECT concat(ENAME, JOB, MGR)
FROM scott.emp;

SELECT length('hello');
SELECT length('中文'); -- byte
SELECT char_length('中文');

UPDATE scott.emp
SET ENAME = '斯科特'
WHERE ENAME = 'scott';

SELECT *
FROM scott.emp
WHERE LENGTH(ENAME) != char_length(ENAME);


SELECT ltrim('     a');
SELECT rtrim('a         ');
SELECT trim('        a           ');

SELECT upper('a');
SELECT ucase('a');

SELECT lower('A');
SELECT lcase('A');

SELECT curdate(), current_date;
SELECT current_time, curtime();

SELECT now();


SELECT date_add(HIREDATE, INTERVAL 12 MONTH)
FROM scott.emp;

SELECT dayofweek('2017-1-13');

SELECT dayofyear('2017-1-13');

SELECT HIREDATE, date_format(HIREDATE, '%Y-%m')
FROM scott.emp;
