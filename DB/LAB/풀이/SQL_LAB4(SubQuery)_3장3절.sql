========================================
		SubQuery
========================================
1. 'IT'부서에서 근무하는 직원들의 이름, 급여, 입사일을 조회하시오.
--5건
select first_name, salary, hire_date,department_id
from employees
where department_id = (
			select department_id
			from departments
			where department_name = 'IT' )

2. 'Alexander' 와 같은 부서에서 근무하는 직원의 이름과 부서id를 조회하시오.

--11건
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


3. 80번부서의 평균급여보다 많은 급여를 받는 
직원의 이름, 부서id, 급여를 조회하시오.
--27건
select first_name, department_id, salary
from employees
where salary > (  
            select avg(salary) 
            from employees
            where department_id = 80
         )




4. 'South San Francisco'에 근무하는 직원의 
최소급여보다 급여를 많이 받으면서 
50 번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 급여, 부서명, 
부서id를 조회하시오.

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



--45명...최소:TJ 2100
select min(salary )
from employees ,departments,locations 
where locations.city = 'South San Francisco'
and employees.department_id = departments.department_id
and departments.location_id = locations.location_id



-------------------scott/tiger (emp, dept)

1. BLAKE와 동일한 부서에 속한 모든 사원의 이름및 입사일을 표시하는 질의를 작성하시오.
결과에서 BLAKE는 제외시킵니다.

 


2. 부서의 위치가 DALLAS인 모든 사원의 이름, 부서번호 , 직무를 표시하시오 





3. KING에게 보고하는 모든 사원의 이름과 급여를 표시하는 질의를 작성하시오 

 














 
