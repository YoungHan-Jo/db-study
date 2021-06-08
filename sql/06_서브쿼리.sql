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



--다중행 서브쿼리
-- 서브쿼리의 결과가 여러개의 행으로 나올때
-- 연산자를 단일행과같이 쓸 수 없다.( = , >,< 부등호 사용불가)
-- IN ANY ALL 등 여러개의 값에 쓰는 연산자 사용

-- 부서별 최저월급
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id;

-- 서브쿼리로 표현
SELECT employee_id, last_name
FROM employees
WHERE salary IN (SELECT MIN(salary)
                FROM employees
                GROUP BY department_id);


--ANY 와 ALL 연산자는 IN 과는 다르게 앞에 비교연산자가 붙음
-- ANY 연산자 : 서브쿼리 결과중 하나라도 만족하면 된다 .OR

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ANY (SELECT salary 
                    FROM employees
                    WHERE job_id ='IT_PROG')
AND job_id != 'IT_PROG';

SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE salary < ALL (SELECT salary 
                    FROM employees
                    WHERE job_id ='IT_PROG')
AND job_id != 'IT_PROG';


--EX1

SELECT employee_id, first_name, job_id, salary
FROM employees
WHERE manager_id IN (SELECT manager_id
                    FROM employees
                    WHERE department_id = 20)
AND department_id != 20;

--EX2
SELECT employee_id,last_name,job_id,SALARY
FROM employees
WHERE salary < ANY (SELECT SALARY
                    FROM employees
                    WHERE job_id = 'ST_MAN')
AND job_id != 'ST_MAN'
ORDER BY SALARY;

--EX3
SELECT employee_id,last_name,job_id,salary
FROM employees
WHERE SALARY < ALL (SELECT SALARY
                    FROM employees
                    WHERE job_id ='IT_PROG')
AND job_id != 'IT_PROG';

-- 다중열 서브쿼리 : 서브쿼리 결과가 2개이상의 열로 반환, 메인쿼리와 1:1대응
SELECT employee_id, first_name, job_id, SALARY, MANAGER_ID
FROM employees
WHERE (manager_id, JOB_ID) IN (SELECT MANAGER_ID, JOB_ID
                                FROM employees
                                WHERE first_name = 'Bruce')
AND first_name != 'Bruce';

--각 부서별로 최소급여
SELECT department_id, employee_id,first_name,salary
FROM employees
WHERE (department_id, SALARY) IN (SELECT department_id, MIN(salary)
                                    FROM employees
                                    GROUP BY department_id)
ORDER BY department_id;

--EX

SELECT FIRST_NAME, JOB_ID, SALARY, DEPARTMENT_ID
FROM employees
WHERE (JOB_ID, SALARY) IN (SELECT JOB_ID, MIN(SALARY)
                            FROM employees
                            GROUP BY JOB_ID)
ORDER BY SALARY DESC;









































