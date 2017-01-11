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


SELECT
  s.name,
  sum(c.credit)
FROM db_student.student s LEFT JOIN db_student.student_course sc
    ON s.id = sc.studentId
  LEFT JOIN db_student.course c
    ON sc.courseId = c.id
WHERE grade >= 60
GROUP BY s.id;