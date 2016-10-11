========================================
		SubQuery
========================================


3. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.
그리고 부서가 없는 직원에 대해서는 '<부서없음>' 이 출력되도록 한다.
(outer-join , nvl() )

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		E.HIRE_DATE,
		NVL(D.DEPARTMENT_NAME, '부서없음')
		FROM EMPLOYEES E, DEPARTMENTS D
		WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)



4. 직원의 직책에 따라 월급을 다르게 지급하려고 한다.
직책에 'Manager'가 포함된 직원은 급여에 0.5를 곱하고
나머지 직원들에 대해서는 원래의 급여를 지급하도록 한다. 
적절하게 조회하시오. (decode)

SELECT E.*, J.JOB_TITLE,
DECODE(substr(J.JOB_TITLE, -7, 7), initcap('manager'), E.salary*0.5, E.salary) as "매니저고통분담"
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



SELECT E.*, D.*
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+) 
AND   E.DEPARTMENT_ID IN (SELECT D FROM(
							SELECT DEPARTMENT_ID AS D, COUNT(DEPARTMENT_ID) 
							FROM EMPLOYEES 
							GROUP BY DEPARTMENT_ID 
							HAVING COUNT(DEPARTMENT_ID) >= 3)
							)  
ORDER BY E.DEPARTMENT_ID





SELECT * FROM EMPLOYEES

4. 각 부서별 최대급여를 받는 직원의 이름, 부서명, 급여를 조회하시오.







5. 직원의 이름, 부서id, 급여를 조회하시오. 그리고 직원이 속한 해당 부서의 
최소급여를 마지막에 포함시켜 출력 하시오.
   
			




 


