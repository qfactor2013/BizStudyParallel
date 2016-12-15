--subquery
--��ձ޿����� �����޿��� �޴� ������ ����?

select *
from employees
where salary < ( 
                 select avg(salary)
                 from employees 
               )
--��Ƽ��ŷ�� �����μ��� ������ȸ
select *
from employees
where department_id =  (
			select department_id
			from employees
			where first_name = 'Steven'
			and last_name = 'King' )
--�ִ�޿��� �޴� ������ ����?
select *
from employees
where salary = ( 
				select max(salary)
				from employees )
				
select *
from employees
where salary = ( 
				select min(salary)
				from employees )				

--country_id�� 'US'�� �μ��� ?

select *
from departments
where location_id in  (
				select location_id
				from locations
				where country_id = 'US'	)		
				
---�˷������ �����μ��� �������� ��ȸ�Ͻÿ� (30,60)
-- =ANY�� IN�� ����. 
select *
from employees
where department_id =ANY (
		select department_id
		from EMPLOYEES
		where first_name = 'Alexander' )
				
--30�� �μ��� �������� �޿����� ���� �޿��� �޴� �������� ��ȸ
-- >ALL (�ִ뺸�� ũ���� �ǹ�)
select *
from employees
where salary >ALL (
					
			select salary
			from employees
			where department_id = 30 ) 

-- >ANY : �ּҺ���ũ��. 			
select *
from employees
where salary >ANY (					
			select salary
			from employees
			where department_id = 30 ) 

--�μ��� �ּ� �޿��� �޴� �������� ���
select *
from employees
where (department_id,salary) in ( 
				select  department_id, min(salary)
				from EMPLOYEES
				group by department_id )
--from���� subquery =>inline-view				
select *
from employees e,   ( 
			select  department_id, min(salary) minsal
			from EMPLOYEES
			group by department_id ) emp2            
where e.department_id = emp2.department_id 
and e.salary = emp2.minsal 
			
--������ �޴� �޿��� ������ ���� �μ��� ��պ��� ���� �޿��� �޴� ����?
select aa.first_name, aa.department_id, aa.salary,
      (select avg(salary)
		 from employees
		 where department_id = aa.department_id) �μ����
from employees aa
where aa.salary < (
		 select avg(salary)
		 from employees
		 where department_id = aa.department_id)


select rowid, first_name, salary
from employees

select *
from (
		select rownum bb, first_name, salary
		from (
				select rownum aa, first_name, salary
				from employees
				order by salary desc ) )
where bb>=6 and bb<=10 				
 
create table emp
as
select employee_id, first_name, salary
from employees

insert into emp select * from emp

select * from emp
drop index idx_emp
create index idx_emp on emp(first_name)		


