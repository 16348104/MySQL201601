/*
      k
a     b      c
d    e f
g      h

*/
DROP DATABASE IF EXISTS db_news;
CREATE DATABASE db_news;

-- table news
DROP TABLE IF EXISTS db_news.news;
CREATE TABLE db_news.news (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content MEDIUMTEXT NOT NULL
  COMMENT '内容'
)
  COMMENT '新闻表';

-- table comment
DROP TABLE IF EXISTS db_news.comment;
CREATE TABLE db_news.comment (
  id        INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  content   TEXT NOT NULL
  COMMENT '内容',
  newsId    INT COMMENT 'FK',
  commentId INT COMMENT 'FK'
)
  COMMENT '评论表';

-- FK
ALTER TABLE db_news.comment
  ADD CONSTRAINT
  fk_comment_newsId
FOREIGN KEY (newsId)
REFERENCES db_news.news (id);

ALTER TABLE db_news.comment
  ADD CONSTRAINT
  fk_comment_commentId
FOREIGN KEY (commentId)
REFERENCES db_news.comment (id);

INSERT INTO db_news.news VALUES (NULL, '新闻。。。');

INSERT INTO db_news.comment VALUES (NULL, 'c1...', 1, NULL);
INSERT INTO db_news.comment VALUES (NULL, 'c2...', NULL, 1);
INSERT INTO db_news.comment VALUES (NULL, 'c3...', NULL, 2);

SELECT *
FROM db_news.news;

SELECT *
FROM db_news.comment;