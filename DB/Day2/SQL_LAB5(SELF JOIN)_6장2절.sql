-- SELF JOIN
1. 직원의 이름과 관리자 이름을 조회하시오.
 
select E1.FIRST_NAME||' '||E1.LAST_NAME AS "직원이름", 
	   E2.FIRST_NAME||' '||E2.LAST_NAME AS "관리자이름" 
from EMPLOYEES e1, EMPLOYEES e2
where e1.manager_id = e2.employee_id
ORDER BY 1

2. 직원의 이름과 관리자 이름을 조회하시오.
관리자가 없는 직원정보도 모두 출력하시오.
 
select E1.FIRST_NAME||' '||E1.LAST_NAME AS "직원이름", 
	   (E2.FIRST_NAME||' '||E2.LAST_NAME) AS "관리자이름"
from EMPLOYEES e1, EMPLOYEES e2
where e1.manager_id = e2.employee_id(+)

3. 관리자 이름과 관리자가 관리하는 직원의 수를 조회하시오.
단, 관리직원수가 3명 이상인 관리자만 출력되도록 하시오.
 

select E2.FIRST_NAME||' '||E2.LAST_NAME AS "관리자이름",
	   count(E2.FIRST_NAME)
from EMPLOYEES e1, EMPLOYEES e2
where e1.manager_id = e2.employee_id(+)
GROUP BY E2.FIRST_NAME, E2.LAST_NAME
HAVING count(E2.FIRST_NAME) >=3
ORDER BY 1