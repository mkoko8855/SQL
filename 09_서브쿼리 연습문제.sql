--���� 1.
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� �����͸� ��� �ϼ��� ( AVG(�÷�) ���)
---EMPLOYEES ���̺��� ��� ������� ��ձ޿����� ���� ������� ���� ����ϼ���
---EMPLOYEES ���̺��� job_id�� IT_PROG�� ������� ��ձ޿����� ���� ������� �����͸� ����ϼ���

/*�ϴ� ��� ����� ��� �޿��� ã�ƾ� ����? ������ �޶�� �ϴ� ���̴�. ������������ �������� WHERE ���� ���߰ڴ�.*/
--SELECT AVG(salary)
--FROM employees; �ϴ� �̰ɷ� ��ȸ�� �Ǿ� �ϰ�, �̰ź��� ū ������ ���ϸ� �ǰ���?
SELECT *
FROM employees
WHERE salary >  ( SELECT AVG(salary)
                   FROM employees e
                ); /*��ȣ���� ������ �̱� ������ > �� �ᵵ �����ϴ�.*/
                  
                  
                  
SELECT COUNT(*)
FROM employees e
WHERE e.salary > ( SELECT AVG(salary)
                   FROM employees e
                  );


SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees 
                WHERE job_id = 'IT_PROG');
                  

                  

--���� 2.
---DEPARTMENTS���̺��� manager_id�� 100�� ����� department_id��
--EMPLOYEES���̺��� department_id�� ��ġ�ϴ� ��� ����� ������ �˻��ϼ���.

SELECT *
FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE manager_id = 100);



--���� 3.
---EMPLOYEES���̺��� ��Pat����(�̶�� ���)�� manager_id���� ���� manager_id�� ���� ��� ����� �����͸� ����ϼ���
---EMPLOYEES���̺��� ��James��(���ӽ��� 2��)���� manager_id�� ���� ��� ����� �����͸� ����ϼ���.


--SELECT manager_id
--FROM employees
--WHERE first_name = 'Pat';    ���� ��������, �Ŵ������̵� 201������ ū ������� ���� ã���� �ȴ�.

SELECT *
FROM employees
WHERE manager_id > (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'Pat'); /*���� �� ������ ������ �ε�ȣ�� �ᵵ �ȴ�. */

/*���� ���ӽ��� �ϴ� ã��*/
--SELECT manager_id
--FROM employees
--WHERE first_name = 'James';   /*��� ��� : MANAGER_ID�� 2���� ���´�. */

/*���� �ɷ�����*/
SELECT *
FROM employees
WHERE manager_id IN (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'James');
                   





/*  ���� 4.
-EMPLOYEES���̺� ���� first_name�������� �������� �����ϰ�, 41~50��° �������� �� ��ȣ, �̸��� ����ϼ��� 
*/
SELECT *
FROM
    (
    SELECT ROWNUM AS ��ŷ, tbl.first_name
    FROM
        (
        SELECT *
        FROM employees
        ORDER BY first_name DESC
        ) tbl
    )
WHERE ��ŷ > 40 AND ��ŷ <= 50;
/*�Ǵ� WHERE ��ŷ BETWEEN 41 AND 50 �̶�� �ᵵ ��*/






--���� 5.
---EMPLOYEES���̺��� hire_date�������� �������� �����ϰ�, 31~40��° �������� �� ��ȣ, ���id, �̸�, ��ȣ, 
--�Ի����� ����ϼ���.

SELECT *
FROM
    (
    SELECT ROWNUM AS ��ŷ, tbl.*
    FROM
    (
    SELECT employee_id, first_name, phone_number, hire_date
    FROM employees
    ORDER BY hire_date ASC /*hire_date�� ������������ ������ �ߴ�.*/
    ) tbl
)
WHERE ��ŷ > 30 AND ��ŷ <= 40;





/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
SELECT e.employee_id, CONCAT(first_name, last_name) AS �̸�, d.department_id /*d���������� e���������� �������~*/
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;


--���� 7.
/*
���� 6.
employees���̺� departments���̺��� left �����ϼ���
����) �������̵�, �̸�(��, �̸�), �μ����̵�, �μ��� �� ����մϴ�.
����) �������̵� ���� �������� ����
*/
--���� 6�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���.
SELECT e.employee_id, CONCAT(first_name, last_name) AS �̸�, e.department_id, (SELECT department_name
                                                                              FROM departments d
                                                                              WHERE d.department_id = e.department_id
                                                                              ) AS department_name
FROM employees e
ORDER BY employee_id ASC;






--���� 8.
--departments���̺� locations���̺��� left �����ϼ���
--����) �μ����̵�, �μ��̸�, �Ŵ������̵�, �����̼Ǿ��̵�, ��Ʈ��_��巹��, ����Ʈ �ڵ�, ��Ƽ �� ����մϴ�
--����) �μ����̵� ���� �������� ����
SELECT d.department_id, d.department_name, d.manager_id, l.location_id, l.street_address, l.postal_code, l.city
FROM departments d LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
ORDER BY department_id ASC;




--���� 9.
--���� 8�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
select d.department_id, d.department_name, d.manager_id, 
(select l.location_id from locations l where d.location_id = l.location_id),
(select l.postal_code from locations l where d.location_id = l.location_id),
(select l.city from locations l where d.location_id = l.location_id)
from departments d
order by department_id asc;
                                                                                            




--���� 10.
--locations���̺� countries ���̺��� left �����ϼ���
--����) �����̼Ǿ��̵�, �ּ�, ��Ƽ, country_id, country_name �� ����մϴ�
--����) country_name���� �������� ����

select l.location_id, l.street_address, l.city, l.country_id, 
(select c.country_name from countries c where l.country_id = c.country_id) as ctn
from locations l
order by ctn asc;





--���� 11.
--���� 10�� ����� (��Į�� ����)�� �����ϰ� ��ȸ�ϼ���
select l.location_id, l.street_address, l.city, l.country_id, 
(select c.country_name from countries c where l.country_id = c.country_id) as ctn
from locations l
order by ctn asc;


