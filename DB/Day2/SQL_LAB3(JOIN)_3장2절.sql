========================================
		JOIN
========================================

1.직원들의 이름과 직급명(job_title)을 조회하시오.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",  J.JOB_TITLE AS "직무이름"
FROM EMPLOYEES E, JOBS J
WHERE E.JOB_ID = J.JOB_ID

SELECT * FROM JOBS
 
SELECT * FROM EMPLOYEES

SELECT * FROM TAB

2.부서이름과 부서가 속한 도시명(city)을 조회하시오.

SELECT * FROM COUNTRIES
SELECT * FROM DEPARTMENTS D

SELECT D.DEPARTMENT_NAME, L.CITY
FROM DEPARTMENTS D, LOCATIONS L
WHERE D.LOCATION_ID = L.LOCATION_ID 



3. 직원의 이름과 근무국가명을 조회하시오. (employees, departments, locations,countries)
 
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		C.COUNTRY_NAME
FROM EMPLOYEES E, DEPARTMENTS D, LOCATIONS L, COUNTRIES C
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND	  D.LOCATION_ID = L.LOCATION_ID
AND   L.COUNTRY_ID  = C.COUNTRY_ID

SELECT * FROM JOBS

4. 직책(job_title)이 'manager' 인 사람의 이름, 직책, 부서명을 조회하시오.
 
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
		J.JOB_TITLE,
		D.DEPARTMENT_NAME
FROM EMPLOYEES E, JOBS J, DEPARTMENTS D
WHERE E.JOB_ID = J.JOB_ID
AND	  E.DEPARTMENT_ID = D.DEPARTMENT_ID
AND   J.JOB_TITLE LIKE INITCAP('%MANAGER%')



5. 직원들의 이름, 입사일, 부서명을 조회하시오.
 
SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
	   E.HIRE_DATE,
	   D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID




6. 직원들의 이름, 입사일, 부서명을 조회하시오.
단, 부서가 없는 직원이 있다면 그 직원정보도 출력결과에 포함시킨다.

SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
	   E.HIRE_DATE,
	   D.DEPARTMENT_NAME
FROM EMPLOYEES E, DEPARTMENTS D
WHERE E.DEPARTMENT_ID = D.DEPARTMENT_ID(+)



7. 직원의 이름과 직책(job_title)을 출력하시오.
단, 사용되지 않는 직책이 있다면 그 직책정보도 출력결과에 포함시키시오.


SELECT E.FIRST_NAME||' '||E.LAST_NAME AS "직원이름",
	   J.JOB_TITLE
FROM EMPLOYEES E 
RIGHT OUTER JOIN JOBS J ON E.JOB_ID = J.JOB_ID
ORDER BY J.JOB_ID




insert into JOBS values('Free', '잉여인간', 500, 1000)