--JOIN : 두개의 테이블을 합쳐서 원하는 데이터를 출력
SELECT e.employee_id 직원번호, e.last_name 성, 
        e.department_id 부서번호, d.department_name 부서명
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3개 테이블 조인
SELECT DISTINCT d.department_id, d.department_name, l.city, COUNT(*)
FROM employees e
    JOIN departments d
        ON e.department_id = d.department_id
    JOIN locations L
        ON d.location_id = l.location_id
ORDER BY d.department_id;   


--EX1
SELECT d.department_name 부서명 , l.city 도시명, c.country_name 국가명
FROM locations L
    JOIN countries C
        ON l.country_id=c.country_id
    JOIN departments D
        ON l.location_id = d.location_id
WHERE l.city IN('Seattle','London')
AND c.country_name LIKE 'United%';

--자체조인
SELECT e.last_name 직원이름, m.last_name 매니저이름
FROM employees E
    JOIN employees M
    ON e.manager_id = M.employee_id
