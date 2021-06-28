DESC EMP;

SELECT ENAME, SAL, SAL*12+COMM AS ANNSAL, COMM
FROM EMP;

SELECT *
FROM EMP
ORDER BY DEPTNO, SAL DESC;

SELECT DISTINCT JOB
FROM EMP;

SELECT EMPNO AS EMPLOYEE_NO, ENAME AS EMPLOYEE_NAME,
        MGR AS MANAGER, SAL AS SALARY, COMM AS COMMISSION,
        DEPTNO AS DEPARTMENT_NO
FROM EMP
ORDER BY DEPTNO DESC, ENAME;