-- Equi ���� (=)
-- db account scott
select e.first_name, d.department_name, j.job_title
from EMPLOYEES e, JOBS j, DEPARTMENTS d -- �ڵ强 ���̺��� �ڿ��� �Ѵ�.(�� ��� ���̺��� �տ�)
where e.department_id = d.department_id -- �׷��� �ΰ� �ߺ��Ǵ� ����(PK Ȥ�� FK) �������� �Ǵ�.
and e.job_id	= j.job_id				-- ���̺� �� n����� ������ n-1�� �Ǿ���Ѵ�.


select e.first_name, d.department_name, j.job_title
from EMPLOYEES e join jobs j using (job_id)  -- �÷��̸��� �����ϴٸ� e.job_id = j.job_id ��Ī���� �ȴ�.
join departments d using (department_id)      -- ������ ���̺��� �÷����� �ٸ� �� �����Ƿ� �� ������
											  -- ANSI ǥ����
											  
--������ �̷��� ���� ����.
select e.first_name, d.department_name, j.job_title
from EMPLOYEES e join jobs j on (e.job_id = j.job_id)
join departments d on (e.department_id = d.department_id)


-- non-equi JOIN
-- (=�� �ƴ� ������ JOIN�� �Ѵ�.)
--DECODE() �Լ��� if~elseif~else ���� �����̴�.
--case()�� ���������� �����Ѵ�. ������ �����ڸ� ����� �� �ִ�.
select e.ename, e.job, e.sal, s.grade, 
	   DECODE(s.grade, 1, '1ȣ��', 2, '2ȣ��', 3, '3ȣ��', 4,'4ȣ��', 5,'5ȣ��') grade��,
	   case s.grade when 1 then sal+1000
	   			  when 2 then sal+500
	   			  when 3 then sal+300
	   			  when 4 then sal+100
	   			  else sal end grade��2,
	   case 	  when s.grade = 1 then sal+1000
	   			  when s.grade = 2 then sal+500
	   			  when s.grade = 3 then sal+300
	   			  when s.grade = 4 then sal+100
	   			  else e.sal end grade��3,
	   case 	  when s.grade >= 2 then sal+1000
	   			  else e.sal end grade��4,
	   case		  when e.ename like 'M%' then 'M���ν����Ѵ�'
	   			  else e.ename||'****M���� ���۾���' end �̸�,  
	   DECODE(s.grade, 1, e.sal+1000, 2, e.sal+500, 3, e.sal+300, 4, sal+100, e.sal) �����޿�
from emp e, SALGRADE s
where e.sal between s.losal and s.hisal 

-- db account hr/hr
select *
from Employees e, Departments d, Locations l, Countries c
where e.department_id = d.department_id
and	  d.location_id   = l.location_id
and	  l.country_id    = c.country_id


-- OUTER JOIN(ORACLE ������)(sybase�� *=)
-- ������ �Ǵ� ���� ������ �ϴ��� NULL�̶� �����
select *
from Employees e, Departments d, Locations l, Countries c
where e.department_id = d.department_id(+)
and	  d.location_id   = l.location_id(+)
and	  l.country_id    = c.country_id(+)

-- ������ FULL OUTER JOIN�� ORACLE �����ڷ� �Ұ���
select *
from Employees e, Departments d, Locations l, Countries c
where e.department_id = d.department_id(+)
and	  d.location_id(+)   = l.location_id(+)
and	  l.country_id(+)    = c.country_id(+)

-- OUTER JOIN ANSI ǥ��
-- ������ ����
select *
from Employees e 
LEFT OUTER JOIN Departments d on e.department_id = d.department_id
LEFT OUTER JOIN Locations l on d.location_id   = l.location_id 
LEFT OUTER JOIN Countries c on l.country_id    = c.country_id

-- ������ ������
select *
from Employees e 
RIGHT OUTER JOIN Departments d on e.department_id = d.department_id
RIGHT OUTER JOIN Locations l on d.location_id   = l.location_id 
RIGHT OUTER JOIN Countries c on l.country_id    = c.country_id

-- ������ ����(OR, �� �߿� �ϳ��� ������)
select *
from Employees e 
FULL OUTER JOIN Departments d on e.department_id = d.department_id
FULL OUTER JOIN Locations l on d.location_id   = l.location_id 
FULL OUTER JOIN Countries c on l.country_id    = c.country_id

-- SELF JOIN

SELECT ����.FIRST_NAME �����̸�, �Ŵ���.EMPLOYEE_ID, 
		NVL2(�Ŵ���.EMPLOYEE_ID, TO_CHAR(�Ŵ���.EMPLOYEE_ID), '�Ŵ�������'),
		NVL(�Ŵ���.FIRST_NAME, '����') �Ŵ����̸�,
		�Ŵ���.EMPLOYEE_ID �Ŵ���
FROM EMPLOYEES ����, EMPLOYEES �Ŵ���
WHERE ����.MANAGER_ID = �Ŵ���.EMPLOYEE_ID(+)
ORDER BY  1

SELECT * FROM EMPLOYEES

SELECT * FROM TAB	
	SELECT D.DEPARTMENT_NAME , E.FIRST_NAME
	FROM DEPARTMENTS D, EMPLOYEES E
	WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
	
	
	