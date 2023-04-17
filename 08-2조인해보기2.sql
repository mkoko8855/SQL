/* �̳�(����) ���� ����*/

/*������ ��� ��ĥ ���̴�*/
SELECT *
FROM info i
INNER JOIN auth a
ON i.auth_id = a.auth_id; 

/*�ؿ��� ����Ŭ����(�߻�����)���� �Ἥ �񱳵� �غ���*/
SELECT
FROM info i, auth a
WHERE i.auth_id = a.auth_id;







/*�Ʒ��� ���� �ȵȴ�~ auth_id �÷��� �� ���̺��� �� �������ִ°ǵ� ��ȣ�� ���Ƕ�� �������
�������� ���� �ش� �÷��� � ���̺� �Ҽ����� ��⸦ ����� �Ѵ�.
��, auth_id�� �÷��� �׳� ���� ��ȣ�ϴ� ��� ���.
���� ���̺� ��� �����ϱ� �����̴ϱ�~
�׷��� �÷��� ���̺� �̸��� ���̴���, ��Ī�� �ٿ��� Ȯ���ϰ� �����ؾ� �Ѵ�.
*/
SELECT i.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a /*�̰� auth�� a��� ��Ī�� ���� ���̴�. */
ON i.auth_id = a.auth_id; 








/*�ʿ��� �����͸� ��ȸ�ϰڴٸ�, WHERE ������ ���� �Ϲ� ������ �ɾ� �ָ� �ȴ�.*/
/*�Ϲ��� ����� �����ϰ� �� �ʿ䰡 ����. */
SELECT i.auth_id, i.title, i.content, a.name
FROM info i
INNER JOIN auth a 
ON i.auth_id = a.auth_id;
WHERE a.name = '�̼���';













/* �ƿ��� ���� (�ܺ�����) */
/*
�������̺��� �ְ�, �����ϰ��� �ϴ� ���̺��� �� ���̴� �����̴�.
*/
SELECT *
FROM info i LEFT OUTER JOIN auth a 
/*LEFT�� �ٿ�����, ������ info ���̺��̴�. 
�̰� �������� auth���̺��� ���� ���̰�, info ���̺� �����͵��� �� ���´�. 
info ���̺��� auth_id�� ������ �ʾҴٸ� NULL �� ���´�.*/

/*���� �ƿ��ͻ��� LEFT JOIN, RIGHT JOIN �̶�� �ᵵ �ȴ�. �׳� JOIN�� �̳������� ���Ѵ�.*/
ON i.auth_id = a.auth_id;

/*������ ���̺��� �����̸� �������� auth ������ ������ �ȴ�.*/






/* FULL OUTER JOIN : ���� ���̺�� ���� ���̺� �����͸� ��� �о� �ߺ��� �����ʹ� �����Ǵ� �ܺ� ����.*/
SELECT *
FROM info i FULL OUTER JOIN auth a /*���� OUTER�� ���� ����*/
ON i.auth_id = a.auth_id;







/* 
CROSS JOIN : JOIN������ �������� �ʱ� ������
�ܼ��� ��� �÷��� ���� JOIN�� �����Ѵ�. 
�����δ� ���� ������� �ʴ´�. 
*/
SELECT *
FROM info
CROSS JOIN auth
ORDER BY id ASC;
/*��, info�� ������ �� �࿡ auth�� ��� �����͸� ���� ���ΰ���
���̳� å���� �ٽ� �ѹ� ���� �������� */










/*���� �� ���̺� ���� > Ű ���� ã�Ƽ� ������ �����ؼ� ���� ��*/
SELECT *
FROM employees e LEFT JOIN departments d
ON e.department_id = d.department_id
/*�ٵ� �� ������ �߰��Ҳ��� �̾ �ɾ��*/
LEFT JOIN locations loc
ON d.location_id = loc.location_id;




/*
���̺� ��Ī�� a�� i�� �̿��Ͽ� LEFT OUTER JOIN�� ����ض�
���̺��� info�� auth�� �̿��϶�
job �÷��� scientist�� ����� id, title, content, job�� ���.
(job �÷��� ���̾�Ƽ��Ʈ ��� ���� �Ϲ������̴� where�����)
*/
SELECT i.id, i.title, i.content, a.job
FROM auth a LEFT JOIN info i
ON a.auth_id = i.auth_id
WHERE a.job = 'scientist';
/*���ǿ��� scientist�� ������ auth a�� ���ʿ� ��� �������� ��ƺ��Ҵ�. */






/* ���������̶�? ���� ���̺� ������ ������ ���Ѵ�.
   ���� ���̺� �÷��� ���� ������ �����ϴ� ���� ��Ī���� ������ �� ����Ѵ�.
*/
/*�Ŵ���id�� ����� �ñ��ϴܸ��̾�~?*/
SELECT e1.employee_id, e1.first_name, e1.manager_id, e2.first_name, e2.employee_id
FROM employees e1
JOIN employees e2
ON e1.manager_id = e2.employee_id;









