SELECT employee_id,emp_name
FROM employees
WHERE salary >5000
OR job_id = 'IT_PROG'
ORDER BY employee_id;

CREATE TABLE EX3_1(
    COL1    VARCHAR2(10),
    COL2    NUMBER,
    COL3    DATE);
    
INSERT INTO EX3_1(COL1,COL2,COL3)
VALUES('MNO',40,SYSDATE);

CREATE TABLE EX3_2(
    EMP_ID  NUMBER,
    EMP_NAME VARCHAR2(100)
    );

INSERT INTO EX3_2(EMP_ID, EMP_NAME)
SELECT e.employee_id, e.emp_name
FROM employees E
WHERE E.SALARY > 5000;

SELECT*
FROM EX3_1;

UPDATE EX3_1
SET COL1 = 50;

INSERT INTO EX3_1
VALUES('ABC', 50, NULL);

UPDATE EX3_1
SET COL3 = SYSDATE
WHERE COL3 IS NULL;

CREATE TABLE EX3_3(
    EMPLOYEE_ID NUMBER,
    BONUS_AMT   NUMBER DEFAULT 0
    );
    
--EX3_3 테이블에 EMP, SALES 테이블 사원번호로 조인,200010 부터 200012 까지 , 사원번호로 그룹 묶어서 사원번호 호출해서 입력

SELECT *
FROM SALES;

