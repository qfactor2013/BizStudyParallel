select * from EMPLOYEES;

desc employees;


select employee_id, first_name from employees


select 	employee_id "사원 번호", first_name, 
		salary 급여, salary*0.1 as "급여10%"     -- 3. 해당하는 열을 가져온다.
		from "EMPLOYEES"        	  -- 1. 먼저 테이블을 가져와서
		where salary >= 5000		  -- 2. 조건을 한번 보고
		and "FIRST_NAME" = 'Alexander'  -- 값을 찾고 싶을때는 반드시 홑따옴표(single quotation)를 해야한다.
		"Alexander"   -- 색깔이 다름!!
		--ORA-00904: "급여": invalid identifier  식별자가 올바르지 않는다.		
		-- 쌍따옴표(double quotation)을 하게 되면 대소문자까지 일치하는 정확한 검색을 하게 된다.
			--값(literal) : ''(single quotation)
			--식별자(identifier) : 칼럼이름, "대문자", 소문자
			--산술연산자, 비교연산자, 논리 연산자 가능
-- Alias(별명) : as  예약어는 생략가능 , 단 생략하면 문자만 있어야된다.(특수문자X) ""로 감싸면 됨

		
		SELECT EMPLOYEE_ID, FIRST_NAME,
				SALARY, COMMISSION_PCT, SALARY+SALARY*COMMISSION_PCT 커미션추가
		FROM EMPLOYEES					-- SALARY가 있음에도 불구하고 PCT가 NULL이라 커미션추가가 NULL됨
		
		SELECT EMPLOYEE_ID, FIRST_NAME,
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) 커미션추가
		FROM EMPLOYEES					-- NVL() 함수로 널 처리를 함(NULL이면 0)
		
		SELECT EMPLOYEE_ID, FIRST_NAME,
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) 커미션추가
		FROM EMPLOYEES	
		WHERE COMMISSION_PCT IS NOT NULL  -- NULL이 아닌 것만 찾는다.
		
		-- 문자열 연결
		SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, -- ||연산자는 오라클만, SYBASE는 +  
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) 커미션추가
		FROM EMPLOYEES	
		WHERE COMMISSION_PCT IS NOT NULL
		
		-- CONCAT() 함수도 있다.
		SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME,
				CONCAT(	CONCAT(FIRST_NAME, ' '), LAST_NAME), -- CONCAT()은 인자가 2개밖에 안되서...
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) 커미션추가
		FROM EMPLOYEES	
		WHERE COMMISSION_PCT IS NOT NULL
		
		-- DISTINCT 중복을 제거하는 예약어(컬럼을 추가하면 추가된 컬럼까지 포함하여 중복체크)
		SELECT DISTINCT DEPARTMENT_ID, FIRST_NAME, LAST_NAME
		FROM EMPLOYEES
		ORDER BY 1,2,3 --오름차순정렬, 컬럼명을 써도 되고 숫자로 쓰면 SELECT 절에 명시된 순서 순으로 정렬
		WHERE DEPARTMENT_ID IS NOT NULL
		
		--날짜는 반드시 따옴표로 감싸야 한다.
		SELECT * FROM EMPLOYEES WHERE HIRE_DATE >= '2006.01.01' -- 2006-01-01, 2006/01/01
		
		--논리연산자 : NOT > AND > OR 의 우선순위
		--우선순위는 ()로 변경한다.
		SELECT * FROM EMPLOYEES 
		WHERE HIRE_DATE >= '2006.01.01'
		AND (SALARY >= 6000 OR DEPARTMENT_ID = 80)
		
		SELECT * FROM EMP WHERE COMM >= 300 AND COMM <= 1000
		SELECT * FROM EMP WHERE COMM BETWEEN 300 AND 1000 -- 큰 수가 먼저 나올 순 없다.
		
		SELECT * FROM EMP WHERE COMM = 300 OR COMM = 500 OR COMM = 1400
		SELECT * FROM EMP WHERE COMM IN (300, 500, 1400)
		-- substr, 1번째 문자부터 1번째 문자까지 자름
		SELECT * FROM EMP WHERE SUBSTR(ENAME,1,1) = 'M'
		
		select * from employees where first_name like 'L%' -- L뒤에 0자리 이상의 아무 문자나 가능
		select * from employees where first_name like 'L___' -- 자리수 고정, L___ 총 4자리
		select * from employees where first_name like '%is%' -- 중앙에 is라는 단어를 가진 first_name을 찾음
		
		-- order by 절 
		SELECT EMPLOYEE_ID 직원번호, FIRST_NAME, SALARY	 --3.
		FROM EMPLOYEES				-- 1. 
		WHERE DEPARTMENT_ID = 80	-- 2.
		ORDER BY 직원번호 desc		-- 4. default asc(오름차순), desc(내림차순)
		
		SELECT EMPLOYEE_ID 직원번호, FIRST_NAME, SALARY	급여 --3.
		FROM EMPLOYEES				-- 1. 
		WHERE DEPARTMENT_ID = 80	-- 2.
		ORDER BY 3 desc, 급여 asc	--4.
		
		
		SELECT * FROM tab
		
		