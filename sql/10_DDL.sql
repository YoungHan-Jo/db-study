--DDL - 데이터 정의어

-- 테이블 만들기 CREATE
CREATE TABLE test (
    char_col    VARCHAR2(4),
    number_ex   NUMBER(2),
    start_date  DATE DEFAULT SYSDATE
    );
    
DESC TEST;
    
    
SELECT*FROM test;



INSERT INTO TEST VALUES('ASDF','12','2021-06-09');

UPDATE TEST
SET START_DATE = '2021-06-08'
WHERE CHAR_COL = 'ASDF';

-- DEFAULT
INSERT INTO TEST(char_col,number_ex) VALUES('HONG','13');

--DROP 삭제
DROP TABLE TEST;

ROLLBACK; -- 삭제하면 롤백 안먹힘, DDL은 자동 커밋됨.


--EX
CREATE TABLE sample_product(
    product_id      NUMBER,
    product_name    VARCHAR2(20),
    menu_date       DATE);
    
    
    
DESC sample_product;

DROP TABLE sample_product;
    
    
-- TREATE TABLE AS : AS 다음의 서브쿼리 결과로 테이블을 만듦.
CREATE TABLE EMP_TEMP
AS
SELECT *
FROM employees
WHERE 1 != 1; -- 항상 거짓인 조건 ( 행을 가져오지 않음) -> 테이블의 구조만 복사

SELECT* FROM EMP_TEMP;
    

-- 80번 부서    
CREATE TABLE EMP80
AS
SELECT employee_id,last_name,salary*12 ANNUAL, hire_date
FROM employees
WHERE department_id = 80;
    
SELECT*FROM EMP80;
DESC EMP80;

-- 30번 부서
CREATE TABLE EMP30(직원번호,풀네임,월급,고용일자)
AS
SELECT employee_id,last_name||' '||first_name,salary,hire_date
FROM employees
WHERE department_id = 30;

SELECT*FROM EMP30;


--EX

CREATE TABLE stmans(ID,JOB,SAL)
AS
SELECT employee_id,job_id,salary
FROM employees
WHERE job_id = 'ST_MAN'
ORDER BY salary DESC;


SELECT* FROM stmans;

DROP TABLE STMANS;












