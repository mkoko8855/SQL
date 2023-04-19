
/* DDL 을 사용해보자~ */


/* NUMBER(2)  ->  2자리 정수를 뜻한다. 즉, 정수를 2자리까지 저장할 수 있는 숫자형 타입. */
/* NUMBER(5, 2) -> 정수부, 실수부를 합친 총 자리수가 5자리이고, 소수점은 2자리까지 저장이 가능하다. */
/* NUMBER() -> 괄호를 생략할 시에는 (38, 0)으로 자동 지정이 된다. */
/* VARCHAR2(byte) -> 괄호 안에 들어올 문자열의 최대 길이를 지정. (4000byte까지) */
/* CLOB -> 대용량 텍스트 데이터 타입 (최대 4Gbye까지) */
/* BLOB -> 이진형 대용량 객체 (이미지, 파일 저장 시 사용) */
/* DATE -> BC 4712년 1월 1일 부터 AD 9999년 12월 31일까지 지정이 가능하다. */
/* 시, 분, 초 지원 가능.*/



/* DDL을 사용하여 테이블을 만들자 */
CREATE TABLE DEPT2 (
    /*여기엔 테이블의 구조를 설명하자. 컬럼이 뭐가있는지, 무슨 타입인지..*/
    dept_no NUMBER(2), /*얘한테 값집어넣을떈 40은되는데 400은안된다. 2자리까지니까.*/
    dept_name VARCHAR2(14),
    loca VARCHAR2(15),
    dept_date DATE,
    dept_bonus NUMBER(10) /*200은되는데 200억은안된다.*/
);

/*참고로 DDL문은 트랜잭션 범위에 포함되지 않아서 ROLLBACK이 되지 않는다.*/



/*데이터를 한번 집어넣어보자*/
INSERT INTO DEPT2
VALUES(30, '', '서울', sysdate, 2000000000);







/*테이블을 만들었는데 컬럼 하나 더늘껄..하는마음이라면

테이블 구조를 바꾸자 (컬럼추가)

CREATE로 만들었으면 ALTER를 쓰자
*/
ALTER TABLE DEPT2
ADD (dept_count NUMBER(3));



/*아 이번엔 방금 추가했던 dept_count말고 다른 이름을 쓰고 싶다면? */
/* 열(컬럼)이름(명) 변경*/
ALTER TABLE DEPT2
RENAME COLUMN dept_count TO emp_count;




/*이번엔 열 속성을 수정하고싶다면? > NUMBER(3)였는데 생각해보니 (4)로 해야할꺼같다면? */
ALTER TABLE DEPT2
MODIFY (emp_count NUMBER(4));





ALTER TABLE DEPT2
MODIFY (dept_name VARCHAR2(20));  /*기존 dept_name이 바차14였는데 바차20으로 바꿨다~*/
/*근데 이걸 다시 dept_name의 타입을 NUMBER로 바꾸겠다? 이건 안된다. 넘버타입은 숫자만 가능하기 떄문인데 이미 dept_name에는 문자열이 들어가 있기 때문이다.*/
/*즉, 만약 변경하고자 하는 컬럼에 데이터가 이미 존재한다면 그에 맞는 타입으로 변경해줘야 한다. 맞지 않는 타입으로는 변경이 불가능하다. */




/*열 삭제를 하고 싶다면?*/
/*아까 추가한 emp_count를 지우고 싶다면*/
ALTER TABLE DEPT2
DROP COLUMN emp_count;





/* 테이블 이름도 변경이 가능하다. */
ALTER TABLE DEPT2
RENAME TO DEPT3;




/* 테이블 삭제 */
/* (구조는 남겨두고 내부 데이터만 모두 삭제 (테이블이 없어진 건 아님) */
TRUNCATE TABLE DEPT3;

DROP TABLE DEPT3;
SELECT * FROM DEPT3; /*테이블이 없으니 오류창나옴~*/

/*롤백 진행해도 테이블을 찾을 수가 없다~ 드랍썼으니까*/












