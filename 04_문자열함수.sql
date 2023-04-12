/* lower(소문자), initcap(앞글자만 대문자), upper(대문자) 로 변환해주는 함수들이다. */
/*dual은 오라클에서 사용할 수 있는 전역적인 테이블이다. 
어떠한 데이터를 저장하거나 조회하기 위한 목적을 가진 테이블이 아니다.
즉, 테스트 용도로 사용할 더미 테이블이다. 
일시적인 연산의 결과값이라던가 그런 용도로 많이 사용된다.
즉, dual이라는 테이블은 sys가 소유하는 오라클의 표준 테이블로서
오직 한 행에 한 컬럼만 담고 있는 dummy 테이블이다.
즉, 일시적인 산술 연산이나 날짜 연산 등에 주로 사용한다.
즉, 모든 사용자가 접근 할 수 있다. */

/*SELECT * FROM dual;*/
/* SELECT * FROM dual; 출력결과는 DUMMY X 라고 뜬다.*/
SELECT 'abcDEF', lower('abcDEF'), upper('abcDEF')
FROM dual;



SELECT last_name, LOWER(last_name), INITCAP(last_name), UPPER(last_name)
FROM employees;


SELECT last_name
FROM employees
/*이렇게 하면 앞글자만 대문자, 뒤에는 소문자는 last_name을 알 수 있다. */
WHERE LOWER(last_name) = 'austin';






/* length 길이, instr(문자 찾기이며 없으면 0을 반환하고 있으면 인덱스 값을 준다. */
/*INSTR은 원본값 먼저 주고 찾고자하는 값을 적어주면 된다. 존재하면 해당 값의 인덱스를 준다.*/
/*참고로 인덱스가 자바처럼 0번부터 시작하는게 아니라 첫번째(1번)부터 시작한다*/
SELECT 'abcdef', LENGTH('abcdef'), INSTR('abcdef', 'a')
FROM dual;



/*dual말고 실제값에서 사용해보자*/
SELECT first_name, LENGTH(first_name), INSTR(first_name, 'a')
/*a가 없으면 0, 있으면 a가 위치해있는 인덱스값이 나온다.*/
FROM employees;





/* substr(문자열 자르기), concat(문자 연결) 1부터 시작*/
SELECT 'abcdef' AS ex, SUBSTR('abcdef', 1, 4), CONCAT('abc', 'def')
/*즉, SUBSTR은 원본문자열, 1번부터 4번(포함)까지 잘라서 그 값만 출력해줘 라고 얘기한다. */
FROM dual;
/*CONCAT은 'abc'와 'def'를 연결해줘~ 라고 얘기한다. 참고로 매개값을 2개밖에 안받는다. */




/*실제 테이블에서 정상동작하는지 확인하자*/
SELECT first_name, SUBSTR(first_name, 1, 3), CONCAT(first_name, last_name)
FROM employees;











/* LPAD, RPAD 는 각각 레프트와 라이트를 의미하겠지 PAD는 채워준다는 의미이다.*/
/*즉, 좌 우측을 지정문자열로 채우는 함수들이다. */
SELECT LPAD('abc', 10, '*'), RPAD('abc', 10, '*')
FROM dual;
/*LPAD는 abc라는 3글자를 10-3 = 7을 *로, 좌측에다 채워주세요 라고 말한다.
출력결과는 *******abc가 나온다.*/

/*RPAD는 abc라는 3글자를 10-3 = 7을 *로, 우측에다 채워주세요 라고 말한다.
출력결과는 abc*******가 나온다. */





/* LTRIM(), RTRIM(), TRIM() */
/* LTRIM(param1, param2) > param2의 값을 param1에서 찾아서 제거한다. 왼쪽부터 */
/* RTRIM(param1, param2) > param2의 값을 param1에서 찾아서 제거한다. 오른쪽부터*/
SELECT LTRIM('javascript_java', 'java')
/*java를 javascrpit의 왼쪽부터 찾아서 출력은 scrpit_java만 출력 된다.*/
FROM dual;



SELECT RTRIM('javascript_java', 'java')
FROM dual;
/*뒤에 java가 삭제되겠지~*/



SELECT TRIM('javascript_java', 'java')
FROM dual;
/*이건 에러*/





SELECT TRIM('    java    ')
FROM dual;
/*양쪽 공백을 제거해준다*/





/* replace() */
SELECT REPLACE('My Dream is a president', 'president', 'programmer')
/*마이드림이스어프레지던트 중에서, 프레지던트를 프로그래머로 바꿔줘 라고 얘기한다*/
FROM dual;






SELECT REPLACE('My Dream is a president', ' ', '')
/*공백을 모두 찾아서 공백으로 만들겠다 라는 뜻이다. 그럼 모두 공백없이 붙어서 출력된다.*/
FROM dual;



SELECT REPLACE(REPLACE('My Dream is a president', 'president', 'programmer'), ' ', '')
FROM dual;
/*이거 또한 값이 붙어서 출력된다.*/
/*안쪽 리플레이스는 프레지던트를 프로그래머로 바꿔달라 얘기했다. 그리고 바깥쪽 리플레이스를 적용해서 이 문장에서 공백을 없애줘 라고 얘기 하는 것이다. */





SELECT REPLACE(CONCAT('hello', ' world!'), '!', '?')
FROM dual;
/*느낌표를 물음표로 바꾸고싶다면? 컨캣이라는 함수의 리턴값을 리플레이스의 매개값으로 쓰자*/





/*문제 1.
EMPLOYEES 테이블 에서 이름, 입사일자 컬럼으로 변경해서 이름순으로 오름차순 출력 합니다.
조건 1) 이름 컬럼은 first_name, last_name을 붙여서 출력합니다.
조건 2) 입사일자 컬럼은 xx/xx/xx로 저장되어 있습니다. xxxxxx형태로 변경해서 출력합니다.
*/
SELECT CONCAT(first_name, last_name) AS 이름, REPLACE(hire_date,'/', '') AS 입사일자
FROM employees
ORDER BY 이름 ASC;




/*문제 2.
EMPLOYEES 테이블 에서 phone_numbe컬럼은 ###.###.####형태로 저장되어 있다
여기서 처음 세 자리 숫자 대신 서울 지역변호 (02)를 붙여 전화 번호를 출력하도록 쿼리를 작성하세요
*/
SELECT CONCAT('(02)', SUBSTR(phone_number, 5, LENGTH(phone_number)))
FROM employees;
/*출력 결과가 (02)가 들어가면서 번호들이 출력 될 것이다.
*/




/*
문제 3. 
EMPLOYEES 테이블에서 JOB_ID가 it_prog인 사원의 이름(first_name)과 급여(salary)를 출력하세요.
조건 1) 비교하기 위한 값은 소문자로 입력해야 합니다.(힌트 : lower 이용)
조건 2) 이름은 앞 3문자까지 출력하고 나머지는 *로 출력합니다. 
이 열의 열 별칭은 name입니다.(힌트 : rpad와 substr 또는 substr 그리고 length 이용)
조건 3) 급여는 전체 10자리로 출력하되 나머지 자리는 *로 출력합니다. 
이 열의 열 별칭은 salary입니다.(힌트 : lpad 이용)
*/

SELECT RPAD(SUBSTR(first_name, 1, 3), LENGTH(first_name), '*') AS name,
       LPAD(salary, 10, '*') AS salary
FROM employees
WHERE LOWER(job_id) = 'it_prog';


