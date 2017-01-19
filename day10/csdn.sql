DROP DATABASE IF EXISTS db_csdn;
CREATE DATABASE db_csdn;

DROP TABLE IF EXISTS db_csdn.user_new;
CREATE TABLE db_csdn.user_new (
  id       INT AUTO_INCREMENT PRIMARY KEY
  COMMENT 'PK',
  username VARCHAR(191) COMMENT '用户名',
  password VARCHAR(191) COMMENT '密码',
  email    VARCHAR(191) COMMENT '邮箱'
)
  COMMENT '用户表';

ALTER TABLE db_csdn.user_new
  MODIFY COLUMN username VARCHAR(191);
DESC db_csdn.user_new;

TRUNCATE TABLE db_csdn.user_new;

LOAD DATA LOCAL INFILE '/Users/mingfei/Desktop/csdn'
INTO TABLE db_csdn.user_new
FIELDS TERMINATED BY ' # ' (username, password, email)
SET id = NULL;

SELECT count(*)
FROM db_csdn.user_new;

SHOW TABLE STATUS FROM db_csdn;

SELECT *
FROM db_csdn.user_new;

/*

-- 处理错误的数据

SELECT *
FROM db_csdn.user_new
WHERE user_new.email IS NULL; -- 295

SELECT *
FROM db_csdn.user_new
WHERE user_new.email LIKE ' # %'; -- 295

UPDATE db_csdn.user_new
SET email = substr(password, instr(password, ' # '))
WHERE email IS NULL;

UPDATE db_csdn.user_new
SET password = replace(password, email, '')
WHERE user_new.email LIKE ' # %';

UPDATE db_csdn.user_new
SET email = substr(email, 3+1)
WHERE email LIKE ' # %';


SELECT substr(password, instr(password, ' # '))
FROM db_csdn.user_new
WHERE id = 31521;

SELECT replace(password, email, '')
FROM db_csdn.user_new
WHERE id = 31521;

SELECT email, substr(email, 3+1)
FROM db_csdn.user_new
WHERE email LIKE ' # %';

*/

SELECT count(*)
FROM db_csdn.user_new
WHERE email NOT REGEXP '^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,4}'; -- 1991


SELECT *
FROM db_csdn.user_new
ORDER BY id DESC;
# 各列值的快速模糊查询

# 排名前十的密码
SELECT
  password,
  count(*)
FROM db_csdn.user_new
GROUP BY password
ORDER BY count(*) DESC
LIMIT 0, 10; -- time: 1m 11s

CREATE INDEX ind_password
  ON db_csdn.user_new (password);

SHOW INDEX FROM db_csdn.user_new;
# 排名前十的邮箱 123@qq.com 456@126.com
CREATE INDEX ind_email
  ON db_csdn.user_new (email);

SELECT *
FROM db_csdn.user_new;

SELECT
  substr(email, instr(email, '@') + 1),
  count(*)
FROM db_csdn.user_new
GROUP BY 1
ORDER BY count(*) DESC
LIMIT 0, 10;
# 用户名和邮箱名相同的数据
CREATE INDEX ind_username
  ON db_csdn.user_new (username);

SELECT * -- 撞库
FROM db_csdn.user_new
WHERE username = substring_index(email, '@', 1); -- asdf@asdf.com
# 密码可能是生日的数据
SELECT count(*)
FROM db_csdn.user_new
WHERE password REGEXP '^19[6-9]{1}[0-9]{1}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$'; -- 19990
# 哪一年出生的用户最多
SELECT
  substr(password, 1, 3),
  count(*)
FROM db_csdn.user_new
WHERE password REGEXP '^19[6-9]{1}[0-9]{1}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$'
GROUP BY 1
ORDER BY 2 DESC;
# 哪个星座的用户最多
-- 白羊座 3月21日~4月19日
SELECT count(*)
FROM db_csdn.user_new
WHERE password REGEXP '^19[6-9]{1}[0-9]{1}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$'
      AND substr(password, 6) BETWEEN 420 AND 520;
# 密码是 QQ 号的
SELECT count(*)
FROM db_csdn.user_new
WHERE password = substring_index(email, '@', 1) AND substr(email, instr(email, '@') + 1) LIKE 'qq%';
# 密码是手机号的
SELECT count(*)
FROM db_csdn.user_new
WHERE password REGEXP '^1(3[0-9]|4[57]|5[0-35-9]|7[0135678]|8[0-9])[0-9]{8}$';
# 哪个运营商的用户最多
# 弱密码用户数据
#   短密码
#   纯数字密码
#   纯字母密码
SELECT *
FROM db_csdn.user_new
WHERE length(password) < 5 OR password REGEXP '^[0-9]+$' OR password REGEXP '^[a-zA-Z]+$';
# 强密码用户数据
#   长密码
#   字母和数字
#   含特殊符号
SELECT password
FROM db_csdn.user_new
WHERE length(password) = 20;
