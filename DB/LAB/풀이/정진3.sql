--그룹함수

--단일행함수
select first_name, length(first_name) 이름길이 
from employees
--다중행함수
select  count(*) null포함건수 ,
        count(employee_id) 직원수,
        count(department_id) 직원수2,
        sum(salary) 합계,
        avg(salary) 평균,
        sum(salary)/count(salary) 평균2,
        max(salary) 최대급여,
        min(salary) 최소급여,
        max(first_name) 알파벳마지막사원,
        min(first_name) 첫번째사원,
        max(HIRE_DATE) 최근사원,
        min(HIRE_DATE) 선배
from employees

--select절에 group함수(집계함수)가 사용되지않은 칼럼은
--반드시 group by절에 참여한다.
select  department_id, count(*) null포함건수 ,
        count(employee_id) 직원수,
        count(department_id) 직원수2,
        sum(salary) 합계,
        avg(salary) 평균,
        sum(salary)/count(salary) 평균2,
        max(salary) 최대급여,
        min(salary) 최소급여,
        max(first_name) 알파벳마지막사원,
        min(first_name) 첫번째사원,
        max(HIRE_DATE) 최근사원,
        min(HIRE_DATE) 선배
from employees
where salary > 0 
group by department_id
having count(*) > 1 
order by  2 desc

--having은 group by의 조건절 
--작성순서2(가능): select>from>where>having>group by>order by
--작성순서1(일반적): select>from>where>group by>having>order by
--해석순서: from>where>group by>having>select>order by 

select department_id, job_id, count(*)
from employees
group by department_id, job_id
order by 1

select count(distinct job_id), count(job_id),
       count(distinct department_id), count(department_id)
from employees

select distinct department_id
from employees


-----------------------------------------------
7. 각 부서별 인원수를 조회하되 인원수가 5명 이상인 부서만 출력되도록 하시오.
select department_id, count(*) 
from  employees 
group by department_id
having count(*) >= 5 
order by 2 desc


8. 각 부서별 최대급여와 최소급여를 조회하시오.
   단, 최대급여와 최소급여가 같은 부서는 직원이 한명일 가능성이 높기때문에 
   조회결과에서 제외시킨다.
 
   select department_id, 
          max(salary) 최대급여,min(salary) 최소급여,
           count(*)
   from employees
   group by department_id
   having  max(salary)<>min(salary)
   order by 1
   
   
9. 부서가 50, 80, 110 번인 직원들 중에서 
급여를 5000 이상 24000 이하를 받는
   직원들을 대상으로 부서별 평균 급여를 조회하시오.
   다, 평균급여가 8000 이상인 부서만 출력되어야 하며, 
   출력결과를 평균급여가 높은
   부서면저 출력되도록 해야 한다.
select department_id, avg(salary) 평균급여 
from employees 
where department_id in (50, 80, 110)
and salary between 5000 and 24000
group by department_id
having avg(salary) >= 8000
order by 평균급여 desc

   


