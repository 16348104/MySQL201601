DROP DATABASE IF EXISTS db_message;
CREATE DATABASE db_message;

DROP TABLE IF EXISTS db_message.user;
CREATE TABLE db_message.user (
  id       INT                   AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  email    VARCHAR(191) NOT NULL UNIQUE
  COMMENT '邮箱',
  username VARCHAR(255) NOT NULL
  COMMENT '用户名',
  password VARCHAR(255) NOT NULL
  COMMENT '密码',
  role     VARCHAR(255) NOT NULL DEFAULT '普通用户'
  COMMENT '角色：普通用户，管理员'
)
  COMMENT '用户表';


DROP TABLE IF EXISTS db_message.message;
CREATE TABLE db_message.message (
  id      INT               AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content TEXT     NOT NULL
  COMMENT '留言内容',
  time    DATETIME NOT NULL DEFAULT now()
  COMMENT '留言时间',
  userId  INT COMMENT 'FK'
)
  COMMENT '留言表';

-- FK
ALTER TABLE db_message.message
  ADD CONSTRAINT
  fk_message_userId
FOREIGN KEY (userId)
REFERENCES db_message.user (id);
-- 用户注册
INSERT INTO db_message.user (email, username, password) VALUES ('tester1@test.com', 'tester1', '123');
INSERT INTO db_message.user (email, username, password) VALUES ('tester2@test.com', 'tester2', '123');
-- 用户留言
INSERT INTO db_message.message (content, userId) VALUES ('留言内容1。。。', 1);
INSERT INTO db_message.message (content, userId) VALUES ('留言内容2。。。', 1);
INSERT INTO db_message.message (content, userId) VALUES ('留言内容3。。。', 2);
INSERT INTO db_message.message (content, userId) VALUES ('留言内容4。。。', 2);
-- 添加管理员
INSERT INTO db_message.user VALUES (NULL, 'admin@test.com', 'admin', '123', '管理员');
-- 留言列表
SELECT
  u.username,
  m.content,
  m.time
FROM db_message.user u INNER JOIN db_message.message m
    ON u.id = m.userId
LIMIT 0, 2;
-- 删除留言
DELETE FROM db_message.message
WHERE id = 1;

-- select
SELECT *
FROM db_message.user;

SELECT *
FROM db_message.message;