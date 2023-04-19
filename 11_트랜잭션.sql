
SELECT * FROM emps; /*사본테이블인 emps을 이용해서 데이터 삽입 해보자 */

/* 오토커밋 여부 확인 */
SHOW AUTOCOMMIT;     
SET AUTOCOMMIT ON;   /*오토커밋 온*/
SET AUTOCOMMIT OFF;  /*오토커밋 오프*/



INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (304, 'lee', 'lee1234@gmail.com', sysdate, 1800);

/*인서트를 했는데 취소하고싶어. 그러면, 보류중인 모든 데이터 변경사항을 취소, 직전 커밋 단계로 회귀(돌아가는)및 트랜잭션 종료 */
ROLLBACK;


SELECT * FROM emps;



-------------------------------------------



/* SAVE POINT 생성 > Oracle에서만 사용하는 문법이다. */
/* 롤백할 포인트를 직접 이름을 붙여서 지정. */
/* ANSI 표준 문법이 아니기 때문에 그렇게 권장하는 문법은 아니다. */
SAVEPOINT insert_park; /*이름을 붙여서 SAVEPOINT를 정했다.*/

INSERT INTO emps
    (employee_id, last_name, email, hire_date, job_id)
VALUES
    (305, 'park', 'park4321@gmail.com', sysdate, 1800);

ROLLBACK TO SAVEPOINT insert_park;


/*보류중인 모든 데이터 변경사항을 영구적으로 적용하면서 트랜잭션 통료 */
/*커밋한 이후에는 어떠한 방법을 사용하더라도 되돌릴 수 없다. */
COMMIT;








