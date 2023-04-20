
/* ����� ���� Ȯ�ι� */
SELECT * FROM all_users;


/* ���� ���� ��� */
CREATE USER user1 IDENTIFIED BY user1;
/*hr������ ������ ������ ���� ����. */

/* �� �� ������ ���� �ַ� �;��Ѵ�. hr����..system(�Ƶ�system ���oracle)��������� */



/* ������ hr_pratice�� �ƴ϶� system�̴�. (�����ڸ� �ٲ���)*/
CREATE USER user1 IDENTIFIED BY user1; /*������ ���� �� �ִ�. */

/* �����쿡 sqlplus ģ ���� Run SQL Ŀ�ǵ���ο� ����
connect > user1 > ����� user1 > �׷��� ������ ���ٴ� ������ ���. �Ʒ��� ����
*/



/*
DCL : ������ ���� �ο� > GRANT(���� �ο�) REVOKE(���� ȸ��)

CREATE USER -> �����ͺ��̽� ���� ���� ����
CREATE SESSION -> �����ͺ��̽� ���� ����
CREATE TABLE -> ���̺� ���� ����
CREATE VIEW -> �� ���� ����
CREATE SEQUENCE -> ������ ���� ����
ALTER ANY TABLE -> ��� ���̺� ������ �� �ִ� ����
INSERT ANY TABLE -> ��� ���̺��� �����͸� �����ϴ� ����.
SELECT ANY TABLE...

SELECT ON [���̺� �̸�] TO [���� �̸�] -> Ư�� ���̺� ��ȸ�� �� �ִ� ����.
INSERT ON....
UPDATE ON....

- �����ڿ� ���ϴ� ������ �ο��ϴ� ����.
RESOURCE, CONNECT, DBA TO [���� �̸�]
*/



/* cmd���� ���� �ȵǴ°� ������ ���� */
GRANT CREATE SESSION TO user1;

/*�� ����, �ٽ� Run ���ñ� cmd�� ���� �ۼ� */
/* connect > user1 > user1*/


/* SELECT �� �� �ִ� ���ѵ� ��� �Ѵ� */
GRANT SELECT ON hr.employees TO user1;
/* �׷��� SELECT * FROM hr.employees; �� �Դ´�. */


/*cmd���� ���̺� ������*/
CREATE TABLE t_test (
bno NUMBER(3)
);

/* �� ������� �����̶�� ���. ���̺��� ������ �� �ִ� ������ �� ������ */
GRANT CREATE TABLE TO user1;

/*cmd���� �� ���̺� ����� ������ �ڵ� �ƴµ� �ٽ� ������ ����..*/

/*�ٽ� ������ ����Ѵ�..ġƮŰ��.*/
GRANT CONNECT, RESOURCE TO user1;

/*�ٽ� cmd���� ���̺� ����� �ڵ� creat>bno �� ������ ���������!!*/



/*
�׷� cmd���� CREATE SEQUENCE t_test_seq�� �Գ� ? ���Ѵ������ϱ�(ġƮŰ).
�׷� �����嵵 ���������!!
*/


/* REVOKE CONNECT, RESOURCE FROM user1; �� ������ �ȴ�. */
REVOKE CONNECT, RESOURCE FROM user1;



/* ����� ���� ������ �����ϴ�. */
DROP USER user1;  /* ������ ����. ���� ������ �������̱� �����̴�. cmd���� ������� �Ѵ�. */

/* cmd���� exit������ �ȴ�. */
/* 
user1�� ������ �ִ� ��ü�� �ϳ� �̻��̴� ��� ���̴�.
user1���� ���̺�, �������� ��������µ� �̰͵��� �ִ� �̻� ������ �ȵȴٴ� ���̴�. 
*/

/*DROP USER [�����̸�] CASCADE */
/*���� CASCADE�� ���� ��, ���̺� or ������ �� ��ü�� �����Ѵٸ� ���� ���� �Ұ�. */
DROP USER user1 CASCADE;  /*CASCADE �ٿ���� ������ ������ �ȴ�. */




/*
���̺� �����̽��� �����ͺ��̽� ��ü �� ���� �����Ͱ� ����Ǵ� �����Դϴ�.
���̺� �����̽��� �����ϸ� ������ ��ο� ���� ���Ϸ� ������ �뷮��ŭ��
������ ������ �ǰ�, �����Ͱ� ���������� ����˴ϴ�.
�翬�� ���̺� �����̽��� �뷮�� �ʰ��Ѵٸ� ���α׷��� ������������ �����մϴ�.
*/



SELECT * FROM dba_tablespaces;
/* ����ٰ� ������ ���� �����ؼ� �츮�� ���� ���̺� �����̽��� �����غ��� */
CREATE USER test1 IDENTIFIED BY test1;

/*���ѵ� �� ���� */
GRANT CREATE SESSION TO test1;

/*�׳� ��� ���� �� ����*/
GRANT CONNECT, RESOURCE TO test1;


/* USER_TABLESPACE ��� ���̺� �����̽��� �⺻ ��� �������� ������ �� �ִ�. */
ALTER USER test1 DEFAULT TABLESPACE user_tablespace
QUOTA UNLIMITED ON user_tablespace;




/*test1 �������� ���̺��� �����ϰ� �����غ��� */
/* test1���� �����غ��� Run cmd����*/



/* ���̺� �����̽� ���� ��ü�� ��ü �����ϴ� �� */
DROP TABLESPACE user_tablesapce INCLUDING CONTENTS;



/*������ ���ϱ��� �� ���� �����ϴ� ��*/
DROP TABLESPACE user_tablesapce INCLUDING CONTENTS AND DATAFILES;


