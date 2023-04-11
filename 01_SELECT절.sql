-- SELECT * FROM employees; -- /*��ȸ�ϰڴ� > ��������� �����س��� employees��*/
/*���������۾� : DML(SELECT, INSERT, UPDATE, DELETE)*/
/*���������Ǿ� : DDL(CREATE, ALTER, DROP, RENAME, TRUNCATE)*/

/*���ٻ��� : Alt + Shift + D*/
/*���ٺ��� : Ctrl + Shift + D*/




/*��ȸ : SELECT �÷���(����������) FROM ���̺��̸�*/
SELECT
    *
FROM
    employees; /*EMPLOYESS ���̺� ��� �÷��� ��ȸ����*/

/*SQL���� : Ű����� �빮��, �ĺ��ڸ� �ҹ��ڷ� �ۼ��Ѵ�.*/

/*Ctrl + F7 = ���ʴ�� ���� �ٲ��ش�. �̰ɷ� ������� */


--�̹����� ���� �ñ��� ���� ����� ��ȣ, �̸��� ���� �ñ��ϴ�.--
--��, �÷��� ������ ���� �͵� �����ϴ�.--
SELECT employee_id, first_name, last_name
  FROM employees;


--�÷� ������ ���°� ���� : �̸��ϰ� ����ȣ�� �Ի����� �ñ��ϴٸ�?--
SELECT email, phone_number, hire_date
  FROM employees;

--�÷��� ��ȸ�ϴ� ��ġ���� ��Ģ���굵 �����ϴ� * / + - ���� �͵�. --
--��ȸ�� �ҋ�, ������ ������ Ŀ�̼��� ������������ ������ �ñ���. �׷������?--
--���������� 0.1�� ���� ������ ���� ���� �ִ�.--
SELECT employee_id, first_name, last_name, salary, salary+salary*0.1
  FROM employees;

/*�÷��� ��Ī�� �ٿ��ִ� ��� : alias(�÷����̳� ���̺�� �̸��� �����ؼ� ��ȸ�Ѵ�.)*/
SELECT first_name AS �̸�, last_name AS ��, salary AS �޿�
  FROM employees;



/*
����Ŭ�� Ȭ����ǥ�� ���ڸ� ǥ���ϰ�, ���ڿ� �ȿ�
Ȭ����ǥ�� ǥ���ϰ� �ʹٸ� ''�� �ι� �������� ���� �ȴ�.
������ �����ϰ� �ʹٸ� ||�� ����Ѵ�.
*/
SELECT first_name || ' ' || last_name || '''s salary is $' || salary 
       AS �޿�����
  FROM employees;



/*DISTINCT (�ߺ� ���� ����)*/
SELECT department_id
  FROM employees;
--�μ��� ��� �ñ��ϴٸ�?--
--�ߺ� �� �����ϸ� �μ�ID�� �����鸸 ��������?--
SELECT DISTINCT department_id
  FROM employees;





/* ROWNUM, ROWID > ROWNUM�� ������ ���� ��ȯ�Ǵ� �� ��ȣ�� ���,
                   ROWID�� �����ͺ��̽� ���� ���� �ּҸ� ��ȯ�Ѵ�.
*/
SELECT ROWNUM, ROWID, employee_id
FROM employees;




/*
NULL ���� Ȯ��(���� 0�̳� �����̶��� �ٸ� �����̴�.
NULL + ���� = NULL
���� �Լ� ���� NULL�� ���Ե� ���� ���迡�� ����
�ش�Ǵ� ���� ���� ��� SUM, AVG�� ����� NULL
COUNT�� ����� 0
*/








