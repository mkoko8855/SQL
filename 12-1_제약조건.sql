-- 테이블 생성과 제약조건
-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키)
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음.
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.


/*이번엔 제약조건을 이용하여 테이블을 만들어 보자*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2) CONSTRAINT DEPT2_deptno_pk PRIMARY KEY,  /*CONSTRAINT 다음 아무거나 별명 > 주키 주기*/ 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT DEPT2_deptname_uk UNIQUE, /*NOT NULL과 유니크 키의 제약조건을 걸었다.*/
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id), /*loca컬럼은 제약조건 외래키에 의해 참조되고 있다. 어떤? locations테이블의 location_id에 의해. (참고로 로케이션키의 로케이션id가 프라이머리키로 되어있음)*/
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);



