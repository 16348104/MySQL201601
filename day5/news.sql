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
INSERT INTO db_news.comment VALUES (NULL, 'c4...', NULL, 3);
INSERT INTO db_news.comment VALUES (NULL, 'c5...', NULL, 4);

SELECT *
FROM db_news.news;

SELECT *
FROM db_news.comment;

SELECT
  id,
  content,
  commentId
FROM (SELECT *
      FROM db_news.comment
      ORDER BY commentId, id) comment_stored,
  (SELECT @pv := '1') initialisation
WHERE find_in_set(commentId, @pv) > 0
      AND @pv := concat(@pv, ',', id);

CREATE PROCEDURE get_tree(IN id INT)
  BEGIN
    DECLARE child_id INT;
    DECLARE prev_id INT;
    SET prev_id = id;
    SET child_id = 0;
    SELECT db_news.comment.commentId
    INTO child_id
    FROM db_news.comment
    WHERE comment.id = id;
    CREATE TEMPORARY TABLE IF NOT EXISTS temp_table AS (SELECT *
                                                        FROM db_news.comment
                                                        WHERE 1 = 0);
    TRUNCATE TABLE temp_table;
    WHILE child_id <> 0 DO
      INSERT INTO temp_table SELECT *
                             FROM db_news.comment
                             WHERE db_news.comment.id = prev_id;
      SET prev_id = child_id;
      SET child_id = 0;
      SELECT db_news.comment.commentId
      INTO child_id
      FROM db_news.comment
      WHERE db_news.comment.id = prev_id;
    END WHILE;
    SELECT *
    FROM temp_table;
  END;

CALL get_tree(5);

