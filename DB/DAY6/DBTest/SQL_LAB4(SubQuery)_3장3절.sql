========================================
		SubQuery
========================================
1. 'IT'�μ����� �ٹ��ϴ� �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
	   E.SALARY,
	   E.HIRE_DATE
from employees E
where E.DEPARTMENT_ID in ( 
							SELECT DEPARTMENT_ID 
							FROM DEPARTMENTS 
							WHERE DEPARTMENT_NAME 
							LIKE UPPER('%it%')
						)		






2. 'Alexander' �� ���� �μ����� �ٹ��ϴ� ������ �̸��� �μ�id�� ��ȸ�Ͻÿ�.


select E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
	   E.EMPLOYEE_ID
from EMPLOYEES	E	-- =any == in
where E.DEPARTMENT_id =any (
select DEPARTMENT_id
from EMPLOYEES
where first_name = 'Alexander'
)


3. 80���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		E.DEPARTMENT_ID,
		E.SALARY
FROM EMPLOYEES E
WHERE E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80)

4. 'South San Francisco'�� �ٹ��ϴ� ������ �ּұ޿����� �޿��� ���� �����鼭 
50 ���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �޿�, �μ���, 
�μ�id�� ��ȸ�Ͻÿ�.

SELECT * FROM TAB
SELECT * FROM COUNTRIES
SELECT * FROM LOCATIONS

SELECT  E.FIRST_NAME||' '||E.LAST_NAME AS "�����̸�",
		E.SALARY,
		E.DEPARTMENT_ID,
		D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND   E.SALARY > (SELECT MIN(E.SALARY) 
				  FROM EMPLOYEES E, 
				  DEPARTMENTS D, 
				  LOCATIONS L
				  WHERE 
				  		E.DEPARTMENT_ID = D.DEPARTMENT_ID
				  AND	D.LOCATION_ID	= L.LOCATION_ID
				  AND	L.CITY			= 'South San Francisco'	)
AND	  E.SALARY > (SELECT AVG(SALARY)
					FROM EMPLOYEES
					WHERE DEPARTMENT_ID = 50)



-------------------scott/tiger (emp, dept)

1. BLAKE�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
������� BLAKE�� ���ܽ�ŵ�ϴ�.

SELECT * FROM TAB
SELECT * FROM EMP, DEPT

SELECT E.ENAME, E.HIREDATE
FROM EMP E
WHERE E.DEPTNO = ( SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE')
AND E.ENAME != 'BLAKE'


2. �μ��� ��ġ�� DALLAS�� ��� ����� �̸�, �μ���ȣ , ������ ǥ���Ͻÿ� 

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE D.DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS')



3. KING���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ� 

 
SELECT E.ENAME, E.SAL
FROM EMP E
WHERE E.MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')













 
