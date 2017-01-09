DROP DATABASE IF EXISTS db_student;
CREATE DATABASE db_student;

-- table student
DROP TABLE IF EXISTS db_student.student;
CREATE TABLE db_student.student (
  id           INT          AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name         VARCHAR(255) NOT NULL
  COMMENT '学生姓名',
  age          INT COMMENT '年龄',
  gender       VARCHAR(255) DEFAULT '男'
  COMMENT '性别',
  dob          DATE COMMENT '出生日期',
  departmentId INT COMMENT 'FK'
)
  COMMENT '学生表'; -- ?

DESC db_student.student;
SHOW FULL COLUMNS FROM db_student.student; -- ?
SHOW CREATE TABLE db_student.student;

-- table department
DROP TABLE IF EXISTS db_student.department;
CREATE TABLE db_student.department (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '系名称',
  tel   VARCHAR(255) COMMENT '电话'
)
  COMMENT '系别表';

-- table course
DROP TABLE IF EXISTS db_student.course;
CREATE TABLE db_student.course (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title  VARCHAR(255) NOT NULL
  COMMENT '课程名称',
  credit INT COMMENT '学分'
)
  COMMENT '课程表';


-- table student_course
DROP TABLE IF EXISTS db_student.student_course;
CREATE TABLE db_student.student_course (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  studentId INT COMMENT 'FK',
  courseId  INT COMMENT 'FK',
  grade     INT COMMENT '成绩'
)
  COMMENT '课程表';