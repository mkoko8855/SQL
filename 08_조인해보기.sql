/* �����̶� ?*/

/*���� �ٸ� ���̺��� ������ ���谡 �����Ͽ� 1�� �̻��� ���̺��� �����͸�
��ȸ�ϱ� ���� ����Ѵ�. 
*/

/*
SELECT �÷�����Ʈ FROM ���� ����� �Ǵ� ���̺� (1�� �̻�)
WHERE ���� ����  -> �̰� ����Ŭ ���� ������ ���Ѵ�.
                -> �׸���, ANSI ǥ�� �� �ִ�. 
                   ����Ŭ�� ANSI ǥ������ ���� ����ϴµ�, ����Ŭ ���� ������ �˾ƾ� �Ѵ�.
                   ������ �˰� �־�� �ϴϱ�..
*/




/* 
employees ���̺��� �μ� id�� ��ġ�ϴ� departments ���̺��� �μ� id�� ã�Ƽ�
SELECT ���Ͽ� �ִ� �÷����� ����ϴ� �������� �ۼ��غ���. (����Ŭ ����)
*/

SELECT first_name, last_name, hire_date, salary, job_id, e.department_id, department_name
FROM employees e, departments d /*e�� d�� ��Ī�̴�. FROM�� ���̺��� AS�� ������ �� �ִ�.*/
/*
���̺��� ���� ������ ������ ������ �ȵǱ� ������ ���� ������ ����� �Ѵ�.
�� ���̺��� �������� ������ �ִ� �÷��� ����� �Ѵ�. WHERE ���� ����
*/
WHERE e.department_id = d.department_id;
/* 
SELECT���� department_id�� �� ���̺� �� �ֱ� ������ ������ ����.
�������� department_id�� ������ ��⸦ ����� �ϴϱ� e�Ǵ� d.department_id��� ������.
*/








/*���� �ٸ� ���ι�����, ANSI ǥ�� �������� ���� */
SELECT e.first_name, e.last_name, e.hire_date, e.salary, e.job_id, e.department_id, d.department_name
/*ON���ٰ��� ���� ������ �Ǵ�. WHERE�� ���� �ʴ´�. ����� ������������ ������������ �˾ƾ��Ѵ�.
����Ŭ������ �������������ٰ� ���� ������ �������ȿ��� ���� �������� �����ϱ� �����. ���� ����� �ɾ������.*/
FROM employees e 
INNER JOIN department d 
ON e.department_id = d.department_id;
/*
������ ���̺� ���������� �����ϴ� �÷��� ��쿡�� ���̺� �̸��� �����ص� �����ϴ�.
�׷��� �ؼ��� ��Ȯ���� ���� ���̺� �̸��� �ۼ��ϼż� �Ҽ��� ǥ���� �ִ� ���� �ٶ����ϴ�.
(��, ���̺� �̸��� ��� ��Ī�� ����ؼ� SELECT���� Ȯ���� ��Ī�� ��� �Ҽ��� ǥ��������~)

����, �� ���̺� ��� ������ �ִ� �÷��� ��쿡�� (�ݵ��) ����� �־�� �Ѵ�.
e�� d�� ��� ����!
*/








/*
�̹��� 3���� ���̺��� �̿��� ��������(INNER JOIN)

�������� : �� ���̺� ��ο��� ��ġ�ϴ� ���� ���� �ุ ��ȯ�Ѵ�. 
10, 20, 30, 40   VS  10, 20, 30, 40, 50 �̶��
50�� �ȿ�����~
�ѹ� �غ���
*/
SELECT e.first_name, e.last_name, e.department_id, d.department_name, j.job_title
FROM employees e, departments d, jobs j
/*WHERE���� �ϴ� e�� d�� ���ļ� ���� ���� ã��, �� ��ģ ����� j�� ��ģ ����� ã��*/
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;







/*���� ���̺� 4���� ����*/
SELECT e.first_name, e.last_name, d.department_id, d.department_name, j.job_title, loc.city
FROM employees e, departments d, jobs j, locations loc
WHERE e.department_id = d.department_id /*e�� d�� ����Ʈ��Ʈid�� ���ٸ�*/
AND /*�׸���, e�� ����̵� j�� �� ���̵�� ���ٸ�*/
e.job_id = j.job_id                 /*�ؼ� 3, 4�� ��*/
AND /*�׸��� d�� �����̼� ���̵� loc�� �����̼� ���̵� ���ٸ�*/
d.location_id = loc.location_id     /*�갡 �ؼ� 2��*/
AND
loc.state_province = 'California';  /*�갡 �ؼ� 1��*/

/*
�ٵ� ���� �� loc.state_province = 'california'; �� ����� ��ȸ�ϰ�ʹٸ�? 
�Ϲ������̴� ������������,�ٵ� ��� �������ǵ�(AND)�� �������ִ�. ���̴ٰ� �Ϲ������� ����ұ�?
�� ������ AND �� ������ ����ȴ�. 
�׷��� �ؼ��� ������������ �߿��Ѱ� �ƴ϶� ���ϸ��� �ؼ��ȴ�. ����Ŭ ������ �������� �� ����.

��, 
1. loc���̺��� province='California' ���ǿ� �´� ���� �������
2. location_id ���� ���� ���� ������ �����͸� departments���� ã�Ƽ� ���ε���.
3. �� ����, 2������ ����� ����� ������ department_id�� ����
   employees ���̺��� �����͸� ã�Ƽ� ������ ����
4. ���� ����� jobs ���̺��� ���Ͽ� �����ϰ� ���� ����� ����Ѵ�.
*/










/* 
�ܺ� ����(OUTER JOIN) : 
��ȣ ���̺� ���� ��ġ�Ǵ� ������ ����Ǵ� ���� ���ΰ��� �ٸ���
��� �� ���̺� ���� ���� ������ �ش� row(��)���� ��ȸ ����� ���� ���Եȴ�.
*/
SELECT first_name, last_name, hire_date, salary, job_id, e.department_id, department_name
FROM employees e, departments d  
WHERE e.department_id = d.department_id(+);
/*
where���� �������� �ۼ��Ҷ� �÷����� �ٿ�����. �̰� �ܺ�(�ƿ���)�����̴�.
���� ������ NULL�� ��µǾ ���δ� ��ȸ�ǰ� �Ѵ�.
�������̺��� �������� ���������̺��� ���� ���δ� ��� ���� +�̴�.
��, �������̺��� ���� ����� �ϴ� �� ���´�.������ ���̺��� ���� ���������� NULL�� ǥ���ȴ�.
*/








SELECT e.first_name, e.last_name, e.hire_date, e.salary, e.job_id, e.department_id, d.department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id(+) /*�� �ƿ�������*/
AND d.location_id = loc.location_id; /*�� �̳�����*/
/*
�̰� �����Ű�� ����� ����, outjoin���� �ߴµ� ����� ������� 106����� ǥ�õȴ�.
107�������ϴµ�, locations�� �߰��� �����ϴϱ� NULL���� ������ �ִ��ְ� �ȳ��Դ�.
��, employees ���̺��� �����ϰ� departments ���̺��� �������� �ʾƵ�
(+)��ȣ�� ���� ���� ���̺��� �������� �Ͽ� departments ���̺��� ���ο�
�����϶�� �ǹ̸� �ο��ϱ� ���� ��ȣ�� ���Դϴ�.

�ܺ�(�ƿ���)������ ����ߴ���, ���Ŀ� ���� ������ ����ϸ� 
��������(�̳�����)���� �켱������ �ν��Ѵ�.
��, �̳����κ����ϰ� �ƿ����ϴϱ� NULL���� �ν� ���Ѵ�.
*/




SELECT e.employee_id, e.first_name, e.department_id, j.start_date, j.end_date, j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+)
AND j.department_id = 80;
/*������ �ϵ�, j.department_id = 80 �ֵ鸸 �ҰŴ�.

��, ����Ŭ���ι����� �ϴ� �� �Ⱦ���������..�ƹ�ư
�ܺ� ���� ���� �� ��� ���ǿ� (+)�� �ٿ��� �ܺ� ������ �����˴ϴ�.
�Ϲ� ���ǿ��� (+)�� ������ ������ �ܺ� ������ Ǯ���� ������ �߻��ؼ� ������ ������ �߻��ȴ�.


���� ANSI�������� ������~
*/



