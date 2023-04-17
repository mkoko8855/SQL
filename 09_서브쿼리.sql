/*  서브쿼리  */



/*
서브쿼리란?
서브쿼리의 사용 방법은 () 안에 명시 해야 한다.
또한, 서브쿼리절의 리턴행이 1줄 이하여야 한다.
서브쿼리 절에는 비교할 대상이 하나가 반드시 들어가야 한다.
해석할 때는 서브쿼리절 부터 먼저 해석한다
*/



/* 'Nancy'의 급여보다 급여가 많은 사람을 검색하는 문장*/
SELECT salary
FROM employees
WHERE first_name = 'Nancy';

SELECT *
FROM employees
WHERE salary > 12008;

/*이런 식으로 12008 이라는 결과를 얻기 위해 식을 많이 썻다. 이렇게 쓰면 편하다. 이건 단일행 서브쿼리다.*/

SELECT *
FROM employees
WHERE salary > (SELECT salary
                FROM employees
                WHERE first_name = 'Nancy');