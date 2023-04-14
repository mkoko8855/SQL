/* 그룹함수 AVG, MAX, MIN, SUM, COUNT */
/* 얘네들은 전부 그룹이 필요하다. */

SELECT
    AVG(salary),
    MAX(salary),
    MIN(salary),
    SUM(salary),
    COUNT(salary)
FROM employees;
/*출력결과 : 6461.831775700934579439252336448598130841	24000	2100	691416	107*/
/*즉, employees 테이블이 기준이 되며 여기서만 해당되는 조건들만 조회가 되는 것을 알 수 있다. */




SELECT COUNT(*) /*나중에 페이징 할때도 씀 총 게시물의 개수를 얻어서 집어넣어야되니까.*/
FROM employees;
/* 총 행 데이터 수가 107개인 것을 알 수 있다. */
SELECT COUNT(first_name)
FROM employees;
/* 즉, 이름이 없는 애는 없구나 라고 알 수 있다. */
SELECT COUNT(commission_pct)
FROM employees;
/* NULL을 세주지 않는다. 35가 조회된다.*/
SELECT COUNT(manager_id)
FROM employees;
/*조회는 106으로 된다. 즉, 한명이 매니저아이디가 없는 것을 알 수 있다. */
/*즉, COUNT는 NULL이 아닌 행의 수를 알려준다~ */





/*  이제 그룹화를 시켜보자 > 부서별로 그룹화를 할 거고 그룹함수를 사용할 것이다.  */
SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id; /*디팔트먼트아이디에 그룹을 지어줘서.*/


SELECT job_id,department_id, AVG(salary)
FROM employees
GROUP BY department_id;
/* 이건 안먹는다. AVG는 그룹 함수이기 때문에.*
/*그리고, GROUP BY절을 사용할 떄, 그룹에 묶이지 않은 다른 컬럼들은 사용할 수 없다. job_id가 문제가 있으니까~*/



/* GROUP BY절 2개 이상 사용하기 */
SELECT job_id,department_id, AVG(salary)
FROM employees
GROUP BY department_id, job_id
ORDER BY department_id;



SELECT department_id, AVG(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) > 100000;    /*HAVING은 그룹의 조건을 걸 수 있다. */
/*즉, 그룹바이를 통해 그룹화를 할 때 조건을 걸 경우 HAVING을 사용한다. */



/*job_id의 종류가 궁금하다.*/
SELECT job_id, COUNT(*)
FROM employees
GROUP BY job_id
HAVING COUNT(*) >= 20;




/*부서 아이디가 50 이상인 것들을 그룹화 시키고, 그룹 월급 평균이 5000 이상만 조회하라*/
SELECT department_id, AVG(salary) AS 평균
FROM employees
WHERE department_id >= 50
GROUP BY department_id
HAVING AVG(salary) >= 5000
ORDER BY department_id DESC;





/*
문제 1.
사원 테이블에서 JOB_ID별 사원 수를 구하세요.
사원 테이블에서 JOB_ID별 월급의 평균을 구하세요. 월급의 평균 순으로 내림차순 정렬하세요
*/
SELECT job_id, COUNT(*) AS 사원수
FROM employees
GROUP BY job_id
ORDER BY 사원수 DESC;


/*
문제 2.
사원 테이블에서 입사 년도 별 사원 수를 구하세요.
*/
select to_char(hire_date,'yy'), count(*) 
from employees 
group by to_char(hire_date,'yy');





/*
문제 3.
급여가 5000 이상인 사원들의 부서별 평균 급여를 출력하세요. 
단 부서 평균 급여가 7000이상인 부서만 출력
*/
SELECT department_id, AVG(salary) AS 평균
FROM employees
WHERE salary >= 5000
GROUP BY department_id
HAVING AVG(salary) > 7000;


/*
문제 4.
사원 테이블에서 commission_pct(커미션) 컬럼이 null이 아닌 사람들의
department_id(부서별) salary(월급)의 평균, 합계, count를 구합니다.
조건 1) 월급의 평균은 커미션을 적용시킨 월급입니다.
조건 2) 평균은 소수 2째 자리에서 절삭 하세요
*/
SELECT department_id, TRUNC(AVG(salary + (salary * commission_pct)), 2), SUM(salary + salary * commission_pct), count(*)
FROM employees
WHERE commission_pct is not null
GROUP BY department_id;





