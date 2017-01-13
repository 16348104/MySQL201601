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