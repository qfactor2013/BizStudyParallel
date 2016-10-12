--Equi조인(=)

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
               4,sal+100, sal) grade평가 ,
  case grade  when  1 then   sal+1000
              when  2 then   sal+500
              when  3 then   sal+300
              when  4 then   sal+100
              else sal end grade평가2,
 case  when  grade=1 then   sal+1000
       when grade=2 then   sal+500
       when grade=3 then   sal+300
       when grade=4 then   sal+100
       else sal end grade평가3 ,
  case when grade>=2 then  sal+1000
       else sal end grade평가4 ,
  case when ename like 'M%' then 'M으로시작한다.' 
       else ename||'****M으로 시작안함' end 이름
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
where e.department_id = d.department_id (+) --oracle문법

select first_name, department_name
from employees e left outer join departments d
on e.department_id = d.department_id --ANSI표준

select first_name, department_name
from departments d right outer join employees e
on e.department_id = d.department_id --ANSI표준


select first_name, department_name
from employees e, departments d
where e.department_id(+) = d.department_id 

select first_name, department_name
from employees e right outer join departments d
on e.department_id = d.department_id --ANSI표준

select first_name, department_name
from departments d left outer join employees e
on e.department_id = d.department_id --ANSI표준

--불가 
select first_name, department_name
from employees e, departments d
where e.department_id(+) = d.department_id(+) --불가 

select first_name, department_name
from departments d full outer join employees e
on e.department_id = d.department_id --ANSI표준

-------------------------------------------------
--self join

select 직원.employee_id, 직원.first_name 직원이름, 
        nvl2(메니져.employee_id,
              to_char(메니져.employee_id),'메니져없음'), 
        nvl(메니져.first_name,'대장') 메니져이름
from employees 직원, employees 메니져 
where 직원.manager_id = 메니져.employee_id(+)
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
             
             
             
