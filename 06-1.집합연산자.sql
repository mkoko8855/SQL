
--���� ������
--UNION(������ �ߺ�X) UNION ALL(������ �ߺ�O) INTERSECT(������) MINUS(������)
--�� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �Ѵ�. 

SELECT 
    employee_id, first_name --TO_CHAR(salary) �� �����ϱ� �ѵ� ����
FROM employees
WHERE hire_date LIKE '04%'
UNION
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;
---------------------------------
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
UNION ALL
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;
----------------------------------
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
INTERSECT
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;
---------------------------------------------
SELECT 
    employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%'
MINUS
SELECT
    employee_id, first_name
FROM employees
WHERE department_id = 20;