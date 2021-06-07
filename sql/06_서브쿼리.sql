--서브쿼리 : 서브쿼리는 SELECT문(메인쿼리)에 포함되어 있는 또 하나의 별도 SELECT문이다.

--단일행서브쿼리 : 서브쿼리에서 오직 하나의 행만 반환해야함, 그리고 나서 연산자 사용 가능

-- Popp 이름의 직원보다 고용일자가 큰 직원들을 출력하라
SELECT last_name 이름,hire_date 고용일자
FROM employees
WHERE hire_date > (SELECT hire_date
                    FROM employees
                    WHERE last_name = 'Popp');
                    
-- 여러개의 서브쿼리 사용
SELECT last_name 이름, job_id 직종, salary 급여
FROM employees
WHERE job_id = (SELECT job_id
                FROM employees
                WHERE LAST_NAME ='Chen')
AND salary > (SELECT salary
                FROM employees
                WHERE LAST_NAME = 'Chen');
                
-- 집계(그룹)함수를 사용한 서브쿼리
SELECT *
FROM employees
WHERE SALARY = (SELECT MIN(SALARY)
                FROM employees);
                
                
--EX
SELECT LAST_NAME, SALARY
FROM employees
WHERE SALARY > (SELECT SALARY
                FROM employees
                WHERE LAST_NAME = 'Abel');
                
--EX
SELECT employee_id 직원번호, last_name 이름, department_id 부서번호, SALARY 급여
FROM employees
WHERE department_ID = (SELECT department_id
                        FROM employees
                        WHERE last_name = 'Bull'
                        )
AND SALARY > (SELECT SALARY
                FROM employees
                WHERE last_name = 'Bull');

--EX
SELECT last_name,salary,manager_id
FROM employees
WHERE manager_id = (SELECT employee_id
                    FROM employees
                    WHERE last_name = 'Russell');

--EX
SELECT *
FROM employees
WHERE job_id = (SELECT job_id
                FROM jobs
                WHERE job_title='Stock Manager');















