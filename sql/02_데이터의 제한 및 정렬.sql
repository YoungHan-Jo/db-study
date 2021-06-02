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



















