/*  ��������  */



/*
����������?
���������� ��� ����� () �ȿ� ��� �ؾ� �Ѵ�.
����, ������������ �������� 1�� ���Ͽ��� �Ѵ�.
�������� ������ ���� ����� �ϳ��� �ݵ�� ���� �Ѵ�.
�ؼ��� ���� ���������� ���� ���� �ؼ��Ѵ�
*/



/* 'Nancy'�� �޿����� �޿��� ���� ����� �˻��ϴ� ����*/
SELECT salary
FROM employees
WHERE first_name = 'Nancy';

SELECT *
FROM employees
WHERE salary > 12008;

/*�̷� ������ 12008 �̶�� ����� ��� ���� ���� ���� ����. �̷��� ���� ���ϴ�. �̰� ������ ����������.*/

SELECT *
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE first_name = 'Nancy');