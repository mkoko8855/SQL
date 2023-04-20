
/* 사용자 계정 확인법 */
SELECT * FROM all_users;


/* 계정 생성 명령 */
CREATE USER user1 IDENTIFIED BY user1;
/*hr계정은 계정을 생성할 수는 없다. */

/* 좀 더 권한이 높은 애로 와야한다. hr말고..system(아디system 비번oracle)만들어주자 */



/* 지금은 hr_pratice가 아니라 system이다. (관리자명 바꿨음)*/
CREATE USER user1 IDENTIFIED BY user1; /*이제는 만들 수 있다. */

/* 윈도우에 sqlplus 친 다음 Run SQL 커맨드라인에 들어가서
connect > user1 > 비번도 user1 > 그러면 권한이 없다는 오류가 뜻다. 아래로 가자
*/



/*
DCL : 데이터 권한 부여 > GRANT(권한 부여) REVOKE(권한 회수)

CREATE USER -> 데이터베이스 유저 생성 권한
CREATE SESSION -> 데이터베이스 접속 권한
CREATE TABLE -> 테이블 생성 권한
CREATE VIEW -> 뷰 생성 권한
CREATE SEQUENCE -> 시퀀스 생성 권한
ALTER ANY TABLE -> 어떠한 테이블도 수정할 수 있는 권한
INSERT ANY TABLE -> 어떠한 테이블에도 데이터를 삽입하는 권한.
SELECT ANY TABLE...

SELECT ON [테이블 이름] TO [유저 이름] -> 특정 테이블만 조회할 수 있는 권한.
INSERT ON....
UPDATE ON....

- 관리자에 준하는 권한을 부여하는 구문.
RESOURCE, CONNECT, DBA TO [유저 이름]
*/



/* cmd에서 권한 안되는걸 권한을 주자 */
GRANT CREATE SESSION TO user1;

/*그 다음, 다시 Run 뭐시기 cmd로 가서 작성 */
/* connect > user1 > user1*/


/* SELECT 할 수 있는 권한도 줘야 한다 */
GRANT SELECT ON hr.employees TO user1;
/* 그러면 SELECT * FROM hr.employees; 가 먹는다. */


/*cmd에서 테이블 만들어보자*/
CREATE TABLE t_test (
bno NUMBER(3)
);

/* 또 불충분한 권한이라고 뜬다. 테이블을 생성할 수 있는 권한을 또 써주자 */
GRANT CREATE TABLE TO user1;

/*cmd가서 또 테이블 만드는 위에꺼 코드 쳤는데 다시 에러가 떴어..*/

/*다시 권한을 줘야한다..치트키다.*/
GRANT CONNECT, RESOURCE TO user1;

/*다시 cmd가서 테이블 만드는 코드 creat>bno 꺼 적으면 만들어진다!!*/



/*
그럼 cmd에서 CREATE SEQUENCE t_test_seq도 먹나 ? 권한다줬으니까(치트키).
그럼 시퀀드도 만들어졌다!!
*/


/* REVOKE CONNECT, RESOURCE FROM user1; 를 적으면 된다. */
REVOKE CONNECT, RESOURCE FROM user1;



/* 사용자 계정 삭제도 가능하다. */
DROP USER user1;  /* 에러가 난다. 지금 계정이 접속중이기 떄문이다. cmd에서 나가줘야 한다. */

/* cmd에서 exit누르면 된다. */
/* 
user1이 가지고 있는 객체가 하나 이상이다 라는 것이다.
user1으로 테이블, 시퀀스를 만들었었는데 이것들이 있는 이상 삭제가 안된다는 것이다. 
*/

/*DROP USER [유저이름] CASCADE */
/*만약 CASCADE가 없을 시, 테이블 or 시퀀스 등 객체가 존재한다면 계정 삭제 불가. */
DROP USER user1 CASCADE;  /*CASCADE 붙여줘야 완전히 삭제가 된다. */




/*
테이블 스페이스는 데이터베이스 객체 내 실제 데이터가 저장되는 공간입니다.
테이블 스페이스를 생성하면 지정된 경로에 실제 파일로 정의한 용량만큼의
파일이 생성이 되고, 데이터가 물리적으로 저장됩니다.
당연히 테이블 스페이스의 용량을 초과한다면 프로그램이 비정상적으로 동작합니다.
*/



SELECT * FROM dba_tablespaces;
/* 여기다가 빠르게 계정 생성해서 우리가 만든 테이블 스페이스를 지정해보자 */
CREATE USER test1 IDENTIFIED BY test1;

/*권한도 좀 주자 */
GRANT CREATE SESSION TO test1;

/*그냥 모든 권한 다 주자*/
GRANT CONNECT, RESOURCE TO test1;


/* USER_TABLESPACE 라는 테이블 스페이스를 기본 사용 공간으로 지정할 수 있다. */
ALTER USER test1 DEFAULT TABLESPACE user_tablespace
QUOTA UNLIMITED ON user_tablespace;




/*test1 계정으로 테이블을 간단하게 생성해보자 */
/* test1으로 접속해보자 Run cmdㄱㄱ*/



/* 테이블 스페이스 내의 객체를 전체 삭제하는 법 */
DROP TABLESPACE user_tablesapce INCLUDING CONTENTS;



/*물리적 파일까지 한 번에 삭제하는 법*/
DROP TABLESPACE user_tablesapce INCLUDING CONTENTS AND DATAFILES;


