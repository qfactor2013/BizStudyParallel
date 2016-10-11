========================================
		SubQuery
========================================


3. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
�׸��� �μ��� ���� ������ ���ؼ��� '<�μ�����>' �� ��µǵ��� �Ѵ�.
(outer-join , nvl() )

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		E.HIRE_DATE,
		NVL(D.DEPARTMENT_NAME, '�μ�����')
		FROM EMPLOYEES E, DEPARTMENTS D
		WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)



4. ������ ��å�� ���� ������ �ٸ��� �����Ϸ��� �Ѵ�.
��å�� 'Manager'�� ���Ե� ������ �޿��� 0.5�� ���ϰ�
������ �����鿡 ���ؼ��� ������ �޿��� �����ϵ��� �Ѵ�. 
�����ϰ� ��ȸ�Ͻÿ�. (decode)

SELECT E.*, J.JOB_TITLE,
DECODE(substr(J.JOB_TITLE, -7, 7), initcap('manager'), E.salary*0.5, E.salary) as "�Ŵ�������д�"
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID

SELECT * FROM EMPLOYEES
SELECT * FROM JOBS

5. �� �μ����� �����޿��� �޴� ������ �̸��� �μ�id, �޿��� ��ȸ�Ͻÿ�.

select E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
	   E.SALARY,
	   E.DEPARTMENT_ID
from employees E 
WHERE (E.DEPARTMENT_ID, E.SALARY) IN (
							SELECT DEPARTMENT_ID ,MIN(SALARY) 
							FROM EMPLOYEES 
							GROUP BY DEPARTMENT_ID)

-- ��������


3. �� ���޺�(job_title) �ο����� ��ȸ�ϵ� ������ ���� ������ �ִٸ� �ش� ���޵�
��°���� ���Խ�Ű�ÿ�. �׸��� ���޺� �ο����� 3�� �̻��� ���޸� ��°���� ���Խ�Ű�ÿ�.



SELECT E.*, D.*
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) 
AND   E.DEPARTMENT_ID IN (SELECT D FROM(
							SELECT DEPARTMENT_ID AS D, COUNT(DEPARTMENT_ID) 
							FROM EMPLOYEES 
							GROUP BY DEPARTMENT_ID 
							HAVING COUNT(DEPARTMENT_ID) >= 3)
							)  
ORDER BY E.DEPARTMENT_ID





SELECT * FROM EMPLOYEES

4. �� �μ��� �ִ�޿��� �޴� ������ �̸�, �μ���, �޿��� ��ȸ�Ͻÿ�.







5. ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�. �׸��� ������ ���� �ش� �μ��� 
�ּұ޿��� �������� ���Խ��� ��� �Ͻÿ�.
   
			




 


