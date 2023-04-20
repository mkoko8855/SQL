/*

VIEW�� �������� �ڷḸ ���� ���� ����ϴ� ���� ���̺��� �����̴�. 

��� �⺻ ���̺�� ������ ���� ���̺��̱� ������

�ʿ��� �÷��� ������ �θ� ������ ����������. 

��� ���� ���̺��, ���� �����Ͱ� ���������� ����� ���´� �ƴϴ�.

�並 ���ؼ� �����Ϳ� �����ϸ� ���� �����ʹ� �����ϰ� ��ȣ�� �� �ִ�.
*/


/*
�並 ����� ���ؼ��� ������ �ִ�. ������ ��� ��Դ� ���� �� ������..
*/
SELECT *
FROM user_sys_privs; /*������ ������ Ȯ���� �� �ִ� ���̺��̴�. ����� �ƴ϶� �����Ǵ� ���̺��̴�. */





/*�� ����� ���� ����� �ʴ�. */

/* �ܼ� ��
���� �÷� �̸��� �Լ� ���� ����ǥ�����̸� �ȵȴ�.
*/
SELECT employee_id, first_name || ' ' || last_name, job_id, salary
FROM employees
WHERE department_id = 60;
/* �� ������� ���� ���̺� �ϳ� ������ > �� ������ �並 ����� ���� */


/*�䵵 CREATE�� �����Ѵ�.*/
CREATE VIEW view_emp AS (
    /*������� �ϴ� ���� ������ �ۼ����ָ� �ȴ�.*/
    SELECT employee_id, first_name || ' ' || last_name, job_id, salary /*�̰Ǿȵ�, �ݵ�� Ȯ���ϰ� �̸������ �Ѵ�. ��Ĺ,lower �̷��� ��Ī�� �ٿ� ��Ȯ�� �÷����� ��� ����� �Ѵ�. */
    FROM employees
    WHERE department_id = 60
);


/*���� ���� �ܼ� �並 �����غ���*/
CREATE VIEW view_emp AS (
    /*������� �ϴ� ���� ������ �ۼ����ָ� �ȴ�.*/
    SELECT employee_id, first_name || ' ' || last_name AS name, job_id, salary
    FROM employees
    WHERE department_id = 60
);

/*������� �ܼ� �並 Ȯ���غ���*/
SELECT *
FROM view_emp;




/* 
������ ���� �� �̴�.

���� ���̺��� �����Ͽ� �ʿ��� �����͸� �����ϰ� ���� Ȯ���� ���� ����Ѵ�.

��, �ܼ� ����� �������� ������ �ǰڴ�.
*/

/*�׷�, ���ι��� �̿��Ͽ� ���� �並 ����� �غ���*/
CREATE VIEW view_emp_dept_jobs AS ( /*���̺�3�����ΰ���� ��� ������ �ϴ±���~*/
    SELECT 
    e.employee_id, first_name || ' ' || last_name AS name,
    d.department_name, j.job_title /*�ʿ��� �͵鸸 �̾Ƽ� ��� ����ڴ�!*/
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id  /*������ �ܷ�Ű, ������ ��Ű ��, ���� �������� �� �� �ְڴ�.*/
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id ASC;
/*�丸��� ������ ���� ���� Ȱ���� �� ������..Ȱ���� ������ �ۼ��ϱ� ����ϱ� ��� ����� ���̴�*/

/*��������� ��ȸ �غ���*/
SELECT * FROM view_emp_dept_jobs;







/* �÷��� �߰� �ϰ� �ʹٸ�, ������ ���� ������ �� �ִ�. */
/* ���� ���� > (CREATE OR REPLACE VIEW ����) */
/* ���� �̸����� �ش� ������ ����ϸ� �����Ͱ� ����Ǹ鼭 ���Ӱ� �����ȴ�. */
/* salary �÷��� �߰��غ��� */
CREATE OR REPLACE VIEW view_emp_dept_jobs AS ( 
    SELECT 
    e.employee_id, first_name || ' ' || last_name AS name,
    d.department_name, j.job_title, e.salary /*e.salary�� ���� �־����.*/
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id 
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id ASC;
/*�׷���, �����Ǿ����� ������ ������ �ٲ�鼭 �������� �� �� �ִ�. */


SELECT
    job_title, AVG(salary)
FROM view_emp_dept_jobs
GROUP BY job_title /*�� Ÿ��Ʋ���� �׷��� �����ʹ�*/
ORDER BY AVG(salary) DESC;
/*���� ������� ������ �ؾ� �Ǵµ�, �����̺� ���� ������ �� ���´� �Ƚᵵ �ȴ�. */
/*SQL���� Ȯ���� ª������ �� �� �ִ�. */





/* �� ����(CREATE �� ��������� DROP���� */
DROP VIEW view_emp;





/* 
�׷� �信 �����͸� ���� �ִ� ���� �����ұ�? 
VIEW�� INSERT�� �Ͼ�� ���, ����(����) ���̺��� �ݿ��� �Ǳ� ������
�׷��� VIEW�� INSERT, UPDATE, DELETE�� ���� ���� ������ ������.
���� ���̺��� NOT NULL�� ���, VIEW���� INSERT�� �Ұ����ϴ�.
�׸���, VIEW���� ����ϴ� �÷��� ���� �÷��� ��쿡�� INSERT�� �ȵȴ�(�μ�Ʈ �� �� �ƴϴ�).
*/


INSERT INTO view_emp_dept_jobs
VALUES(300, 'test', 'test', 'test', 10000); 
/*�� ���� ����. ���� �÷����� INSERT�� ������ �ʴ´�.*/
/*view_emp_dept_jobs�� �ι�° �÷��� name�̶�� �÷��� ù�̸�+����+���̸��� ��ģ ���ε�, ������ �̰� ���ݾ�. �׷��� ���ִ´�. first_name�̵� last_name�̵� �ϳ��� ������ �ֱ� �����̴�..*/
/*��, �� ��° �÷��� name�� ���� Ŀ���̱� ������ INSERT�� �ȵȴ�. */


/*�׷��ٸ� ������*/
INSERT INTO view_emp_dept_jobs
(employee_id, department_name, job_title, salary)
VALUES(300, 'test', 'test', 10000); 
/*�̰͵� ������. JOIN�� �� �信���� �� ���� ������ �� ����. */
/* �� �÷����� ���� �ٸ� ���̺��� �÷����̱� ������ ������ �� �����̴�. */


/* �׷� employees ���� INSERT�� �غ��� */
INSERT INTO view_emp
(employee_id, job_id, salary)
VALUES(300, 'test', 10000);
/* ���� �÷��̾��� first+lastname�� ���� �ϰ� INSERT�� ������ ���� not null�̶� �̰͵� ������.*/
/* ��, ���� ���̺���  NULL�� ������� �ʴ� �÷� ������ �� �� ����. */




/* 
WITH CHECK OPTION   ->  ���� ���� �÷�
��, ���ǿ� ���Ǿ��� �÷����� �並 ���ؼ� ������ �� ���� ���ִ� Ű�����̴�.
*/

/*WITH CHECK �ɼ� ���� �ʰ� �ϴ� �並 �ϳ� �����غ��� -> ó���̸� ����, ������ ������ ���� ���ش�! */
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT 
        employee_id, first_name, last_name, email, hire_date, job_id, department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck; /*�̰� üũ�ɼ��� �̸��� ���. �޷յ� �ǰ���*/

/*�並 �̿��ؼ� ������ �����غ���(UPDATE) -> department_id*/
UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 105; /*105���� ����� department_id�� 100���� ������ ���̴�.*/
/*�׷��� �̷����ϸ� department_id�� �������̺� ������ ���ϱ� ��������*/
/*�並 ������� �� (���ΰ���)�� �������� department_id�� �ٲ�� �ȵȴٰ� ���������
�̷��� �Ǹ�, department_id(����������)�� �÷��� ���� �����Ϸ� �ϸ� �����ش�.*/

UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 106; /*������ �ٲ��� �ʴ´�. �� üũ �ɼ��� ��� �����̴�.*/




/* ������ �ɾ��ֱ� ������. ���� �μ�Ʈ, ������Ʈ, ����Ʈ ��ü�� �ȵ����� ���ھ�. -> �б� ���� ��(DML ���� ��ü�� ���´�) -> SELECT�� ����Ѵ�. */
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT 
        employee_id, first_name, last_name, email, hire_date, job_id, department_id
    FROM employees
    WHERE department_id = 60
)
WITH READ ONLY;

/*����¸��� �Դ��� Ȯ���غ���*/
UPDATE view_emp_test
SET job_id = 'text'
WHERE employee_id = 106; /*�ȵȴ�~*/


