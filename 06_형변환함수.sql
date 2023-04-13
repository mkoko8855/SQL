/* 형변환함수 TO_CHAR, TO_NUMBER, TO_DATE */


/* 날짜를 문자로 변환해주는 함수 > 변환하고자하는 값, 형식 주면 된다.
   TO_CHAR(변환하고자 하는 값, 형식)
*/
SELECT sysdate
FROM dual;
/*출력 결과 : 23/04/13 */


/*오늘 날짜 정보를 문자로 바꿔보자*/
SELECT TO_CHAR(sysdate)
FROM dual;
/*출력 결과 : 23/04/13 위와 같아보이지만 그러나 문자열로 바뀐 것이다.*/



/*날짜데이터를 TO_CHAR로 바꾸되, 문자열 형태로 원하는 날짜 형태를 삽입하면 된다. */
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD HH:MI:SS')
FROM dual;
/*출력 결과 : 2023-04-13 09:52:08 */


SELECT TO_CHAR(sysdate, 'YY-MM-DD HH24:MI:SS')
FROM dual;
/*출력 결과 : 23-04-13 09:54:07 */



/*요일을 표시하려면, 월화수목 */
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD DAY HH24:MI:SS')
FROM dual;
/*출력 결과 : 2023-04-13 목요일 09:56:18 */




/*임플로이 에서도 적용되나 보자~*/
SELECT first_name, TO_CHAR(hire_date, 'YYYY"년" MM"월" DD"일"')
FROM employees;
/*출력 결과 : 
Steven	2003년 06월 17일
Neena	2005년 09월 21일
Bruce	2007년 05월 21일
David	2005년 06월 25일
Valli	2006년 02월 05일
Diana	2007년 02월 07일
Nancy	2002년 08월 17일
Daniel	2002년 08월 16일
John	2005년 09월 28일
Ismael	2005년 09월 30일
이런 식으로 출력이 된다.
/*즉, 사용하고 싶은 문자를 ""로 묶자~*/






/* 이번엔 숫자를 문자로 바꿔주는 TO_CHAR(값, 형식) */
SELECT TO_CHAR(20000, '99999')
FROM dual;
/* 출력 결과는 20000 이다. 99999는 뭘까? 다음꺼 보자 */

SELECT TO_CHAR(20000, '9999')
FROM dual;
/* 출력 결과는 ##### 이다. 이게 무슨 뜻일까?
   9가 숫자가 아니라 자릿수이다. 20000을 5자리 문자로 표현한다는 거고, 
   9999는 원본이 20000(5자리)인데, 9999(4자리)로 나타내달라고 하니 ####이 나오게 된 것이다.
*/


/*소수점도 표현해보자*/
SELECT TO_CHAR(20000.21, '99999.9')
FROM dual;
/* 출력 결과 :  20000.2*/
/*한 자리만 표현할꺼면 99999.9 처럼, 소수점 한자리에만 9 써주면 된다. */




SELECT TO_CHAR(20000, '99,999')
FROM dual;
/*출력 결과 :  20,000 */




/*달러기호나 WON기호도 있으니 넣을 수 있다. */
SELECT TO_CHAR(salary, '$99,999') AS salary
FROM employees;
/*출력 결과 :  
$24,000
$17,000
$17,000
$9,000
$6,000
$4,800
$4,800
$4,200
$12,008
$9,000
$8,200
  */
  
  
  
/*WON단위는 */
SELECT TO_CHAR(salary, 'L99,999') AS salary
FROM employees;
/*출력 결과 :         
￦24,000
￦17,000
￦17,000
￦9,000
￦6,000
￦4,800
￦4,800
￦4,200
￦12,008
￦9,000
￦8,200
￦7,700*/







/*문자를 숫자로   TO_NUMBER(값, 형식)  */
SELECT '2000' + 2000
FROM dual;
/*출력 결과 : 4000*/

/*자동 형 변환(문자 > 숫자)로 되는걸 보여주기 위해..지금은 자동으로 된거고 직접 해보자*/

SELECT TO_NUMBER('2000') + 2000
FROM dual;
/*출력 결과 : 4000    즉, 이건 직접 한 것이다. (명시적 형 변환이다)*/



SELECT '$3,300' + 2000
FROM dual;
/* 이건 연산이 불가능하다. 왜? 변환을 할 수가 없는 값이 있으니까..
TO_NUMBER로 직접 변환 해줘야 한다
*/
SELECT TO_NUMBER('$3,300', '$9,999') + 2000
FROM dual;
/* 출력 결과 : 5300 */





/*문자를 날짜로 변환하는 함수 TO_DATE(값, 형식) 주면 된다. */
SELECT TO_DATE('2023-04-13')
FROM dual;
/*출력 결과 : 23/04/13*/



SELECT sysdate - '2021-03-26'
FROM dual;
/*날짜처럼 생긴 문자기 떄문에, 이런 형태에서는 연산이 불가능하다.
문자에서 날짜로 변환을 해줘야 하기 떄문에 TO_DATE 사용 해야 한다.
*/
SELECT sysdate - TO_DATE('2021-03-26')
FROM dual;
/* 748.44462962962962962962962962962962963 */


SELECT TO_DATE('2020/12/25', 'YY-MM-DD')
FROM dual;
/*   20/12/25  */



SELECT TO_DATE('2021/03/31 12:23:50', 'YY-MM-DD')
FROM dual;
/*위는 에러다. 주어진 문자열을 날짜로 바꿀 때는 모두 다 변환 해야 한다. */
SELECT TO_DATE('2021/03/31 12:23:50', 'YY-MM-DD HH:MI:SS')
FROM dual;
/* 21/03/31 */



/*XXXX년 XX월 XX일 문자열 형식으로 변환해보세요*/
SELECT TO_CHAR(TO_DATE('20050112','YY-MM-DD'), 'YYYY"년" MM"월" DD"일"') as dateInfo
FROM dual;
/*출력 결과 2005년 01월 12일*/





/*NULL 제거 함수인 NVL(컬럼, 변환할 타겟값)*/
SELECT NVL(null, 0)
FROM dual;
/*출력 결과 : null을 0으로 변환한다. */
/*즉, 값이 null 인 경우, 지정 값을 출력하고 그렇지 않으면 원래값을 그대로 출력한다.*/





SELECT first_name, NVL(commission_pct, 0) AS comm_pct
FROM employees;
/*출력 결과 : 
Steven	0
Neena	0
Lex	0
Alexander	0
Bruce	0
David	0
Valli	0
Diana	0
Nancy	0
Daniel	0
John	0
Ismael	0
Jose Manuel	0
*/





/* NVL2는 null이면 지정값1, 아니면 지정값2를 출력한다. 조건이 null 체크인 IF문이라고 생각하면 되겠다.*/


/*  NULL 제거 함수 NVL2(컬럼, null이 아닐 경우의 값, null일 경우의 값*/
/*  NULL이 아닌 값도 필요하면 NVL2를 쓰면 된다. */
SELECT NVL2(null, '널아님', '널임')
FROM dual;
/* 출력 결과 : 널임 */

SELECT NVL2('abc', '널아님', '널임')
FROM dual;
/* 출력 결과 : 널아님 */


/*이사람이 커미션을 받느냐 안받느냐만을 판단하고 싶다면? */
SELECT first_name, NVL2(commission_pct, 'true', 'false')
FROM employees;
/* 커미션을 받는애들은 트루고 받지 못하면 폴스가 뜨겠죠~ */






SELECT first_name, (salary * commission_pct) AS real_salary
FROM employees;
/*커미션을 안받는애들은 null이 나오는데, 널과 샐러리를 연산하니 null로 나온다.
  커미션을 안받는애들은 원래 샐러리가 나와야하는데..흠
  커미션PCT가 널인 애들은 저 연산을 해주면 안된다 라고 얘기하면 되지.
  NVL2를 이용하자.
*/

SELECT first_name, commission_pct, NVL2(commission_pct, salary + (salary * commission_pct), salary) AS real_salary
FROM employees;
/*출력 결과 : 
Steven 24000
Neena  17000
Lex	   17000
Alexander  9000
Bruce	   6000
David	   4800
Valli	   4800
*/






/*   DECODE(컬럼 혹은 표현식, 항목1, 결과1, 항목2, 결과2....(어떠한 케이스로 안걸리면)default)   즉, 스위치랑 약간 비슷하다.*/
SELECT DECODE('F', 'A', 'A입니다.', 'B', 'B입니다.', 'C', 'C입니다.', '모르겠는데요?')
FROM employees;
/*기준으로 F를 잡았다. */
/*즉, 컬럼 혹은 표현식을 기준으로 그 값이 조건1에 해당하면 결과1을..2면 결과2를 이런식이다. */





SELECT job_id, salary, DECODE(job_id, 'IT_PROG', salary*1.1, 'FI_MGR', salary*1.2, 'AD_VP', salary*1.3) AS result
FROM employees;







/* CASE WHEN THEN END */
SELECT first_name, job_id, salary, 
(CASE job_id
    WHEN 'IT_PROG' THEN salary * 1.1
    WHEN 'FI_MGR' THEN salary * 1.2
    WHEN 'AD_VP' THEN salary * 1.3
    WHEN 'FI_ACCOUNT' THEN salary * 1.4
    ELSE salary /*해당하지 않는애들은 원래 자기 salary가 나올 것이다.*/
    END) AS result
FROM employees;




/*
문제 1.
현재일자를 기준으로 EMPLOYEE테이블의 입사일자(hire_date)를 참조해서 근속년수가 17년 이상인
사원을 다음과 같은 형태의 결과를 출력하도록 쿼리를 작성해 보세요. 
조건 1) 근속년수가 높은 사원 순서대로 결과가 나오도록 합니다*/
SELECT employee_id AS 사원번호,
       CONCAT(first_name, last_name) AS 사원명,
       hire_date AS 입사일자,
       TRUNC((sysdate-hire_date) / 365, 0) AS 근속년수
FROm employees
WHERE (sysdate-hire_date) / 365 > 17 /*웨어절에 '근속년수 >= 17 로 비교하면 안된다.*/
ORDER BY 근속년수 DESC;








/*
문제 2.
EMPLOYEE 테이블의 manager_id컬럼을 확인하여 first_name, manager_id, 직급을 출력합니다.
100이라면 ‘사원’, 
120이라면 ‘주임’
121이라면 ‘대리’
122라면 ‘과장’
나머지는 ‘임원’ 으로 출력합니다.
조건 1) department_id가 50인 사람들을 대상으로만 조회합니다
*/

--SELECT first_name, manager_id, salary AS 직급
--(CASE manager_id
--    WHEN manager_id = 100 THEN '사원'
--    WHEN manager_id = 120 THEN '주임'
--    WHEN manager_id = 122 THEN '과장'
--    ELSE AS '임원'
--    END)
--FROM employees
--WHERE department_id > 50;

/*위에껀 출력이 잘안되네..아래 디코드 쌤 풀이껄로 보자. */
SELECT first_name, manager_id, DECODE(manager_id, 100, '사원', 120, '주임', 121, '대리', 122, '과장', '임원') AS 직급
FROM employees;




/*
디코드를 선택할지, case when을 선택할지 뭘 쓸지 판단하는 법을 알려주겠다.
*/
SELECT salary, employee_id, first_name, 
DECODE(TRUNC(salary / 1000), 0, 'E', 1, 'D', 2, 'C', 3, 'B', 'A') AS grade
FROM employees
ORDER BY salary DESC;
/* 디코드는 범위 지정하는 식을 쓸 수가 없다. 정확한 값을 얘기 해야 한다. */



/*케이스웬으로 써보자*/
SELECT salary, employee_id, first_name, 
    (CASE /*기준잡을꺼없으면 케이스 다음에 생략 가능. 바로 웬절 들어가자*/
        WHEN salary BETWEEN 0 AND 999 THEN 'E'
        WHEN salary BETWEEN 1000 AND 1999 THEN 'D'
        WHEN salary BETWEEN 2000 AND 2999 THEN 'C'
        WHEN salary BETWEEN 3000 AND 3999 THEN 'B'
        ELSE 'A'
    END) AS grade
FROM employees
ORDER BY salary DESC;

