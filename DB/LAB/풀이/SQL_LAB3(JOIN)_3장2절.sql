========================================
		JOIN
========================================

1.직원들의 이름과 직급명(job_title)을 조회하시오.
--가장일반적join
select e.first_name, j.job_title
from employees e, jobs j 
where e.job_id = j.job_id
--ANSI표준...칼럼이름 다른경우도 가능
select e.first_name, j.job_title
from employees e join jobs j 
on e.job_id = j.job_id
--ANSI표준...칼럼이름  같은경우의 조인
select e.first_name, j.job_title
from employees e join jobs j using(job_id)

2.부서이름과 부서가 속한 도시명(city)을 조회하시오.
select d.department_name, lo.city 
from DEPARTMENTS d, LOCATIONS lo
where d.location_id = lo.location_id 

3. 직원의 이름과 근무국가명을 조회하시오. (employees, departments, locations,countries)
 select e.first_name, c.country_name
 from employees e, departments d, locations lo,countries c
 where e.department_id = d.department_id
 and d.location_id = lo.location_id
 and lo.country_id = c.country_id
 
4. 직책(job_title)이 'manager' 인 사람의 이름, 직책, 부서명을 조회하시오.
select employees.first_name, jobs.job_title, 
        departments.department_name
from employees, jobs, departments 
where employees.job_id = jobs.job_id
and employees.department_id = departments.department_id 
and substr(jobs.job_title,-7,7) = initCap('manager'); 

and jobs.job_title like '%'||initCap('manager')||'%';




select * from jobs

5. 직원들의 이름, 입사일, 부서명을 조회하시오.
select employees.first_name,  employees.hire_date,
        departments.department_name
from employees,  departments 
where employees.department_id = departments.department_id 

 
6. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
--(+)오라클문법...sybase문법 *=
--없는곳에 보태준다~
select employees.first_name,  employees.hire_date,
        departments.department_name
from employees,  departments 
where employees.department_id = departments.department_id(+) 
--ANSI표준....왼쪽기준입니다. 오른쪽이 없어도 왼쪽깆준으로 select
select employees.first_name,  employees.hire_date,
        departments.department_name
from employees left outer join  departments 
on employees.department_id = departments.department_id 


7. 직원의 이름과 직책(job_title)을 출력하시오.
단, 사용되지 않는 직책이 있다면 그 직책정보도 출력결과에 포함시키시오.
select e.first_name, j.job_title
from employees e, jobs j 
where e.job_id(+) = j.job_id
--ANSI표준...칼럼이름 다른경우도 가능
select e.first_name, j.job_title
from employees e right outer join jobs j 
on e.job_id = j.job_id
--
insert into jobs values('놀기','공부하면서놀기',500, 1000);
--



