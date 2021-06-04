-- 그룹함수 사용하기
-- 평균,최대값,최소값 합계
SELECT  ROUND(AVG(salary),2) AS 평균급여, 
        MAX(salary) AS 최고급여, 
        MIN(salary) AS 최저급여, 
        SUM(salary) AS 합계
FROM employees;

SELECT  ROUND(AVG(salary),2) AS 평균급여, 
        MAX(salary) AS 최고급여, 
        MIN(salary) AS 최저급여, 
        SUM(salary) AS 합계
FROM employees
WHERE department_id = 80;

SELECT COUNT(commission_pct), COUNT(*)
FROM employees;

--GROUP BY 절 - 그룹으로 나누어서 그룹함수를 사용
SELECT department_id AS 부서명,
        COUNT(*) AS 직원수,
        ROUND(AVG(salary)) AS 평균급여
FROM employees
GROUP BY department_id
order by 부서명;


--EX1
SELECT department_id AS 부서명,
        COUNT(*) AS 사원수,
        MAX(salary) AS 최고급여,
        MAX(salary) AS 최저급여,
        SUM(salary) AS 급여합계,
        ROUND(AVG(salary)) AS 평균급여
FROM employees
GROUP BY department_id
ORDER BY 급여합계 DESC;

--EX2
SELECT department_id AS 부서번호,
        job_id AS 직업,
        manager_id AS 상사번호,
        SUM(salary) AS 월급합계,
        COUNT(*) AS 직원수
FROM employees
GROUP BY department_id, job_id, manager_id
ORDER BY 부서번호;

--EX3
SELECT  ROUND(AVG(MAX(salary))) AS 부서별최고월급평균,
        ROUND(AVG(MIN(SALARY))) AS 부서별최저월급평균
FROM employees
GROUP BY department_id;



--GROUP BY , HAVING
SELECT department_id 부서번호, COUNT(*) 직원수
FROM employees
GROUP BY department_id
HAVING COUNT(*) > 5
ORDER BY 직원수 DESC;

--EX1
SELECT job_id 직종, SUM(salary) 월급여합계
FROM employees
WHERE job_id <> 'AC_MGR'
GROUP BY job_id
HAVING AVG(salary) > 10000
ORDER BY 월급여합계 DESC;

--EX2
SELECT department_id 부서번호, ROUND(AVG(salary)) 평균급여
FROM employees
WHERE department_id <> 40
GROUP BY department_id
HAVING AVG(salary) <= 7000
ORDER BY 평균급여 DESC;

--EX3
SELECT job_id, SUM(salary) 급여총액
FROM employees
WHERE job_id NOT LIKE '%REP%'
GROUP BY job_id
HAVING SUM(salary) >= 13000
ORDER BY 급여총액 DESC;



















