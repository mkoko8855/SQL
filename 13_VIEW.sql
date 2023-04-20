/*

VIEW는 제한적인 자료만 보기 위해 사용하는 가상 테이블의 개념이다. 

뷰는 기본 테이블로 유도된 가상 테이블이기 때문에

필요한 컬럼만 저장해 두면 관리가 용이해진다. 

뷰는 가상 테이블로, 실제 데이터가 물리적으로 저장된 형태는 아니다.

뷰를 통해서 데이터에 접근하면 원본 데이터는 안전하게 보호될 수 있다.
*/


/*
뷰를 만들기 위해서는 권한이 있다. 계정이 없어서 깊게는 말할 수 없지만..
*/
SELECT *
FROM user_sys_privs; /*유저의 권한을 확인할 수 있는 테이블이다. 만든게 아니라 제공되는 테이블이다. */





/*뷰 만드는 것은 어렵지 않다. */

/* 단순 뷰
뷰의 컬럼 이름은 함수 같은 가상표현식이면 안된다.
*/
SELECT employee_id, first_name || ' ' || last_name, job_id, salary
FROM employees
WHERE department_id = 60;
/* 이 모양으로 가상 테이블 하나 만들자 > 위 내용들로 뷰를 만들어 보자 */


/*뷰도 CREATE로 생성한다.*/
CREATE VIEW view_emp AS (
    /*만들고자 하는 뷰의 내용을 작성해주면 된다.*/
    SELECT employee_id, first_name || ' ' || last_name, job_id, salary /*이건안됨, 반드시 확인하게 이름지어야 한다. 컨캣,lower 이런건 별칭을 붙여 명확한 컬럼명을 명시 해줘야 한다. */
    FROM employees
    WHERE department_id = 60
);


/*오류 없이 단순 뷰를 생성해보자*/
CREATE VIEW view_emp AS (
    /*만들고자 하는 뷰의 내용을 작성해주면 된다.*/
    SELECT employee_id, first_name || ' ' || last_name AS name, job_id, salary
    FROM employees
    WHERE department_id = 60
);

/*만들어진 단순 뷰를 확인해보자*/
SELECT *
FROM view_emp;




/* 
다음은 복합 뷰 이다.

여러 테이블을 조인하여 필요한 데이터만 저장하고 빠른 확인을 위해 사용한다.

즉, 단순 뷰와의 차이점은 조인이 되겠다.
*/

/*그럼, 조인문을 이용하여 복합 뷰를 만들며 해보자*/
CREATE VIEW view_emp_dept_jobs AS ( /*테이블3개조인결과를 뷰로 만들라고 하는구나~*/
    SELECT 
    e.employee_id, first_name || ' ' || last_name AS name,
    d.department_name, j.job_title /*필요한 것들만 뽑아서 뷰로 만들겠다!*/
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id  /*좌측은 외래키, 우측은 주키 로, 서로 연결함을 알 수 있겠다.*/
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id ASC;
/*뷰만드는 이유는 위를 자주 활용할 것 같으니..활용할 떄마다 작성하기 힘드니까 뷰로 만드는 것이다*/

/*만들었으니 조회 해보자*/
SELECT * FROM view_emp_dept_jobs;







/* 컬럼을 추가 하고 싶다면, 지우지 말고 수정할 수 있다. */
/* 뷰의 수정 > (CREATE OR REPLACE VIEW 구문) */
/* 동일 이름으로 해당 구문을 사용하면 데이터가 변경되면서 새롭게 생성된다. */
/* salary 컬럼을 추가해보자 */
CREATE OR REPLACE VIEW view_emp_dept_jobs AS ( 
    SELECT 
    e.employee_id, first_name || ' ' || last_name AS name,
    d.department_name, j.job_title, e.salary /*e.salary를 집어 넣어줬다.*/
    FROM employees e
    LEFT OUTER JOIN departments d
    ON e.department_id = d.department_id 
    LEFT JOIN jobs j
    ON e.job_id = j.job_id
)
ORDER BY employee_id ASC;
/*그러면, 생성되었지만 기존의 내용이 바뀌면서 생성됨을 알 수 있다. */


SELECT
    job_title, AVG(salary)
FROM view_emp_dept_jobs
GROUP BY job_title /*잡 타이틀별로 그룹을 만들고싶다*/
ORDER BY AVG(salary) DESC;
/*원래 뷰없으면 조인을 해야 되는데, 뷰테이블에 의해 조인이 된 상태니 안써도 된다. */
/*SQL문이 확실히 짧아짐을 알 수 있다. */





/* 뷰 삭제(CREATE 로 만들었으니 DROP쓰자 */
DROP VIEW view_emp;





/* 
그럼 뷰에 데이터를 집어 넣는 것이 가능할까? 
VIEW에 INSERT가 일어나는 경우, 원본(실제) 테이블에도 반영이 되기 떄문에
그래서 VIEW에 INSERT, UPDATE, DELETE는 많은 제약 사항이 따른다.
원본 테이블이 NOT NULL인 경우, VIEW에서 INSERT가 불가능하다.
그리고, VIEW에서 사용하는 컬럼이 가상 컬럼인 경우에도 INSERT가 안된다(인서트 뿐 만 아니다).
*/


INSERT INTO view_emp_dept_jobs
VALUES(300, 'test', 'test', 'test', 10000); 
/*들어갈 수가 없다. 가상 컬럼에는 INSERT가 허용되지 않는다.*/
/*view_emp_dept_jobs의 두번째 컬럼인 name이라는 컬럼은 첫이름+공백+뒷이름을 합친 것인데, 원본엔 이게 없잖아. 그래서 못넣는다. first_name이든 last_name이든 하나만 원본에 있기 떄문이다..*/
/*즉, 두 번째 컬럼인 name은 가상 커럶이기 때문에 INSERT가 안된다. */


/*그렇다면 빼보자*/
INSERT INTO view_emp_dept_jobs
(employee_id, department_name, job_title, salary)
VALUES(300, 'test', 'test', 10000); 
/*이것도 오류다. JOIN이 된 뷰에서는 한 번에 수정할 수 없다. */
/* 위 컬럼들은 각자 다른 테이블의 컬럼들이기 때문에 조인이 된 상태이다. */


/* 그럼 employees 에만 INSERT를 해보자 */
INSERT INTO view_emp
(employee_id, job_id, salary)
VALUES(300, 'test', 10000);
/* 가상 컬럼이었던 first+lastname을 제외 하고 INSERT를 했지만 하필 not null이라 이것도 오류다.*/
/* 즉, 원본 테이블의  NULL을 허용하지 않는 컬럼 떄문에 들어갈 수 없다. */




/* 
WITH CHECK OPTION   ->  조건 제약 컬럼
즉, 조건에 사용되어진 컬럼값은 뷰를 통해서 변경할 수 없게 해주는 키워드이다.
*/

/*WITH CHECK 옵션 걸지 않고 일단 뷰를 하나 생성해보자 -> 처음이면 생성, 기존에 있으면 수정 해준다! */
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT 
        employee_id, first_name, last_name, email, hire_date, job_id, department_id
    FROM employees
    WHERE department_id = 60
)
WITH CHECK OPTION CONSTRAINT view_emp_test_ck; /*이건 체크옵션의 이름을 줬다. 메롱도 되겠지*/

/*뷰를 이용해서 수정을 진행해보자(UPDATE) -> department_id*/
UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 105; /*105번인 사람의 department_id를 100으로 변경할 것이다.*/
/*그러나 이렇게하면 department_id에 원본테이블에 영향이 가니까 막아주자*/
/*뷰를 만들었을 때 (위로가서)맨 마지막에 department_id가 바뀌면 안된다고 얘기해주자
이렇게 되면, department_id(웨어조건절)의 컬럼의 값을 수정하려 하면 막아준다.*/

UPDATE view_emp_test
SET department_id = 100
WHERE employee_id = 106; /*지금은 바뀌지 않는다. 윗 체크 옵션을 줬기 떄문이다.*/




/* 일일이 걸어주기 귀찮아. 뷰의 인서트, 업데이트, 딜리트 자체가 안됐으면 좋겠어. -> 읽기 전용 뷰(DML 연산 자체를 막는다) -> SELECT만 허용한다. */
CREATE OR REPLACE VIEW view_emp_test AS (
    SELECT 
        employee_id, first_name, last_name, email, hire_date, job_id, department_id
    FROM employees
    WHERE department_id = 60
)
WITH READ ONLY;

/*리드온리가 먹는지 확인해보자*/
UPDATE view_emp_test
SET job_id = 'text'
WHERE employee_id = 106; /*안된다~*/


