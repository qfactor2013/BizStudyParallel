========================================
		SubQuery
========================================


3. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
그리고 부서가 없는 직원에 대해서는 '<부서없음>' 이 출력되도록 한다.
(outer-join , nvl() )

-- 오라클에서 널은 뒤에 나온다.(ASC 기준)
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		E.HIRE_DATE,
		NVL(D.DEPARTMENT_NAME, '부서없음') 부서이름
		FROM EMPLOYEES E, DEPARTMENTS D
		WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)
		ORDER BY 부서이름 NULLS FIRST -- NULLS FIRST를 하게되면 널이 먼저 나옴
									  -- 별칭으로 하게 되면 이미 변경되서 NULL이 아니게 됨
		

4. 직원의 직책에 따라 월급을 다르게 지급하려고 한다.
직책에 'Manager'가 포함된 직원은 급여에 0.5를 곱하고
나머지 직원들에 대해서는 원래의 급여를 지급하도록 한다. 
적절하게 조회하시오. (decode)

SELECT E.*, J.JOB_TITLE,
DECODE(substr(J.JOB_TITLE, -7, 7), initcap('manager'), E.salary*0.5, E.salary) as "매니저고통분담",
CASE WHEN JOB_TITLE LIKE initcap('%manager%')
then salary * 0.5
else salary end 고통분담2
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID

SELECT * FROM EMPLOYEES
SELECT * FROM JOBS

5. 각 부서별로 최저급여를 받는 직원의 이름과 부서id, 급여를 조회하시오.

select E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
	   E.SALARY,
	   E.DEPARTMENT_ID
from employees E 
WHERE (E.DEPARTMENT_ID, E.SALARY) IN (
							SELECT DEPARTMENT_ID ,MIN(SALARY) 
							FROM EMPLOYEES 
							GROUP BY DEPARTMENT_ID)

-- 연습문제


3. 각 직급별(job_title) 인원수를 조회하되 사용되지 않은 직급이 있다면 해당 직급도
출력결과에 포함시키시오. 그리고 직급별 인원수가 3명 이상인 직급만 출력결과에 포함시키시오.



select j.job_title, count(employee_id)
from employees e, jobs j
where e.job_id(+) = j.job_id
group by j.job_title
having count(job_title)>=3

SELECT * FROM EMPLOYEES

4. 각 부서별 최대급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		NVL(D.DEPARTMENT_NAME, '부서없음'),
		E.SALARY
FROM	EMPLOYEES E, DEPARTMENTS D
WHERE	(E.DEPARTMENT_ID, E.SALARY) IN (SELECT DEPARTMENT_ID,MAX(SALARY) FROM EMPLOYEES GROUP BY DEPARTMENT_ID)
AND		E.DEPARTMENT_ID = D.DEPARTMENT_ID




5. 직원의 이름, 부서id, 급여를 조회하시오. 그리고 직원이 속한 해당 부서의 
최소급여를 마지막에 포함시켜 출력 하시오.
   
-- IN-LINE VIEW 이용
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		E.DEPARTMENT_ID,
		E.SALARY,
		E2.MI
FROM EMPLOYEES E, 	(SELECT MIN(EX.SALARY) AS "MI", 
				EX.DEPARTMENT_ID 
		FROM EMPLOYEES EX
		GROUP BY EX.DEPARTMENT_ID 
		ORDER BY EX.DEPARTMENT_ID) E2
WHERE E.DEPARTMENT_ID = E2.DEPARTMENT_ID




 


