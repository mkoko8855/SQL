

/* ��������

-���������� ������� () �ȿ� �����.
������������ �������� 1�� ���Ͽ��� �Ѵ�.
�������� ������ ���� ����� �ϳ� �ݵ�� ���� �Ѵ�.
�ؼ��� ���� ���������� ���� ���� �ؼ��ϸ� �ȴ�.

*/

--'Nancy'�� �޿����� �޿��� ���� ����� �˻��ϴ� ����.
SELECT salary 
FROM employees 
WHERE first_name = 'Nancy';  /*12008�� ���� ���´�. */






SELECT * 
FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE first_name = 'Nancy');   /*salary�� ���� ������������ ��ȸ�� ������ ũ�ٸ� �̶� ���̴�.*/
                /*�������� ���� �ؼ��Ѵ�. */










/* ���� �� ���ο� ���� ������ �� ��������. */
/*employee_id�� 103���� ����� job_id�� ������ ����� �˻��ϴ� ����*/

/*�ϴ� employee_id�� 103���� ����� job_id���� �˾ƾ߰���?*/
SELECT job_id
FROM employees
WHERE employee_id = 103;
/*JOB_ID�� IT_PROG �ϳ� ���Դ�. ���������� �̿��غ���*/

SELECT *
FROM employees
WHERE job_id = (SELECT job_id 
                FROM employees 
                WHERE employee_id = 'IT_PROG'); /*103 ��ſ� IT_PROG�� �Ẹ�Ҵ�. �׷� ������ ��� ��? �������ε� = �� ��� ����. */
/*���������� �����ϴ� ���� �������� ������ �����ڸ� ����� �� ���� �����̴�.
�̷� ��쿡�� ������ �����ڸ� ����ؾ� �Ѵ�.
�������� �ϳ��� > = �ص� �Ǵµ�, ���� ����� �������� �Ϲ����� = > ���� �����ڴ� ����� �� ����. 
�������� ����� 2�� �� �̻��̸� ���� �� ����������� �θ���. ���������� ���� �� �̶�� �ٸ� �����ڸ� ����ؾ� �Ѵ�.
IN, ANY, SOME, ALL, EXISTE
*/










/* ������ ������ IN�� ���ؼ� �˾ƺ���.
IN�̶�? ����� � ���� ���� �� Ȯ���Ѵ�.
*/
SELECT *
FROM employees
WHERE job_id IN (SELECT job_id 
                FROM employees 
                WHERE job_id = 'IT_PROG');










                
                

/* first_name�� David�� ��� �� ���� ���� ������ �޿��� ū ����� ��ȸ�϶��? */
SELECT salary
FROM employees
WHERE first_name = 'David';
/*�̷� ������ ��, ANY��� �����ڸ� ����Ѵ�.
ANY��? ���� ���������� ���� ���ϵ� ������ ���� ���Ѵ�.
��, �ϳ��� �����ϸ� �ȴ�.
*/
SELECT *
FROM employees
WHERE salary > ANY (SELECT salary 
                    FROM employees 
                    WHERE first_name = 'David');
                    /*salary�� Ŀ�ߵȴ�. ��������? 3���� ��ȸ ��� �߿���(4800, 9500, 6800) ����̶� ���� ���̴�.
                    > �� ANY�� ����ߴٴ°�, �� ������ �ϳ��� �����ϸ� ��ȸ ����� ���Եȴ�.*/
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
/* ALL �̶�?
���� ���������� ���� ���ϵ� ���� ��� ���ؼ� ��� ������ �ؾ� �Ѵ�.
*/   
SELECT *
FROM employees
WHERE salary > ALL (SELECT salary    /*�Ʊ� ���̺��� 4800 9500 6800���Դµ�, ANY�� ���߿� �ϳ��� Ŀ�� ��ȸ��� ���Եȴ�.
                                       ��, �������� 4800���ٸ� Ŀ�� ���� ��ȸ�Ǵµ�,
                                       ALL�� 4800 9500 6800���� �� �´� Ŀ���Ѵ�.*/
                    FROM employees 
                    WHERE first_name = 'David');
                    /*
                        < ANY : ���� ū ������ �������
                        < ALL : ���� ���� ������ �۾ƾ� ��
                        > ALL : ���� ū ������ Ŀ�� ��
                        = ANY : IN�� ���� ������ �Ѵ�.
                    */




-----------------------------------------------------------------------------
                    
                    
                    
                    
                    
/* SELECT ������ ���������� ��Į�� ���������̴�. */
/* ��� ��ȸ ����� LEFT OUTER JOIN�� ������ ����� ���´�. */

/*�ϴ� ��Į�� �����ϰ� ����ϰ� �ۼ��غ���*/
SELECT e.first_name, d.department_name /*����� �̸��� ����� �μ� ���� �غ��Ҵ�. �μ� ���� departments������ ���� �� �ִ�. */
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id
ORDER BY first_name ASC;
                
                
                            /*���� ��Į�� ���������� ����غ���*/
SELECT e.first_name, (SELECT department_name
                      FROM departments d
                      WHERE d.department_id = e.department_id) AS department_name  /*e.department_id�� from������*/
FROM employees e
ORDER BY first_name ASC;  /* 
                             ��Į�� ���κ��� ���� ����, �Լ�ó�� �� ���ڵ�� ��Ȯ�� �ϳ��� ������ ������ �� �̴�.
                             ������ ��Į�󺸴� ���� ����, ��ȸ�� �����Ͱ� ��뷮�� ��� �� �ش� �����Ͱ� ����, ���� ���� ����� ���.
                          */
                          






/*��Į�� ���������� �ϳ� �� �غ���.      �� �μ� �� �Ŵ��� �̸��� �˾ƺ���*/
/*�μ��� departments, �̸��� employees�� ������ �ִ�*/
/*����Ʈ ����(��Į��� ���Ϻ���ϴϱ�)���� �ѹ� ���� �Ẹ�� ��Į�� �Ẹ��*/
SELECT d.*, e.first_name
FROM departments d
LEFT JOIN employees e
ON d.manager_id = e.employee_id
ORDER BY d.manager_id ASC;

/*���� ��Į�󼭺������� �ۼ��غ���*/
SELECT d.*, ( SELECT first_name
              FROM employees e
              WHERE e.employee_id = d.manager_id )AS manager_name
FROM departments d
ORDER BY d.manager_id ASC;











/*������ �� �μ��� ��� �� �̱�*/
SELECT department_id, COUNT(*)                    
FROM employees
GROUP BY department_id;
/*������ �����µ� � �μ����� �𸥴�. ��Į��� �غ���*/


SELECT d.*, ( /*������� ��ȸ�ϴ� ������ ã�� ���⼭.*/
              SELECT COUNT(*)
              FROM employees e
              WHERE e.department_id = d.department_id
              GROUP BY department_id ) AS �����
FROM departments d;









-------------------------------------------------------------

/* �̹����� ���������� FROM ���� �ٴ´�. �̰��� �ζ��� ��(FROM ������ ���������� ���� ��) �̶�� �Ѵ�. */

/* �ζ��� ��� ������ ���س��� ��ȸ �ڷḦ ������ �����ؼ� ������ ���� ��쿡 ����Ѵ�. */



/* ���� ��ŷ�� ���غ���~ */
SELECT employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;
/*�� ������� �������� �ʰ� 11����� 20����� ������ �߰��� ���ϰ�ʹٸ�?*/
/*salary�� ���ĵǾ� ������ salary�� ��ȣ�� ���̸� ���ϰ���~ ROWNUM���� ���̸� �ȴ�. */


/*���� ��ȣ�ƿ��� �Ẹ��. 
�׷��� �Ʒ��� SELECT���� ROWNUM���� �ڵ�� ��, salary�� ������ �����ϸ鼭 �ٷ� ROWNUM���̸� 
ROWNUM�� ������ ���� �ʴ� ��Ȳ�� �߻��Ѵ�. ������ ROWNUM�� ���� �ٰ� ������ ���� �Ǳ� �����̴�. 
�������̴� �׻� �������� ������ �Ǳ� �����̴�. 
�ذ����� ������ �̸� ����� �ڷῡ ROWNUM�ٿ��� �ٽ� ��ȸ�ϴ� ���� ����.*/
SELECT ROWNUM AS ��ŷ, employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;


/*�ٽ� ��ȣ �ƿ��� ����� �ۼ� �غ���*/
SELECT ROWNUM AS ��ŷ, tbl.*  /*�ο�� �ٿ��� tbl�� ������ ��ȸ�϶� ��� ���̴�.*/
FROM
(SELECT employee_id, first_name, salary /*�������� ������, ������, �������̸� ������ ���̺�� ����*/
FROM employees e
ORDER BY salary DESC ) tbl /*������ ���̺��� tbl�̶� ��Ī�� ��µ�, AS�� ���� �ȵȴ�.*/
WHERE ��ŷ > 10 AND ��ŷ <= 20; /*
                                �� WHERE���� �ȵȴ�. �ֳ��ϸ� ��ŷ�� ��ȸ�� �� �ٿ��� �̸��ε�,
                                ���������� where������ �ϰ� �ֱ� �����̴�.  FROM ���� select�� �ƴ϶� where�̴ϱ�. ��ŷ�̶� ��Ī�� SELECT���� �ִ�.
                                �ذ����� ROWNUM�� SELECT���� ���� ��ȸ�� �Ǿ��ϴ� ROWNUM���� �ٿ����� ��, WHERE���� ������ ��� �Ϳ� ()�� �ɾ��ش�.                              
                              */


/* ��, WHERE���� ������ ��� ���� ���������� �����ؼ� */
/* �����, ���� ���� SELECT ������ �ʿ��� ���̺� ����(�ζ��� ��)�� �����Ѵ�. �� ���� �ٱ��� SELECT������ ROWNUM�� �ٿ��� �ٽ� ��ȸ�Ѵ�(2��°��ȣ).
�� ����, ���� �ٱ��� SELECT�������� �̹� �پ��ִ� ROWNUM�� ������ �����ؼ� ��ȸ�ϸ� �Ǵ� ���̴�.*/
SELECT *   /*����¡�Ҷ� �̰� ��..�����ְ���?*/
FROM
(
SELECT ROWNUM AS ��ŷ, tbl.*  
FROM
(SELECT employee_id, first_name, salary 
FROM employees e
ORDER BY salary DESC ) tbl
)
WHERE ��ŷ > 10 AND ��ŷ <= 20;





/* �Ʒ� ���̺��� �������� ��¥�� ���� ��¥�� �����͸� �̾Ƴ����?*/
/*��¥ Ÿ������ ���� �� tochar�� ������ ������ ���� �ϸ� �� ���̴�. �� ������ ���� ���� ��ȣ�� ���� ���̴�.*/
SELECT *
FROM
(
SELECT TO_CHAR(TO_DATE(test, 'YY/MM/DD'), 'MMDD') AS mm, name
FROM
    (
    SELECT 'ȫ�浿' AS name, '20230418' AS test 
    FROM dual 
    UNION ALL
    SELECT '��ö��', '20230301' 
    FROM dual 
    UNION ALL
    SELECT '�ڿ���', '20230201' 
    FROM dual 
    UNION ALL
    SELECT '��ǻ�', '20230501' 
    FROM dual 
    UNION ALL
    SELECT '�ڶѶ�', '20230601' 
    FROM dual 
    UNION ALL
    SELECT '���׽�Ʈ', '20230701' 
    FROM dual
    )
)
WHERE mm = '0418';


