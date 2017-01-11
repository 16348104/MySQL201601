SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e
  LEFT JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO

UNION

SELECT
  e.ENAME,
  d.DNAME
FROM scott.emp e RIGHT JOIN scott.dept d
    ON e.DEPTNO = d.DEPTNO;


CREATE TABLE scott.new_emp
  SELECT *
  FROM scott.emp; -- DDL

CREATE TABLE scott.temp_emp LIKE scott.emp;

SHOW TABLE STATUS FROM scott;
SHOW FULL COLUMNS FROM scott.new_emp;
SHOW FULL COLUMNS FROM scott.temp_emp;


SELECT *
FROM scott.new_emp;

INSERT INTO scott.emp (empno, DEPTNO) VALUE (1, 1);
INSERT INTO scott.new_emp (empno, DEPTNO) VALUE (1, 1);
INSERT INTO scott.temp_emp (empno, DEPTNO) VALUE (1, 1);


INSERT INTO scott.emp
  SELECT *
  FROM scott.emp;

INSERT INTO db_student.student (name, age, gender, dob, departmentId)
  SELECT
    name,
    age,
    gender,
    dob,
    departmentId
  FROM db_student.student;

SELECT *
FROM db_student.student;

DESC scott.new_emp;

INSERT INTO scott.temp_emp
  SELECT *
  FROM scott.emp;

SELECT *
FROM scott.temp_emp;

SHOW TABLES;

CREATE OR REPLACE VIEW scott.v_emp
AS
  SELECT
    ENAME,
    JOB,
    HIREDATE,
    SAL
  FROM scott.emp
  WHERE HIREDATE > '1985-12-31' AND ENAME RLIKE 'a';

SHOW TABLE STATUS FROM scott;

SELECT *
FROM scott.v_emp;

INSERT INTO scott.v_emp VALUES ('zhangsan', 'job...', '1999-1-1', 1000);


UPDATE scott.v_emp
SET SAL = SAL * 0.2;

DELETE FROM scott.v_emp;

SELECT *
FROM scott.emp;

SHOW TABLE STATUS FROM db_student;


SELECT *
FROM db_student.student_course;


CREATE VIEW db_student.v_student_credits
AS
  SELECT
    s.name,
    sum(c.credit)
  FROM db_student.student s LEFT JOIN db_student.student_course sc
      ON s.id = sc.studentId
    LEFT JOIN db_student.course c
      ON sc.courseId = c.id
  WHERE grade >= 60
  GROUP BY s.id;

SELECT *
FROM db_student.v_student_credits;

SELECT *
FROM db_student.v_student_credits
WHERE name = 'lisi';

SHOW TABLE STATUS FROM db_student;

UPDATE db_student.v_student_credits
SET name = 'Zhangsan_new'
WHERE name = 'Zhangsan';

DELETE FROM db_student.v_student_credits;