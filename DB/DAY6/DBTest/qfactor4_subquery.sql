--SUB QUERY
-- ����/������, �����÷�, ��ȣ����, ��Į�� ���������� �ִ�.

-- ��ձ޿����� �����޿��� �޴� ������ ����?

select 
*
from EMPLOYEES e
where e.salary < (
					select avg(salary) from EMPLOYEES
			  		)
			  
-- ��Ƽ��ŷ�� ���� �μ��� ������ȸ

select * 
from EMPLOYEES 
where department_id =
(			  		
	select department_id
	from employees
	where first_name = 'Steven'
	and last_name = 'King'
)

-- �ִ� �޿��� �޴� ����
select *
from EMPLOYEES
where salary = (
					select max(salary)
					from EMPLOYEES
					)
					
					
-- country_id�� 'US'�� �μ���?
select 	*
from DEPARTMENTS
where location_id in (
select location_id 
from LOCATIONS
where country_id = 'US'
)

--�˷������ ���� �μ��� �������� ��ȸ(30,60)
select *
from EMPLOYEES		-- =any == in
where DEPARTMENT_id =any (
select DEPARTMENT_id
from EMPLOYEES
where first_name = 'Alexander'
)


-- 30�� �μ��� �������� �޿����� ���� �޿��� �޴� �������� ��ȸ
-- ALL(�ִ뺸�� ũ��.
select * 
from EMPLOYEES
where salary > any ( -- ������ �ּҸ�� ũ��
select salary
from EMPLOYEES
where DEPARTMENT_id = 30
)


select * 
from EMPLOYEES
where (department_id, salary) in (    -- �����÷��񱳵� �����ϴ�!!!
				  select department_id, min(salary) as a
				  from EMPLOYEES
				  group by department_id
				  )
-- from���� �������� => �ζ���-��
select *
from employees e, (select department_id, min(salary) as a
				  from EMPLOYEES
				  group by department_id) e2
where e.department_id = e2.department_id
and e.salary = e2.a
				  

-- ������ �޴� �޿��� ������ ���� �μ��� ��պ��� ���� �޿��� �޴� ����
-- select ���� ���ִ� ���������� ��Į�� ���������� �Ѵ�.
select e.*, ( select avg(se.salary)
				 from employees se
				 where se.department_id = e.department_id)
from employees e
where salary < ( select avg(se.salary)
				 from employees se
				 where se.department_id = e.department_id)

				 
				 
-- row �� select ȣ�� �ÿ� �����ȴ�.
select rowid, first_name, salary
from employees

-- rownum�� ������ �࿡ ������ �Ű��ִ� ����Ŭ�� �ε���
-- from�ؼ� ������ �����ʹ� 1�྿ �����ͼ� where ���� ���Ѵ�.
-- �׷��� rownum = 5 ������ ��ȸ �ȵ�
-- �ҷ��� �ѹ� �� ���μ� ���̺�� ������! (�ζ��κ�)
			
		select * from
			(
				select rownum cc,
						a.* 
				from(
						select rownum as "aa", e.first_name, e.salary
						from employees e
						order by e.salary desc
					) a
			)
		where cc = 5