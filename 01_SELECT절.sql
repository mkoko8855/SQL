-- SELECT * FROM employees; -- /*조회하겠다 > 사원정보를 저장해놓은 employees를*/
/*데이터조작어 : DML(SELECT, INSERT, UPDATE, DELETE)*/
/*데이터정의어 : DDL(CREATE, ALTER, DROP, RENAME, TRUNCATE)*/

/*한줄삭제 : Alt + Shift + D*/
/*한줄복사 : Ctrl + Shift + D*/




/*조회 : SELECT 컬럼명(여러개가능) FROM 테이블이름*/
SELECT
    *
FROM
    employees; /*EMPLOYESS 테이블에 모든 컬럼을 조회해줘*/

/*SQL관례 : 키워드는 대문자, 식별자를 소문자로 작성한다.*/

/*Ctrl + F7 = 관례대로 식을 바꿔준다. 이걸로 사용하자 */


--이번에는 내가 궁금한 것은 사원의 번호, 이름과 성만 궁금하다.--
--즉, 컬럼은 여러개 쓰는 것도 가능하다.--
SELECT employee_id, first_name, last_name
  FROM employees;


--컬럼 여러개 쓰는거 가능 : 이메일과 폰번호와 입사일이 궁금하다면?--
SELECT email, phone_number, hire_date
  FROM employees;

--컬럼을 조회하는 위치에서 사칙연산도 가능하다 * / + - 같은 것들. --
--조회를 할떄, 원래의 연봉과 커미션을 적용했을때의 연봉이 궁금해. 그럼어떻게해?--
--기존연봉의 0.1을 곱한 연봉을 더할 수도 있다.--
SELECT employee_id, first_name, last_name, salary, salary+salary*0.1
  FROM employees;

/*컬럼에 별칭을 붙여주는 방법 : alias(컬럼명이나 테이블명에 이름을 변경해서 조회한다.)*/
SELECT first_name AS 이름, last_name AS 성, salary AS 급여
  FROM employees;



/*
오라클은 홑따옴표로 문자를 표현하고, 문자열 안에
홑따옴표를 표현하고 싶다면 ''를 두번 연속으로 쓰면 된다.
문장을 연결하고 싶다면 ||를 사용한다.
*/
SELECT first_name || ' ' || last_name || '''s salary is $' || salary 
       AS 급여내역
  FROM employees;



/*DISTINCT (중복 행의 제거)*/
SELECT department_id
  FROM employees;
--부서가 몇갠지 궁금하다면?--
--중복 다 제거하면 부서ID의 종류들만 나오겠지?--
SELECT DISTINCT department_id
  FROM employees;





/* ROWNUM, ROWID > ROWNUM은 쿼리에 의해 반환되는 행 번호를 출력,
                   ROWID은 데이터베이스 내의 행의 주소를 반환한다.
*/
SELECT ROWNUM, ROWID, employee_id
FROM employees;




/*
NULL 값의 확인(숫자 0이나 공백이랑은 다른 존재이다.
NULL + 숫자 = NULL
집계 함수 계산시 NULL이 포함된 행은 집계에서 제외
해당되는 행이 없는 경우 SUM, AVG의 결과는 NULL
COUNT의 결과는 0
*/








