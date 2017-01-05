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
  id           INT AUTO_INCREMENT PRIMARY KEY, -- 主关键字 主键 主码
  name         VARCHAR(255) NOT NULL,
  age          INT,
  dob          DATE UNIQUE,
  departmentId INT,
  CONSTRAINT FOREIGN KEY (departmentId) REFERENCES day2.department (id)
);

DROP TABLE day2.student;

DESC day2.student;

INSERT INTO day2.student VALUES (NULL, 'Zhangsan', 18, '1999-1-1', 1); -- null
INSERT INTO day2.student VALUES (NULL, 'Lisi', 19, '2000-1-1', 2); -- null
INSERT INTO day2.student VALUES (NULL, 'Wanger', 20, '1997-1-1', 3); -- null
INSERT INTO day2.student VALUES (NULL, 'tester', 20, '1996-1-1', 4); -- null

SELECT *
FROM day2.student;
-- ORDER BY dob DESC ;

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

SELECT *
FROM day2.department;

INSERT INTO day2.department VALUES (NULL, 'CS', '123');
INSERT INTO day2.department VALUES (NULL, 'EE', '789');
INSERT INTO day2.department VALUES (NULL, 'SS', '456');