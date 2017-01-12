-- DCL DBA Database Administrator

-- root

DROP DATABASE IF EXISTS db_dcl;
CREATE DATABASE db_dcl;

CREATE USER dcl_user
  IDENTIFIED BY 'system';

UPDATE mysql.user
SET host = 'localhost'
WHERE user = 'dcl_user';

GRANT ALL ON db_dcl.* TO dcl_user;

SHOW GRANTS FOR dcl_user; -- grant vt.\ 授予；允许；承认

SELECT *
FROM mysql.user;

# REVOKE ALL ON db_dcl.* FROM dcl_user@localhost;

FLUSH PRIVILEGES;
