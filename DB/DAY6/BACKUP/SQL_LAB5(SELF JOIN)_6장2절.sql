-- SELF JOIN
1. 직원의 이름과 관리자 이름을 조회하시오.

select emp.first_name||emp.last_name,  m.first_name 
from employees emp, employees m
where emp.manager_id = m.employee_id 
order by 1

2. 직원의 이름과 관리자 이름을 조회하시오.
관리자가 없는 직원정보도 모두 출력하시오.
 select emp.first_name||emp.last_name,  
             nvl(m.first_name , '대장') 관리자이름
from employees emp, employees m
where emp.manager_id = m.employee_id(+) 
order by 1


3. 관리자 이름과 관리자가 관리하는 직원의 수를 조회하시오.
단, 관리직원수가 3명 이상인 관리자만 출력되도록 하시오.
  select  substr(m.first_name,1,5) 관리자이름, count(*) 직원수 
from employees emp, employees m
where emp.manager_id = m.employee_id 
group by  m.first_name 
having count(*) >= 3
order by 1


