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
  id   INT(1),
  name VARCHAR(255)
);

SELECT *
FROM day2.user; -- 结果集

DROP TABLE day2.user;

INSERT INTO day2.user VALUES (111, 'asdfasdf');

DESC day2.user; -- describe DESC 描述