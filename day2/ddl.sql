SHOW DATABASES;

-- DDL: CREATE ALTER DROP
CREATE DATABASE day2;
# ALTER DATABASE day2 ...
DROP DATABASE day2;

USE day2;
SHOW TABLES;

# CREATE TABLE ...
# ALTER TABLE ...;
# DROP TABLE ...

# char(size) 定长字符类型
# varchar(255) 可变长字符类型

CREATE TABLE day2.user (
  # AUTO_INCREMENT 自动增长
  id     INT AUTO_INCREMENT PRIMARY KEY, -- display width 展示宽度 unsigned 无符号（负号） Java int
  name   VARCHAR(255),
  height DOUBLE(3, 2),
  price  DECIMAL(6, 2),
  dob    DATE,
  time   DATETIME
);

SELECT *
FROM day2.user; -- 结果集

DROP TABLE day2.user;

UPDATE day2.user
SET height = 1.70, name = 'tester'
WHERE id = 1;

INSERT INTO day2.user VALUES (NULL, 'zhangsan', 0.755, 0.755, '1990-1-2', '2017-1-5 11:05:6'); -- ?
SELECT sum(height)
FROM day2.user;
DESC day2.user; -- describe DESC 描述


SHOW TABLES;

-- entity
CREATE TABLE student (
  id           INT          AUTO_INCREMENT PRIMARY KEY, -- 主关键字 主键 主码
  name         VARCHAR(255) NOT NULL,
  gender       VARCHAR(255) DEFAULT '男',
  age          INT CHECK (age > 17), -- 检查完整性约束
  dob          DATE UNIQUE,
  departmentId INT
  #   CONSTRAINT FOREIGN KEY (departmentId) REFERENCES day2.department (id)
  #     ON DELETE RESTRICT
  #     ON UPDATE NO ACTION -- 级联 cascade 删除  set null 置空
);

DROP TABLE day2.student;

ALTER TABLE day2.student
  AUTO_INCREMENT = 10000;

DESC day2.student;

INSERT INTO day2.student VALUES (NULL, 'Zhangsan', NULL, 10, '1999-1-1', 3); -- null
INSERT INTO day2.student VALUES (NULL, 'Lisi', NULL, 19, '2000-1-1', 3); -- null
INSERT INTO day2.student VALUES (NULL, 'Wanger', NULL, 20, '1997-1-1', 3); -- null
INSERT INTO day2.student VALUES (NULL, 'tester', NULL, 20, '1996-1-1', 4); -- null

INSERT INTO day2.student (name, dob, departmentId) VALUES ('new studenet', '1990-1-1', 3);


DELETE FROM day2.student
WHERE id = 2;

SELECT *
FROM day2.student;
-- ORDER BY dob DESC ;

DELETE FROM day2.student;
TRUNCATE TABLE day2.student; -- dangerous!

DELETE FROM day2.student
WHERE id = 2;
DELETE FROM day2.student
WHERE dob = '1990-1-2';

-- table department entity
CREATE TABLE day2.department (
  id    INT AUTO_INCREMENT PRIMARY KEY,
  dname VARCHAR(255) NOT NULL,
  tel   VARCHAR(255)
);

DROP TABLE day2.department;

SELECT *
FROM day2.department;

INSERT INTO day2.department VALUES (NULL, 'CS', '123');
INSERT INTO day2.department VALUES (NULL, 'EE', '789');
INSERT INTO day2.department VALUES (NULL, 'SS', '456');

DELETE FROM day2.department
WHERE id = 1;

UPDATE day2.department
SET id = 4
WHERE id = 2;

SET FOREIGN_KEY_CHECKS = 0;
SET FOREIGN_KEY_CHECKS = 1;

ALTER TABLE day2.new_student
  RENAME day2.student;

SHOW TABLES;


ALTER TABLE day2.student
  ADD COLUMN address VARCHAR(255)
  AFTER gender;

ALTER TABLE day2.student
  DROP COLUMN address;

ALTER TABLE day2.student
  DROP COLUMN city;

ALTER TABLE day2.student
  MODIFY COLUMN name VARCHAR(20);

ALTER TABLE day2.student
  MODIFY COLUMN name VARCHAR(20) AFTER age;

ALTER TABLE day2.student
  ADD CONSTRAINT pk_student_id PRIMARY KEY (id);

ALTER TABLE day2.student
  MODIFY COLUMN id INT AUTO_INCREMENT;

ALTER TABLE day2.student
  CHANGE gender sex VARCHAR(255);
DESC day2.student;

-- ***
ALTER TABLE day2.student
  ADD CONSTRAINT
  fk_student_departmentId -- alias 别名
FOREIGN KEY (departmentId)
REFERENCES day2.department (id);

ALTER TABLE day2.student
    DROP FOREIGN KEY fk_student_departmentId;