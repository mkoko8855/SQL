--���� 1.
--��� ���̺��� JOB_ID�� ��� ���� ���ϼ���.
--��� ���̺��� JOB_ID�� ������ ����� ���ϼ���. ������ ��� ������ �������� �����ϼ���

SELECT 
    count(job_id)
FROM employees
GROUP BY job_id;

SELECT 
    job_id,
    AVG(salary) AS ���
FROM employees
GROUP BY job_id
ORDER BY ��� DESC;

--���� 2.
--��� ���̺��� �Ի� �⵵ �� ��� ���� ���ϼ���.
SELECT TO_CHAR(hire_date, 'yy'), 
    count(hire_date)
FROM employees
GROUP BY TO_CHAR(hire_date, 'yy');

--���� 3.
--�޿��� 5000 �̻��� ������� �μ��� ��� �޿��� ����ϼ���. �� �μ� ��� �޿��� 7000�̻��� �μ��� ���

SELECT 
    department_id,
    AVG(salary)
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary) >= 7000;


--���� 4.
--��� ���̺��� commission_pct(Ŀ�̼�) �÷��� null�� �ƴ� �������
--department_id(�μ���) salary(����)�� ���, �հ�, count�� ���մϴ�.
SELECT 
    department_id,
    TRUNC(AVG(salary+(salary*commission_pct)),2),
    SUM(salary),
    COUNT(salary)    
FROM employees
WHERE commission_pct IS NOT NULL
GROUP BY department_id;


--���� 1) ������ ����� Ŀ�̼��� �����Ų �����Դϴ�.
--���� 2) ����� �Ҽ� 2° �ڸ����� ���� �ϼ���

