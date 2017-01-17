DROP DATABASE IF EXISTS db_user;
CREATE DATABASE db_user;

DROP TABLE IF EXISTS db_user.user;
CREATE TABLE db_user.user (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '帐号',
  password VARCHAR(255) NOT NULL
  COMMENT '密码'
)
  COMMENT '用户表';

DROP TABLE IF EXISTS db_user.message;
CREATE TABLE db_user.message (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content TEXT NOT NULL
  COMMENT '',
  userId  INT COMMENT 'FK'
)
  COMMENT '留言表';

-- FK
ALTER TABLE db_user.message
  ADD CONSTRAINT
  fk_message_userId
FOREIGN KEY (userId)
REFERENCES db_user.user (id);

-- 注册
INSERT INTO db_user.user VALUES (NULL, 'tester@test.com', 'tester', '123');
-- 登录
SELECT *
FROM db_user.user
WHERE email = 'tester@test.com' AND password = '123';
-- 注销
-- 留言
INSERT INTO db_user.message VALUES (NULL, '...', 1);


SELECT *
FROM db_user.user;

SELECT *
FROM db_user.message;


