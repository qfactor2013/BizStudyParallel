==========================================
	Inline View 와 Top-N SubQuery
==========================================

1. 급여를 가장 많이 받는 상위 5명의 직원 정보를 조회하시오.

SELECT *
FROM ( SELECT FIRST_NAME, SALARY FROM EMPLOYEES ORDER BY SALARY DESC)
WHERE ROWNUM <=5

2. 커미션을 가장 많이 받는 상위 3명의 직원 정보를 조회하시오.

SELECT * FROM
(SELECT FIRST_NAME,
		COMMISSION_PCT
FROM EMPLOYEES
WHERE COMMISSION_PCT IS NOT NULL
ORDER BY 2 DESC NULLS LAST
)
WHERE ROWNUM <= 3

3. 월별 입사자 수를 조회하되, 입사자 수가 5명 이상인 월만 출력하시오.

SELECT TO_CHAR(HIRE_DATE, 'mm') 월, count(*) 입사자수
FROM EMPLOYEES E
GROUP BY TO_CHAR(HIRE_DATE, 'mm')
having count(*) >= 5
order by 월


4. 년도별 입사자 수를 조회하시오. 
단, 입사자수가 많은 년도부터 출력되도록 합니다.


select TO_CHAR(HIRE_DATE, 'yyyy') 년, count(*) 입사자수
FROM EMPLOYEES E
GROUP BY TO_CHAR(HIRE_DATE, 'yyyy')
order by 년 desc


--부서별, 직급별 급여 합계

SELECT DEPARTMENT_ID, JOB_ID, SUM(SALARY) 급여합계
FROM EMPLOYEES
GROUP BY CUBE(DEPARTMENT_ID, JOB_ID)    
-- CUBE() 인자들의 합계가 나옴 1번째 인자합계값은 1번째 항목값이 끝날때마다 출력
-- ROLLUP() 
ORDER BY 1,2




