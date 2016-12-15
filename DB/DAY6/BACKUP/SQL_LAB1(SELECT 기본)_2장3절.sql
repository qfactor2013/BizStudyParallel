
hr/hr
========================================
		SELECT 기본
========================================

1. 급여가 15000 이상인 직원들의 이름, 급여, 부서id를 조회하시오.
--3건
select first_name, salary, department_id
from EMPLOYEES
where salary >= 15000



2. 직원 중에서 연봉이 170000 이상인 직원들의 이름, 연봉을 조회하시오.
   연봉은 급여(salary)에 12를 곱한 값입니다.
   --3건
select first_name, salary*12 연봉
from EMPLOYEES
where salary*12 >= 170000


3. 직원 중에서 부서id가 없는 직원의 이름과 급여를 조회하시오.
--1건
select first_name, salary 
from EMPLOYEES
where department_id is null; 

4. 2004년 이전에 입사한 직원의 이름, 급여, 입사일을 조회하시오.
select first_name, salary, hire_date 
from EMPLOYEES
where hire_date <= '2004/12/31'

-- 논리연산자 -- 
1. 80, 50 번 부서에 속해있으면서 급여가 13000 이상인 직원의 이름, 급여, 부서id
를 조회하시오.
--2건
select first_name, salary, hire_date 
from EMPLOYEES
where department_id in (80,50)
and salary >= 13000

2. 2005년 이후에 입사한 직원들 중에서 
급여가 1300 이상 20000 이하인 직원들의 
이름, 급여, 부서id, 입사일을 조회하시오.
--83건 
select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date >= '2005/01/01'
and (salary between 1300 and 20000 )



-- SQL 비교연산자 --
1. 80, 50 번 부서에 속해있으면서 급여가 13000 이상인 직원의 이름, 급여, 부서id
를 조회하시오.
--2건
select first_name, salary, hire_date 
from EMPLOYEES
where (department_id = 80 or department_id = 50 )
and salary >= 13000



2. 2005년 이후에 입사한 직원들 중에서 급여가 1300 이상 30000 이하인 직원들의 
이름, 급여, 부서id, 입사일을 조회하시오.

select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date >= '2005/01/01'
and salary >= 1300 and salary<= 20000 


3. 2005년도 입사한 직원의 정보만 출력하시오.
--29건
select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date >= '2005/01/01' and 
      hire_date <= '2005/12/31'

select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date between '2005/01/01' and  '2005/12/31'

select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date like '05%';

select first_name, salary, hire_date , department_id
from EMPLOYEES
where to_char(hire_date,'yyyy') = '2005';

4. 이름이 D로 시작하는 직원의 이름, 급여, 입사일을 조회하시오.
--9건
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like 'D%'


5. 12월에 입사한 직원의 이름, 급여, 입사일을 조회하시오.
select *
from employees
where hire_date like '____/12/__'

년도format (default)
RR : 50~99 : 19~
     00~49 : 20~
년도format : yyyy
alter session set nls_date_format = 'yyyy/mm/dd'
     
     
6. 이름에 le 가 들어간 직원의 이름, 급여, 입사일을 조회하시오.
--9건
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like '%le%'



7. 이름이 m으로 끝나는 직원의 이름, 급여, 입사일을 조회하시오.
--4건
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like '%m'


8. 이름의 세번째 글자가 r인 이름, 급여, 입사일을 조회하시오.
--11건
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like '__r%'



9. 커미션을 받는 직원의 이름, 커미션, 급여를 조회하시오.
--35건
select first_name, salary, hire_date , commission_pct
from EMPLOYEES
where commission_pct is not null 


10. 커미션을 받지 않는 직원의 이름, 커미션, 급여를 조회하시오.
--72건
select first_name, salary, hire_date , commission_pct
from EMPLOYEES
where commission_pct is  null 
11. 2000년대에 입사해서 30, 50, 80 번 부서에 속해있으면서, 
급여를 5000 이상 17000 이하를 받는 직원을 조회하시오. 
단, 커미션을 받지 않는 직원들은 검색 대상에서 제외시키며, 
먼저 입사한 직원이 
먼저 출력되어야 하며 입사일이 같은 경우 급여가 많은 직원이 먼저 출력되록 하시오.
--34건 
select *
 from employees
 where to_char(hire_date,'yyyy') like '2%'
 and department_id in (30, 50, 80)
 and salary between 5000 and 17000
 and commission_pct is not null
order by hire_date , salary desc 

 

