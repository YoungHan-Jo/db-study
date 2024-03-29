SELECT *
FROM EMP
WHERE SAL > (SELECT SAL
                FROM EMP
                WHERE ENAME = 'JONES');
                
SELECT *
FROM EMP E
    JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
WHERE D.DEPTNO = 20
AND E.SAL > (SELECT AVG(SAL)
                FROM EMP);

SELECT*
FROM EMP E
    JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
WHERE D.DEPTNO = 20
AND SAL <= (SELECT AVG(SAL)
            FROM EMP);
            
SELECT *
FROM EMP
WHERE SAL IN (SELECT MAX(SAL)
                FROM EMP
                GROUP BY DEPTNO);
                
WITH
E10 AS (SELECT * FROM EMP WHERE DEPTNO = 10)
SELECT *
FROM E10
    JOIN DEPT D
    ON E10.DEPTNO = D.DEPTNO;

SELECT EMPNO,ENAME,JOB,SAL,
        (SELECT S.GRADE
            FROM SALGRADE S
            WHERE E.SAL BETWEEN S.LOSAL AND S.HISAL) AS GRADE,
        DEPTNO,
        (SELECT D.DNAME
            FROM DEPT D
            WHERE D.DEPTNO = E.DEPTNO) AS DNAME
FROM EMP E;

--Q1
SELECT*
FROM EMP
WHERE JOB = (SELECT JOB
            FROM EMP
            WHERE ENAME = 'ALLEN');
            
--Q2
SELECT E.EMPNO, E.ENAME, D.DNAME, E.HIREDATE, D.LOC, E.SAL, S.GRADE
FROM EMP E
    JOIN DEPT D
    ON E.DEPTNO = D.DEPTNO
    JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE SAL > (SELECT AVG(SAL)
                FROM EMP)
ORDER BY SAL DESC, EMPNO;

--Q3
SELECT *
FROM EMP
WHERE DEPTNO = 10
AND JOB NOT IN(SELECT JOB
            FROM EMP
            WHERE DEPTNO = 30
            GROUP BY JOB);
            
--Q4

SELECT EMPNO, ENAME, SAL, S.GRADE
FROM EMP E
    JOIN SALGRADE S
    ON E.SAL BETWEEN S.LOSAL AND S.HISAL
WHERE SAL > (SELECT MAX(SAL)
                FROM EMP
                WHERE JOB = 'SALESMAN')
ORDER BY E.EMPNO;








