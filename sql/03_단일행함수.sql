--문자형 함수 : 대소문자 조작, 문자조작
--1.대소문자 조작함수(UPPER,LOWER,INITCAP)
SELECT employee_id, first_name, UPPER(first_name)
FROM employees;

SELECT employee_id,first_name,UPPER(first_name),LOWER(first_name),INITCAP(first_name)
FROM employees
WHERE UPPER(first_name) = 'PATRICK'; --이름의 대소문자 상관없이 결과 출력

-- SUBSTR 함수 (열 이름 , M , N )
-- M은 시작 위치,N은 출력할 길이
SELECT employee_id,first_name, 
    SUBSTR(first_name,1,3), -- 1번째 문자부터 시작해서 3개 출력
    SUBSTR(first_name,2,4), -- 2번째 문자부터 시작해서 4개 출력
    SUBSTR(first_name,2) -- 2번째 문자부터 끝까지 출력
FROM employees;

-- LENGTH 함수(문자열): 문자열의 길이를 리턴
SELECT first_name, LENGTH(first_name)
FROM employees;

--INSTR 함수(문자열,'찾는문자', M,N): 문자열에서 찾는 문자의 위치를 리턴
-- M은 검사시작위치, N은 찾는횟수
SELECT first_name,
    INSTR(first_name,'e'),
    INSTR(first_name,'e',1,2)
FROM employees;

-- LPAD, RAPD(문자열, 전체자리수 , 빈자리채우는글자 : 특정문자를 앞뒤에 넣음
SELECT employee_id,first_name,salary,
    LPAD(salary,10,'#'), 
    RPAD(salary,10,'*')
FROM employees;

-- REPLACE 함수 (문자열,'문자','바꿀문자'): 특정 문자나 문자열을 교체
SELECT employee_id,first_name,
    REPLACE(first_name,'a','*'),
    REPLACE(first_name,'en','#')
FROM employees;

-- DUAL 테이블: 임시테이블 (결과를 출력하고 싶을때 임시 테이블을 사용/ 행이 1개)
SELECT 10*20
FROM DUAL;

--TRIM 함수 : 접두어나 접미어를 잘라낸다.
SELECT TRIM('H' FROM 'HelloWorld')
FROM DUAL;

SELECT TRIM(' ' FROM ' HelloWorld ')
FROM DUAL;

SELECT LTRIM('HELLO WORLD', 'HE')
FROM DUAL;

--EX1
SELECT last_name, LOWER(last_name), UPPER(last_name),
    email, INITCAP(email)
FROM employees;

--EX2
SELECT job_id, SUBSTR(job_id, 1,2)
FROM employees;


--숫자형 함수
-- ROUND: 반올림
SELECT
    ROUND(15.734,1) AS 소수첫째,
    ROUND(14.493,0) AS 정수,
    ROUND(13.908,-1) AS "10의자리"
FROM DUAL;

--TRUNC : 버림
SELECT
    TRUNC(15.734,1) AS 소수첫째,
    TRUNC(14.493,0) AS 정수,
    TRUNC(13.908,-1) AS "10의자리"
FROM DUAL;

--ID가 짝수번째 직원들 출력. MOD
SELECT employee_id,last_name
FROM employees
WHERE MOD(employee_id,2) = 0
ORDER BY employee_id;

--EX1
SELECT salary,
    ROUND(salary/30, 0) AS 정수,
    RPAD(ROUND(salary/30, 1),5,'.0') AS 소수1,
    ROUND(salary/30, -1) AS "10의 자리"
FROM employees
ORDER BY salary DESC;


SELECT phone_number, SUBSTR(phone_number,-4,4)
FROM employees;

--날짜형 함수
SELECT
    ROUND(sysdate,'DD') 일,
    ROUND(sysdate,'MM') 월,
    ROUND(sysdate,'YYYY') 년도,
    MONTHS_BETWEEN('2017-10-10','2017-07-10') 월차이,
    ADD_MONTHS('2017-07-10',3)애드먼쓰
FROM DUAL;

--sysdate는 현재 날짜와 시간
SELECT sysdate FROM DUAL;

--날짜연산
SELECT sysdate - 1 AS 어제,
    sysdate AS 오늘,
    sysdate +1 AS 내일
FROM DUAL;

--90번 부서의 직원들의 현재까지의 근무일수
SELECT last_name, TRUNC(sysdate - hire_date) AS 근무일수
FROM employees
WHERE department_id = 90;


--EX1
SELECT last_name, sysdate, hire_date, TRUNC(ABS(MONTHS_BETWEEN(hire_date,sysdate))) AS 근무개월
FROM employees
WHERE department_id = 100
ORDER BY 근무개월 DESC;

--EX2
SELECT hire_date,
    ADD_MONTHS(hire_date,3) AS 더하기_3개월,
    ADD_MONTHS(hire_date,-3) AS 빼기_3개월
FROM employees
WHERE employee_id BETWEEN 100 AND 106;

--숫자형 함수
SELECT TO_CHAR(12345678,'999,999,999')
FROM DUAL;

SELECT TO_CHAR(123.45678,'999,999,999.99')
FROM DUAL;

SELECT TO_CHAR(12345678,'$999,999,999')
FROM DUAL;

SELECT TO_CHAR(12345678,'L999,999,999')
FROM DUAL;

SELECT TO_CHAR(123,'09999')
FROM DUAL;


--TO_CHAR 날짜를 문자로 변환
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH24:MI:SS') AS 현재시간
FROM DUAL;

SELECT TO_CHAR(sysdate, 'DDD') AS 올해몇번째일
FROM DUAL;

SELECT TO_CHAR(sysdate, 'IW') AS 올해몇번째주
FROM DUAL;

SELECT TO_CHAR(sysdate, 'MONTH') AS 달
FROM DUAL;

--EX1
SELECT employee_id, TO_CHAR(hire_date,'MM/YY') AS 입사월
FROM employees
WHERE department_id = 100
ORDER BY hire_date;

--EX2
SELECT last_name AS 이름, TO_CHAR(salary,'$999,999.99') AS 월급
FROM employees
WHERE salary > 10000
ORDER BY salary DESC;

--문자를 날짜로 변환
-- TO_DATE
SELECT TO_DATE('2011-01-01','YYYY-MM-DD')
FROM DUAL;

--문자를 숫자로 변환
-- TO_NUMBER
SELECT TO_NUMBER('100') + 100
FROM DUAL;













