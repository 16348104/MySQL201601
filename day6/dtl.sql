SELECT *
FROM scott.emp;

-- DTL Transaction
START TRANSACTION; -- 事务\ [træn'zækʃ\(ə\)n\;\ trɑːn-\;\ -'sæk-]

DELETE FROM scott.emp;
INSERT INTO scott.emp (EMPNO) VALUES (1);
UPDATE scott.emp
SET ENAME = 'Zhangsan'
WHERE EMPNO = 1;

UPDATE scott.emp
SET ENAME = 'new_scott'
WHERE ENAME = 'scott';

UPDATE scott.emp
SET SAL = SAL * 1.2;

UPDATE scott.emp
SET ENAME = 'scott'
WHERE ENAME = 'new_scott';

UPDATE scott.emp
SET SAL = SAL / 1.2;

CREATE TABLE scott.temp (
  id INT
); -- DDL create drop alter 结束一次事务 commit 隐式结束

ROLLBACK; -- 回滚\ ['rəʊlbæk] rollback 结束一次事务 显式结束
COMMIT; -- 提交\ [kə'mɪt] commit 结束一次事务 显示结束

SELECT *
FROM scott.emp;
START TRANSACTION;
DELETE FROM scott.emp;
TRUNCATE TABLE scott.emp; -- 截断\ [trʌŋ'keɪt\;\ 'trʌŋ-]
ROLLBACK;

/*
Zhangsan             Lisi
1500                 0
500                  1000


一次事务
DML insert update delete
1. update db set money = money - 1000 where id = 12345;
2. update db set money = money + 1000 where id = 67890;

A:
1. right
2. wrong

B:
1. wrong
2. right

C: 全部完成 commit
1. right
2. right

D: 全部不完成 rollback
1. wrong
2. wrong

 */