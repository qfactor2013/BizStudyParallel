========================================
		단일행 함수
========================================

1. 이름이 'adam' 인 직원의 급여와 입사일을 조회하시오.

select first_name||' '||last_name, salary, hire_date from employees where LOWER(first_name) = 'adam'

select first_name||' '||last_name, salary, hire_date from employees where first_name = initcap('adam')

2. 나라 명이 'united states of america' 인 나라의 국가 코드를 조회하시오.

select country_id from countries where LOWER(country_name) = 'united states of america'

3. 'Adam의 입사일은 2005/11/02 이고, 급여는 7000 입니다.' 이런 식으로 직원
정보를 조회하시오.

select initcap(first_name)||' 의 입사일은 '|| TO_CHAR(hire_date, 'yyyy/mm/dd') 
		|| '이고, 급여는 ' || salary || ' 입니다.' 출력
from employees
where lower(first_name) = 'adam'


4. 이름이 5글자 이하인 직원들의 이름, 급여, 입사일을 조회하시오.

select first_name||' '||last_name, salary, hire_date from employees where length(first_name) < 6 


5. 2006년도에 입사한 직원의 이름, 입사일을 조회하시오.

select first_name||' '||last_name, hire_date from employees where SUBSTR(HIRE_DATE, 1, 2) = '06'

--인덱스가 걸려있으면 범위지정하는것이 더 낫다.

select first_name||' '||last_name, hire_date from employees where hire_date between '2006-01-01' and '2006-12-31'

6. 15년 이상 장기 근속한 직원들의 이름, 입사일, 급여, 근무년차를 조회하시오.

select first_name||' '||last_name, hire_date, SALARY 
from employees where (FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12)) >= 15



7. 각 부서별 인원수를 조회하되 인원수가 5명 이상인 부서만 출력되도록 하시오.






8. 각 부서별 최대급여와 최소급여를 조회하시오.
   단, 최대급여와 최소급여가 같은 부서는 직원이 한명일 가능성이 높기때문에 
   조회결과에서 제외시킨다.




   
9. 부서가 50, 80, 110 번인 직원들 중에서 급여를 5000 이상 24000 이하를 받는
   직원들을 대상으로 부서별 평균 급여를 조회하시오.
   다, 평균급여가 8000 이상인 부서만 출력되어야 하며, 출력결과를 평균급여가 높은
   부서면저 출력되도록 해야 한다.






