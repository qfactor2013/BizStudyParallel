========================================
		SubQuery
========================================


3. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
�׸��� �μ��� ���� ������ ���ؼ��� '<�μ�����>' �� ��µǵ��� �Ѵ�.
(outer-join , nvl() )

select e.first_name, e.hire_date, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by d.department_name nulls first   --asc�� �������� ..null�ڿ�����
--ANSI ǥ�� 
select e.first_name, e.hire_date, 
       nvl(d.department_name,'�μ�����') �μ��̸�
from employees e left outer join departments d
on e.department_id = d.department_id
order by d.department_name nulls first 



4. ������ ��å�� ���� ������ �ٸ��� �����Ϸ��� �Ѵ�.
��å�� 'Manager'�� ���Ե� ������ �޿��� 0.5�� ���ϰ�
������ �����鿡 ���ؼ��� ������ �޿��� �����ϵ��� �Ѵ�. 
�����ϰ� ��ȸ�Ͻÿ�. (decode)

select first_name, job_title,salary,
     decode(substr(job_title,-7,7),'Manager',
                      salary*0.5, salary) ����д�,
     case when  job_title like '%Manager' 
                then salary*0.5
          else   salary end  ����д�2  
from employees e, jobs j
where e.job_id = j.job_id 






5. �� �μ����� �����޿��� �޴� 
������ �̸��� �μ�id, �޿��� ��ȸ�Ͻÿ�.

select first_name, department_id, salary
from employees
where (department_id, salary) in 
              ( 		
		select department_id, min(salary)
		from employees
		group by department_id  )







-- ��������


3. �� ���޺�(job_title) �ο����� ��ȸ�ϵ� 
������ ���� ������ �ִٸ� �ش� ���޵�
��°���� ���Խ�Ű�ÿ�. 
�׸��� ���޺� �ο����� 3�� �̻��� ���޸� ��°���� ���Խ�Ű�ÿ�.
--8�� 
select j.job_title, count(employee_id) �ο��� 
from employees e , jobs j 
where e.job_id(+) = j.job_id 
group by j.job_title
having count(employee_id) >=3 
4. �� �μ��� �ִ�޿��� �޴� ������ �̸�, �μ���, �޿��� ��ȸ�Ͻÿ�.
select first_name, department_name, salary
from employees join DEPARTMENTS
on employees.department_id = DEPARTMENTS.department_id
where (employees.department_id, salary) in 
              ( 		
		select department_id, max(salary)
		from employees
		group by department_id  )

5. ������ �̸�, �μ�id, �޿��� ��ȸ�Ͻÿ�. 
�׸��� ������ ���� �ش� �μ��� 
�ּұ޿��� �������� ���Խ��� ��� �Ͻÿ�.
--��Į��subquery
--���subquery
select first_name, department_id, salary , 
          ( select min(salary) 
            from employees
            where department_id = aa.department_id)
from employees aa
--inline View�̿�
select e.first_name,e.department_id,e.salary,d.minsal
from employees e,( 
			select department_id, min(salary) minsal
			from employees
			group by department_id) d
where e.department_id = d.department_id

			




 


