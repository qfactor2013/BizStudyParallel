--Equi����(=)

select e.first_name, e.job_id, j.job_title,  d.department_name 
from employees e, jobs j,  DEPARTMENTS d  
where  e.department_id = d.department_id
and e.job_id = j.job_id 


select e.first_name,job_id,j.job_title,d.department_name 
from employees e join jobs j using (job_id)
                 join departments d using(department_id)
  
select e.first_name,e.job_id,j.job_title,d.department_name 
from employees e join jobs j 
                 on (e.job_id = j.job_id )
             join departments d 
             on(e.department_id = d.department_id)

------------------------------------------------
--non-equi JOIN

select * from emp
select * from salgrade

select ename, job, sal, grade,
  decode(grade,1,sal+1000,
               2,sal+500,
               3,sal+300,
               4,sal+100, sal) grade�� ,
  case grade  when  1 then   sal+1000
              when  2 then   sal+500
              when  3 then   sal+300
              when  4 then   sal+100
              else sal end grade��2,
 case  when  grade=1 then   sal+1000
       when grade=2 then   sal+500
       when grade=3 then   sal+300
       when grade=4 then   sal+100
       else sal end grade��3 ,
  case when grade>=2 then  sal+1000
       else sal end grade��4 ,
  case when ename like 'M%' then 'M���ν����Ѵ�.' 
       else ename||'****M���� ���۾���' end �̸�
from emp, salgrade 
where emp.sal between salgrade.losal and salgrade.hisal

-----------------------------------------------
--outer join
select first_name, department_name, city, country_name 
from employees e, departments d, locations lo, countries c
where e.department_id = d.department_id(+)
and d.location_id = lo.location_id(+)
and lo.country_id = c.country_id(+) 
------------------------------------------------
select first_name, department_name
from employees e, departments d
where e.department_id = d.department_id (+) --oracle����

select first_name, department_name
from employees e left outer join departments d
on e.department_id = d.department_id --ANSIǥ��

select first_name, department_name
from departments d right outer join employees e
on e.department_id = d.department_id --ANSIǥ��


select first_name, department_name
from employees e, departments d
where e.department_id(+) = d.department_id 

select first_name, department_name
from employees e right outer join departments d
on e.department_id = d.department_id --ANSIǥ��

select first_name, department_name
from departments d left outer join employees e
on e.department_id = d.department_id --ANSIǥ��

--�Ұ� 
select first_name, department_name
from employees e, departments d
where e.department_id(+) = d.department_id(+) --�Ұ� 

select first_name, department_name
from departments d full outer join employees e
on e.department_id = d.department_id --ANSIǥ��

-------------------------------------------------
--self join

select ����.employee_id, ����.first_name �����̸�, 
        nvl2(�޴���.employee_id,
              to_char(�޴���.employee_id),'�޴�������'), 
        nvl(�޴���.first_name,'����') �޴����̸�
from employees ����, employees �޴��� 
where ����.manager_id = �޴���.employee_id(+)
order by 1

select department_name, first_name 
from departments, employees 
where departments.manager_id = employees.employee_id(+)





select * 
from employees      

select *
from departments

select * from jobs

select distinct job_id
from employees
             
             
             
