-- ���̺� ������ ��������
-- ���̺� ������ �������� (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: ���̺��� ���� �ĺ� �÷��Դϴ�. (�ֿ� Ű)
-- UNIQUE: ������ ���� ���� �ϴ� �÷� (�ߺ��� ����)
-- NOT NULL: null�� ������� ����.
-- FOREIGN KEY: �����ϴ� ���̺��� PRIMARY KEY�� �����ϴ� �÷�
-- CHECK: ���ǵ� ���ĸ� ����ǵ��� ���.


/*�̹��� ���������� �̿��Ͽ� ���̺��� ����� ����*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2) CONSTRAINT DEPT2_deptno_pk PRIMARY KEY,  /*CONSTRAINT ���� �ƹ��ų� ���� > ��Ű �ֱ�*/ 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT DEPT2_deptname_uk UNIQUE, /*NOT NULL�� ����ũ Ű�� ���������� �ɾ���.*/
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id), /*loca�÷��� �������� �ܷ�Ű�� ���� �����ǰ� �ִ�. �? locations���̺��� location_id�� ����. (����� �����̼�Ű�� �����̼�id�� �����̸Ӹ�Ű�� �Ǿ�����)*/
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);



