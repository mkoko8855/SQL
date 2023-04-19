/*    MERGE (테이블 병합 이다)*/

/* UPDATE와 INSERT를 한 방에 처리한다.
한 테이블에 해당하는 데이터가 있다면 UPDATE를,
없으면 INSERT로 처리해라 라는 것이다.
*/


/*일단 테이블 하나 만들어봐. 복사해서.*/
CREATE TABLE emps_it AS (SELECT *
                         FROM employees WHERE 1 = 2); /*구조만 딸 것이기 때문에 false문 넣어주자. 데이터는 안가져와.*/
                         
SELECT * FROM emps_it;  /*확인해보면 비어있는 테이블만 나올 것이다*/


/*데이터를 삽입해보자*/
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES
    (105, '데이비드', '김', 'DAVIDKIM', '23/04/19', 'IT_PROG');
    
SELECT * FROM emps_it;  /*테이블 확인 용 (데이터가 잘 들어갔는지*/





SELECT * FROM employees  /*이거를 emps_it와 병합할건데, 타겟은 emps_it겠지?*/
WHERE job_id = 'IT_PROG';

MERGE INTO emps_it a /*머지를 할 타겟 테이블을 적어주자, a는 별칭이다*/
    USING (SELECT *      /*병합시킬 데이터. 즉, 원본 테이블이겠다.*/
           FROM employees
           WHERE job_id = 'IT_PROG') b        /*병합 하고자 하는 데이터*/
    ON /*병합시킬 데이터의 연결 조건*/
     (a.employee_id = b.employee_id)
WHEN MATCHED THEN  /*조건에 일치하는 경우(즉, 두 테이블 다 존재하면 업데이트, 타겟 테이블에 이렇게 실행해라 라는 명령어다.*/
    UPDATE SET 
        a.phone_number = b.phone_number, 
        a.hire_date = b.hire_date,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id /*b의 테이블 정보들을 a에 업데이트 시키겠다. 누구만? ON절 조건을 만족한 사람들만.*/
WHEN NOT MATCHED THEN  /*조건에 일치하지 않는 경우(즉, b데이터가 a에 없다는얘기니까 인서트) 타겟 테이블을 이렇게 실행해라 라는 명령어다*/
    INSERT /*속성(컬럼)*/ VALUES
    (b.employee_id, b.first_name, b.last_name,
     b.email, b.phone_number, b.hire_date, b.job_id,
     b.salary, b.commission_pct, b.manager_id, b.department_id);
     
SELECT *
FROM emps_it;/*확인해보면 1줄에서 5줄이 됐다*/

-----------------------------------------------------------------------------


/*머지를 한번 더 연습 해보자*/
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(102, '렉스', '박', 'LEXPARK', '01/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(101, '니나', '최', 'NINA', '20/04/06', 'AD_VP');
INSERT INTO emps_it
    (employee_id, first_name, last_name, email, hire_date, job_id)
VALUES(103, '흥민', '손', 'HMSON', '20/04/06', 'AD_VP');
/*컨트롤엔터눌러서 삽입~*/

/*위 값들은 emps_it에 다 넣은 것이다.

그럼 여기서 문제 : employees 테이블을 매번 빈번하게 수정되는 테이블이라고 가정하자.
                기존의 데이터는 email, phone, salary, comm_pct, manager_id, dept_id를
                업데이트 하도록 처리, 새로 유입된 데이터는 그대로 추가하자.
*/

MERGE INTO emps_it a
    USING 
        /*병합하고자하는 데이터를 작성하면됐었지*/
        (SELECT * FROM employees) b /*이번엔 employees 테이블 자체를 병합*/
    ON
        (a.employee_id = b.employee_id)
        
        
        
        /*머지문에서 DELETE 쓸 순 있지만, DELETE만 단독적으로 쓸 수는 없다.
          UPDATE 이후에 DELETE 작성이 가능하다.
          UPDATE 된 대상을 DELETE 하도록 설계되어 있기 떄문에
          삭제할 대상 컬럼들을 동일한 값으로 일단 UPDATE를 진행하고,
          그 다음 DELETE의 WHERE절에 아까 지정한 동일한 값을 지정해서 삭제한다.
        */
     
        
WHEN MATCHED THEN
    UPDATE SET
        a.email = b.email,
        a.phone_number = b.phone_number,
        a.salary = b.salary,
        a.commission_pct = b.commission_pct,
        a.manager_id = b.manager_id,
        a.department_id = b.department_id
        
        /*머지문에서 DELETE 쓸 순 있지만, DELETE만 단독적으로 쓸 수는 없다.
          UPDATE 이후에 DELETE 작성이 가능하다.
          UPDATE 된 대상을 DELETE 하도록 설계되어 있기 떄문에
          삭제할 대상 컬럼들을 동일한 값으로 일단 UPDATE를 진행하고,
          그 다음 DELETE의 WHERE절에 아까 지정한 동일한 값을 지정해서 삭제한다.
        */
      
        DELETE
            WHERE a.employee_id = b.employee_id
            
            
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.employee_id, b.first_name, b.last_name,
     b.email, b.phone_number, b.hire_date, b.job_id,
     b.salary, b.commission_pct, b.manager_id, b.department_id); /*b만 가지고 있을테니 이것들을 a에다가 넣어줘 라는 얘기다.*/

SELECT *
FROM emps_it
ORDER BY employee_id ASC; /*확인용*/









/* 문제 1
DEPTS 테이블의 다음을 추가하세요 */
DESC DEPTS;
 
INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (280, '개발', 1800);
INSERT INTO DEPTS
    (department_id, department_name, location_id)
VALUES
    (290, '회계', 1800);
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (300, '재정', 301, 1800);
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES    
    (310, '인사', 302, 1800);
INSERT INTO DEPTS
    (department_id, department_name, manager_id, location_id)
VALUES
    (320, '영업', 303, 1700);

SELECt *
FROM DEPTS;


/* 문제 2  2-1*/
UPDATE DEPTS SET department_name = 'IT bank'
WHERE department_name = 'IT Support';


/* 문제 2  2-2*/
UPDATE DEPTS SET manager_id = 301
WHERE department_id = 290;


/* 문제 2  2-3*/
UPDATE DEPTS SET department_name = 'IT Help', manager_id = 303, location_id = 1800
WHERE department_name = 'IT Helpdesk';



/* 문제 2  2-4*/
UPDATE DEPTS SET manager_id = 301
WHERE department_id IN(290, 300, 310, 320);



/* 문제 3*/
DELETE FROM DEPTS
WHERE department_id = 302;

DELETE FROM DEPTS
WHERE department_id = 220;



/* 문제 4*/
DELETE 
FROM depts
WHERE department_id > 200;



/* 문제 4-2 */

UPDATE DEPTS SET manager_id = 100
WHERE manager_id is not null;



/* 문제 4-3*/
/*문제 없음*/





/* 문제 4-4 */
MERGE INTO DEPTS a
USING
(SELECT * FROM departments) b
ON
(a.department_id = b.department_id)
WHEN MATCHED THEN
    UPDATE SET
        a.department_name = b.department_name,
        a.manager_id = b.manager_id,
        a.location_id = b.location_id
WHEN NOT MATCHED THEN
    INSERT VALUES
        (b.department_id, b.department_name, b.manager_id, b.location_id);
        
        
 
        
    



/* 5 - 1*/
CREATE TABLE jobs_it AS
(SELECT *
 FROM jobs
 WHERE min_salary > 6000);
 
 
 
 /* 5 - 2*/
 INSERT INTO jobs_it
 (job_id, job_title, min_salary, max_salary)
 VALUES
 ('IT_DEV', '아이티개발팀', 6000, 20000);
 INSERT INTO jobs_it
 (job_id, job_title, min_salary, max_salary)
 VALUES
 ('NET_DEV', '네트워크개발팀', 5000, 20000);
 INSERT INTO jobs_it
 (job_id, job_title, min_salary, max_salary)
 VALUES
 ('SEC_DEV', '보안개발팀', 6000, 19000);
 
/*또는, INSERT INTO jobs_it VALUSE ('IT_DEV', '아이티개발팀', 6000, 20000);*/
/*INSERT INTO jobs_it VALUSE ('NET_DEV', '아이티개발팀', 5000, 20000);*/
/*INSERT INTO jobs_it VALUSE ('SEC_DEV', '아이티개발팀', 6000, 19000);*/

 
 
/* 5 - 4 */
MERGE INTO jobs_it a
    USING (SELECT * FROM jobs WHERE min_salary >= 0) b
    ON (a.job_id = b.job_id)
WHEN MATCHED THEN
    UPDATE SET a.min_salary = b.min_salary,
               a.max_salary = b.max_salary
WHEN NOT MATCHED THEN
    INSERT VALUES
    (b.job_id, b.job_title, b.min_salary, b.max_salary);
    
    
    SELECt * FROM jobs_it;












    
    
    








