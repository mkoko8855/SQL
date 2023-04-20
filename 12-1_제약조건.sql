-- ���̺� ������ ��������
-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����.
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.


/*�̹��� ���������� �̿��Ͽ� ���̺��� ����� ���� (�÷� ���� ���� ���� > �÷� ���𸶴� ���������� ������ ��)*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2) CONSTRAINT DEPT2_deptno_pk PRIMARY KEY,  /*CONSTRAINT ���� �ƹ��ų� ���� > ��Ű �ֱ�*/ 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT DEPT2_deptname_uk UNIQUE, /*NOT NULL�� ����ũ Ű�� ���������� �ɾ���.*/
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id), /*loca�÷��� �������� �ܷ�Ű�� ���� �����ϰ� �ִ�. �? locations���̺��� location_id��. (����� �����̼�Ű�� �����̼�id�� �����̸Ӹ�Ű�� �Ǿ�����)*/
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);


DROP TABLE DEPT2;
/*���� DEPT2�� �ϴ� �ٽ� ������*/








/*�̹��� �÷� ������ �ƴ� ���̺� ���� ���� ���� ( ��� �� ���� �� ���������� ���ϴ� ��� )*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
    
    CONSTRAINT DEPT2_deptno_pk PRIMARY KEY(dept_no), /*�̹��� ��Ű �ڿ� ��������(�����) ���� ����� ��*/
    CONSTRAINT DEPT2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT DEPT2_dept_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id), /*��ī �ܷ�Ű�� locations�� location_id�� �����ϰ� �־� ��� ���ϰ� �ִ�.*/
    CONSTRAINT DEPT2_bonus_ck CHECK(dept_bonus > 0),
    CONSTRAINT DEPT2_gender_ck CHECK(dept_gender IN('M', 'F'))
);





/*�������ǵ��� �� �����ϴ��� �����͸� �ѹ� �־��*/
INSERT INTO DEPT2
VALUES(10, 'gg', 4000, 100000, 'M'); /*loca�κ� ���� �־��ַ��µ� 4000�� ������ ���. �ܷ�Ű�� �θ����̺�(�������̺�)�� ���ٸ� INSERT�� �ȵȴ�. ��, locations���̺� location_id���� 4õ�� ���� �����̴�.*/


INSERT INTO DEPT2
VALUES(10, 'hh', 1900, 100000, 'M'); /*1800�� �ȴ�. */


INSERT INTO DEPT2
VALUES(10, 'gg', 1900, 100000, 'M'); /*�⺻Ű�� ������ �ĺ��ڿ��߸� �Ѵ�. 10�̶�� ���� �� ������ �ȵȴ�. */



/*�ܷ�Ű�� INSERT�� �ƴ϶� UPDATE���� ������ ��ģ��.*/
UPDATE DEPT2
SET loca = 4000
WHERE dept_no = 10; /*loca�� 4õ���� ������ ���̴�. dept_no 10���� ����. > �׷��� �ȵȴ�. locations�� location_id�� 4õ�� ���ʿ� ���� �����̴�. */









/* ���� ���� ����*/
/* ���� ������ �߰�, ������ ���������� ������ ���� �ʴ´�.*/
/* �������� ���� ������ ����� ���ο� ������ �ٽ� �Ű���� �Ѵ�. 
��, �����ϰ� ���ο� �������� �߰��ؾ� �Ѵ�. */



/*�ϴ� ����ٽ�����*/
DROP TABLE dept2;



/*�׸��� �ϴ� �ٽ� ������*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

/*PK �߰�(���̺��� �����̰��� �׷��� ALTER�� ����Ѵ�) */
ALTER TABLE DEPT2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
/*FK �߰�*/
ALTER TABLE DEPT2 ADD CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id);
/*CHECK �߰�*/
ALTER TABLE DEPT2 ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));
/*unique �߰�*/
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

/*�׷���, NOT NULL�� �� ���� ���·� �����ؾ� �Ѵ�.*/
ALTER TABLE DEPT2 MODIFY dept_bonus NUMBER(10) NOT NULL;

/* ���� ���� ���� ( ���� ������ ���� ����� �̸�����. > ������ ���� �̸��� �ٴ� ���̴�)*/
ALTER TABLE DEPT2 DROP CONSTRAINT dept_no_pk;


/* ���� ���� Ȯ��*/
SELECT *
FROM user_constraints
WHERE table_name = 'DEPT2';






/*  ����  */
CREATE TABLE MEMBERS (
    M_NAME VARCHAR2(20) NOT NULL,
    M_NUM NUMBER CONSTRAINT mem_memnum_pk PRIMARY KEY,
    REG_DATE DATE NOT NULL CONSTRAINT mem_regdate_uk UNIQUE,
    GENDER CHAR(50),
    LOCA NUMBER CONSTRAINT mem_loca_loc_locid_fk REFERENCES locations(location_id)
);

INSERT INTO MEMBERS
VALUES('AAA', 1, '18-07-01', 'M', 1800);
INSERT INTO MEMBERS
VALUES('BBB', 2, '18-07-02', 'F', 1900);
INSERT INTO MEMBERS
VALUES('CCC', 3, '18-07-03', 'M', 2000);
INSERT INTO MEMBERS
VALUEs('DDD', 4, sysdate, 'M', 2000);

COMMIT;



/*���� 2*/
SELECT m.m_name, m.m_num, l.street_address, l.location_id
FROM MEMBERS m
JOIN LOCATIONS l
ON m.loca = l.location_id
ORDER BY m.m_num ASC;













