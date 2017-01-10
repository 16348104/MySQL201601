SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%a%'; -- 通配符 任意数量任意字符

SELECT *
FROM scott.emp
WHERE HIREDATE LIKE '%81%';

SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE ENAME LIKE '_c%'; -- _ 数量为1的任意字符

UPDATE scott.emp
SET ENAME = 'S_COTT'
WHERE ENAME = 'scott';

SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE ENAME LIKE '%\_%' ESCAPE '\\';

CREATE TABLE scott.emp_new LIKE scott.emp;

SHOW TABLE STATUS FROM scott;

DESC scott.emp;
DESC scott.emp_new;

SHOW CREATE TABLE scott.emp_new;

CREATE TABLE `emp_new` (
  `EMPNO`    INT(4) NOT NULL,
  `ENAME`    VARCHAR(10)  DEFAULT NULL,
  `JOB`      VARCHAR(9)   DEFAULT NULL,
  `MGR`      INT(4)       DEFAULT NULL,
  `HIREDATE` DATE         DEFAULT NULL,
  `SAL`      DOUBLE(7, 2) DEFAULT NULL,
  `COMM`     DOUBLE(7, 2) DEFAULT NULL,
  `DEPTNO`   INT(2)       DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `FK_emp_deptno` (`DEPTNO`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

SHOW CREATE TABLE scott.emp;

CREATE TABLE `emp` (
  `EMPNO`    INT(4) NOT NULL,
  `ENAME`    VARCHAR(10)  DEFAULT NULL,
  `JOB`      VARCHAR(9)   DEFAULT NULL,
  `MGR`      INT(4)       DEFAULT NULL,
  `HIREDATE` DATE         DEFAULT NULL,
  `SAL`      DOUBLE(7, 2) DEFAULT NULL,
  `COMM`     DOUBLE(7, 2) DEFAULT NULL,
  `DEPTNO`   INT(2)       DEFAULT NULL,
  PRIMARY KEY (`EMPNO`),
  KEY `FK_emp_deptno` (`DEPTNO`),
  CONSTRAINT `FK_emp_deptno` FOREIGN KEY (`DEPTNO`) REFERENCES `dept` (`DEPTNO`)
)
  ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

DROP TABLE scott.emp_new;

SELECT *
FROM scott.emp
WHERE ENAME REGEXP 'a'; -- RLIKE REGEXP 正则匹配

-- ===================== 正则表达式  REGEXP regular expression

SELECT *
FROM emp
WHERE ENAME = BINARY 'WARd';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP 'a|b';

SELECT *
FROM emp
WHERE ENAME LIKE '%a%' OR emp.ENAME LIKE '%b%';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[a-d]';

UPDATE scott.emp
SET ENAME = '斯科特'
WHERE EMPNO = 7788;

SELECT *
FROM scott.emp;

-- ============ 匹配中文 ===
SELECT *
FROM emp
WHERE hex(ENAME) REGEXP 'e[4-9][0-9a-f]{4}'; -- ?

SELECT *
FROM emp
WHERE ENAME NOT REGEXP '[\u0391-\uFFE5]'; -- ?


SELECT *
FROM scott.emp
WHERE length(ENAME) <> char_length(ENAME);
-- ============ 匹配中文 ===

SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE ENAME RLIKE '\\.';

UPDATE scott.emp
SET ENAME = '斯科特.'
WHERE ENAME = '斯科特';

SELECT *
FROM scott.emp
WHERE COMM REGEXP '[0-9]{3}';

DESC scott.emp;

SELECT *
FROM scott.emp
WHERE COMM > 99 AND comm < 1000;

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '^a';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-z]';

SELECT 'hello0' REGEXP '[0-9]';

SELECT *
FROM scott.emp
WHERE ENAME NOT LIKE '%a%';

SELECT *
FROM scott.emp
WHERE JOB NOT IN ('manager', 'clerk');

SELECT *
FROM scott.emp
WHERE JOB = 'manager' OR JOB = 'clerk';


SELECT *
FROM scott.emp
WHERE SAL BETWEEN 1200 AND 1600; -- [number1, number2]

-- alias
SELECT
  ENAME       '姓名',
  JOB      AS '工作',
  HIREDATE AS '入职日期'
FROM scott.emp;

SELECT
  e.ENAME,
  e.JOB,
  e.HIREDATE,
  e.DEPTNO
FROM scott.emp AS e;

DESC scott.emp;

SHOW CREATE TABLE scott.emp;

SELECT *
FROM scott.emp
WHERE COMM IS NOT NULL; -- NULL 的判断：is null, is not null

UPDATE scott.emp
SET COMM = NULL
WHERE EMPNO = 7844;

SELECT *
FROM scott.emp;

SELECT
  ENAME,
  SAL + ifnull(COMM, 0)
FROM scott.emp;

-- ========================== JOIN
SELECT
  ENAME,
  DNAME
FROM scott.emp, scott.dept; -- 13 * 4 = 52
-- cross join 交叉连接 笛卡尔积

SELECT
  DNAME,
  ENAME
FROM scott.dept
  INNER JOIN scott.emp
    ON emp.DEPTNO = dept.DEPTNO; -- 连接条件
-- inner join 内连接