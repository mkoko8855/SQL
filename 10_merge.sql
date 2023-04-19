/*    MERGE (���̺� ���� �̴�)*/

/* UPDATE�� INSERT�� �� �濡 ó���Ѵ�.
�� ���̺� �ش��ϴ� �����Ͱ� �ִٸ� UPDATE��,
������ INSERT�� ó���ض� ��� ���̴�.
*/


/*�ϴ� ���̺� �ϳ� ������. �����ؼ�.*/
CREATE TABLE emps_it AS (SELECT *
                         FROM employees WHERE 1 = 2); /*������ �� ���̱� ������ false�� �־�����. �����ʹ� �Ȱ�����.*/
                         
SELECT * FROM emps_it;  /*Ȯ���غ��� ����ִ� ���̺� ���� ���̴�*/


/*�����͸� �����غ���*/
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (105, '���̺��', '��', 'DAVIDKIM', '23/04/19', 'IT_PROG');
    
SELECT * FROM emps_it;  /*���̺� Ȯ�� �� (�����Ͱ� �� ������*/





SELECT * FROM employees  /*�̰Ÿ� emps_it�� �����Ұǵ�, Ÿ���� emps_it����?*/
WHERE job_id = 'IT_PROG';

MERGE INTO emps_it a /*������ �� Ÿ�� ���̺��� ��������, a�� ��Ī�̴�*/
    USING (SELECT *      /*���ս�ų ������. ��, ���� ���̺��̰ڴ�.*/
           FROM employees
           WHERE job_id = 'IT_PROG') b        /*���� �ϰ��� �ϴ� ������*/
    ON /*���ս�ų �������� ���� ����*/
     (a.employee_id = b.employee_id)
WHEN MATCHED THEN  /*���ǿ� ��ġ�ϴ� ���(��, �� ���̺� �� �����ϸ� ������Ʈ, Ÿ�� ���̺� �̷��� �����ض� ��� ��ɾ��.*/
    UPDATE SET 
        a.phone_number = b.phone_number, 
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id /*b�� ���̺� �������� a�� ������Ʈ ��Ű�ڴ�. ������? ON�� ������ ������ ����鸸.*/
WHEN NOT MATCHED THEN  /*���ǿ� ��ġ���� �ʴ� ���(��, b�����Ͱ� a�� ���ٴ¾��ϱ� �μ�Ʈ) Ÿ�� ���̺��� �̷��� �����ض� ��� ��ɾ��*/
    INSERT /*�Ӽ�(�÷�)*/ VALUES
    (b.employee_id, b.first_name, b.last_name,
     b.email, b.phone_number, b.hire_date, b.job_id,
     b.salary, b.commission_pct, b.manager_id, b.department_id);
     
SELECT *
FROM emps_it;/*Ȯ���غ��� 1�ٿ��� 5���� �ƴ�*/

-----------------------------------------------------------------------------


/*������ �ѹ� �� ���� �غ���*/
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '����', '��', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '�ϳ�', '��', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '���', '��', 'HMSON', '20/04/06', 'AD_VP');
/*��Ʈ�ѿ��ʹ����� ����~*/

/*�� ������ emps_it�� �� ���� ���̴�.

�׷� ���⼭ ���� : employees ���̺��� �Ź� ����ϰ� �����Ǵ� ���̺��̶�� ��������.
                ������ �����ʹ� email, phone, salary, comm_pct, manager_id, dept_id��
                ������Ʈ �ϵ��� ó��, ���� ���Ե� �����ʹ� �״�� �߰�����.
*/

MERGE INTO emps_it a
    USING 
        /*�����ϰ����ϴ� �����͸� �ۼ��ϸ�ƾ���*/
        (SELECT * FROM employees) b /*�̹��� employees ���̺� ��ü�� ����*/
    ON
        (a.employee_id = b.employee_id)
        
        
        
        /*���������� DELETE �� �� ������, DELETE�� �ܵ������� �� ���� ����.
          UPDATE ���Ŀ� DELETE �ۼ��� �����ϴ�.
          UPDATE �� ����� DELETE �ϵ��� ����Ǿ� �ֱ� ������
          ������ ��� �÷����� ������ ������ �ϴ� UPDATE�� �����ϰ�,
          �� ���� DELETE�� WHERE���� �Ʊ� ������ ������ ���� �����ؼ� �����Ѵ�.
        */
     
        
WHEN MATCHED THEN
    UPDATE SET
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
        /*���������� DELETE �� �� ������, DELETE�� �ܵ������� �� ���� ����.
          UPDATE ���Ŀ� DELETE �ۼ��� �����ϴ�.
          UPDATE �� ����� DELETE �ϵ��� ����Ǿ� �ֱ� ������
          ������ ��� �÷����� ������ ������ �ϴ� UPDATE�� �����ϰ�,
          �� ���� DELETE�� WHERE���� �Ʊ� ������ ������ ���� �����ؼ� �����Ѵ�.
        */
      
        DELETE
            WHERE a.employee_id = b.employee_id
            
            
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name,
     b.email, b.phone_number, b.hire_date, b.job_id,
     b.salary, b.commission_pct, b.manager_id, b.department_id); /*b�� ������ �����״� �̰͵��� a���ٰ� �־��� ��� ����.*/

SELECT *
FROM emps_it
ORDER BY employee_id ASC; /*Ȯ�ο�*/









/* ���� 1
DEPTS ���̺��� ������ �߰��ϼ��� */
DESC DEPTS;
 
INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (280, '����', 1800);
INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (290, 'ȸ��', 1800);
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (300, '����', 301, 1800);
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES    
    (310, '�λ�', 302, 1800);
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (320, '����', 303, 1700);

SELECt *
FROM DEPTS;


/* ���� 2  2-1*/
UPDATE DEPTS SET department_name = 'IT bank'
WHERE department_name = 'IT Support';


/* ���� 2  2-2*/
UPDATE DEPTS SET manager_id = 301
WHERE department_id = 290;


/* ���� 2  2-3*/
UPDATE DEPTS SET department_name = 'IT Help', manager_id = 303, location_id = 1800
WHERE department_name = 'IT Helpdesk';



/* ���� 2  2-4*/
UPDATE DEPTS SET manager_id = 301
WHERE department_id IN(290, 300, 310, 320);



/* ���� 3*/
DELETE FROM DEPTS
WHERE department_id = 302;

DELETE FROM DEPTS
WHERE department_id = 220;



/* ���� 4*/
DELETE 
FROM depts
WHERE department_id > 200;



/* ���� 4-2 */

UPDATE DEPTS SET manager_id = 100
WHERE manager_id is not null;



/* ���� 4-3*/
/*���� ����*/





/* ���� 4-4 */
MERGE INTO DEPTS a
USING
(SELECT * FROM departments) b
ON
(a.department_id = b.department_id)
WHEN MATCHED THEN
    UPDATE SET
        a.department_name = b.department_name,
        a.manager_id = b.manager_id,
        a.location_id = b.location_id
WHEN NOT MATCHED THEN
    INSERT VALUES
        (b.department_id, b.department_name, b.manager_id, b.location_id);
        
        
 
        
    



/* 5 - 1*/
CREATE TABLE jobs_it AS
(SELECT *
 FROM jobs
 WHERE min_salary > 6000);
 
 
 
 /* 5 - 2*/
 INSERT INTO jobs_it
 (job_id, job_title, min_salary, max_salary)
 VALUES
 ('IT_DEV', '����Ƽ������', 6000, 20000);
 INSERT INTO jobs_it
 (job_id, job_title, min_salary, max_salary)
 VALUES
 ('NET_DEV', '��Ʈ��ũ������', 5000, 20000);
 INSERT INTO jobs_it
 (job_id, job_title, min_salary, max_salary)
 VALUES
 ('SEC_DEV', '���Ȱ�����', 6000, 19000);
 
/*�Ǵ�, INSERT INTO jobs_it VALUSE ('IT_DEV', '����Ƽ������', 6000, 20000);*/
/*INSERT INTO jobs_it VALUSE ('NET_DEV', '����Ƽ������', 5000, 20000);*/
/*INSERT INTO jobs_it VALUSE ('SEC_DEV', '����Ƽ������', 6000, 19000);*/

 
 
/* 5 - 4 */
MERGE INTO jobs_it a
    USING (SELECT * FROM jobs WHERE min_salary >= 0) b
    ON (a.job_id = b.job_id)
WHEN MATCHED THEN
    UPDATE SET a.min_salary = b.min_salary,
               a.max_salary = b.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);
    
    
    SELECt * FROM jobs_it;












    
    
    








