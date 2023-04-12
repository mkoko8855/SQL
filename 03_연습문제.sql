/* 1. ��� ����� �����ȣ, �̸�, �Ի���, �޿��� ����ϼ��� */
SELECT EMPLOYEE_ID, FIRST_NAME, HIRE_DATE, SALARY
FROM employees;


/* 2. ��� ����� �̸��� ���� �ٿ� ����ϼ���. �� ��Ī�� name���� �ϼ���.*/
SELECT first_name || last_name AS name
FROM employees;



/* 3. 50�� �μ� ����� ��� ������ ����ϼ���.*/
SELECT *
FROM employees
WHERE department_id = 50;

/* 4. 50�� �μ� ����� �̸�, �μ���ȣ, �������̵� ����ϼ���.*/

SELECT first_name, JOB_ID, EMPLOYEE_ID
FROM employees
WHERE department_id = 50;



/* 5. ��� ����� �̸�, �޿� �׸��� 300�޷� �λ�� �޿��� ����ϼ���.*/
SELECT FIRST_NAME, SALARY, (SALARY+300) AS �λ�ȱ޿�
FROM employees;


/* 6. �޿��� 10000���� ū ����� �̸��� �޿��� ����ϼ���.*/
SELECT FIRST_NAME, SALARY
FROM employees
WHERE SALARY > 10000;


/* 7. ���ʽ��� �޴� ����� �̸��� ����, ���ʽ����� ����ϼ���. */
SELECT FIRST_NAME, JOB_ID, COMMISSION_PCT
FROM employees
WHERE COMMISSION_PCT IS NOT NULL;


/* 8. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(BETWEEN ������ ���)*/
SELECT FIRST_NAME, HIRE_DATE, SALARY
FROM employees
WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';



/* 9. 2003�⵵ �Ի��� ����� �̸��� �Ի��� �׸��� �޿��� ����ϼ���.(LIKE ������ ���) */
SELECT FIRST_NAME, HIRE_DATE, SALARY
FROM employees
WHERE hire_date LIKE '03%';



/* 10. ��� ����� �̸��� �޿��� �޿��� ���� ������� ���� ��������� ����ϼ���. */
SELECT FIRST_NAME, SALARY
FROM employees
ORDER BY SALARY DESC;

/* 11. �� ���Ǹ� 60�� �μ��� ����� ���ؼ��� �����ϼ���. (�÷�: department_id)
*/
SELECT FIRST_NAME, SALARY
FROM employees
WHERE department_id = 60
ORDER BY SALARY DESC;


/* 12. �������̵� IT_PROG �̰ų�, SA_MAN�� ����� �̸��� �������̵� ����ϼ���. */
SELECT FIRST_NAME, JOB_ID
FROM employees
WHERE job_id = 'IT_PROG'
OR job_id = 'SA_MAN';
   
/*
SELECT FIRST_NAME, JOB_ID
  FROM employees
 WHERE job_id IN ('IT_PROG', 'SA_MAN'); �� �����ϴ�.
*/
   
/* 13. Steven King ����� ������ ��Steven King ����� �޿��� 24000�޷� �Դϴ١� �������� ����ϼ���.
*/

SELECT first_name || ' ' || last_name || '����� �޿��� ' || salary || '�޷� �Դϴ�.'
FROM employees
WHERE first_name = 'Steven'
AND last_name = 'King';
    

/* 14. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� ����ϼ���. (�÷�:job_id)
*/

SELECT first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN';





/*15. �Ŵ���(MAN) ������ �ش��ϴ� ����� �̸��� �������̵� �������̵� ������� ����ϼ���.
*/
SELECT first_name, job_id
FROM employees
WHERE job_id LIKE '%MAN'
ORDER BY job_id;
