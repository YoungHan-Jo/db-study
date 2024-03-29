SELECT*
FROM EMP;

SELECT*
FROM EMP
WHERE DEPTNO = 30;

SELECT*
FROM EMP
WHERE DEPTNO = 30
AND JOB = 'SALESMAN';

SELECT*
FROM EMP
WHERE EMPNO = 7499
AND DEPTNO = 30;

SELECT*
FROM EMP
WHERE DEPTNO = 20
OR JOB = 'SALESMAN';

SELECT *
FROM EMP
WHERE SAL >= 2500
AND JOB = 'ANALYST';

SELECT*
FROM EMP
WHERE SAL != 3000;

SELECT*
FROM EMP
WHERE NOT SAL = 3000;

SELECT *
FROM EMP
WHERE JOB IN ('MANAGER','SALESMAN','CLERK');

SELECT *
FROM EMP
WHERE JOB NOT IN ('MANAGER','SALESMAN','CLERK');

SELECT *
FROM EMP
WHERE DEPTNO IN(10,20)
ORDER BY DEPTNO;

SELECT *
FROM EMP
WHERE SAL BETWEEN 2000 AND 3000;

SELECT *
FROM EMP
WHERE SAL NOT BETWEEN 2000 AND 3000;

SELECT *
FROM EMP
WHERE ENAME LIKE 'S%';

SELECT *
FROM EMP
WHERE ENAME LIKE '_L%';

SELECT*
FROM EMP
WHERE ENAME LIKE '%AM%';

SELECT*
FROM EMP
WHERE COMM IS NOT NULL;




















