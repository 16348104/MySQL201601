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
  dob DATE
);

SELECT *
FROM day2.user; -- 结果集

DROP TABLE day2.user;

UPDATE day2.user
SET height = 1.70, name = 'tester'
WHERE id = 1;

INSERT INTO day2.user VALUES (NULL, 'zhangsan', 0.755, 0.755, '1990-1-2'); -- ?
SELECT sum(height)
FROM day2.user;
DESC day2.user; -- describe DESC 描述