SELECT * FROM employees;

/*데이터 제한 : where 절을 이용해서 조건에 맞는 데이터만 추출할 수 있다. */

/*WHERE 절 비교(SQL은 원래 대/소문자를 구별 안하지만 데이터 값은 대/소문자를 구분한다)*/

SELECT first_name, last_name, job_id
FROM employees
/*job_id중에서 it_prog라는 사람들만 조회할껀데, 그 사람들의 first_name과 last_name과 job_id만 조회한다.*/
WHERE job_id = 'IT_PROG';




SELECT * 
FROM employees
WHERE last_name = 'King';




/*사원테이블에서 department_id가 90번인 사원들의 모든 정보를 출력 한다.*/
SELECT *
FROM employees
WHERE department_id = 90;





/*샐러리를 15000 이상 받는 사람들이 궁금하다면?*/
SELECT *
FROM employees
WHERE salary >= 15000;




/*입사 일자가 04년1월30일인 사람을 모든 사원들 중에서 찾을 것이다.*/
SELECT *
FROM employees
WHERE hire_date = '04/01/30';





/*데이터 행 제한(BETWEEN, IN, LIKE)*/
/*샐러리가 15000과 20000사이 라면, 조회를 할 것이다. */
SELECT *
FROM employees
WHERE salary BETWEEN 15000 AND 20000;




/*between은 날짜에서도 사용할 수 있다. 이 날짜와 저 날짜의 사이라던가..*/
SELECT *
  FROM employees
 WHERE hire_date BETWEEN '03/01/01' AND '03/12/31';




/* IN 연산자의 사용 (특정 값들과 비교할 때 사용) */
SELECT *
  FROM employees
/*manager_id 컬럼의 값이 100이거나 101이거나 102면 조회할 것이다.*/
 WHERE manager_id IN (100, 101, 102);



SELECT *
  FROM employees
 WHERE job_id IN ('IT_PROG', 'AD_VP');
 
 
 
 
 
 /*LIKE 연산자 : 비슷하면 가져와라 라는 것이다.*/
 /*%(퍼센트) 기호는 어떠한 문자든, _(언더바)는 데이터의 자리(위치)를 찾아낼 때 와일드카드 기호다*/
 SELECT first_name, hire_date
   FROM employees
   /*03년도에 입사한 사람을 전부 조회해줘 >
     hire_date라는 컬럼의 값이 마치 03% 와 같다면 으로 해석을 하면 되는데,
     즉, 03으로시작하면서 뒤에는 어떠한 문자가 와도 상관이 없다는 뜻이다.
   */
  WHERE hire_date LIKE '03%';
  /*'%15'라면, 앞에가 뭐가들어가든간에 뒤가 15면 전부 조회해라 라는 뜻이 된다.*/
  /*'%05%라면, 05가 들어가기만하면 뭐든지 조회해라 라는 뜻이 된다.*/

/*언더바*/
/*월이 05인(5월달인) 애만 찾고싶다면?*/
/*WHERE hire_date LIKE '___05%' 이다.*/
/*즉, 언더바를 3개 넣었는데 앞에아무글자 3개가들어가고 뒤에05라면 조회한다 라는 뜻이 된다. */




/* IS NULL */
SELECT *
fROM employees
/*매니저id가 널인 것만을 찾아라.*/
WHERE manager_id IS NULL;



/*commission_pct가 NULL이 아닌 것들만을 찾아라*/
SELECT *
FROM employees
WHERE commission_pct IS NOT NULL;






/*AND , OR*/
/*
이미 and와 or연산자들을 알고 있다.
연산순서는 AND가 OR보다 연산 순서가 빠르다.
*/

/*Job_id가 it_prog이거나 FI_MGR. 둘중의 하나였으면 좋겠고 공통조건은 샐러리가 6천이 넘었으면 좋겠다.*/
SELECT *
  FROM employees
WHERE (job_id = 'IT_PROG'
    OR job_id = 'FI_MGR')
   AND salary >= 6000;
/*이건 정확한 조회가 안된다. 왜냐하면, FI_MGR와 AND salary >= 6000을 찾았기 때문이다.*/
/*OR먼저하고 AND가 진행이 되야하니 다시작성하자면, 괄호를 붙여주면 된다.*/







/*조회된 결과를 정렬해서 보자  >  데이터의 정렬(SELECT구문의 가장 마지막에 진행된다)
오더바이는 마지막이니까 마지막에 정렬이 진행되는 것이 맞겠지~
*/
/*연산 순서도 가장 마지막에 진행이 된다.*/

/*
ASC : ascending 오름차순(작은값부터순서대로)
DESC : descending 내림차순(큰값부터순서대로내려옴)
*/


SELECT *
FROM employees
/*hier_date를 오름차순으로 해줘!*/
ORDER BY hire_date ASC;



SELECT *
FROM employees
/*hier_date를 내림차순으로 해줘!*/
ORDER BY hire_date DESC;




SELECT *
FROM employees
WHERE job_id = 'IT_PROG'
/*first_name을 오름차순으로 > ABCD순으로 정렬이 될 것이다*/
ORDER BY first_name ASC;




SELECT *
FROM employees
WHERE salary >= 5000
ORDER BY employee_id DESC;
/*사원테이블에서 샐러리가 5000이상인데, employee_id가 내림차순으로 되어있도록 조회할꺼야 */





/*연봉은 샐러리(월급)의 12배가 될테니까, 즉 테이블에 존재하지 않지만 우리가 별칭붙여서 만들어서 정렬까지 해줬다.*/
SELECT first_name, salary*12 AS pay
FROM employees
ORDER BY pay ASC;





