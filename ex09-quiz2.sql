-- 1. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ������ ��(last_name) ��ȸ�ϱ�
SELECT e.last_name AS employees, mgr.last_name AS manager
FROM employees e 
LEFT OUTER JOIN employees mgr
ON e.manager_id = mgr.employee_id;

SELECT last_name, employee_id, manager_id FROM employees;

-- 2. �� ������ ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id;

-- 3. �� �μ��� �̸�(department_name)�� �ش� �μ��� ��� �޿�(avg_salary) ��ȸ�ϱ�
SELECT d.department_name, AVG(e.salary) AS avg_salary
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY d.department_name;

-- 4. �� �μ��� �̸�(department_name)�� �ش� �μ��� �ִ� �޿�(max_salary) ��ȸ�ϱ�
SELECT d.department_name, MAX(e.salary) AS max_salary
FROM departments d JOIN employees e
ON d.department_id = e.employee_id
GROUP BY d.department_name;

-- 5. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �ּ� �޿�(min_salary) ��ȸ�ϱ� ???
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
-- 6. �� �μ��� �̸�(department_name)�� �ش� �μ��� ���� ���� �� ���� ���� �޿�(highest_salary) ��ȸ�ϱ�
SELECT d.department_name, MAX(e.salary) AS highest_salary
FROM departments d JOIN employees e
ON d.department_id = e.department_id
GROUP BY department_name;

-- 7. �� ������ ��(last_name)�� �ش� ������ �Ŵ����� ��(last_name) �� �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT emp.last_name AS emp, mgr.last_name AS mgr, d.department_name AS emp_department
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id
JOIN departments d
ON emp.department_id = d.department_id;

-- 8. �� ������ ��(last_name)�� �ش� ������ ���� �μ��� �Ŵ����� ��(last_name) ��ȸ�ϱ�
SELECT emp.last_name AS emp, mgr.last_name AS mgr
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id
JOIN departments d 
ON d.manager_id = emp.manager_id;

-- 9. �� ������ ��(last_name)�� �ش� ������ ���� ��簡 �ִ� ��� ���� ����� ��(last_name) ��ȸ�ϱ�
SELECT emp.last_name AS emp, mgr.last_name AS mgr
FROM employees emp JOIN employees mgr
ON emp.manager_id = mgr.employee_id;

-- 10. ������ �߿��� �޿�(salary)�� 10000 �̻��� �������� ��(last_name)�� �ش� ������ �μ� �̸�(department_name) ��ȸ�ϱ�
SELECT e.last_name, d.department_name
FROM employees e JOIN departments d
ON e.department_id = d.department_id
WHERE e.salary>=10000;

/*
11.
�� �μ��� �̸�(department_name), �ش� �μ��� �Ŵ����� ID(manager_id)�� �Ŵ����� ��(last_name),
������ ID(employee_id), ������ ��(last_name), �׸��� �ش� ������ �޿�(salary) ��ȸ�ϱ�.
�������� �޿�(salary)�� �ش� �μ��� ��� �޿����� ���� �������� ��ȸ�մϴ�.
����� �μ� �̸��� ������ �޿��� ���� ������ ���ĵ˴ϴ�.
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