

/* INSERT */

/*
그러나, 테이블 구조를 알아야 쓰겠지?
테이블 구조를 확인부터 해보자.
*/
DESC departments;




/* INSERT 의 첫번째 방법 ( 모든 컬럼 데이터를 한 번에 지정) */
INSERT INTO departments
VALUES(290, '영업부', 100, 2300); /*departments에 넣고 싶은 값을 모두 때려넣자*/, /*또한 VALUES를 이용해서 값을 넣을 때는 컬럼 개수 만큼 값을 무조건 넣어줘야 된다.*/
/*결과보면, 1행이 삽입되었습니다. 라고 나온다 확인해보자*/
SELECT * FROM departments;
ROLLBACK;       /*실행 시점을 다시 뒤로 되돌리는 키워드, 일단 그냥 써보자 나중에 배움*/



/* INSERT 의 두번째 방법 (직접 컬럼을 지정하고 저장, 그리고 NOT NULL 확인하세요!) */
INSERT INTO departments
    (department_id, location_id) /*내가 데이터를 삽입하고자 하는 컬러만 써보자*/
VALUES
    (290, '영업부'); /*컬럼 값에 만큼 전부 안줬는데 왜? > 값을 안줘도 null로 되기 떄문 > 무슨소리냐면, 매니저와 로케이션 id는 NOT NULL이 아니라 빈 칸이었기 떄문에 안줘도 표현할 수 있다. 그러나 department_name은 NOT NULL이기 떄문에 무조건 값을 넣어줘야 한다. */











---------------------------------------------------------------













/* 원본 테이블을 망치기 싫다면 사본 테이블을 생성 할 수 있다. */
CREATE TABLE managers AS      /*내가 복사본 만들고자 하는 테이블을 적어주자 > CTAS*/
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);
/*managers라는 테이블을 만들껀데 어떻게 만들꺼냐? > SELECT FROM절 처럼 만들었다. 라고 해석할 수 있겠다. */


DROP TABLE managers; /*일단 다시 삭제하고*/


/*다시 사본을 만들어보자*/
/* 사본 테이블을 생성할 때 그냥 생성하면 > 조회된 데이터까지 모두 복사되고,
   WHERE절에 false값(1 = 2)를 지정하면 > 테이블의 구조만 복사하고 데이터는 복사 X*/
CREATE TABLE managers AS     
(SELECT employee_id, first_name, job_id, hire_date
FROM employees
WHERE 1 = 2);

SELECT *
FROM managers;
/*WHERE 1 = 2를 추가해서 테이블을 만들고, SELECT * FROM 으로 테이블을 확인하려했지만
WHERE 1 = 2라는 조건을 줬는데 테이블이 뜨지 않는다. 즉, 구조만 따오고 데이터는 가져오지 않는다.
*/




/* 
데이터를 넣어보자.
INSERT 문에 서브쿼리를 넣을 수 있다.
*/
/*managers는 지금 분명 비어있을텐데, 아래 코드들(서브쿼리)로 한번에 밀어넣어보자*/
INSERT INTO managers
(SELECT employee_id, first_name, job_id, hire_date
FROM employees);

/* SELECT * FROM managers로 확인을 해보면 잘 들어간 것을 확인할 수 있다.*/





---------------------------------------------------------------------





/*   UPDATE (수정)  */
CREATE TABLE emps AS (SELECT * FROM employees); /*employees테이블 전체를 복사할 것이다.*/

SELECt *
FROM emps; /*employees랑 완벽한 똑같은 테이블이 나올 것이다.*/
/*그러나, CTAS를 사용하면 제약 조건은 NOT NULL 말고는 복사 되지 않습니다. 구조랑 데이터만 복사한다.*/
/*제약조건은 업무 규칙을 지키는 데이터만 저장하고, 그렇지 않은 것들이 DB에 저장되는 것을 방지하는 목적으로 사용한다. */


