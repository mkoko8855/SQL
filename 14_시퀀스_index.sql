

/* 시퀀스 (순차적으로 증가하는 값을 만들어 주는 객체) */
/*객체니까 테이블과 뷰처럼 시퀀스도 CREATE로 생성을 하겠지 */

/*일단 시퀀스가 없을 때 불편한 점을 보자 */
CREATE TABLE DEPT3 (
    dept_no NUMBER(2),
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);
/*데이터도 마저 집어 넣어보자*/
INSERT INTO DEPT3
VALUES(1, 'test', 'test', sysdate);

/*조회해보자*/
SELECT *
FROM DEPT3;

/*
dept_no를 기본키로 지정하지 않았기 때문에 INSERT 한번 더때리면 중복이 된다.
그래서 우리는 다음 값을 인서트 해줄 때는 dept_no를 2번으로 올려줘야 한다.
*/
INSERT INTO DEPT3
VALUES(2, 'test', 'test', sysdate);
/*그 다음으로 할꺼면 계속 +1 해줘야 한다. */
INSERT INTO DEPT3
VALUES(3, 'test', 'test', sysdate);


/*이렇게 일일이 줄꺼면 시퀀스를 쓰자*/
/*테이블 삭제하고 기본키 줘서 다시 만들자*/
CREATE TABLE DEPT3 (
    dept_no NUMBER(2) PRIMARY KEY,
    dept_name VARCHAR2(14),
    loca VARCHAR2(13),
    dept_date DATE
);

/*이제 기본키줬으니 시퀀스로 하자(보통 기본키에 사용됨)*/
CREATE SEQUENCE dept3_seq
/* 시작 값을 뜻함 -> (기본값은 증가할 때 최소값, 감소할 때는 최대값)*/
    START WITH 1
/* 증가값을 뜻함 -> (양수면 증가, 음수면 감소이다. 기본값(INCREMENT안먹이면) 1씩 증가한다. */
    INCREMENT BY 1
/* MAXVALUE는 최대값을 뜻함 -> (기본값은 증가 1027, 감소일 때 -1) */
    MAXVALUE 10
/* MINVALUE는 최소값을 뜻함 -> (기본값은 증가 1, 감소일 때 -1028) */
    MINVALUE 1
/* 캐시메모리 사용 여부 (반대는 CACHE)*/
/* 번호를 올려줄 때 완벽한 데이터 값이라고 생각하면 쓰는게 이득이지만, 조금의 오류라도 있다 싶으면 그냥 노캐쉬 쓰는게 나음*/
    NOCACHE
/* 순환 여부. (NOCYCLE이 기본 값이고, 순환 시키려면 CYCLE이라고 지정하면 된다. */
    NOCYCLE; 
/*기본키의 시퀀스는 노싸이클로 지정해야 한다.*/



/*시퀀스 사용하기 (NEXTVAL, CURRVAL*/
INSERT INTO DEPT3
VALUES(dept3_seq.NEXTVAL, 'test', 'test', sysdate);


SELECT dept3_seq.CURRVAL 
FROM dual; /*현재값을 불러옴*/

/*이 상태에서 NEXTVAL 보내면 6....7....8...이런식이다.*/









/* 시퀀스  수정  */
/* START WITH(시작값은)는 수정이 불가능하다. */
ALTER SEQUENCE dept3_seq MAXVALUE 9999;  /*최대값 증가*/
ALTER SEQUENCE dept3_seq INCREMENT BY 10; /*증가값을 1이 아니라 10씩 증가하게.*/
/*10이 아니라 -1이면 1씩 내려가겠지. dept_no가.*/

ALTER SEQUENCE dept3_seq MINVALUE 0; /*최소값 변경*/




/* 이쯤되서 테이블 삭제 후, 다시 만들고(시퀀스값들이 망가졌을테니) 시퀀스 값을 다시 처음으로 돌리는 방법 */
SELECT dept3_seq.CURRVAL FROM dual;
/* 27일테니 1로 변경을 하기 위해 -26을 빼줘야겠지.*/
ALTER SEQUENCE dept3_seq INCREMENT BY -26; /*인크리먼트만 변경했기 떄문에 NEXTVAL까지 불러줘야 한다*/
/*NEXTVAL은 dual에 적용해야겠다.*/
SELECT dept3_seq.NEXTVAL FROM dual;
/*그럼 1이 된다. */
ALTER SEQUENCE dept3_seq INCREMENT BY 1;
/*1로 바꿔주는 과정까지 해줘야 1로 완벽하게 된다. 근데 그냥 지우고 다시 만드는게 낫다.*/

/*시퀀스를 지우고 다시 하는게 편하다..*/
DROP SEQUENCE dept3_seq;





-----------------------------------------------------------






/*
- index
index는 primary key, unique 제약 조건에서 자동으로 생성되고,
조회를 빠르게 해 주는 hint 역할을 합니다.
index는 조회를 빠르게 하지만, 무작위하게 많은 인덱스를 생성해서
사용하면 오히려 성능 부하를 일으킬 수 있습니다.
정말 필요할 때만 index를 사용하는 것이 바람직합니다.
*/


/* 일단 조회문 하나 써보자*/
SELECT * FROM employees WHERE salary = 12008;


/* 인덱스 추가 */
CREATE INDEX emp_salary_idx ON employees(salary);

/* 지울수도있다*/
DROP INDEX emp_salary_idx;





/* 시퀀스와 인덱스를 사용하는 hint 방법 */
/* 시퀀스도 만들고 테이블도 만들어서 데이터도 집어 넣고 INSERT 문자도 넣어보자 */

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


/* 힌트를 쓰려면 인덱스 이름을 직접 지목 해야 한다. */
/* 인덱스 이름 변경부터 할꺼야 */
ALTER INDEX SYS_C007048
RENAME TO tbl_board_idx;
/*이름 바꾼 후에, 다시 인서트 긴 문장들을 한 6번 엔터 ㄱㄱ*/

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




-- 문장주석인 /**/ 도 인덱스힌트 용으로도 많이 쓴다
-- /*+ INDEX(table_name index_name) */    
/*
위 문법이 지정된 인덱스를 강제로 쓰게끔 지정.
그리고 INDEX ASC 혹은 DECS 까지 추가해서 내림차, 오름차 순으로 쓰게끔 지정도 가능하다. 
*/
SELECT *
FROM
    (
   SELECT /*+ INDEX_DESC(tbl_board tbl_board_idx*/   /*이러면 직접 내림차순을 따로 정렬해서(오더바이) 로 할 필요가 없다. */
   ROWNUM AS rn,
   bno,
   writer
   FROM tbl_board
)
WHERE rn > 10 AND rn <= 20;





/*
- 인덱스가 권장되는 경우 
1. 컬럼이 WHERE 또는 조인조건에서 자주 사용되는 경우
2. 열이 광범위한 값을 포함하는 경우
3. 테이블이 대형인 경우
4. 타겟 컬럼이 많은 수의 null값을 포함하는 경우.
5번은 권장하지 않는 경우.
5. 테이블이 자주 수정되고, 이미 하나 이상의 인덱스를 가지고 있는 경우에는
   권장하지 않습니다.
*/