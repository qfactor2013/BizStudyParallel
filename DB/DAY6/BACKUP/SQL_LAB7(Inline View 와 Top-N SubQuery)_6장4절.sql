==========================================
	Inline View 와 Top-N SubQuery
==========================================

1. 급여를 가장 많이 받는 상위 5명의 직원 정보를 조회하시오.

select *
from (
		select first_name, salary
		from employees
		order by salary desc )
where rownum <=5 		


2. 커미션을 가장 많이 받는 상위 3명의 직원 정보를 조회하시오.

select * 
from (  
		select first_name, commission_pct
		from employees
		where commission_pct is not null
		order by 2 desc  )
where rownum <=3 		


select first_name, commission_pct
from employees
order by 2 desc nulls  last 


--group by, having 
3. 월별 입사자 수를 조회하되, 입사자 수가 5명 이상인 월만 출력하시오.

select to_char(hire_date,'mm') 월, count(*) 입사자수 
from employees
group by to_char(hire_date,'mm')
having count(*) >=5
order by 1
4. 년도별 입사자 수를 조회하시오. 
단, 입사자수가 많은 년도부터 출력되도록 합니다.
select to_char(hire_date,'yyyy') 년도, count(*) 입사자수 
from employees
group by to_char(hire_date,'yyyy')
order by 2 desc 
---------------------------------
--부서별  직급별 직원의 급여합계

--부서별 추가
select department_id,job_id, sum(salary) 급여합계
from employees
group by rollup(department_id,job_id)
order by 1,2

--모든조합
select department_id,job_id, sum(salary) 급여합계
from employees
group by cube(department_id,job_id)
order by 1,2



