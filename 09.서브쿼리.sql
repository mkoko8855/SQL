

/* 서브쿼리

-서브쿼리의 사용방법은 () 안에 명시함.
서브쿼리절의 리턴행이 1줄 이하여야 한다.
서브쿼리 절에는 비교할 대상이 하나 반드시 들어가야 한다.
해석할 때는 서브쿼리절 부터 먼저 해석하면 된다.

*/

--'Nancy'의 급여보다 급여가 많은 사람을 검색하는 문장.
SELECT salary 
FROM employees 
WHERE first_name = 'Nancy';  /*12008의 값이 나온다. */






SELECT * 
FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE first_name = 'Nancy');   /*salary가 여기 서브쿼리에서 조회한 값보다 크다면 이란 뜻이다.*/
                /*서브쿼리 부터 해석한다. */










/* 단일 행 조인에 관한 내용을 더 설명하자. */
/*employee_id가 103번인 사람과 job_id가 동일한 사람을 검색하는 문장*/

/*일단 employee_id가 103번인 사람의 job_id부터 알아야겠지?*/
SELECT job_id
FROM employees
WHERE employee_id = 103;
/*JOB_ID가 IT_PROG 하나 나왔다. 서브쿼리를 이용해보자*/

SELECT *
FROM employees
WHERE job_id = (SELECT job_id 
                FROM employees 
                WHERE employee_id = 'IT_PROG'); /*103 대신에 IT_PROG를 써보았다. 그럼 에러가 뜬다 왜? 다중행인데 = 을 썼기 때문. */
/*서브쿼리가 리턴하는 행이 여러개라서 단일행 연산자를 사용할 수 없기 떄문이다.
이런 경우에는 다중행 연산자를 사용해야 한다.
단일행이 하나면 > = 해도 되는데, 값의 출력이 여러개면 일반적인 = > 같은 연산자는 사용할 수 없다. 
서브쿼리 결과가 2개 행 이상이면 다중 행 서브쿼리라고 부른다. 서브쿼리가 다중 행 이라면 다른 연산자를 사용해야 한다.
IN, ANY, SOME, ALL, EXISTE
*/










/* 다중행 연산자 IN에 대해서 알아보자.
IN이란? 목록의 어떤 값과 같은 지 확인한다.
*/
SELECT *
FROM employees
WHERE job_id IN (SELECT job_id 
                FROM employees 
                WHERE job_id = 'IT_PROG');










                
                

/* first_name이 David인 사람 중 가장 작은 값보다 급여가 큰 사람을 조회하라면? */
SELECT salary
FROM employees
WHERE first_name = 'David';
/*이런 문제일 때, ANY라는 연산자를 사용한다.
ANY란? 값을 서브쿼리에 의해 리턴된 각각의 값과 비교한다.
즉, 하나라도 만족하면 된다.
*/
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary 
                    FROM employees 
                    WHERE first_name = 'David');
                    /*salary가 커야된다. 누구보다? 3개의 조회 결과 중에서(4800, 9500, 6800) 얘들이랑 비교할 것이다.
                    > 와 ANY를 사용했다는건, 저 셋중의 하나만 만족하면 조회 결과에 포함된다.*/
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
/* ALL 이란?
값을 서브쿼리에 의해 리턴된 값과 모두 비교해서 모두 만족을 해야 한다.
*/   
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary    /*아까 데이빗은 4800 9500 6800나왔는데, ANY는 셋중에 하나만 커도 조회대상에 포함된다.
                                       즉, 제일작은 4800보다만 커도 전부 조회되는데,
                                       ALL은 4800 9500 6800보다 즉 셋다 커야한다.*/
                    FROM employees 
                    WHERE first_name = 'David');
                    /*
                        < ANY : 가장 큰 값보다 작으면됨
                        < ALL : 가장 작은 값보다 작아야 함
                        > ALL : 가장 큰 값보다 커야 함
                        = ANY : IN과 같은 역할을 한다.
                    */




-----------------------------------------------------------------------------
                    
                    
                    
                    
                    
/* SELECT 구문에 서브쿼리는 스칼라 서브쿼리이다. */
/* 얘는 조회 결과가 LEFT OUTER JOIN과 유사한 결과가 나온다. */

/*일단 스칼라 사용안하고 평범하게 작성해보자*/
SELECT e.first_name, d.department_name /*사원의 이름과 사원의 부서 명을 해보았다. 부서 명은 departments에서만 얻을 수 있다. */
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY first_name ASC;
                
                
                            /*위를 스칼라 서브쿼리로 사용해보자*/
SELECT e.first_name, (SELECT department_name
                      FROM departments d
                      WHERE d.department_id = e.department_id) AS department_name  /*e.department_id는 from절꺼다*/
FROM employees e
ORDER BY first_name ASC;  /* 
                             스칼라가 조인보다 좋은 경우는, 함수처럼 한 레코드당 정확히 하나의 값만을 리턴할 때 이다.
                             조인이 스칼라보다 좋은 경우는, 조회할 데이터가 대용량인 경우 와 해당 데이터가 수정, 삭제 등이 빈번한 경우.
                          */
                          






/*스칼라 서브쿼리를 하나 더 해보자.      각 부서 별 매니저 이름을 알아보자*/
/*부서는 departments, 이름은 employees가 가지고 있다*/
/*레프트 조인(스칼라랑 제일비슷하니까)으로 한번 먼저 써보고 스칼라를 써보자*/
SELECT d.*, e.first_name
FROM departments d
LEFT JOIN employees e
ON d.manager_id = e.employee_id
ORDER BY d.manager_id ASC;

/*위를 스칼라서브쿼리로 작성해보자*/
SELECT d.*, ( SELECT first_name
              FROM employees e
              WHERE e.employee_id = d.manager_id )AS manager_name
FROM departments d
ORDER BY d.manager_id ASC;











/*이제는 각 부서별 사원 수 뽑기*/
SELECT department_id, COUNT(*)                    
FROM employees
GROUP BY department_id;
/*나오긴 나오는데 어떤 부서인지 모른다. 스칼라로 해보자*/


SELECT d.*, ( /*사원수를 조회하는 내용을 찾자 여기서.*/
              SELECT COUNT(*)
              FROM employees e
              WHERE e.department_id = d.department_id
              GROUP BY department_id ) AS 사원수
FROM departments d;









-------------------------------------------------------------

/* 이번에는 서브쿼리가 FROM 절에 붙는다. 이것을 인라인 뷰(FROM 구문에 서브쿼리가 오는 것) 이라고 한다. */

/* 인라인 뷰는 순번을 정해놓은 조회 자료를 범위를 지정해서 가지고 오는 경우에 사용한다. */



/* 월급 랭킹을 구해보자~ */
SELECT employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;
/*위 결과값에 만족하지 않고 11등부터 20등까지 월급을 추가로 구하고싶다면?*/
/*salary가 정렬되어 있으니 salary로 번호를 맥이면 편하겠지~ ROWNUM으로 먹이면 된다. */


/*이제 번호맥여서 써보자. 
그러나 아래에 SELECT절에 ROWNUM붙인 코드는 즉, salary로 정렬을 진행하면서 바로 ROWNUM붙이면 
ROWNUM이 정렬이 되지 않는 상황이 발생한다. 이유는 ROWNUM이 먼저 붙고 정렬이 진행 되기 때문이다. 
오더바이는 항상 마지막에 진행이 되기 때문이다. 
해결방법은 정렬이 미리 진행된 자료에 ROWNUM붙여서 다시 조회하는 것이 좋다.*/
SELECT ROWNUM AS 랭킹, employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;


/*다시 번호 맥여서 제대로 작성 해보자*/
SELECT ROWNUM AS 랭킹, tbl.*  /*로우넘 붙여서 tbl의 내용을 조회하라 라는 뜻이다.*/
FROM
(SELECT employee_id, first_name, salary /*지금적은 셀렉적, 프롬절, 오더바이를 가상의 테이블로 쓰자*/
FROM employees e
ORDER BY salary DESC ) tbl /*가상의 테이블을 tbl이란 별칭을 줬는데, AS는 쓰면 안된다.*/
WHERE 랭킹 > 10 AND 랭킹 <= 20; /*
                                이 WHERE절은 안된다. 왜냐하면 랭킹은 조회할 떄 붙여준 이름인데,
                                범위지정을 where절에서 하고 있기 떄문이다.  FROM 다음 select이 아니라 where이니까. 랭킹이란 별칭은 SELECT절에 있다.
                                해결방안은 ROWNUM인 SELECT절이 먼저 조회가 되야하니 ROWNUM까지 붙여놓은 후, WHERE절을 제외한 모든 것에 ()을 걸어준다.                              
                              */


/* 즉, WHERE절을 제외한 모든 곳을 서브쿼리로 지정해서 */
/* 참고로, 가장 안쪽 SELECT 절에서 필요한 테이블 형식(인라인 뷰)를 생성한다. 그 다음 바깥쪽 SELECT절에서 ROWNUM을 붙여서 다시 조회한다(2번째괄호).
그 다음, 가장 바깥쪽 SELECT절에서는 이미 붙어있는 ROWNUM에 범위를 지정해서 조회하면 되는 것이다.*/
SELECT *   /*페이징할때 이걸 쓸..수도있겠지?*/
FROM
(
SELECT ROWNUM AS 랭킹, tbl.*  
FROM
(SELECT employee_id, first_name, salary 
FROM employees e
ORDER BY salary DESC ) tbl
)
WHERE 랭킹 > 10 AND 랭킹 <= 20;





/* 아래 테이블을 기준으로 날짜가 오늘 날짜인 데이터만 뽑아내라면?*/
/*날짜 타입으로 변경 후 tochar로 연도를 제외한 월과 일만 할 것이다. 이 행위를 위해 전부 괄호로 감쌀 것이다.*/
SELECT *
FROM
(
SELECT TO_CHAR(TO_DATE(test, 'YY/MM/DD'), 'MMDD') AS mm, name
FROM
    (
    SELECT '홍길동' AS name, '20230418' AS test 
    FROM dual 
    UNION ALL
    SELECT '김철수', '20230301' 
    FROM dual 
    UNION ALL
    SELECT '박영희', '20230201' 
    FROM dual 
    UNION ALL
    SELECT '김뽀삐', '20230501' 
    FROM dual 
    UNION ALL
    SELECT '박뚜띠', '20230601' 
    FROM dual 
    UNION ALL
    SELECT '김테스트', '20230701' 
    FROM dual
    )
)
WHERE mm = '0418';


