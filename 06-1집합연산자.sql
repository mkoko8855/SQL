/*집합 연산자*/

/* UNION (합집합이며 중복X),     UNION ALL(합집합이며 중복O*/
/* INTERSECT(교집합),          MINUS(차집합)            */
/* 위 아래 column 개수와 데이터 타입이 정확히 일치해야 한다. A 자료1개 B 자료2개면 못합침*/


SELECT employee_id, first_name /*여기2개 아래도 2개라서 UNION이 가능하다.*/
FROM employees
WHERE hire_date LIKE '04%' 
UNION
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;




SELECT employee_id, first_name
FROM employees
WHERE hire_date LIKE '04%' 
UNION ALL /*얘는 중복까지 허용*/
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;




SELECT employee_id, first_name /*여기2개 아래도 2개라서 UNION이 가능하다.*/
FROM employees
WHERE hire_date LIKE '04%' 
INTERSECT /*얘는 교집합*/
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;





SELECT employee_id, first_name /*여기2개 아래도 2개라서 UNION이 가능하다.*/
FROM employees
WHERE hire_date LIKE '04%' 
MINUS /*얘는 차집합*/
SELECT employee_id, first_name
FROM employees
WHERE department_id = 20;