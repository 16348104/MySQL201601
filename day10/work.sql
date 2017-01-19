DROP DATABASE IF EXISTS db_work;
CREATE DATABASE db_work;

DROP TABLE IF EXISTS db_work.team;
CREATE TABLE db_work.team (
  id    INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  title VARCHAR(255) NOT NULL
  COMMENT '组名称'
)
  COMMENT '组别表';


DROP TABLE IF EXISTS db_work.emp;
CREATE TABLE db_work.emp (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  name     VARCHAR(255) NOT NULL
  COMMENT '姓名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  type     INT          NOT NULL
  COMMENT '0：组员；1：组长',
  teamId   INT
  COMMENT 'FK'
)
  COMMENT '员工表';


DROP TABLE IF EXISTS db_work.log;
CREATE TABLE db_work.log (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content TEXT NOT NULL
  COMMENT '日志内容',
  time    DATE NOT NULL
  COMMENT '时间',
  empId   INT COMMENT 'FK'
)
  COMMENT '日志表';

-- FK
ALTER TABLE db_work.emp
  ADD CONSTRAINT
  fk_emp_teamId
FOREIGN KEY (teamId)
REFERENCES db_work.team (id);

ALTER TABLE db_work.log
  ADD CONSTRAINT
  fk_log_empId
FOREIGN KEY (empId)
REFERENCES db_work.emp (id);

-- 创建组
INSERT INTO db_work.team VALUES (NULL, '第一组');
INSERT INTO db_work.team VALUES (NULL, '第二组');
INSERT INTO db_work.team VALUES (NULL, '第三组');
-- 注册
INSERT INTO db_work.emp VALUES (NULL, 'a', '1', 0, 1);
INSERT INTO db_work.emp VALUES (NULL, 'b', '1', 0, 1);
INSERT INTO db_work.emp VALUES (NULL, 'c', '1', 0, 2);
INSERT INTO db_work.emp VALUES (NULL, 'd', '1', 1, 1);
INSERT INTO db_work.emp VALUES (NULL, 'e', '1', 1, 2);
-- 登录
SELECT *
FROM db_work.emp
WHERE name = 'a' AND password = '1';
-- 发布日志
INSERT INTO db_work.log VALUES (NULL, 'c11...', '2017-1-18', 1);
INSERT INTO db_work.log VALUES (NULL, 'c12...', '2017-1-19', 1);
INSERT INTO db_work.log VALUES (NULL, 'c2...', '2017-1-18', 2);
INSERT INTO db_work.log VALUES (NULL, 'c3...', '2017-1-18', 3);
INSERT INTO db_work.log VALUES (NULL, 'c4...', '2017-1-18', 4);
INSERT INTO db_work.log VALUES (NULL, 'c5...', '2017-1-18', 5);
-- 组员查询日志
SELECT
  content,
  time
FROM db_work.log
WHERE empId = 1;
-- 组长查询日志
SELECT
  e.name,
  l.content,
  l.time
FROM db_work.emp e INNER JOIN db_work.log l
    ON e.id = l.empId
WHERE e.teamId = 1;
-- 组长按条件查询日志
SELECT
  e.name,
  l.content,
  l.time
FROM db_work.emp e INNER JOIN db_work.log l
    ON e.id = l.empId
WHERE e.teamId = 1 AND (e.name = 'a' AND l.time = '2017-1-18');
SELECT
  e.name,
  l.content,
  l.time
FROM db_work.emp e INNER JOIN db_work.log l
    ON e.id = l.empId
WHERE e.teamId = 1 AND e.name = 'a';
SELECT
  e.name,
  l.content,
  l.time
FROM db_work.emp e INNER JOIN db_work.log l
    ON e.id = l.empId
WHERE e.teamId = 1 AND l.time = '2017-1-18';

-- select
SELECT *
FROM db_work.team;

SELECT *
FROM db_work.emp;

SELECT *
FROM db_work.log;