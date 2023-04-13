/*���� ������*/

/* UNION (�������̸� �ߺ�X),     UNION ALL(�������̸� �ߺ�O*/
/* INTERSECT(������),          MINUS(������)            */
/* �� �Ʒ� column ������ ������ Ÿ���� ��Ȯ�� ��ġ�ؾ� �Ѵ�. A �ڷ�1�� B �ڷ�2���� ����ħ*/


SELECT employee_id, first_name /*����2�� �Ʒ��� 2���� UNION�� �����ϴ�.*/
FROM employees
WHERE hire_date LIKE '04%' 
UNION
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;




SELECT employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%' 
UNION ALL /*��� �ߺ����� ���*/
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;




SELECT employee_id, first_name /*����2�� �Ʒ��� 2���� UNION�� �����ϴ�.*/
FROM employees
WHERE hire_date LIKE '04%' 
INTERSECT /*��� ������*/
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;





SELECT employee_id, first_name /*����2�� �Ʒ��� 2���� UNION�� �����ϴ�.*/
FROM employees
WHERE hire_date LIKE '04%' 
MINUS /*��� ������*/
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;