-- DCL DBA Database Administrator

-- root

# DROP USER dcl_user@'localhost';


SELECT *
FROM mysql.user;

CREATE USER dcl_user@'localhost'
  IDENTIFIED BY 'system';

GRANT ALL ON db_dcl.* TO dcl_user@'localhost';

REVOKE CREATE ON db_dcl.* FROM dcl_user@'localhost';

FLUSH PRIVILEGES;
