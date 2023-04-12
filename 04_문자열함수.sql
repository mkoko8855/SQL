/* lower(�ҹ���), initcap(�ձ��ڸ� �빮��), upper(�빮��) �� ��ȯ���ִ� �Լ����̴�. */
/*dual�� ����Ŭ���� ����� �� �ִ� �������� ���̺��̴�. 
��� �����͸� �����ϰų� ��ȸ�ϱ� ���� ������ ���� ���̺��� �ƴϴ�.
��, �׽�Ʈ �뵵�� ����� ���� ���̺��̴�. 
�Ͻ����� ������ ������̶���� �׷� �뵵�� ���� ���ȴ�.
��, dual�̶�� ���̺��� sys�� �����ϴ� ����Ŭ�� ǥ�� ���̺�μ�
���� �� �࿡ �� �÷��� ��� �ִ� dummy ���̺��̴�.
��, �Ͻ����� ��� �����̳� ��¥ ���� � �ַ� ����Ѵ�.
��, ��� ����ڰ� ���� �� �� �ִ�. */

/*SELECT * FROM dual;*/
/* SELECT * FROM dual; ��°���� DUMMY X ��� ���.*/
SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;



SELECT last_name, LOWER(last_name), INITCAP(last_name), UPPER(last_name)
FROM employees;


SELECT last_name
FROM employees
/*�̷��� �ϸ� �ձ��ڸ� �빮��, �ڿ��� �ҹ��ڴ� last_name�� �� �� �ִ�. */
WHERE LOWER(last_name) = 'austin';






/* length ����, instr(���� ã���̸� ������ 0�� ��ȯ�ϰ� ������ �ε��� ���� �ش�. */
/*INSTR�� ������ ���� �ְ� ã�����ϴ� ���� �����ָ� �ȴ�. �����ϸ� �ش� ���� �ε����� �ش�.*/
/*����� �ε����� �ڹ�ó�� 0������ �����ϴ°� �ƴ϶� ù��°(1��)���� �����Ѵ�*/
SELECT 'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'a')
FROM dual;



/*dual���� ���������� ����غ���*/
SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
/*a�� ������ 0, ������ a�� ��ġ���ִ� �ε������� ���´�.*/
FROM employees;





/* substr(���ڿ� �ڸ���), concat(���� ����) 1���� ����*/
SELECT 'abcdef' AS ex, SUBSTR('abcdef', 1, 4), CONCAT('abc', 'def')
/*��, SUBSTR�� �������ڿ�, 1������ 4��(����)���� �߶� �� ���� ������� ��� ����Ѵ�. */
FROM dual;
/*CONCAT�� 'abc'�� 'def'�� ��������~ ��� ����Ѵ�. ����� �Ű����� 2���ۿ� �ȹ޴´�. */




/*���� ���̺��� �������ϴ��� Ȯ������*/
SELECT first_name, SUBSTR(first_name, 1, 3), CONCAT(first_name, last_name)
FROM employees;











/* LPAD, RPAD �� ���� ����Ʈ�� ����Ʈ�� �ǹ��ϰ��� PAD�� ä���شٴ� �ǹ��̴�.*/
/*��, �� ������ �������ڿ��� ä��� �Լ����̴�. */
SELECT LPAD('abc', 10, '*'), RPAD('abc', 10, '*')
FROM dual;
/*LPAD�� abc��� 3���ڸ� 10-3 = 7�� *��, �������� ä���ּ��� ��� ���Ѵ�.
��°���� *******abc�� ���´�.*/

/*RPAD�� abc��� 3���ڸ� 10-3 = 7�� *��, �������� ä���ּ��� ��� ���Ѵ�.
��°���� abc*******�� ���´�. */





/* LTRIM(), RTRIM(), TRIM() */
/* LTRIM(param1, param2) > param2�� ���� param1���� ã�Ƽ� �����Ѵ�. ���ʺ��� */
/* RTRIM(param1, param2) > param2�� ���� param1���� ã�Ƽ� �����Ѵ�. �����ʺ���*/
SELECT LTRIM('javascript_java', 'java')
/*java�� javascrpit�� ���ʺ��� ã�Ƽ� ����� scrpit_java�� ��� �ȴ�.*/
FROM dual;



SELECT RTRIM('javascript_java', 'java')
FROM dual;
/*�ڿ� java�� �����ǰ���~*/



SELECT TRIM('javascript_java', 'java')
FROM dual;
/*�̰� ����*/





SELECT TRIM('    java    ')
FROM dual;
/*���� ������ �������ش�*/





/* replace() */
SELECT REPLACE('My Dream is a president', 'president', 'programmer')
/*���̵帲�̽�����������Ʈ �߿���, ��������Ʈ�� ���α׷��ӷ� �ٲ��� ��� ����Ѵ�*/
FROM dual;






SELECT REPLACE('My Dream is a president', ' ', '')
/*������ ��� ã�Ƽ� �������� ����ڴ� ��� ���̴�. �׷� ��� ������� �پ ��µȴ�.*/
FROM dual;



SELECT REPLACE(REPLACE('My Dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;
/*�̰� ���� ���� �پ ��µȴ�.*/
/*���� ���÷��̽��� ��������Ʈ�� ���α׷��ӷ� �ٲ�޶� ����ߴ�. �׸��� �ٱ��� ���÷��̽��� �����ؼ� �� ���忡�� ������ ������ ��� ��� �ϴ� ���̴�. */





SELECT REPLACE(CONCAT('hello', ' world!'), '!', '?')
FROM dual;
/*����ǥ�� ����ǥ�� �ٲٰ�ʹٸ�? ��Ĺ�̶�� �Լ��� ���ϰ��� ���÷��̽��� �Ű������� ����*/





/*���� 1.
EMPLOYEES ���̺� ���� �̸�, �Ի����� �÷����� �����ؼ� �̸������� �������� ��� �մϴ�.
���� 1) �̸� �÷��� first_name, last_name�� �ٿ��� ����մϴ�.
���� 2) �Ի����� �÷��� xx/xx/xx�� ����Ǿ� �ֽ��ϴ�. xxxxxx���·� �����ؼ� ����մϴ�.
*/
SELECT CONCAT(first_name, last_name) AS �̸�, REPLACE(hire_date,'/', '') AS �Ի�����
FROM employees
ORDER BY �̸� ASC;




/*���� 2.
EMPLOYEES ���̺� ���� phone_numbe�÷��� ###.###.####���·� ����Ǿ� �ִ�
���⼭ ó�� �� �ڸ� ���� ��� ���� ������ȣ (02)�� �ٿ� ��ȭ ��ȣ�� ����ϵ��� ������ �ۼ��ϼ���
*/
SELECT CONCAT('(02)', SUBSTR(phone_number, 5, LENGTH(phone_number)))
FROM employees;
/*��� ����� (02)�� ���鼭 ��ȣ���� ��� �� ���̴�.
*/




/*
���� 3. 
EMPLOYEES ���̺��� JOB_ID�� it_prog�� ����� �̸�(first_name)�� �޿�(salary)�� ����ϼ���.
���� 1) ���ϱ� ���� ���� �ҹ��ڷ� �Է��ؾ� �մϴ�.(��Ʈ : lower �̿�)
���� 2) �̸��� �� 3���ڱ��� ����ϰ� �������� *�� ����մϴ�. 
�� ���� �� ��Ī�� name�Դϴ�.(��Ʈ : rpad�� substr �Ǵ� substr �׸��� length �̿�)
���� 3) �޿��� ��ü 10�ڸ��� ����ϵ� ������ �ڸ��� *�� ����մϴ�. 
�� ���� �� ��Ī�� salary�Դϴ�.(��Ʈ : lpad �̿�)
*/

SELECT RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
       LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';


