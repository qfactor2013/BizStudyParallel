
hr/hr
========================================
		SELECT 기본
========================================

1. 급여가 15000 이상인 직원들의 이름, 급여, 부서id를 조회하시오.

SELECT DEPARTMENT_ID 부서ID, FIRST_NAME||' '||LAST_NAME 직원이름, SALARY 급여 
FROM EMPLOYEES WHERE SALARY >= 15000

2. 직원 중에서 연봉이 170000 이상인 직원들의 이름, 연봉을 조회하시오.
   연봉은 급여(salary)에 12를 곱한 값입니다.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		(SALARY*12) AS "연봉"
FROM EMPLOYEES WHERE (SALARY*12) >= 170000

3. 직원 중에서 부서id가 없는 직원의 이름과 급여를 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여"
FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL


4. 2004년 이전에 입사한 직원의 이름, 급여, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여",
		HIRE_DATE AS "입사일",
FROM EMPLOYEES WHERE SUBSTR(HIRE_DATE, 0, 4) <= '2004' -- 이전이 포함하는거였음 충격과 공포!

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여",
		HIRE_DATE AS "입사일"
FROM EMPLOYEES WHERE HIRE_DATE < '2004.01.01'



-- 논리연산자 -- 
1. 80, 50 번 부서에 속해있으면서 급여가 13000 이상인 직원의 이름, 급여, 부서id
를 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID
FROM EMPLOYEES WHERE DEPARTMENT_ID IN ('80','50') 
AND SALARY >= 13000

2. 2005년 이후에 입사한 직원들 중에서 급여가 1300 이상 20000 이하인 직원들의 
이름, 급여, 부서id, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 0, 2) >= '05'
AND SALARY BETWEEN 1300 AND 20000


-- SQL 비교연산자 --
1. 80, 50 번 부서에 속해있으면서 급여가 13000 이상인 직원의 이름, 급여, 부서id
를 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID" 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ('80', '50')
AND SALARY >= 13000


2. 2005년 이후에 입사한 직원들 중에서 급여가 1300 이상 30000 이하인 직원들의 
이름, 급여, 부서id, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 0, 2) >= '05'
AND SALARY BETWEEN 1300 AND 20000


3. 2005년도 입사한 직원의 정보만 출력하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 0, 2) = '05'

4. 이름이 D로 시작하는 직원의 이름, 급여, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE 'D%'


5. 12월에 입사한 직원의 이름, 급여, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES 
WHERE SUBSTR(HIRE_DATE, 4, 2) = '12'



6. 이름에 le 가 들어간 직원의 이름, 급여, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE '%le%' OR LAST_NAME LIKE '%le%'


7. 이름이 m으로 끝나는 직원의 이름, 급여, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES 
WHERE LAST_NAME LIKE '%m'



8. 이름의 세번째 글자가 r인 이름, 급여, 입사일을 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		DEPARTMENT_ID AS "부서ID", 
		HIRE_DATE AS "입사일"
FROM EMPLOYEES 
WHERE first_name LIKE '__r%'



9. 커미션을 받는 직원의 이름, 커미션, 급여를 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		COMMISSION_PCT AS "커미션"
FROM EMPLOYEES 
WHERE commission_pct is not null


10. 커미션을 받지 않는 직원의 이름, 커미션, 급여를 조회하시오.

SELECT FIRST_NAME||' '||LAST_NAME AS "직원이름",
		SALARY AS "급여", 
		COMMISSION_PCT AS "커미션"
FROM EMPLOYEES 
WHERE commission_pct is null


11. 2000년대에 입사해서 30, 50, 80 번 부서에 속해있으면서, 
급여를 5000 이상 17000 이하를 받는 직원을 조회하시오. 
단, 커미션을 받지 않는 직원들은 검색 대상에서 제외시키며, 먼저 입사한 직원이 
먼저 출력되어야 하며 입사일이 같은 경우 급여가 많은 직원이 먼저 출력되록 하시오.


SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ('30', '50', '80')
AND SUBSTR(HIRE_DATE, 0, 2) >= '00'
AND SALARY BETWEEN 5000 AND 17000
AND COMMISSION_PCT IS NOT NULL
ORDER BY HIRE_DATE ASC , SALARY DESC

-- 연도가 왜 2자리로 검색되는가?
-- RR 포맷으로 되어있어서 그렇다!
-- 년도 FORMAT
-- RR : 50~99 	: 	19~
--		00~49	:	20~

 ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD'

