
SELECT * FROM emps; /*�纻���̺��� emps�� �̿��ؼ� ������ ���� �غ��� */

/* ����Ŀ�� ���� Ȯ�� */
SHOW AUTOCOMMIT;     
SET AUTOCOMMIT ON;   /*����Ŀ�� ��*/
SET AUTOCOMMIT OFF;  /*����Ŀ�� ����*/



INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (304, 'lee', 'lee1234@gmail.com', sysdate, 1800);

/*�μ�Ʈ�� �ߴµ� ����ϰ�;�. �׷���, �������� ��� ������ ��������� ���, ���� Ŀ�� �ܰ�� ȸ��(���ư���)�� Ʈ����� ���� */
ROLLBACK;


SELECT * FROM emps;



-------------------------------------------



/* SAVE POINT ���� > Oracle������ ����ϴ� �����̴�. */
/* �ѹ��� ����Ʈ�� ���� �̸��� �ٿ��� ����. */
/* ANSI ǥ�� ������ �ƴϱ� ������ �׷��� �����ϴ� ������ �ƴϴ�. */
SAVEPOINT insert_park; /*�̸��� �ٿ��� SAVEPOINT�� ���ߴ�.*/

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (305, 'park', 'park4321@gmail.com', sysdate, 1800);

ROLLBACK TO SAVEPOINT insert_park;


/*�������� ��� ������ ��������� ���������� �����ϸ鼭 Ʈ����� ��� */
/*Ŀ���� ���Ŀ��� ��� ����� ����ϴ��� �ǵ��� �� ����. */
COMMIT;








