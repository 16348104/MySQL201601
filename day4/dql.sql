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

SELECT *
FROM emp
WHERE ENAME NOT REGEXP '[\u4e00-\u9fbb]'; -- ?


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
WHERE COMM > 99 AND  comm < 1000;

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '^a';

SELECT *
FROM scott.emp
WHERE ENAME REGEXP '[^a-z]';

SELECT 'hello0' REGEXP '[0-9]';


