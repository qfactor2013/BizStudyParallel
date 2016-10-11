========================================
		JOIN
========================================

1.�������� �̸��� ���޸�(job_title)�� ��ȸ�Ͻÿ�.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",  J.JOB_TITLE AS "�����̸�"
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID

SELECT * FROM JOBS
 
SELECT * FROM EMPLOYEES

SELECT * FROM TAB

2.�μ��̸��� �μ��� ���� ���ø�(city)�� ��ȸ�Ͻÿ�.

SELECT * FROM COUNTRIES
SELECT * FROM DEPARTMENTS D

SELECT D.DEPARTMENT_NAME, L.CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID 



3. ������ �̸��� �ٹ��������� ��ȸ�Ͻÿ�. (employees, departments, locations,countries)
 
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		C.COUNTRY_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND	  D.LOCATION_ID = L.LOCATION_ID
AND   L.COUNTRY_ID  = C.COUNTRY_ID

SELECT * FROM JOBS

4. ��å(job_title)�� 'manager' �� ����� �̸�, ��å, �μ����� ��ȸ�Ͻÿ�.
 
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		J.JOB_TITLE,
		D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.JOB_ID = J.JOB_ID
AND	  E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND   J.JOB_TITLE LIKE INITCAP('%MANAGER%')



5. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
 
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
	   E.HIRE_DATE,
	   D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID




6. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
	   E.HIRE_DATE,
	   D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)



7. ������ �̸��� ��å(job_title)�� ����Ͻÿ�.
��, ������ �ʴ� ��å�� �ִٸ� �� ��å������ ��°���� ���Խ�Ű�ÿ�.


SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
	   J.JOB_TITLE
FROM EMPLOYEES E 
RIGHT OUTER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
ORDER BY J.JOB_ID




insert into JOBS values('Free', '�׿��ΰ�', 500, 1000)