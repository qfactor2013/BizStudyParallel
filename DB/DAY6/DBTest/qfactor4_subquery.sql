--SUB QUERY
-- 단일/다중행, 다중컬럼, 상호연관, 스칼라 서브쿼리가 있다.

-- 평균급여보다 적은급여를 받는 직원들 정보?

select 
*
from EMPLOYEES e
where e.salary < (
					select avg(salary) from EMPLOYEES
			  		)
			  
-- 스티븐킹과 같은 부서의 직원조회

select * 
from EMPLOYEES 
where department_id =
(			  		
	select department_id
	from employees
	where first_name = 'Steven'
	and last_name = 'King'
)

-- 최대 급여를 받는 직원
select *
from EMPLOYEES
where salary = (
					select max(salary)
					from EMPLOYEES
					)
					
					
-- country_id가 'US'인 부서는?
select 	*
from DEPARTMENTS
where location_id in (
select location_id 
from LOCATIONS
where country_id = 'US'
)

--알렉산더와 같은 부서의 직원들을 조회(30,60)
select *
from EMPLOYEES		-- =any == in
where DEPARTMENT_id =any (
select DEPARTMENT_id
from EMPLOYEES
where first_name = 'Alexander'
)


-- 30번 부서의 직원들의 급여보다 많은 급여를 받는 직원들을 조회
-- ALL(최대보다 크다.
select * 
from EMPLOYEES
where salary > any ( -- 집합의 최소모다 크다
select salary
from EMPLOYEES
where DEPARTMENT_id = 30
)


select * 
from EMPLOYEES
where (department_id, salary) in (    -- 다중컬럼비교도 가능하다!!!
				  select department_id, min(salary) as a
				  from EMPLOYEES
				  group by department_id
				  )
-- from절에 서브쿼리 => 인라인-뷰
select *
from employees e, (select department_id, min(salary) as a
				  from EMPLOYEES
				  group by department_id) e2
where e.department_id = e2.department_id
and e.salary = e2.a
				  

-- 본인이 받는 급여가 본인이 속한 부서의 평균보다 적은 급여를 받는 직원
-- select 절에 들어가있는 서브쿼리를 스칼라 서브쿼리라 한다.
select e.*, ( select avg(se.salary)
				 from employees se
				 where se.department_id = e.department_id)
from employees e
where salary < ( select avg(se.salary)
				 from employees se
				 where se.department_id = e.department_id)

				 
				 
-- row 는 select 호출 시에 생성된다.
select rowid, first_name, salary
from employees

-- rownum은 가져온 행에 순서를 매겨주는 오라클의 인덱스
-- from해서 가져온 데이터는 1행씩 가져와서 where 절로 비교한다.
-- 그래서 rownum = 5 같은건 조회 안됨
-- 할려면 한번 더 감싸서 테이블로 만들자! (인라인뷰)
			
		select * from
			(
				select rownum cc,
						a.* 
				from(
						select rownum as "aa", e.first_name, e.salary
						from employees e
						order by e.salary desc
					) a
			)
		where cc = 5