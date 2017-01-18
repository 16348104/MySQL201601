DROP DATABASE IF EXISTS db_dict;
CREATE DATABASE db_dict;

DROP TABLE IF EXISTS db_dict.word;
CREATE TABLE db_dict.word (
  id         INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  english    VARCHAR(255) NOT NULL
  COMMENT '英文',
  phoneticUk VARCHAR(255) COMMENT '英语音标',
  phoneticUs VARCHAR(255) COMMENT '美语音标'
)
  COMMENT '单词表';


DROP TABLE IF EXISTS db_dict.pos;
CREATE TABLE db_dict.pos (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  pos    VARCHAR(255) COMMENT '词性',
  wordId INT COMMENT 'FK'
)
  COMMENT '词性表';


DROP TABLE IF EXISTS db_dict.concise;
CREATE TABLE db_dict.concise (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  chinese VARCHAR(255) NOT NULL
  COMMENT '中文',
  posId   INT COMMENT 'FK'
)
  COMMENT '简明释义表';


DROP TABLE IF EXISTS db_dict.detail;
CREATE TABLE db_dict.detail (
  id     INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  detail TEXT COMMENT '详尽释义',
  posId  INT COMMENT 'FK'
)
  COMMENT '详尽释义';


DROP TABLE IF EXISTS db_dict.sentence;
CREATE TABLE db_dict.sentence (
  id      INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  english TEXT COMMENT '例句英文',
  chinese TEXT COMMENT '例句中文',
  posId   INT COMMENT 'FK'
)
  COMMENT ' 例句表';

-- FK
ALTER TABLE db_dict.pos
  ADD CONSTRAINT
  fk_pos_wordId
FOREIGN KEY (wordId)
REFERENCES db_dict.word (id);

ALTER TABLE db_dict.concise
  ADD CONSTRAINT
  fk_concise_posId
FOREIGN KEY (posId)
REFERENCES db_dict.pos (id);

ALTER TABLE db_dict.detail
  ADD CONSTRAINT
  fk_detail_posId
FOREIGN KEY (posId)
REFERENCES db_dict.pos (id);

ALTER TABLE db_dict.sentence
  ADD CONSTRAINT
  fk_sentence_posId
FOREIGN KEY (posId)
REFERENCES db_dict.pos (id);

-- insert
INSERT INTO db_dict.word VALUES (NULL, 'test', '[test]', '[test]');

INSERT INTO db_dict.pos VALUES (NULL, 'n.', 1);
INSERT INTO db_dict.pos VALUES (NULL, 'vt.', 1);

INSERT INTO db_dict.concise VALUES (NULL, '考验；试验；测试', 1);
INSERT INTO db_dict.concise VALUES (NULL, '试验；测试；接受测验', 2);

INSERT INTO db_dict.detail VALUES (NULL, '检验，化验，试验', 1);
INSERT INTO db_dict.detail VALUES (NULL, '考验', 1);
INSERT INTO db_dict.detail VALUES (NULL, '测验，小考，考试，测试', 1);
INSERT INTO db_dict.detail VALUES (NULL, '试验，测验，进行测验，测试', 2);
INSERT INTO db_dict.detail VALUES (NULL, '考验', 2);
INSERT INTO db_dict.detail VALUES (NULL, '受试验，受测验', 2);

INSERT INTO db_dict.sentence VALUES
  (NULL, 'We achieved within seven months an agreement that has stood the test of time.', '我们在七个月内完成一项协议,而且经受住了时间的考验。',
   1);
INSERT INTO db_dict.sentence VALUES (NULL, 'Our test flight was to discover the bugs in the new plane.', '试验飞行是为了发现新飞机有何毛病。
', 1);
INSERT INTO db_dict.sentence VALUES (NULL, 'By doing so, you can test the strength of steel.', '这样做,你可以试验一下钢的强度。', 2);
INSERT INTO db_dict.sentence VALUES
  (NULL, 'Listening to his continuous stream of empty chatter really tested my patience.', '听他那没完没了的连篇空话对我的耐心真是一大考验。',
   2);

-- select
SELECT *
FROM db_dict.word;

SELECT *
FROM db_dict.pos;

SELECT *
FROM db_dict.concise;

SELECT *
FROM db_dict.detail;

SELECT *
FROM db_dict.sentence;

SELECT *
FROM db_dict.word w INNER JOIN db_dict.pos p
  INNER JOIN db_dict.concise c
  INNER JOIN db_dict.detail d
  INNER JOIN db_dict.sentence s
    ON w.id = p.wordId AND p.id = c.posId AND p.id = d.posId AND p.id = s.posId;