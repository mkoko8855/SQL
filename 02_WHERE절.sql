SELECT * FROM employees;

/*������ ���� : where ���� �̿��ؼ� ���ǿ� �´� �����͸� ������ �� �ִ�. */

/*WHERE �� ��(SQL�� ���� ��/�ҹ��ڸ� ���� �������� ������ ���� ��/�ҹ��ڸ� �����Ѵ�)*/

SELECT first_name, last_name, job_id
FROM employees
/*job_id�߿��� it_prog��� ����鸸 ��ȸ�Ҳ���, �� ������� first_name�� last_name�� job_id�� ��ȸ�Ѵ�.*/
WHERE job_id = 'IT_PROG';




SELECT * 
FROM employees
WHERE last_name = 'King';




/*������̺��� department_id�� 90���� ������� ��� ������ ��� �Ѵ�.*/
SELECT *
FROM employees
WHERE department_id = 90;





/*�������� 15000 �̻� �޴� ������� �ñ��ϴٸ�?*/
SELECT *
FROM employees
WHERE salary >= 15000;




/*�Ի� ���ڰ� 04��1��30���� ����� ��� ����� �߿��� ã�� ���̴�.*/
SELECT *
FROM employees
WHERE hire_date = '04/01/30';





/*������ �� ����(BETWEEN, IN, LIKE)*/
/*�������� 15000�� 20000���� ���, ��ȸ�� �� ���̴�. */
SELECT *
FROM employees
WHERE salary BETWEEN 15000 AND 20000;




/*between�� ��¥������ ����� �� �ִ�. �� ��¥�� �� ��¥�� ���̶����..*/
SELECT *
  FROM employees
 WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';




/* IN �������� ��� (Ư�� ����� ���� �� ���) */
SELECT *
  FROM employees
/*manager_id �÷��� ���� 100�̰ų� 101�̰ų� 102�� ��ȸ�� ���̴�.*/
 WHERE manager_id IN (100, 101, 102);



SELECT *
  FROM employees
 WHERE job_id IN ('IT_PROG', 'AD_VP');
 
 
 
 
 
 /*LIKE ������ : ����ϸ� �����Ͷ� ��� ���̴�.*/
 /*%(�ۼ�Ʈ) ��ȣ�� ��� ���ڵ�, _(�����)�� �������� �ڸ�(��ġ)�� ã�Ƴ� �� ���ϵ�ī�� ��ȣ��*/
 SELECT first_name, hire_date
   FROM employees
   /*03�⵵�� �Ի��� ����� ���� ��ȸ���� >
     hire_date��� �÷��� ���� ��ġ 03% �� ���ٸ� ���� �ؼ��� �ϸ� �Ǵµ�,
     ��, 03���ν����ϸ鼭 �ڿ��� ��� ���ڰ� �͵� ����� ���ٴ� ���̴�.
   */
  WHERE hire_date LIKE '03%';
  /*'%15'���, �տ��� �������簣�� �ڰ� 15�� ���� ��ȸ�ض� ��� ���� �ȴ�.*/
  /*'%05%���, 05�� ���⸸�ϸ� ������ ��ȸ�ض� ��� ���� �ȴ�.*/

/*�����*/
/*���� 05��(5������) �ָ� ã��ʹٸ�?*/
/*WHERE hire_date LIKE '___05%' �̴�.*/
/*��, ����ٸ� 3�� �־��µ� �տ��ƹ����� 3�������� �ڿ�05��� ��ȸ�Ѵ� ��� ���� �ȴ�. */




/* IS NULL */
SELECT *
fROM employees
/*�Ŵ���id�� ���� �͸��� ã�ƶ�.*/
WHERE manager_id IS NULL;



/*commission_pct�� NULL�� �ƴ� �͵鸸�� ã�ƶ�*/
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;






/*AND , OR*/
/*
�̹� and�� or�����ڵ��� �˰� �ִ�.
��������� AND�� OR���� ���� ������ ������.
*/

/*Job_id�� it_prog�̰ų� FI_MGR. ������ �ϳ������� ���ڰ� ���������� �������� 6õ�� �Ѿ����� ���ڴ�.*/
SELECT *
  FROM employees
WHERE (job_id = 'IT_PROG'
    OR job_id = 'FI_MGR')
   AND salary >= 6000;
/*�̰� ��Ȯ�� ��ȸ�� �ȵȴ�. �ֳ��ϸ�, FI_MGR�� AND salary >= 6000�� ã�ұ� �����̴�.*/
/*OR�����ϰ� AND�� ������ �Ǿ��ϴ� �ٽ��ۼ����ڸ�, ��ȣ�� �ٿ��ָ� �ȴ�.*/







/*��ȸ�� ����� �����ؼ� ����  >  �������� ����(SELECT������ ���� �������� ����ȴ�)
�������̴� �������̴ϱ� �������� ������ ����Ǵ� ���� �°���~
*/
/*���� ������ ���� �������� ������ �ȴ�.*/

/*
ASC : ascending ��������(���������ͼ������)
DESC : descending ��������(ū�����ͼ�����γ�����)
*/


SELECT *
FROM employees
/*hier_date�� ������������ ����!*/
ORDER BY hire_date ASC;



SELECT *
FROM employees
/*hier_date�� ������������ ����!*/
ORDER BY hire_date DESC;




SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
/*first_name�� ������������ > ABCD������ ������ �� ���̴�*/
ORDER BY first_name ASC;




SELECT *
FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;
/*������̺��� �������� 5000�̻��ε�, employee_id�� ������������ �Ǿ��ֵ��� ��ȸ�Ҳ��� */





/*������ ������(����)�� 12�谡 ���״ϱ�, �� ���̺� �������� ������ �츮�� ��Ī�ٿ��� ���� ���ı��� �����.*/
SELECT first_name, salary*12 AS pay
FROM employees
ORDER BY pay ASC;





