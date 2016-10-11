-- SELF JOIN
1. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.
 
select E1.FIRST_NAME||' '||E1.LAST_NAME AS "�����̸�", 
	   E2.FIRST_NAME||' '||E2.LAST_NAME AS "�������̸�" 
from EMPLOYEES e1, EMPLOYEES e2
where e1.manager_id = e2.employee_id
ORDER BY 1

2. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.
�����ڰ� ���� ���������� ��� ����Ͻÿ�.
 
select E1.FIRST_NAME||' '||E1.LAST_NAME AS "�����̸�", 
	   (E2.FIRST_NAME||' '||E2.LAST_NAME) AS "�������̸�"
from EMPLOYEES e1, EMPLOYEES e2
where e1.manager_id = e2.employee_id(+)

3. ������ �̸��� �����ڰ� �����ϴ� ������ ���� ��ȸ�Ͻÿ�.
��, ������������ 3�� �̻��� �����ڸ� ��µǵ��� �Ͻÿ�.
 

select E2.FIRST_NAME||' '||E2.LAST_NAME AS "�������̸�",
	   count(E2.FIRST_NAME)
from EMPLOYEES e1, EMPLOYEES e2
where e1.manager_id = e2.employee_id(+)
GROUP BY E2.FIRST_NAME, E2.LAST_NAME
HAVING count(E2.FIRST_NAME) >=3
ORDER BY 1