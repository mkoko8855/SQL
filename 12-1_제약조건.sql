-- 테이블 생성과 제약조건
-- 테이블 열레벨 제약조건 (PRIMARY KEY, UNIQUE, NOT NULL, FOREIGN KEY, CHECK)
-- PRIMARY KEY: 테이블의 고유 식별 컬럼입니다. (주요 키)
-- UNIQUE: 유일한 값을 갖게 하는 컬럼 (중복값 방지)
-- NOT NULL: null을 허용하지 않음.
-- FOREIGN KEY: 참조하는 테이블의 PRIMARY KEY를 저장하는 컬럼
-- CHECK: 정의된 형식만 저장되도록 허용.


/*이번엔 제약조건을 이용하여 테이블을 만들어 보자 (컬럼 레벨 제약 조건 > 컬럼 선언마다 제약조건을 지정한 것)*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2) CONSTRAINT DEPT2_deptno_pk PRIMARY KEY,  /*CONSTRAINT 다음 아무거나 별명 > 주키 주기*/ 
    dept_name VARCHAR2(14) NOT NULL CONSTRAINT DEPT2_deptname_uk UNIQUE, /*NOT NULL과 유니크 키의 제약조건을 걸었다.*/
    loca NUMBER(4) CONSTRAINT dept2_loca_locid_fk REFERENCES locations(location_id), /*loca컬럼은 제약조건 외래키에 의해 참조하고 있다. 어떤? locations테이블의 location_id을. (참고로 로케이션키의 로케이션id가 프라이머리키로 되어있음)*/
    dept_bonus NUMBER(10) CONSTRAINT dept2_bonus_ck CHECK(dept_bonus > 0),
    dept_gender VARCHAR2(1) CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'))
);


DROP TABLE DEPT2;
/*만든 DEPT2를 일단 다시 지우자*/








/*이번엔 컬럼 레벨이 아닌 테이블 레벨 제약 조건 ( 모든 열 선언 후 제약조건을 취하는 방식 )*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1),
    
    CONSTRAINT DEPT2_deptno_pk PRIMARY KEY(dept_no), /*이번엔 주키 뒤에 누구인지(어딘지) 말을 해줘야 함*/
    CONSTRAINT DEPT2_deptname_uk UNIQUE(dept_name),
    CONSTRAINT DEPT2_dept_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id), /*로카 외래키는 locations의 location_id를 참조하고 있어 라고 말하고 있다.*/
    CONSTRAINT DEPT2_bonus_ck CHECK(dept_bonus > 0),
    CONSTRAINT DEPT2_gender_ck CHECK(dept_gender IN('M', 'F'))
);





/*제약조건들이 잘 동작하는지 데이터를 한번 넣어보자*/
INSERT INTO DEPT2
VALUES(10, 'gg', 4000, 100000, 'M'); /*loca부분 값을 넣어주려는데 4000은 에러가 뜬다. 외래키가 부모테이블(참조테이블)에 없다면 INSERT가 안된다. 즉, locations테이블에 location_id에는 4천이 없기 떄문이다.*/


INSERT INTO DEPT2
VALUES(10, 'hh', 1900, 100000, 'M'); /*1800은 된다. */


INSERT INTO DEPT2
VALUES(10, 'gg', 1900, 100000, 'M'); /*기본키는 고유한 식별자여야만 한다. 10이라는 값을 또 넣으면 안된다. */



/*외래키는 INSERT뿐 아니라 UPDATE에도 영향을 미친다.*/
UPDATE DEPT2
SET loca = 4000
WHERE dept_no = 10; /*loca를 4천으로 변경할 것이다. dept_no 10번인 것을. > 그러나 안된다. locations의 location_id에 4천은 애초에 없기 떄문이다. */









/* 제약 조건 변경*/
/* 제약 조건은 추가, 삭제가 가능하지만 변경은 되지 않는다.*/
/* 변경기능이 없기 떄문에 지우고 새로운 것으로 다시 매겨줘야 한다. 
즉, 삭제하고 새로운 내용으로 추가해야 한다. */



/*일단 드랍다시하자*/
DROP TABLE dept2;



/*그리고 일단 다시 만들자*/
CREATE TABLE DEPT2 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14) NOT NULL,
    loca NUMBER(4),
    dept_bonus NUMBER(10),
    dept_gender VARCHAR2(1)
);

/*PK 추가(테이블의 변경이겟지 그래서 ALTER를 사용한다) */
ALTER TABLE DEPT2 ADD CONSTRAINT dept_no_pk PRIMARY KEY(dept_no);
/*FK 추가*/
ALTER TABLE DEPT2 ADD CONSTRAINT dept2_loca_locid_fk FOREIGN KEY(loca) REFERENCES locations(location_id);
/*CHECK 추가*/
ALTER TABLE DEPT2 ADD CONSTRAINT dept2_gender_ck CHECK(dept_gender IN('M', 'F'));
/*unique 추가*/
ALTER TABLE dept2 ADD CONSTRAINT dept2_deptname_uk UNIQUE(dept_name);

/*그러나, NOT NULL은 열 수정 형태로 변경해야 한다.*/
ALTER TABLE DEPT2 MODIFY dept_bonus NUMBER(10) NOT NULL;

/* 제약 조건 삭제 ( 제약 조건을 만들 당시의 이름으로. > 지목을 위해 이름을 다는 것이다)*/
ALTER TABLE DEPT2 DROP CONSTRAINT dept_no_pk;


/* 제약 조건 확인*/
SELECT *
FROM user_constraints
WHERE table_name = 'DEPT2';






/*  문제  */
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



/*문제 2*/
SELECT m.m_name, m.m_num, l.street_address, l.location_id
FROM MEMBERS m
JOIN LOCATIONS l
ON m.loca = l.location_id
ORDER BY m.m_num ASC;













