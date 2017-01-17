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

/*
1 1 ....
1 2 ....
 */


