--문제 1.
---EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 데이터를 출력 하세요 ( AVG(컬럼) 사용)
---EMPLOYEES 테이블에서 모든 사원들의 평균급여보다 높은 사원들을 수를 출력하세요
---EMPLOYEES 테이블에서 job_id가 IT_PROG인 사원들의 평균급여보다 높은 사원들을 데이터를 출력하세요

/*일단 모든 사원의 평균 급여를 찾아야 겠지? 조건을 달라고 하는 것이다. 서브쿼리문이 조건절인 WHERE 절에 들어가야겠다.*/
--SELECT AVG(salary)
--FROM employees; 일단 이걸로 조회가 되야 하고, 이거보다 큰 값들을 구하면 되겠지?
SELECT *
FROM employees
WHERE salary >  ( SELECT AVG(salary)
                   FROM employees e
                ); /*괄호값이 단일행 이기 때문에 > 만 써도 가능하다.*/
                  
                  
                  
SELECT COUNT(*)
FROM employees e
WHERE e.salary > ( SELECT AVG(salary)
                   FROM employees e
                  );


SELECT *
FROM employees
WHERE salary > (SELECT AVG(salary)
                FROM employees 
                WHERE job_id = 'IT_PROG');
                  

                  

--문제 2.
---DEPARTMENTS테이블에서 manager_id가 100인 사람의 department_id와
--EMPLOYEES테이블에서 department_id가 일치하는 모든 사원의 정보를 검색하세요.

SELECT *
FROM employees
WHERE department_id = (SELECT department_id
                       FROM departments
                       WHERE manager_id = 100);



--문제 3.
---EMPLOYEES테이블에서 “Pat”의(이라는 사람)의 manager_id보다 높은 manager_id를 갖는 모든 사원의 데이터를 출력하세요
---EMPLOYEES테이블에서 “James”(제임스는 2명)들의 manager_id와 갖는 모든 사원의 데이터를 출력하세요.


--SELECT manager_id
--FROM employees
--WHERE first_name = 'Pat';    이제 다음으로, 매니저아이디가 201번보다 큰 사람들을 전부 찾으면 된다.

SELECT *
FROM employees
WHERE manager_id > (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'Pat'); /*단일 행 쿼리기 때문에 부등호만 써도 된다. */

/*이제 제임스를 일단 찾자*/
--SELECT manager_id
--FROM employees
--WHERE first_name = 'James';   /*출력 결과 : MANAGER_ID가 2개가 나온다. */

/*이제 걸러보자*/
SELECT *
FROM employees
WHERE manager_id IN (SELECT manager_id
                    FROM employees
                    WHERE first_name = 'James');
                   





/*  문제 4.
-EMPLOYEES테이블 에서 first_name기준으로 내림차순 정렬하고, 41~50번째 데이터의 행 번호, 이름을 출력하세요 
*/
SELECT *
FROM
    (
    SELECT ROWNUM AS 랭킹, tbl.first_name
    FROM
        (
        SELECT *
        FROM employees
        ORDER BY first_name DESC
        ) tbl
    )
WHERE 랭킹 > 40 AND 랭킹 <= 50;
/*또는 WHERE 랭킹 BETWEEN 41 AND 50 이라고 써도 됨*/






--문제 5.
---EMPLOYEES테이블에서 hire_date기준으로 오름차순 정렬하고, 31~40번째 데이터의 행 번호, 사원id, 이름, 번호, 
--입사일을 출력하세요.

SELECT *
FROM
    (
    SELECT ROWNUM AS 랭킹, tbl.*
    FROM
    (
    SELECT employee_id, first_name, phone_number, hire_date
    FROM employees
    ORDER BY hire_date ASC /*hire_date를 오름차순으로 정렬을 했다.*/
    ) tbl
)
WHERE 랭킹 > 30 AND 랭킹 <= 40;





/*
문제 6.
employees테이블 departments테이블을 left 조인하세요
조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명 만 출력합니다.
조건) 직원아이디 기준 오름차순 정렬
*/
SELECT e.employee_id, CONCAT(first_name, last_name) AS 이름, d.department_id /*d에서꺼내든 e에서꺼내든 상관없다~*/
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY employee_id ASC;


--문제 7.
/*
문제 6.
employees테이블 departments테이블을 left 조인하세요
조건) 직원아이디, 이름(성, 이름), 부서아이디, 부서명 만 출력합니다.
조건) 직원아이디 기준 오름차순 정렬
*/
--문제 6의 결과를 (스칼라 쿼리)로 동일하게 조회하세요.
SELECT e.employee_id, CONCAT(first_name, last_name) AS 이름, e.department_id, (SELECT department_name
                                                                              FROM departments d
                                                                              WHERE d.department_id = e.department_id
                                                                              ) AS department_name
FROM employees e
ORDER BY employee_id ASC;






--문제 8.
--departments테이블 locations테이블을 left 조인하세요
--조건) 부서아이디, 부서이름, 매니저아이디, 로케이션아이디, 스트릿_어드레스, 포스트 코드, 시티 만 출력합니다
--조건) 부서아이디 기준 오름차순 정렬
SELECT d.department_id, d.department_name, d.manager_id, l.location_id, l.street_address, l.postal_code, l.city
FROM departments d LEFT OUTER JOIN locations l
ON d.location_id = l.location_id
ORDER BY department_id ASC;




--문제 9.
--문제 8의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
select d.department_id, d.department_name, d.manager_id, 
(select l.location_id from locations l where d.location_id = l.location_id),
(select l.postal_code from locations l where d.location_id = l.location_id),
(select l.city from locations l where d.location_id = l.location_id)
from departments d
order by department_id asc;
                                                                                            




--문제 10.
--locations테이블 countries 테이블을 left 조인하세요
--조건) 로케이션아이디, 주소, 시티, country_id, country_name 만 출력합니다
--조건) country_name기준 오름차순 정렬

select l.location_id, l.street_address, l.city, l.country_id, 
(select c.country_name from countries c where l.country_id = c.country_id) as ctn
from locations l
order by ctn asc;





--문제 11.
--문제 10의 결과를 (스칼라 쿼리)로 동일하게 조회하세요
select l.location_id, l.street_address, l.city, l.country_id, 
(select c.country_name from countries c where l.country_id = c.country_id) as ctn
from locations l
order by ctn asc;


