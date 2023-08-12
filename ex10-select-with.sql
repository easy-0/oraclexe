/*
���ϸ�: ex10-select-with.sql

WITH ��
    WITH ���� �������� ����� �ӽ÷� �����ϰ� ����� �� �ִ� ����Դϴ�.
    �������̺�ǥ���� CTE(Common Table Expression)

    �ַ� ������ ������ �����ϰ� �ۼ��ϰų� �������� ���̴µ� Ȱ��˴ϴ�.
    
*/

-- �μ��� ��� �޿��� ����ϴ� ����
WITH AvgSalByDept AS (
    SELECT 
        department_id, 
        AVG(salary) as avgsalary
    FROM employees
    GROUP BY department_id
)
SELECT d.department_name, AvgSalByDept.avgsalary
FROM departments d
JOIN AvgSalByDept
ON d.department_id = AvgSalByDept.department_id
;












