========================================
		SubQuery
========================================
1. 'IT'부서에서 근무하는 직원들의 이름, 급여, 입사일을 조회하시오.

select E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
	   E.SALARY,
	   E.HIRE_DATE
from employees E
where E.DEPARTMENT_ID in ( 
							SELECT DEPARTMENT_ID 
							FROM DEPARTMENTS 
							WHERE DEPARTMENT_NAME 
							LIKE UPPER('%it%')
						)		






2. 'Alexander' 와 같은 부서에서 근무하는 직원의 이름과 부서id를 조회하시오.


select E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
	   E.EMPLOYEE_ID
from EMPLOYEES	E	-- =any == in
where E.DEPARTMENT_id =any (
select DEPARTMENT_id
from EMPLOYEES
where first_name = 'Alexander'
)


3. 80번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 부서id, 급여를 조회하시오.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		E.DEPARTMENT_ID,
		E.SALARY
FROM EMPLOYEES E
WHERE E.SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES WHERE DEPARTMENT_ID = 80)

4. 'South San Francisco'에 근무하는 직원의 최소급여보다 급여를 많이 받으면서 
50 번부서의 평균급여보다 많은 급여를 받는 직원의 이름, 급여, 부서명, 
부서id를 조회하시오.

SELECT * FROM TAB
SELECT * FROM COUNTRIES
SELECT * FROM LOCATIONS

SELECT  E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		E.SALARY,
		E.DEPARTMENT_ID,
		D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND   E.SALARY > (SELECT MIN(E.SALARY) 
				  FROM EMPLOYEES E, 
				  DEPARTMENTS D, 
				  LOCATIONS L
				  WHERE 
				  		E.DEPARTMENT_ID = D.DEPARTMENT_ID
				  AND	D.LOCATION_ID	= L.LOCATION_ID
				  AND	L.CITY			= 'South San Francisco'	)



-------------------scott/tiger (emp, dept)

1. BLAKE와 동일한 부서에 속한 모든 사원의 이름및 입사일을 표시하는 질의를 작성하시오.
결과에서 BLAKE는 제외시킵니다.

SELECT * FROM TAB
SELECT * FROM EMP, DEPT

SELECT E.ENAME, E.HIREDATE
FROM EMP E
WHERE E.DEPTNO = ( SELECT DEPTNO FROM EMP WHERE ENAME = 'BLAKE')
AND E.ENAME != 'BLAKE'


2. 부서의 위치가 DALLAS인 모든 사원의 이름, 부서번호 , 직무를 표시하시오 

SELECT E.ENAME, E.DEPTNO, D.DNAME
FROM EMP E, DEPT D
WHERE D.DEPTNO IN (SELECT DEPTNO FROM DEPT WHERE LOC = 'DALLAS')



3. KING에게 보고하는 모든 사원의 이름과 급여를 표시하는 질의를 작성하시오 

 
SELECT E.ENAME, E.SAL
FROM EMP E
WHERE E.MGR = (SELECT EMPNO FROM EMP WHERE ENAME = 'KING')













 
