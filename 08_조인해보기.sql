/* 조인이란 ?*/

/*서로 다른 테이블간에 설정된 관계가 결합하여 1개 이상의 테이블에서 데이터를
조회하기 위해 사용한다. 
*/

/*
SELECT 컬럼리스트 FROM 조인 대상이 되는 테이블 (1개 이상)
WHERE 조인 조건  -> 이건 오라클 조인 문법을 뜻한다.
                -> 그리고, ANSI 표준 이 있다. 
                   오라클은 ANSI 표준으로 많이 사용하는데, 오라클 조인 문법은 알아야 한다.
                   문법은 알고 있어야 하니까..
*/




/* 
employees 테이블의 부서 id와 일치하는 departments 테이블의 부서 id를 찾아서
SELECT 이하에 있는 컬럼들을 출력하는 쿼리문을 작성해보자. (오라클 문법)
*/

SELECT first_name, last_name, hire_date, salary, job_id, e.department_id, department_name
FROM employees e, departments d /*e와 d는 별칭이다. FROM절 테이블은 AS를 생략할 수 있다.*/
/*
테이블은 서로 연관이 없으면 조인이 안되기 때문에 조인 조건을 써줘야 한다.
두 테이블이 공통으로 가지고 있는 컬럼을 써줘야 한다. WHERE 절로 가자
*/
WHERE e.department_id = d.department_id;
/* 
SELECT절의 department_id는 두 테이블에 다 있기 때문에 에러가 난다.
누구꺼의 department_id를 꺼낼지 얘기를 해줘야 하니까 e또는 d.department_id라고 해주자.
*/








/*이제 다른 조인문법인, ANSI 표준 문법으로 보자 */
SELECT e.first_name, e.last_name, e.hire_date, e.salary, e.job_id, e.department_id, d.department_name
/*ON에다가는 조인 조건을 건다. WHERE로 걸진 않는다. 어떤것이 웨어조건인지 조인조건인지 알아야한다.
오라클문법은 웨어조건절에다가 적기 때문에 웨어절안에서 무슨 조건인지 구분하기 힘들다. 모든걸 웨어로 걸어버리니.*/
FROM employees e 
INNER JOIN department d 
ON e.department_id = d.department_id;
/*
각각의 테이블에 독립적으로 존재하는 컬럼의 경우에는 테이블 이름을 생략해도 무방하다.
그러나 해석의 명확성을 위해 테이블 이름을 작성하셔서 소속을 표현해 주는 것이 바람직하다.
(즉, 테이블 이름이 길면 별칭을 사용해서 SELECT절에 확실히 명칭을 적어서 소속을 표현해주자~)

또한, 두 테이블 모두 가지고 있는 컬럼의 경우에는 (반드시) 명시해 주어야 한다.
e나 d든 상관 없음!
*/








/*
이번엔 3개의 테이블을 이용한 내부조인(INNER JOIN)

내부조인 : 두 테이블 모두에서 일치하는 값을 가진 행만 반환한다. 
10, 20, 30, 40   VS  10, 20, 30, 40, 50 이라면
50은 안오겠지~
한번 해보자
*/
SELECT e.first_name, e.last_name, e.department_id, d.department_name, j.job_title
FROM employees e, departments d, jobs j
/*WHERE절은 일단 e와 d를 합쳐서 같은 것을 찾고, 그 합친 결과에 j를 합친 결과를 찾자*/
WHERE e.department_id = d.department_id
AND e.job_id = j.job_id;







/*이제 테이블 4개를 보자*/
SELECT e.first_name, e.last_name, d.department_id, d.department_name, j.job_title, loc.city
FROM employees e, departments d, jobs j, locations loc
WHERE e.department_id = d.department_id /*e와 d의 디팔트먼트id가 같다면*/
AND /*그리고, e의 잡아이디가 j의 잡 아이디와 같다면*/
e.job_id = j.job_id                 /*해석 3, 4번 순*/
AND /*그리고 d의 로케이션 아이디가 loc의 로케이션 아이디가 같다면*/
d.location_id = loc.location_id     /*얘가 해석 2번*/
AND
loc.state_province = 'California';  /*얘가 해석 1번*/

/*
근데 만약 난 loc.state_province = 'california'; 인 사람만 조회하고싶다면? 
일반조건이니 웨어절에쓰자,근데 웨어에 조인조건들(AND)이 가득차있다. 어이다가 일반조건을 써야할까?
저 마지막 AND 절 다음에 쓰면된다. 
그러나 해석은 마지막에쓴게 중요한게 아니라 제일먼저 해석된다. 오라클 문법의 단점들이 참 많다.

즉, 
1. loc테이블의 province='California' 조건에 맞는 값을 대상으로
2. location_id 값과 같은 값을 가지는 데이터를 departments에서 찾아서 조인들어간다.
3. 그 다음, 2번까지 진행된 결과와 동일한 department_id를 가진
   employees 테이블의 데이터를 찾아서 조인이 들어가고
4. 위의 결과와 jobs 테이블을 비교하여 조인하고 최종 결과를 출력한다.
*/










/* 
외부 조인(OUTER JOIN) : 
상호 테이블 간에 일치되는 값으로 연결되는 내부 조인과는 다르게
어느 한 테이블에 공통 값이 없더라도 해당 row(행)들이 조회 결과에 전부 포함된다.
*/
SELECT first_name, last_name, hire_date, salary, job_id, e.department_id, department_name
FROM employees e, departments d  
WHERE e.department_id = d.department_id(+);
/*
where절인 조인조건 작성할때 플러스를 붙여보자. 이게 외부(아우터)조인이다.
값이 없으면 NULL로 출력되어서 전부다 조회되게 한다.
왼쪽테이블을 기준으로 오른쪽테이블을 갖다 붙인다 라는 것이 +이다.
즉, 왼쪽테이블의 기존 결과는 일단 다 나온다.오른쪽 테이블의 값을 못가져오면 NULL로 표현된다.
*/








SELECT e.first_name, e.last_name, e.hire_date, e.salary, e.job_id, e.department_id, d.department_name
FROM employees e, departments d, locations loc
WHERE e.department_id = d.department_id(+) /*얜 아우터조인*/
AND d.location_id = loc.location_id; /*얜 이너조인*/
/*
이걸 실행시키고 결과를 보면, outjoin먼저 했는데 인출된 모든행은 106개라고 표시된다.
107개여야하는데, locations를 추가로 진행하니까 NULL값을 가지고 있던애가 안나왔다.
즉, employees 테이블에는 존재하고 departments 테이블에는 존재하지 않아도
(+)기호가 붙지 않은 테이블을 기준으로 하여 departments 테이블이 조인에
참여하라는 의미를 부여하기 위해 기호를 붙입니다.

외부(아우터)조인을 사용했더라도, 이후에 내부 조인을 사용하면 
내부조인(이너조인)으로 우선적으로 인식한다.
즉, 이너조인부터하고 아우터하니까 NULL값을 인식 못한다.
*/




SELECT e.employee_id, e.first_name, e.department_id, j.start_date, j.end_date, j.job_id
FROM employees e, job_history j
WHERE e.employee_id = j.employee_id(+)
AND j.department_id = 80;
/*조인은 하되, j.department_id = 80 애들만 할거다.

즉, 오라클조인문법은 일단 잘 안쓰긴하지만..아무튼
외부 조인 진행 시 모든 조건에 (+)를 붙여야 외부 조인이 유지됩니다.
일반 조건에도 (+)를 붙이지 않으면 외부 조인이 풀리는 현상이 발생해서 데이터 누락이 발생된다.


이제 ANSI문법으로 가보자~
*/



