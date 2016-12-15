========================================
		SubQuery
========================================


3. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
�׸��� �μ��� ���� ������ ���ؼ��� '<�μ�����>' �� ��µǵ��� �Ѵ�.
(outer-join , nvl() )

-- ����Ŭ���� ���� �ڿ� ���´�.(ASC ����)
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		E.HIRE_DATE,
		NVL(D.DEPARTMENT_NAME, '�μ�����') �μ��̸�
		FROM EMPLOYEES E, DEPARTMENTS D
		WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
		ORDER BY �μ��̸� NULLS FIRST -- NULLS FIRST�� �ϰԵǸ� ���� ���� ����
									  -- ��Ī���� �ϰ� �Ǹ� �̹� ����Ǽ� NULL�� �ƴϰ� ��
		

4. ������ ��å�� ���� ������ �ٸ��� �����Ϸ��� �Ѵ�.
��å�� 'Manager'�� ���Ե� ������ �޿��� 0.5�� ���ϰ�
������ �����鿡 ���ؼ��� ������ �޿��� �����ϵ��� �Ѵ�. 
�����ϰ� ��ȸ�Ͻÿ�. (decode)

SELECT E.*, J.JOB_TITLE,
DECODE(substr(J.JOB_TITLE, -7, 7), initcap('manager'), E.salary*0.5, E.salary) as "�Ŵ�������д�",
CASE WHEN JOB_TITLE LIKE initcap('%manager%')
then salary * 0.5
else salary end ����д�2
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



select j.job_title, count(employee_id)
from employees e, jobs j
where e.job_id(+) = j.job_id
group by j.job_title
having count(job_title)>=3

SELECT * FROM EMPLOYEES

4. �� �μ��� �ִ�޿��� �޴� ������ �̸�, �μ���, �޿��� ��ȸ�Ͻÿ�.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		NVL(D.DEPARTMENT_NAME, '�μ�����'),
		E.SALARY
FROM	EMPLOYEES E, DEPARTMENTS D
WHERE	(E.DEPARTMENT_ID, E.SALARY) IN (SELECT DEPARTMENT_ID,MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID)
AND		E.DEPARTMENT_ID = D.DEPARTMENT_ID




5. ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�. �׸��� ������ ���� �ش� �μ��� 
�ּұ޿��� �������� ���Խ��� ��� �Ͻÿ�.
   
-- IN-LINE VIEW �̿�
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		E.DEPARTMENT_ID,
		E.SALARY,
		E2.MI
FROM EMPLOYEES E, 	(SELECT MIN(EX.SALARY) AS "MI", 
				EX.DEPARTMENT_ID 
		FROM EMPLOYEES EX
		GROUP BY EX.DEPARTMENT_ID 
		ORDER BY EX.DEPARTMENT_ID) E2
WHERE E.DEPARTMENT_ID = E2.DEPARTMENT_ID




 


