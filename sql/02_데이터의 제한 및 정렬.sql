--ex1
SELECT *
FROM employees
WHERE employee_id = 100;

--ex2
SELECT *
FROM employees
WHERE first_name = 'David';

--ex3
SELECT *
FROM employees
WHERE employee_id <=105;

--ex4
SELECT*
FROM job_history
WHERE start_date >= '2006-03-03';

--ex5
SELECT *
FROM departments
WHERE location_id <> 1700;


-- �������� and or not

SELECT last_name, department_id, salary
FROM employees
WHERE department_id = 60
OR department_id = 80
AND salary > 10000;


--ex1
SELECT *
FROM employees
WHERE salary > 4000
AND job_id = 'IT_PROG';

--ex2
SELECT *
FROM employees
WHERE salary > 4000
AND( job_id = 'IT_PROG' OR job_id = 'FI_ACCOUNT');

-- IN ������ (OR�� ���)
SELECT *
FROM employees
WHERE salary = 4000 OR salary= 3000 OR salary= 2700;

SELECT *
FROM employees
WHERE salary IN(4000,3000,2700);

SELECT *
FROM employees
WHERE salary NOT IN(4000,3000,2700);

--EX1

SELECT *
FROM employees
WHERE salary IN (10000, 17000, 24000);

SELECT *
FROM employees
WHERE department_id NOT IN (30, 50, 80, 100, 110);

--BETWEEN ������ (AND ���)
SELECT *
FROM employees
WHERE salary >=9000 AND salary <= 10000;

SELECT *
FROM employees
WHERE salary BETWEEN 9000 AND 10000;

--EX1
SELECT *
FROM employees
WHERE salary BETWEEN 10000 AND 20000;

--EX2
SELECT *
FROM employees
WHERE hire_date BETWEEN '2004-01-01' AND '2004-12-30';

--EX3
SELECT *
FROM employees
WHERE salary NOT BETWEEN 7000 AND 17000;


-- LIKE 연산자 %(모든문자) , _ (한글자)
SELECT *
FROM employees
WHERE last_name LIKE 'B%'; -- 대문자B로 시작하는 이름

SELECT *
FROM employees
WHERE last_name LIKE '%g%'; -- 이름에 g가 있는경우

SELECT *
FROM employees
WHERE last_name LIKE '%y'; -- 이름의 마지막에 y가 올경우

SELECT *
FROM employees
WHERE first_name LIKE 'A___'; -- 갯수가 맞아야함.

-- EX1
SELECT*
FROM employees
WHERE job_id LIKE '%AD%';

-- EX2
SELECT*
FROM employees
WHERE job_id LIKE '%AD___';

--EX3
SELECT*
FROM employees
WHERE phone_number LIKE '%1234';

--EX4
SELECT*
FROM employees
WHERE phone_number NOT LIKE '%3%'
AND phone_number LIKE '%9';

--EX5
SELECT*
FROM employees
WHERE job_id LIKE '%MGR%'
OR job_id LIKE '%ASST%';

-- 널 연산자 IS NULL, IS NOT NULL
SELECT*
FROM employees
WHERE commission_pct IS NULL;

SELECT*
FROM employees
WHERE commission_pct IS NOT NULL;

--EX1
SELECT*
FROM employees
WHERE manager_id IS NULL;

--ORDER BY 정렬
SELECT*
FROM employees
ORDER BY hire_date ASC; -- 오름차순 생략가능

SELECT*
FROM employees
ORDER BY hire_date DESC; -- 내림차순

SELECT*
FROM employees
ORDER BY last_name DESC; -- 이름 알파벳 내림차순

-- ORDER BY 뒤에 열이 2개 이상일때 (여러 열을 정렬)
SELECT department_id, employee_id, first_name,last_name
FROM employees
ORDER BY department_id,employee_id; --처음 쓴거 먼저 정렬하고 같으면 두번째꺼로 정렬

--계산한 열로 정렬
SELECT department_id, last_name, salary*12 AS 연봉
FROM employees
ORDER BY 연봉 DESC; -- 별칭으로도 정렬가능.

--EX1
SELECT employee_id, first_name, last_name
FROM employees
ORDER BY employee_id DESC;

--EX2
SELECT*
FROM employees
WHERE job_id LIKE '%CLERK%'
ORDER BY SALARY DESC;

--EX3
SELECT*
FROM employees
WHERE employee_id BETWEEN 120 AND 150
ORDER BY department_id DESC, salary DESC;































