���� 1.
-EMPLOYEES ���̺��, DEPARTMENTS ���̺��� DEPARTMENT_ID�� ����Ǿ� �ֽ��ϴ�.
-EMPLOYEES, DEPARTMENTS ���̺��� ������� �̿��ؼ�
���� INNER , LEFT OUTER, RIGHT OUTER, FULL OUTER ���� �ϼ���. (�޶����� ���� ���� Ȯ��)

SELECT *
FROM employees e INNER JOIN departments d
on e.department_id = d.department_id; 

SELECT *
FROM employees e LEFT JOIN departments d
on e.department_id = d.department_id; 

SELECT *
FROM employees e RIGHT JOIN departments d
on e.department_id = d.department_id; 

SELECT *
FROM employees e FULL OUTER JOIN departments d
on e.department_id = d.department_id; 

���� 2.
-EMPLOYEES, DEPARTMENTS ���̺��� INNER JOIN�ϼ���
����)employee_id�� 200�� ����� �̸�, department_id�� ����ϼ���
����)�̸� �÷��� first_name�� last_name�� ���ļ� ����մϴ�

SELECT e.first_name || ' ' || e.last_name AS name , e.department_id
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE e.employee_id = 200; 

���� 3.
-EMPLOYEES, JOBS���̺��� INNER JOIN�ϼ���
����) ��� ����� �̸��� �������̵�, ���� Ÿ��Ʋ�� ����ϰ�, �̸� �������� �������� ����
HINT) � �÷����� ���� ����� �ִ��� Ȯ��

SELECT e.first_name, e.job_id, j.job_title
FROM employees e INNER JOIN jobs j
ON e.job_id = j.job_id
ORDER BY first_name ASC;

���� 4.
--JOBS���̺�� JOB_HISTORY���̺��� LEFT_OUTER JOIN �ϼ���.

SELECT *
FROM jobs j LEFT JOIN job_history h
ON j.job_id = h.job_id;

���� 5.
--Steven King�� �μ����� ����ϼ���.
SELECT e.department_id,d.department_name
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
WHERE e.first_name='Steven' and e.last_name='King';

���� 6.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� Cartesian Product(Cross join)ó���ϼ���
SELECT *
FROM employees CROSS JOIN departments;

���� 7.
--EMPLOYEES ���̺�� DEPARTMENTS ���̺��� �μ���ȣ�� �����ϰ� SA_MAN ������� �����ȣ, �̸�, 
�޿�, �μ���, �ٹ����� ����ϼ���. (Alias�� ���)

SELECT e.first_name,e.employee_id,e.salary AS �޿�,d.department_name AS �μ���, l.city AS �ٹ���
FROM employees e JOIN departments d 
ON e.department_id = d.department_id 
LEFT JOIN locations l ON l.location_id = d.location_id
WHERE e.job_id = 'SA_MAN';

���� 8.
-- employees, jobs ���̺��� ���� �����ϰ� job_title�� 'Stock Manager', 'Stock Clerk'�� ���� ������
����ϼ���.
SELECT *
FROM employees e JOIN  jobs j
ON e.job_id = j.job_id
WHERE j.job_title = 'Stock Manager' or j.job_title = 'Stock Clerk';

���� 9.
-- departments ���̺��� ������ ���� �μ��� ã�� ����ϼ���. LEFT OUTER JOIN ���
SELECT d.department_name
FROM departments d  LEFT JOIN employees e
ON e.department_id = d.department_id
WHERE e.employee_id is null;

���� 10. 
-join�� �̿��ؼ� ����� �̸��� �� ����� �Ŵ��� �̸��� ����ϼ���
��Ʈ) EMPLOYEES ���̺�� EMPLOYEES ���̺��� �����ϼ���.
SELECT e.first_name, e.manager_id, em.first_name AS manager_name,em.employee_id 
FROM employees e JOIN employees em
ON e.manager_id = em.employee_id;

���� 11. 
--6. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)��, �Ŵ����� �̸�, �Ŵ����� �޿� ���� ����ϼ���
--�Ŵ��� ���̵� ���� ����� �����ϰ� �޿��� �������� ����ϼ���
SELECT e.employee_id,e.first_name, em.first_name, e.salary 
FROM employees e LEFT JOIN employees em
ON e.employee_id = em.manager_id
WHERE e.manager_id IS NOT NULL and em.first_name IS NOT NULL
ORDER BY e.salary DESC;