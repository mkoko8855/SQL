/* �׷��Լ� AVG, MAX, MIN, SUM, COUNT */
/* ��׵��� ���� �׷��� �ʿ��ϴ�. */

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;
/*��°�� : 6461.831775700934579439252336448598130841	24000	2100	691416	107*/
/*��, employees ���̺��� ������ �Ǹ� ���⼭�� �ش�Ǵ� ���ǵ鸸 ��ȸ�� �Ǵ� ���� �� �� �ִ�. */




SELECT COUNT(*)
FROM employees;
/* �� �� ������ ���� 107���� ���� �� �� �ִ�. */
SELECT COUNT(first_name)
FROM employees;
/* ��, �̸��� ���� �ִ� ������ ��� �� �� �ִ�. */
SELECT COUNT(commission_pct)
FROM employees;
/* NULL�� ������ �ʴ´�. 35�� ��ȸ�ȴ�.*/
SELECT COUNT(manager_id)
FROM employees;
/*��ȸ�� 106���� �ȴ�. ��, �Ѹ��� �Ŵ������̵� ���� ���� �� �� �ִ�. */
/*��, COUNT�� NULL�� �ƴ� ���� ���� �˷��ش�~ */





/*  ���� �׷�ȭ�� ���Ѻ��� > �μ����� �׷�ȭ�� �� �Ű� �׷��Լ��� ����� ���̴�.  */
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id; /*����Ʈ��Ʈ���̵� �׷��� �����༭.*/


SELECT job_id,department_id, AVG(salary)
FROM employees
GROUP BY department_id;
/* �̰� �ȸԴ´�. AVG�� �׷� �Լ��̱� ������.*
/*�׸���, GROUP BY���� ����� ��, �׷쿡 ������ ���� �ٸ� �÷����� ����� �� ����. job_id�� ������ �����ϱ�~*/



/* GROUP BY�� 2�� �̻� ����ϱ� */
SELECT job_id,department_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;



SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;    /*HAVING�� �׷��� ������ �� �� �ִ�. */
/*��, �׷���̸� ���� �׷�ȭ�� �� �� ������ �� ��� HAVING�� ����Ѵ�. */



/*job_id�� ������ �ñ��ϴ�.*/
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 20;




/*�μ� ���̵� 50 �̻��� �͵��� �׷�ȭ ��Ű��, �׷� ���� ����� 5000 �̻� ��ȸ�϶�*/
SELECT department_id, AVG(salary) AS ���
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;

