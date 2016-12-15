========================================
		JOIN
========================================

1.�������� �̸��� ���޸�(job_title)�� ��ȸ�Ͻÿ�.
--�����Ϲ���join
select e.first_name, j.job_title
from employees e, jobs j 
where e.job_id = j.job_id
--ANSIǥ��...Į���̸� �ٸ���쵵 ����
select e.first_name, j.job_title
from employees e join jobs j 
on e.job_id = j.job_id
--ANSIǥ��...Į���̸�  ��������� ����
select e.first_name, j.job_title
from employees e join jobs j using(job_id)

2.�μ��̸��� �μ��� ���� ���ø�(city)�� ��ȸ�Ͻÿ�.
select d.department_name, lo.city 
from DEPARTMENTS d, LOCATIONS lo
where d.location_id = lo.location_id 

3. ������ �̸��� �ٹ��������� ��ȸ�Ͻÿ�. (employees, departments, locations,countries)
 select e.first_name, c.country_name
 from employees e, departments d, locations lo,countries c
 where e.department_id = d.department_id
 and d.location_id = lo.location_id
 and lo.country_id = c.country_id
 
4. ��å(job_title)�� 'manager' �� ����� �̸�, ��å, �μ����� ��ȸ�Ͻÿ�.
select employees.first_name, jobs.job_title, 
        departments.department_name
from employees, jobs, departments 
where employees.job_id = jobs.job_id
and employees.department_id = departments.department_id 
and substr(jobs.job_title,-7,7) = initCap('manager'); 

and jobs.job_title like '%'||initCap('manager')||'%';




select * from jobs

5. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
select employees.first_name,  employees.hire_date,
        departments.department_name
from employees,  departments 
where employees.department_id = departments.department_id 

 
6. �������� �̸�, �Ի���, �μ����� ��ȸ�Ͻÿ�.
��, �μ��� ���� ������ �ִٸ� �� ���������� ��°���� ���Խ�Ų��.
--(+)����Ŭ����...sybase���� *=
--���°��� �����ش�~
select employees.first_name,  employees.hire_date,
        departments.department_name
from employees,  departments 
where employees.department_id = departments.department_id(+) 
--ANSIǥ��....���ʱ����Դϴ�. �������� ��� ���ʱ������� select
select employees.first_name,  employees.hire_date,
        departments.department_name
from employees left outer join  departments 
on employees.department_id = departments.department_id 


7. ������ �̸��� ��å(job_title)�� ����Ͻÿ�.
��, ������ �ʴ� ��å�� �ִٸ� �� ��å������ ��°���� ���Խ�Ű�ÿ�.
select e.first_name, j.job_title
from employees e, jobs j 
where e.job_id(+) = j.job_id
--ANSIǥ��...Į���̸� �ٸ���쵵 ����
select e.first_name, j.job_title
from employees e right outer join jobs j 
on e.job_id = j.job_id
--
insert into jobs values('���','�����ϸ鼭���',500, 1000);
--



