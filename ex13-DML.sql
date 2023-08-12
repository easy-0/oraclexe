/*
���ϸ�: ex13-DML.sql

DML(Data Manipulation Language)
    DB���� �����͸� �����ϰ� ó���ϴ� SQL
    
    INSERT�� : ���̺� ���ο� ���ڵ� ����
    UPDATE�� : ���̺� ���� ���ڵ带 ����(������Ʈ) �ϴµ� ���
    DELETE�� : ���̺��� Ư�� ���ڵ带 ����
    
    SELECT�� DML�� ���Ե� �� ������, ���� DQL(Data Query Language)�� �з��Ѵ�. (������ �ƴ� ��ȸ)

*/


/*
INSERT ��
[�⺻����]
    INSERT INTO ���̺�� (�÷���1, �÷���2, ...)
    VALUES(��1, ��2, ...);
    
    �Ǵ�
    
    INSERT INTO ���̺�� (�÷���1, �÷���2, ...) subquery; (������ Ÿ���� ������� like UNION)
    
*/
select * from departments;

INSERT INTO departments (department_id, department_name, manager_id, location_id)
VALUES (280, 'Public Relations', 100, 1700);

COMMIT; -- DML ����� ���������� DB�� �ݿ�


-- NULL ���� ���� �� ����
-- �� ����
INSERT INTO departments (department_id, department_name)
VALUES (290, 'Purchasing');

ROLLBACK; -- DML �������� ����� ��

-- NULL Ű���� ����
INSERT INTO departments
VALUES (300,  'Crypto', NULL, NULL);

/* INSERT subquery

*/

CREATE TABLE sales_reps 
AS (
    SELECT employee_id id, last_name name, salary, commission_pct
    FROM employees
    WHERE 1 = 2 -- ������ ���� ��Ű���� ������
    )
;

SELECT * FROM sales_reps;

-- job_id REP���Ե� ���
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id  LIKE '%REP%';

INSERT INTO sales_reps
SELECT employee_id, last_name, salary, commission_pct
FROM employees
WHERE job_id  LIKE '%REP%';

COMMIT;










