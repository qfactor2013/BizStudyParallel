========================================
		SubQuery
========================================


3. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
그리고 부서가 없는 직원에 대해서는 '<부서없음>' 이 출력되도록 한다.
(outer-join , nvl() )

select e.first_name, e.hire_date, d.department_name
from employees e, departments d
where e.department_id = d.department_id(+)
order by d.department_name nulls first   --asc는 오름차순 ..null뒤에나옴
--ANSI 표준 
select e.first_name, e.hire_date, 
       nvl(d.department_name,'부서없음') 부서이름
from employees e left outer join departments d
on e.department_id = d.department_id
order by d.department_name nulls first 



4. 직원의 직책에 따라 월급을 다르게 지급하려고 한다.
직책에 'Manager'가 포함된 직원은 급여에 0.5를 곱하고
나머지 직원들에 대해서는 원래의 급여를 지급하도록 한다. 
적절하게 조회하시오. (decode)

select first_name, job_title,salary,
     decode(substr(job_title,-7,7),'Manager',
                      salary*0.5, salary) 고통분담,
     case when  job_title like '%Manager' 
                then salary*0.5
          else   salary end  고통분담2  
from employees e, jobs j
where e.job_id = j.job_id 






5. 각 부서별로 최저급여를 받는 
직원의 이름과 부서id, 급여를 조회하시오.

select first_name, department_id, salary
from employees
where (department_id, salary) in 
              ( 		
		select department_id, min(salary)
		from employees
		group by department_id  )







-- 연습문제


3. 각 직급별(job_title) 인원수를 조회하되 
사용되지 않은 직급이 있다면 해당 직급도
출력결과에 포함시키시오. 
그리고 직급별 인원수가 3명 이상인 직급만 출력결과에 포함시키시오.
--8건 
select j.job_title, count(employee_id) 인원수 
from employees e , jobs j 
where e.job_id(+) = j.job_id 
group by j.job_title
having count(employee_id) >=3 
4. 각 부서별 최대급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.
select first_name, department_name, salary
from employees join DEPARTMENTS
on employees.department_id = DEPARTMENTS.department_id
where (employees.department_id, salary) in 
              ( 		
		select department_id, max(salary)
		from employees
		group by department_id  )

5. 직원의 이름, 부서id, 급여를 조회하시오. 
그리고 직원이 속한 해당 부서의 
최소급여를 마지막에 포함시켜 출력 하시오.
--스칼라subquery
--상관subquery
select first_name, department_id, salary , 
          ( select min(salary) 
            from employees
            where department_id = aa.department_id)
from employees aa
--inline View이용
select e.first_name,e.department_id,e.salary,d.minsal
from employees e,( 
			select department_id, min(salary) minsal
			from employees
			group by department_id) d
where e.department_id = d.department_id

			




 


