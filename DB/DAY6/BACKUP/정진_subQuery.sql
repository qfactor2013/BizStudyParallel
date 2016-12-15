--subquery
--평균급여보다 적은급여를 받는 직원들 정보?

select *
from employees
where salary < ( 
                 select avg(salary)
                 from employees 
               )
--스티븐킹과 같은부서의 직원조회
select *
from employees
where department_id =  (
			select department_id
			from employees
			where first_name = 'Steven'
			and last_name = 'King' )
--최대급여를 받는 직원은 누구?
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

--country_id가 'US'인 부서는 ?

select *
from departments
where location_id in  (
				select location_id
				from locations
				where country_id = 'US'	)		
				
---알렉산더와 같은부서의 직원들을 조회하시오 (30,60)
-- =ANY는 IN과 같다. 
select *
from employees
where department_id =ANY (
		select department_id
		from EMPLOYEES
		where first_name = 'Alexander' )
				
--30번 부서의 직원들의 급여보다 많은 급여를 받는 직원들을 조회
-- >ALL (최대보다 크다의 의미)
select *
from employees
where salary >ALL (
					
			select salary
			from employees
			where department_id = 30 ) 

-- >ANY : 최소보다크다. 			
select *
from employees
where salary >ANY (					
			select salary
			from employees
			where department_id = 30 ) 

--부서별 최소 급여를 받는 직원정보 출력
select *
from employees
where (department_id,salary) in ( 
				select  department_id, min(salary)
				from EMPLOYEES
				group by department_id )
--from절에 subquery =>inline-view				
select *
from employees e,   ( 
			select  department_id, min(salary) minsal
			from EMPLOYEES
			group by department_id ) emp2            
where e.department_id = emp2.department_id 
and e.salary = emp2.minsal 
			
--본인이 받는 급여가 본인이 속한 부서의 평균보다 적은 급여를 받는 직원?
select aa.first_name, aa.department_id, aa.salary,
      (select avg(salary)
		 from employees
		 where department_id = aa.department_id) 부서평균
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


