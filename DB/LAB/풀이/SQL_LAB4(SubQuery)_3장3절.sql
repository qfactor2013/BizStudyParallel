========================================
		SubQuery
========================================
1. 'IT'�μ����� �ٹ��ϴ� �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
--5��
select first_name, salary, hire_date,department_id
from employees
where department_id = (
			select department_id
			from departments
			where department_name = 'IT' )

2. 'Alexander' �� ���� �μ����� �ٹ��ϴ� ������ �̸��� �μ�id�� ��ȸ�Ͻÿ�.

--11��
select first_name, department_id
from employees
where department_id =ANY (		
		select department_id
		from employees
		where first_name = 'Alexander' )
		
select first_name, department_id
from employees
where department_id in (		
		select department_id
		from employees
		where first_name = 'Alexander' )


3. 80���μ��� ��ձ޿����� ���� �޿��� �޴� 
������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�.
--27��
select first_name, department_id, salary
from employees
where salary > (  
            select avg(salary) 
            from employees
            where department_id = 80
         )




4. 'South San Francisco'�� �ٹ��ϴ� ������ 
�ּұ޿����� �޿��� ���� �����鼭 
50 ���μ��� ��ձ޿����� ���� �޿��� �޴� ������ �̸�, �޿�, �μ���, 
�μ�id�� ��ȸ�Ͻÿ�.

select e.first_name, e.salary, 
       d.department_name, e.department_id
from employees e, departments d
where e.department_id = d.department_id
and salary > ( select min(salary )
				from employees ,departments,locations 
				where locations.city = 'South San Francisco'
				and employees.department_id = departments.department_id
				and departments.location_id = locations.location_id
			 )
and salary >  (  select avg(salary) 
                  from employees
                  where department_id = 50  ) 



--45��...�ּ�:TJ 2100
select min(salary )
from employees ,departments,locations 
where locations.city = 'South San Francisco'
and employees.department_id = departments.department_id
and departments.location_id = locations.location_id



-------------------scott/tiger (emp, dept)

1. BLAKE�� ������ �μ��� ���� ��� ����� �̸��� �Ի����� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
������� BLAKE�� ���ܽ�ŵ�ϴ�.

 


2. �μ��� ��ġ�� DALLAS�� ��� ����� �̸�, �μ���ȣ , ������ ǥ���Ͻÿ� 





3. KING���� �����ϴ� ��� ����� �̸��� �޿��� ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ� 

 














 
