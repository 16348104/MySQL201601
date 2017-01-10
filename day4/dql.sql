SELECT *
FROM scott.emp
WHERE ENAME LIKE '%a%a%'; -- 通配符 任意数量任意字符

SELECT *
FROM scott.emp
WHERE HIREDATE LIKE '%81%';

SELECT *
FROM scott.emp;

SELECT *
FROM scott.emp
WHERE ENAME LIKE '_c%'; -- _ 数量为1的任意字符
