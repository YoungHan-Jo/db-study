-- 한줄의 주석
/*
    여러줄 주석
*/

-- SELECT 문
-- 1. 테이블의 모든 행과 열을 읽어오기
SELECT *
FROM employees;


SELECT *
FROM departments;

-- 2. 특정 열만 읽어오기
SELECT department_id, department_name
FROM departments;

-- 3. 산술 연산자 사용(+,-,*,/)
SELECT employee_id, first_name, salary
FROM employees;

SELECT employee_id, first_name, salary, salary*11/10
FROM employees;

-- 4. 널(NULL) 이란?
-- 널은 입력되지 않은, 사용 불가능한 값.
-- 널은 제로(0) ' ' 과는 다름.

SELECT last_name, job_id, salary, commission_pct, commission_pct+10
FROM employees;

-- 5. 별칭 정하기 AS
SELECT last_name, last_name AS 이름
FROM employees;

-- 6. || 연결 연산자 => 열과 열을 연결해서 하나의 열로
SELECT first_name ||' '|| last_name AS FULL_NAME
FROM employees;

-- 7. DISTINCT 열의 중복을 제거
SELECT DISTINCT department_id
FROM employees;

-- 8. DESCRIBE DESC 명령어 : 테이블의 구조를 간략하게 설명
DESC employees;
DESC departments;
-- 널 NOT NULL 은 null값이 있으면 안됨 - 기본키
--유형 number(6) 6자리 숫자, varchar2(20) char20자
















