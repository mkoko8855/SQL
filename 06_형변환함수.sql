/* ����ȯ�Լ� TO_CHAR, TO_NUMBER, TO_DATE */


/* ��¥�� ���ڷ� ��ȯ���ִ� �Լ� > ��ȯ�ϰ����ϴ� ��, ���� �ָ� �ȴ�.
   TO_CHAR(��ȯ�ϰ��� �ϴ� ��, ����)
*/
SELECT sysdate
FROM dual;
/*��� ��� : 23/04/13 */


/*���� ��¥ ������ ���ڷ� �ٲ㺸��*/
SELECT TO_CHAR(sysdate)
FROM dual;
/*��� ��� : 23/04/13 ���� ���ƺ������� �׷��� ���ڿ��� �ٲ� ���̴�.*/



/*��¥�����͸� TO_CHAR�� �ٲٵ�, ���ڿ� ���·� ���ϴ� ��¥ ���¸� �����ϸ� �ȴ�. */
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS')
FROM dual;
/*��� ��� : 2023-04-13 09:52:08 */


SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS')
FROM dual;
/*��� ��� : 23-04-13 09:54:07 */



/*������ ǥ���Ϸ���, ��ȭ���� */
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DAY HH24:MI:SS')
FROM dual;
/*��� ��� : 2023-04-13 ����� 09:56:18 */




/*���÷��� ������ ����ǳ� ����~*/
SELECT first_name, TO_CHAR(hire_date, 'YYYY"��" MM"��" DD"��"')
FROM employees;
/*��� ��� : 
Steven	2003�� 06�� 17��
Neena	2005�� 09�� 21��
Bruce	2007�� 05�� 21��
David	2005�� 06�� 25��
Valli	2006�� 02�� 05��
Diana	2007�� 02�� 07��
Nancy	2002�� 08�� 17��
Daniel	2002�� 08�� 16��
John	2005�� 09�� 28��
Ismael	2005�� 09�� 30��
�̷� ������ ����� �ȴ�.
/*��, ����ϰ� ���� ���ڸ� ""�� ����~*/






/* �̹��� ���ڸ� ���ڷ� �ٲ��ִ� TO_CHAR(��, ����) */
SELECT TO_CHAR(20000, '99999')
FROM dual;
/* ��� ����� 20000 �̴�. 99999�� ����? ������ ���� */

SELECT TO_CHAR(20000, '9999')
FROM dual;
/* ��� ����� ##### �̴�. �̰� ���� ���ϱ�?
   9�� ���ڰ� �ƴ϶� �ڸ����̴�. 20000�� 5�ڸ� ���ڷ� ǥ���Ѵٴ� �Ű�, 
   9999�� ������ 20000(5�ڸ�)�ε�, 9999(4�ڸ�)�� ��Ÿ���޶�� �ϴ� ####�� ������ �� ���̴�.
*/


/*�Ҽ����� ǥ���غ���*/
SELECT TO_CHAR(20000.21, '99999.9')
FROM dual;
/* ��� ��� :  20000.2*/
/*�� �ڸ��� ǥ���Ҳ��� 99999.9 ó��, �Ҽ��� ���ڸ����� 9 ���ָ� �ȴ�. */




SELECT TO_CHAR(20000, '99,999')
FROM dual;
/*��� ��� :  20,000 */




/*�޷���ȣ�� WON��ȣ�� ������ ���� �� �ִ�. */
SELECT TO_CHAR(salary, '$99,999') AS salary
FROM employees;
/*��� ��� :  
$24,000
$17,000
$17,000
$9,000
$6,000
$4,800
$4,800
$4,200
$12,008
$9,000
$8,200
  */
  
  
  
/*WON������ */
SELECT TO_CHAR(salary, 'L99,999') AS salary
FROM employees;
/*��� ��� :         
��24,000
��17,000
��17,000
��9,000
��6,000
��4,800
��4,800
��4,200
��12,008
��9,000
��8,200
��7,700*/







/*���ڸ� ���ڷ�   TO_NUMBER(��, ����)  */
SELECT '2000' + 2000
FROM dual;
/*��� ��� : 4000*/

/*�ڵ� �� ��ȯ(���� > ����)�� �Ǵ°� �����ֱ� ����..������ �ڵ����� �ȰŰ� ���� �غ���*/

SELECT TO_NUMBER('2000') + 2000
FROM dual;
/*��� ��� : 4000    ��, �̰� ���� �� ���̴�. (����� �� ��ȯ�̴�)*/



SELECT '$3,300' + 2000
FROM dual;
/* �̰� ������ �Ұ����ϴ�. ��? ��ȯ�� �� ���� ���� ���� �����ϱ�..
TO_NUMBER�� ���� ��ȯ ����� �Ѵ�
*/
SELECT TO_NUMBER('$3,300', '$9,999') + 2000
FROM dual;
/* ��� ��� : 5300 */





/*���ڸ� ��¥�� ��ȯ�ϴ� �Լ� TO_DATE(��, ����) �ָ� �ȴ�. */
SELECT TO_DATE('2023-04-13')
FROM dual;
/*��� ��� : 23/04/13*/



SELECT sysdate - '2021-03-26'
FROM dual;
/*��¥ó�� ���� ���ڱ� ������, �̷� ���¿����� ������ �Ұ����ϴ�.
���ڿ��� ��¥�� ��ȯ�� ����� �ϱ� ������ TO_DATE ��� �ؾ� �Ѵ�.
*/
SELECT sysdate - TO_DATE('2021-03-26')
FROM dual;
/* 748.44462962962962962962962962962962963 */


SELECT TO_DATE('2020/12/25', 'YY-MM-DD')
FROM dual;
/*   20/12/25  */



SELECT TO_DATE('2021/03/31 12:23:50', 'YY-MM-DD')
FROM dual;
/*���� ������. �־��� ���ڿ��� ��¥�� �ٲ� ���� ��� �� ��ȯ �ؾ� �Ѵ�. */
SELECT TO_DATE('2021/03/31 12:23:50', 'YY-MM-DD HH:MI:SS')
FROM dual;
/* 21/03/31 */



/*XXXX�� XX�� XX�� ���ڿ� �������� ��ȯ�غ�����*/
SELECT TO_CHAR(TO_DATE('20050112','YY-MM-DD'), 'YYYY"��" MM"��" DD"��"') as dateInfo
FROM dual;
/*��� ��� 2005�� 01�� 12��*/





/*NULL ���� �Լ��� NVL(�÷�, ��ȯ�� Ÿ�ٰ�)*/
SELECT NVL(null, 0)
FROM dual;
/*��� ��� : null�� 0���� ��ȯ�Ѵ�. */
/*��, ���� null �� ���, ���� ���� ����ϰ� �׷��� ������ �������� �״�� ����Ѵ�.*/





SELECT first_name, NVL(commission_pct, 0) AS comm_pct
FROM employees;
/*��� ��� : 
Steven	0
Neena	0
Lex	0
Alexander	0
Bruce	0
David	0
Valli	0
Diana	0
Nancy	0
Daniel	0
John	0
Ismael	0
Jose Manuel	0
*/





/* NVL2�� null�̸� ������1, �ƴϸ� ������2�� ����Ѵ�. ������ null üũ�� IF���̶�� �����ϸ� �ǰڴ�.*/


/*  NULL ���� �Լ� NVL2(�÷�, null�� �ƴ� ����� ��, null�� ����� ��*/
/*  NULL�� �ƴ� ���� �ʿ��ϸ� NVL2�� ���� �ȴ�. */
SELECT NVL2(null, '�ξƴ�', '����')
FROM dual;
/* ��� ��� : ���� */

SELECT NVL2('abc', '�ξƴ�', '����')
FROM dual;
/* ��� ��� : �ξƴ� */


/*�̻���� Ŀ�̼��� �޴��� �ȹ޴��ĸ��� �Ǵ��ϰ� �ʹٸ�? */
SELECT first_name, NVL2(commission_pct, 'true', 'false')
FROM employees;
/* Ŀ�̼��� �޴¾ֵ��� Ʈ��� ���� ���ϸ� ������ �߰���~ */






SELECT first_name, (salary * commission_pct) AS real_salary
FROM employees;
/*Ŀ�̼��� �ȹ޴¾ֵ��� null�� �����µ�, �ΰ� �������� �����ϴ� null�� ���´�.
  Ŀ�̼��� �ȹ޴¾ֵ��� ���� �������� ���;��ϴµ�..��
  Ŀ�̼�PCT�� ���� �ֵ��� �� ������ ���ָ� �ȵȴ� ��� ����ϸ� ����.
  NVL2�� �̿�����.
*/

SELECT first_name, commission_pct, NVL2(commission_pct, salary + (salary * commission_pct), salary) AS real_salary
FROM employees;
/*��� ��� : 
Steven 24000
Neena  17000
Lex	   17000
Alexander  9000
Bruce	   6000
David	   4800
Valli	   4800
*/






/*   DECODE(�÷� Ȥ�� ǥ����, �׸�1, ���1, �׸�2, ���2....(��� ���̽��� �Ȱɸ���)default)   ��, ����ġ�� �ణ ����ϴ�.*/
SELECT DECODE('F', 'A', 'A�Դϴ�.', 'B', 'B�Դϴ�.', 'C', 'C�Դϴ�.', '�𸣰ڴµ���?')
FROM employees;
/*�������� F�� ��Ҵ�. */
/*��, �÷� Ȥ�� ǥ������ �������� �� ���� ����1�� �ش��ϸ� ���1��..2�� ���2�� �̷����̴�. */





SELECT job_id, salary, DECODE(job_id, 'IT_PROG', salary*1.1, 'FI_MGR', salary*1.2, 'AD_VP', salary*1.3) AS result
FROM employees;







/* CASE WHEN THEN END */
SELECT first_name, job_id, salary, 
(CASE job_id
    WHEN 'IT_PROG' THEN salary * 1.1
    WHEN 'FI_MGR' THEN salary * 1.2
    WHEN 'AD_VP' THEN salary * 1.3
    WHEN 'FI_ACCOUNT' THEN salary * 1.4
    ELSE salary /*�ش����� �ʴ¾ֵ��� ���� �ڱ� salary�� ���� ���̴�.*/
    END) AS result
FROM employees;




/*
���� 1.
�������ڸ� �������� EMPLOYEE���̺��� �Ի�����(hire_date)�� �����ؼ� �ټӳ���� 17�� �̻���
����� ������ ���� ������ ����� ����ϵ��� ������ �ۼ��� ������. 
���� 1) �ټӳ���� ���� ��� ������� ����� �������� �մϴ�*/
SELECT employee_id AS �����ȣ,
       CONCAT(first_name, last_name) AS �����,
       hire_date AS �Ի�����,
       TRUNC((sysdate-hire_date) / 365, 0) AS �ټӳ��
FROm employees
WHERE (sysdate-hire_date) / 365 > 17 /*�������� '�ټӳ�� >= 17 �� ���ϸ� �ȵȴ�.*/
ORDER BY �ټӳ�� DESC;








/*
���� 2.
EMPLOYEE ���̺��� manager_id�÷��� Ȯ���Ͽ� first_name, manager_id, ������ ����մϴ�.
100�̶�� �������, 
120�̶�� �����ӡ�
121�̶�� ���븮��
122��� �����塯
�������� ���ӿ��� ���� ����մϴ�.
���� 1) department_id�� 50�� ������� ������θ� ��ȸ�մϴ�
*/

--SELECT first_name, manager_id, salary AS ����
--(CASE manager_id
--    WHEN manager_id = 100 THEN '���'
--    WHEN manager_id = 120 THEN '����'
--    WHEN manager_id = 122 THEN '����'
--    ELSE AS '�ӿ�'
--    END)
--FROM employees
--WHERE department_id > 50;

/*������ ����� �߾ȵǳ�..�Ʒ� ���ڵ� �� Ǯ�̲��� ����. */
SELECT first_name, manager_id, DECODE(manager_id, 100, '���', 120, '����', 121, '�븮', 122, '����', '�ӿ�') AS ����
FROM employees;




/*
���ڵ带 ��������, case when�� �������� �� ���� �Ǵ��ϴ� ���� �˷��ְڴ�.
*/
SELECT salary, employee_id, first_name, 
DECODE(TRUNC(salary / 1000), 0, 'E', 1, 'D', 2, 'C', 3, 'B', 'A') AS grade
FROM employees
ORDER BY salary DESC;
/* ���ڵ�� ���� �����ϴ� ���� �� ���� ����. ��Ȯ�� ���� ��� �ؾ� �Ѵ�. */



/*���̽������� �Ẹ��*/
SELECT salary, employee_id, first_name, 
    (CASE /*���������������� ���̽� ������ ���� ����. �ٷ� ���� ����*/
        WHEN salary BETWEEN 0 AND 999 THEN 'E'
        WHEN salary BETWEEN 1000 AND 1999 THEN 'D'
        WHEN salary BETWEEN 2000 AND 2999 THEN 'C'
        WHEN salary BETWEEN 3000 AND 3999 THEN 'B'
        ELSE 'A'
    END) AS grade
FROM employees
ORDER BY salary DESC;

