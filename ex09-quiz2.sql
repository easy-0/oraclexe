-- 1. 각 직원의 성(last_name)과 해당 직원의 매니저인 직원의 성(last_name) 조회하기
SELECT e.last_name AS employees, mgr.last_name AS manager
FROM employees e 
LEFT OUTER JOIN employees mgr
ON e.manager_id = mgr.employee_id;

SELECT last_name, employee_id, manager_id FROM employees;

-- 2. 각 직원의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3. 각 부서의 이름(department_name)과 해당 부서의 평균 급여(avg_salary) 조회하기
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 4. 각 부서의 이름(department_name)과 해당 부서의 최대 급여(max_salary) 조회하기
SELECT d.department_name, MAX(e.salary) AS max_salary
FROM departments d JOIN employees e
ON d.department_id = e.employee_id
GROUP BY d.department_name;

-- 5. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 최소 급여(min_salary) 조회하기 ???
SELECT e.last_name, d.department_name, e.salary AS min_salary
FROM departments d LEFT OUTER JOIN employees e
ON e.department_id = d.department_id
WHERE e.salary = (SELECT MIN(salary) 
                    FROM employees
                    WHERE e.department_id = department_id
                    GROUP BY department_id)
;

SELECT department_id, MIN(salary) FROM employees GROUP BY department_id;
select * FROM departments;
-- 6. 각 부서의 이름(department_name)과 해당 부서에 속한 직원 중 가장 높은 급여(highest_salary) 조회하기
SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY department_name;

-- 7. 각 직원의 성(last_name)과 해당 직원의 매니저의 성(last_name) 및 부서 이름(department_name) 조회하기
SELECT emp.last_name AS emp, mgr.last_name AS mgr, d.department_name AS emp_department
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id
JOIN departments d
ON emp.department_id = d.department_id;

-- 8. 각 직원의 성(last_name)과 해당 직원이 속한 부서의 매니저의 성(last_name) 조회하기
SELECT emp.last_name AS emp, mgr.last_name AS mgr
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id
JOIN departments d 
ON d.manager_id = emp.manager_id;

-- 9. 각 직원의 성(last_name)과 해당 직원의 보고 상사가 있는 경우 보고 상사의 성(last_name) 조회하기
SELECT emp.last_name AS emp, mgr.last_name AS mgr
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

-- 10. 직원들 중에서 급여(salary)가 10000 이상인 직원들의 성(last_name)과 해당 직원의 부서 이름(department_name) 조회하기
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary>=10000;

/*
11.
각 부서의 이름(department_name), 해당 부서의 매니저의 ID(manager_id)와 매니저의 성(last_name),
직원의 ID(employee_id), 직원의 성(last_name), 그리고 해당 직원의 급여(salary) 조회하기.
직원들의 급여(salary)가 해당 부서의 평균 급여보다 높은 직원들을 조회합니다.
결과는 부서 이름과 직원의 급여가 높은 순으로 정렬됩니다.
*/

SELECT d.department_name, d.manager_id, m.last_name AS mgr_name, e.employee_id, e.last_name AS emp_name, e.salary
FROM departments d JOIN employees m
ON d.manager_id = m.employee_id
JOIN employees e
ON e.manager_id = m.employee_id
WHERE e.salary > (SELECT AVG(salary)
                    FROM employees
                    WHERE e.department_id = department_id
                    group by department_id)
ORDER BY d.department_name, e.salary DESC;


/*
select * from employees where employee_id = '146';
select department_name from departments where department_id = '80';

select d.department_name, AVG(e.salary)
from employees e join departments d 
on e.department_id = d.department_id 
where d.department_id = '80'
group by d.department_name;
*/