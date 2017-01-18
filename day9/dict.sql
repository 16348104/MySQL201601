DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.word;
CREATE TABLE db_dict.word (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  english    VARCHAR(255) NOT NULL
  COMMENT '英文',
  chinese    VARCHAR(255) NOT NULL
  COMMENT '中文',
  phoneticUk VARCHAR(255) COMMENT '英语音标',
  phoneticUs VARCHAR(255) COMMENT '美语音标',
  pos        VARCHAR(255) COMMENT '词性',
  detail     TEXT COMMENT '详尽释义',
  setence    TEXT COMMENT '例句'
)
  COMMENT '单词表';

-- insert
INSERT INTO db_dict.word VALUES (NULL, 'apple', '苹果；珍宝；家伙', '[''æpl]	', '[''æpl]	', 'n.', '1.苹果2.苹果树', 'My uncle has an apple orchard.
我叔叔拥有一个苹果园。');

-- select
SELECT *
FROM db_dict.word
WHERE english = 'apple';
