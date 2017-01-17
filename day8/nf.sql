DROP DATABASE IF EXISTS db_nf;
CREATE DATABASE db_nf;

-- student table
CREATE TABLE db_nf.student (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  info   VARCHAR(255) NOT NULL
  COMMENT '学生信息', -- information
  gender VARCHAR(255)
);

INSERT INTO db_nf.student VALUES (NULL, 'info...', '男');
INSERT INTO db_nf.student VALUES (NULL, 'info2...', '男 女');

SELECT *
FROM db_nf.student;

DESC db_student.student_course;

DROP TABLE IF EXISTS db_student.new_sc;
CREATE TABLE db_student.new_sc (
  studentId INT,
  courseId  INT,
  grade     INT,
  CONSTRAINT pk_student_sc_studentId_courseId PRIMARY KEY (studentId, courseId)
);

INSERT INTO db_student.new_sc VALUES (1, 1, NULL);
INSERT INTO db_student.new_sc VALUES (1, 2, 60);
INSERT INTO db_student.new_sc VALUES (2, 1, 70);
INSERT INTO db_student.new_sc VALUES (3, 3, NULL);
INSERT INTO db_student.new_sc VALUES (1, 3, NULL);

DESC db_student.new_sc;

SELECT *
FROM db_student.new_sc;

/*
1 1 NULL
1 2 60
2 1 70
2 3 NULL
...
 */

UPDATE db_student.new_sc
SET grade = 80
WHERE studentId = 2 AND courseId = 3; -- WHERE id = xxx;


-- ------------------------ table student  冗余 多余
-- id  姓名 性别 年龄 籍贯 departmentId (FK)
-- 1    a   m     1   bj 1
-- 2    b   m     1   sh 1
-- 3    c   f     1   bj 1
-- 4    d   m     1   gz 1
-- 5    e   f     1   bj 1
-- 6    f   m     1   sz 1
-- 7    a   f     1   bj 1

# https://mingfei.gitbooks.io/java-back-end-training-lectures/content/

/*
create table db_student.department
id 系别 电话 主任
1  CS   123 tester1
2  EE   456 tester2
...


UPDATE db_student.student
SET dept_minister = 'new_test';

*/
