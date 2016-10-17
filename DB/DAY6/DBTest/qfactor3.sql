--그룹 함수
--단일행 함수

--length 문자열의 길이
select first_name, length(first_name) 
from employees

select count(*) null포함건수, count(employee_id) 직원수, count(department_id) 직원수,
		sum(salary) 합계, avg(salary) 평균, sum(salary)/count(salary) 평균2,
		max(salary) 최대급여, min(salary) 최소급여,
		max(first_name) 알파벳마지막사원, min(first_name) 알파벳첫번째사원, 
		max(hire_date) 최근날짜, min(hire_date) 오래된날짜
from EMPLOYEES


--다중행함수
--select절에 group함수(집계함수)가 사용되지 않은 칼럼은 
--반드시 group by 로 묶어야 한다.
select department_id,
		count(*) null포함건수, count(employee_id) 직원수, count(department_id) 직원수,
		sum(salary) 합계, avg(salary) 평균, sum(salary)/count(salary) 평균2,
		max(salary) 최대급여, min(salary) 최소급여,
		max(first_name) 알파벳마지막사원, min(first_name) 알파벳첫번째사원, 
		max(hire_date) 최근날짜, min(hire_date) 오래된날짜
from EMPLOYEES
group by DEPARTMENT_id
having count(*) > 1		-- 그룹에 조건을 걸어줌
order by null포함건수				-- group by랑 having이랑 순서가 바껴도 된다.(count(*)도 정렬가능!)

--해석순서
--from -> where -> group by > having > select  > order by
--작성순서1 : select > from > where > group by > having > order by
--작성순서2가능) : select > from > where > having by  >b>olrder



select department_id, job_id, count(*)
from EMPLOYEES
group by department_id, job.id 
order by 1

							-- 컬럼 이름을 주면 NULL은 빠짐
select count(distinct job_id), count(job_id), count(distinct department_id)
from EMPLOYEES