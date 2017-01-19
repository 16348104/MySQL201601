DROP DATABASE IF EXISTS db_ip;
CREATE DATABASE db_ip;

DROP TABLE IF EXISTS db_ip.ip;
CREATE TABLE db_ip.ip (
  min VARCHAR(255) NOT NULL
  COMMENT '起始 IP',
  max VARCHAR(255) NOT NULL
  COMMENT '终止 IP',
  geo VARCHAR(255) NOT NULL
  COMMENT '地理位置'
)
  COMMENT 'IP 表';

TRUNCATE TABLE db_ip.ip;

SELECT count(*)
FROM db_ip.ip;

SELECT *
FROM db_ip.ip;

SET AUTOCOMMIT = 0;

SHOW VARIABLES LIKE '%autocommit%';

# 0.0.0.0 - 255.255.255.255
# 166.111.222.0

SELECT *
FROM db_ip.ip
WHERE inet_aton('59.66.101.202') BETWEEN inet_aton(min) AND inet_aton(max);

LOAD DATA LOCAL INFILE '/Users/mingfei/IdeaProjects/MySQL201601/day7/ip.txt'
INTO TABLE db_ip.ip
FIELDS TERMINATED BY '|';