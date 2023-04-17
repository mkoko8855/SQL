/* 이너(내부) 조인 문법*/

/*인포랑 어쓰랑 합칠 것이다*/
SELECT *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id; 

/*밑에다 오라클문법(잘사용안함)으로 써서 비교도 해보자*/
SELECT
FROM info i, auth a
WHERE i.auth_id = a.auth_id;







/*아래는 실행 안된다~ auth_id 컬럼은 두 테이블을 다 가지고있는건데 모호만 정의라고 에러뜬다
가독성을 위해 해당 컬럼이 어떤 테이블 소속인지 얘기를 해줘야 한다.
즉, auth_id는 컬럼을 그냥 쓰면 모호하다 라고 뜬다.
양쪽 테이블에 모두 존재하기 때문이니까~
그래서 컬럼에 테이블 이름을 붙이던지, 별칭을 붙여서 확실하게 지목해야 한다.
*/
SELECT i.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a /*이건 auth의 a라는 별칭을 붙인 것이다. */
ON i.auth_id = a.auth_id; 








/*필요한 데이터만 조회하겠다면, WHERE 조건을 통해 일반 조건을 걸어 주면 된다.*/
/*일반은 웨얼로 복잡하게 쓸 필요가 없지. */
SELECT i.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a 
ON i.auth_id = a.auth_id;
WHERE a.name = '이순신';













/* 아우터 조인 (외부조인) */
/*
기준테이블이 있고, 조인하고자 하는 테이블을 얹어서 붙이는 형태이다.
*/
SELECT *
FROM info i LEFT OUTER JOIN auth a 
/*LEFT를 붙였으니, 기준은 info 테이블이다. 
이걸 기준으로 auth테이블을 갖다 붙이고, info 테이블 데이터들은 다 나온다. 
info 테이블에서 auth_id를 가지지 않았다면 NULL 로 나온다.*/

/*또한 아우터빼고 LEFT JOIN, RIGHT JOIN 이라고 써도 된다. 그냥 JOIN은 이너조인을 뜻한다.*/
ON i.auth_id = a.auth_id;

/*오른쪽 테이블이 기준이면 오른쪽인 auth 내용이 기준이 된다.*/






/* FULL OUTER JOIN : 좌측 테이블과 우측 테이블 데이터를 모두 읽어 중복된 데이터는 삭제되는 외부 조인.*/
SELECT *
FROM info i FULL OUTER JOIN auth a /*물론 OUTER는 생략 가능*/
ON i.auth_id = a.auth_id;







/* 
CROSS JOIN : JOIN조건을 설정하지 않기 때문에
단순히 모든 컬럼에 대해 JOIN을 진행한다. 
실제로는 거의 사용하지 않는다. 
*/
SELECT *
FROM info
CROSS JOIN auth
ORDER BY id ASC;
/*즉, info의 데이터 한 행에 auth의 모든 데이터를 갖다 붙인거임
정미나 책으로 다시 한번 보고 이해하자 */










/*여러 개 테이블 조인 > 키 값만 찾아서 구문을 연결해서 쓰면 됨*/
SELECT *
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
/*근데 또 조건을 추가할꺼면 이어서 걸어라*/
LEFT JOIN locations loc
ON d.location_id = loc.location_id;




/*
테이블 별칭을 a와 i를 이용하여 LEFT OUTER JOIN을 사용해라
테이블은 info와 auth를 이용하라
job 컬럼이 scientist인 사람의 id, title, content, job을 출력.
(job 컬럼이 싸이언티스트 라는 것은 일반조건이니 where써야함)
*/
SELECT i.id, i.title, i.content, a.job
FROM auth a LEFT JOIN info i
ON a.auth_id = i.auth_id
WHERE a.job = 'scientist';
/*조건에서 scientist라 했으니 auth a를 왼쪽에 적어서 기준으로 삼아보았다. */






/* 셀프조인이란? 동일 테이블 사이의 조인을 말한다.
   동일 테이블 컬럼을 통해 기존에 존재하는 값을 매칭시켜 가져올 때 사용한다.
*/
/*매니저id의 사원이 궁금하단말이야~?*/
SELECT e1.employee_id, e1.first_name, e1.manager_id, e2.first_name, e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;









