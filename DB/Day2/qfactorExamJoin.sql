-- Equi 조인 (=)
-- db account scott
select e.first_name, d.department_name, j.job_title
from EMPLOYEES e, JOBS j, DEPARTMENTS d -- 코드성 테이블은 뒤에다 한다.(주 출력 테이블을 앞에)
where e.department_id = d.department_id -- 그래서 두개 중복되는 것을(PK 혹은 FK) 조건으로 건다.
and e.job_id	= j.job_id				-- 테이블 수 n개라면 조건은 n-1개 되어야한다.


select e.first_name, d.department_name, j.job_title
from EMPLOYEES e join jobs j using (job_id)  -- 컬럼이름이 동일하다면 e.job_id = j.job_id 매칭으로 된다.
join departments d using (department_id)      -- 하지만 테이블마다 컬럼명이 다를 수 있으므로 잘 사용안함
											  -- ANSI 표준임
											  
--보통은 이렇게 많이 쓴다.
select e.first_name, d.department_name, j.job_title
from EMPLOYEES e join jobs j on (e.job_id = j.job_id)
join departments d on (e.department_id = d.department_id)


-- non-equi JOIN
-- (=이 아닌 것으로 JOIN을 한다.)
--DECODE() 함수는 if~elseif~else 같은 구문이다.
--case()도 마찬가지로 동작한다. 하지만 연산자를 사용할 수 있다.
select e.ename, e.job, e.sal, s.grade, 
	   DECODE(s.grade, 1, '1호봉', 2, '2호봉', 3, '3호봉', 4,'4호봉', 5,'5호봉') grade평가,
	   case s.grade when 1 then sal+1000
	   			  when 2 then sal+500
	   			  when 3 then sal+300
	   			  when 4 then sal+100
	   			  else sal end grade평가2,
	   case 	  when s.grade = 1 then sal+1000
	   			  when s.grade = 2 then sal+500
	   			  when s.grade = 3 then sal+300
	   			  when s.grade = 4 then sal+100
	   			  else e.sal end grade평가3,
	   case 	  when s.grade >= 2 then sal+1000
	   			  else e.sal end grade평가4,
	   case		  when e.ename like 'M%' then 'M으로시작한다'
	   			  else e.ename||'****M으로 시작안함' end 이름,  
	   DECODE(s.grade, 1, e.sal+1000, 2, e.sal+500, 3, e.sal+300, 4, sal+100, e.sal) 최종급여
from emp e, SALGRADE s
where e.sal between s.losal and s.hisal 

-- db account hr/hr
select *
from Employees e, Departments d, Locations l, Countries c
where e.department_id = d.department_id
and	  d.location_id   = l.location_id
and	  l.country_id    = c.country_id


-- OUTER JOIN(ORACLE 연산자)(sybase는 *=)
-- 조건이 되는 것이 없더라도 일단은 NULL이라도 출력함
select *
from Employees e, Departments d, Locations l, Countries c
where e.department_id = d.department_id(+)
and	  d.location_id   = l.location_id(+)
and	  l.country_id    = c.country_id(+)

-- 하지만 FULL OUTER JOIN은 ORACLE 연산자로 불가능
select *
from Employees e, Departments d, Locations l, Countries c
where e.department_id = d.department_id(+)
and	  d.location_id(+)   = l.location_id(+)
and	  l.country_id(+)    = c.country_id(+)

-- OUTER JOIN ANSI 표준
-- 기준이 왼쪽
select *
from Employees e 
LEFT OUTER JOIN Departments d on e.department_id = d.department_id
LEFT OUTER JOIN Locations l on d.location_id   = l.location_id 
LEFT OUTER JOIN Countries c on l.country_id    = c.country_id

-- 기준이 오른쪽
select *
from Employees e 
RIGHT OUTER JOIN Departments d on e.department_id = d.department_id
RIGHT OUTER JOIN Locations l on d.location_id   = l.location_id 
RIGHT OUTER JOIN Countries c on l.country_id    = c.country_id

-- 기준이 양쪽(OR, 둘 중에 하나라도 있으면)
select *
from Employees e 
FULL OUTER JOIN Departments d on e.department_id = d.department_id
FULL OUTER JOIN Locations l on d.location_id   = l.location_id 
FULL OUTER JOIN Countries c on l.country_id    = c.country_id

-- SELF JOIN

SELECT 직원.FIRST_NAME 직원이름, 매니저.EMPLOYEE_ID, 
		NVL2(매니저.EMPLOYEE_ID, TO_CHAR(매니저.EMPLOYEE_ID), '매니저없음'),
		NVL(매니저.FIRST_NAME, '대장') 매니저이름,
		매니저.EMPLOYEE_ID 매니저
FROM EMPLOYEES 직원, EMPLOYEES 매니저
WHERE 직원.MANAGER_ID = 매니저.EMPLOYEE_ID(+)
ORDER BY  1

SELECT * FROM EMPLOYEES

SELECT * FROM TAB	
	SELECT D.DEPARTMENT_NAME , E.FIRST_NAME
	FROM DEPARTMENTS D, EMPLOYEES E
	WHERE D.MANAGER_ID = E.EMPLOYEE_ID(+)
	
	
	