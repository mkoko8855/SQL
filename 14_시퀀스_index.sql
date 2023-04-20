

/* ������ (���������� �����ϴ� ���� ����� �ִ� ��ü) */
/*��ü�ϱ� ���̺�� ��ó�� �������� CREATE�� ������ �ϰ��� */

/*�ϴ� �������� ���� �� ������ ���� ���� */
CREATE TABLE DEPT3 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);
/*�����͵� ���� ���� �־��*/
INSERT INTO DEPT3
VALUES(1, 'test', 'test', sysdate);

/*��ȸ�غ���*/
SELECT *
FROM DEPT3;

/*
dept_no�� �⺻Ű�� �������� �ʾұ� ������ INSERT �ѹ� �������� �ߺ��� �ȴ�.
�׷��� �츮�� ���� ���� �μ�Ʈ ���� ���� dept_no�� 2������ �÷���� �Ѵ�.
*/
INSERT INTO DEPT3
VALUES(2, 'test', 'test', sysdate);
/*�� �������� �Ҳ��� ��� +1 ����� �Ѵ�. */
INSERT INTO DEPT3
VALUES(3, 'test', 'test', sysdate);


/*�̷��� ������ �ٲ��� �������� ����*/
/*���̺� �����ϰ� �⺻Ű �༭ �ٽ� ������*/
CREATE TABLE DEPT3 (
    dept_no NUMBER(2) PRIMARY KEY,
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

/*���� �⺻Ű������ �������� ����(���� �⺻Ű�� ����)*/
CREATE SEQUENCE dept3_seq
/* ���� ���� ���� -> (�⺻���� ������ �� �ּҰ�, ������ ���� �ִ밪)*/
    START WITH 1
/* �������� ���� -> (����� ����, ������ �����̴�. �⺻��(INCREMENT�ȸ��̸�) 1�� �����Ѵ�. */
    INCREMENT BY 1
/* MAXVALUE�� �ִ밪�� ���� -> (�⺻���� ���� 1027, ������ �� -1) */
    MAXVALUE 10
/* MINVALUE�� �ּҰ��� ���� -> (�⺻���� ���� 1, ������ �� -1028) */
    MINVALUE 1
/* ĳ�ø޸� ��� ���� (�ݴ�� CACHE)*/
/* ��ȣ�� �÷��� �� �Ϻ��� ������ ���̶�� �����ϸ� ���°� �̵�������, ������ ������ �ִ� ������ �׳� ��ĳ�� ���°� ����*/
    NOCACHE
/* ��ȯ ����. (NOCYCLE�� �⺻ ���̰�, ��ȯ ��Ű���� CYCLE�̶�� �����ϸ� �ȴ�. */
    NOCYCLE; 
/*�⺻Ű�� �������� �����Ŭ�� �����ؾ� �Ѵ�.*/



/*������ ����ϱ� (NEXTVAL, CURRVAL*/
INSERT INTO DEPT3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);


SELECT dept3_seq.CURRVAL 
FROM dual; /*���簪�� �ҷ���*/

/*�� ���¿��� NEXTVAL ������ 6....7....8...�̷����̴�.*/









/* ������  ����  */
/* START WITH(���۰���)�� ������ �Ұ����ϴ�. */
ALTER SEQUENCE dept3_seq MAXVALUE 9999;  /*�ִ밪 ����*/
ALTER SEQUENCE dept3_seq INCREMENT BY 10; /*�������� 1�� �ƴ϶� 10�� �����ϰ�.*/
/*10�� �ƴ϶� -1�̸� 1�� ����������. dept_no��.*/

ALTER SEQUENCE dept3_seq MINVALUE 0; /*�ּҰ� ����*/




/* ����Ǽ� ���̺� ���� ��, �ٽ� �����(������������ ���������״�) ������ ���� �ٽ� ó������ ������ ��� */
SELECT dept3_seq.CURRVAL FROM dual;
/* 27���״� 1�� ������ �ϱ� ���� -26�� ����߰���.*/
ALTER SEQUENCE dept3_seq INCREMENT BY -26; /*��ũ����Ʈ�� �����߱� ������ NEXTVAL���� �ҷ���� �Ѵ�*/
/*NEXTVAL�� dual�� �����ؾ߰ڴ�.*/
SELECT dept3_seq.NEXTVAL FROM dual;
/*�׷� 1�� �ȴ�. */
ALTER SEQUENCE dept3_seq INCREMENT BY 1;
/*1�� �ٲ��ִ� �������� ����� 1�� �Ϻ��ϰ� �ȴ�. �ٵ� �׳� ����� �ٽ� ����°� ����.*/

/*�������� ����� �ٽ� �ϴ°� ���ϴ�..*/
DROP SEQUENCE dept3_seq;





-----------------------------------------------------------






/*
- index
index�� primary key, unique ���� ���ǿ��� �ڵ����� �����ǰ�,
��ȸ�� ������ �� �ִ� hint ������ �մϴ�.
index�� ��ȸ�� ������ ������, �������ϰ� ���� �ε����� �����ؼ�
����ϸ� ������ ���� ���ϸ� ����ų �� �ֽ��ϴ�.
���� �ʿ��� ���� index�� ����ϴ� ���� �ٶ����մϴ�.
*/


/* �ϴ� ��ȸ�� �ϳ� �Ẹ��*/
SELECT * FROM employees WHERE salary = 12008;


/* �ε��� �߰� */
CREATE INDEX emp_salary_idx ON employees(salary);

/* ��������ִ�*/
DROP INDEX emp_salary_idx;





/* �������� �ε����� ����ϴ� hint ��� */
/* �������� ����� ���̺� ���� �����͵� ���� �ְ� INSERT ���ڵ� �־�� */

CREATE SEQUENCE board_seq
    START WITH 1
    INCREMENT BY 1
    NOCACHE
    NOCYCLE;
    
CREATE TABLE tbl_board(
    bno NUMBER(10) PRIMARY KEY,
    writer VARCHAR2(20)
);

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'test');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'admin');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'hong');

INSERT INTO tbl_board
VALUES(board_seq.NEXTVAL, 'kim');

SELECT * FROM tbl_board;

COMMIT;


/* ��Ʈ�� ������ �ε��� �̸��� ���� ���� �ؾ� �Ѵ�. */
/* �ε��� �̸� ������� �Ҳ��� */
ALTER INDEX SYS_C007048
RENAME TO tbl_board_idx;
/*�̸� �ٲ� �Ŀ�, �ٽ� �μ�Ʈ �� ������� �� 6�� ���� ����*/

SELECT *
FROM
    (
    SELECT ROWNUM AS rn, a.*
    FROM
    (
    SELECT *
    FROM tbl_board
    ORDER BY bno DESC
    ) a
)
WHERE rn > 10 AND rn <= 20;




-- �����ּ��� /**/ �� �ε�����Ʈ �����ε� ���� ����
-- /*+ INDEX(table_name index_name) */    
/*
�� ������ ������ �ε����� ������ ���Բ� ����.
�׸��� INDEX ASC Ȥ�� DECS ���� �߰��ؼ� ������, ������ ������ ���Բ� ������ �����ϴ�. 
*/
SELECT *
FROM
    (
   SELECT /*+ INDEX_DESC(tbl_board tbl_board_idx*/   /*�̷��� ���� ���������� ���� �����ؼ�(��������) �� �� �ʿ䰡 ����. */
   ROWNUM AS rn,
   bno,
   writer
   FROM tbl_board
)
WHERE rn > 10 AND rn <= 20;





/*
- �ε����� ����Ǵ� ��� 
1. �÷��� WHERE �Ǵ� �������ǿ��� ���� ���Ǵ� ���
2. ���� �������� ���� �����ϴ� ���
3. ���̺��� ������ ���
4. Ÿ�� �÷��� ���� ���� null���� �����ϴ� ���.
5���� �������� �ʴ� ���.
5. ���̺��� ���� �����ǰ�, �̹� �ϳ� �̻��� �ε����� ������ �ִ� ��쿡��
   �������� �ʽ��ϴ�.
*/