SQL 주요 함수

오늘날짜와 시간 -> 	ORACLE : SYSDATE, 
					SYBASE : GETDATE()
					
SELECT SYSDATE FROM EMPLOYEES -- 이렇게 하면 쓸데없는 로드시간이 있으니까....
SELECT SYSDATE FROM DUAL	  -- DUAL 테이블이 있다.

SELECT ABS(10-20), ROUND(2.6), CEIL(2.4), FLOOR(2.6), SIGN(100-50) FROM DUAL
--		절대값		반올림		올림		버림		양/음수인지

SELECT ROUND(34.5678,2), ROUND(1234.5678, -2) FROM DUAL
--		소수점2자리까지를,    10단위를 반올림

SELECT MOD(10,3) FROM DUAL
--	나눈 나머지

SELECT 	FIRST_NAME,
		INITCAP(EMAIL), 	--첫문자만 대문자 
		UPPER(FIRST_NAME) 대문자, 
		LOWER(FIRST_NAME) 소문자,
		SUBSTR(EMAIL,1,3) AS "처음3문자만가져옴",
		LENGTH(EMAIL) AS "자리수"		 -- 글자개수를 센다
		,INSTR(EMAIL, 'A') AS "특정문자위치찾기"
		,LPAD(FIRST_NAME, 10, '*') AS "왼쪽채우기"
		,RPAD(FIRST_NAME, 10, '*') AS "오른쪽채우기"
		,LTRIM(FIRST_NAME, 'A') AS "왼쪽자르기"
		,RTRIM(FIRST_NAME, 'n') AS "오른쪽자르기"
		,TRIM('a' from 'aaaaORACLEaaaaa') AS "양쪽자르기"
		FROM EMPLOYEES

--날짜함수

		SELECT SYSDATE 오늘, HIRE_DATE 입사일, MONTHS_BETWEEN(SYSDATE, HIRE_DATE) 입사개월수,
				FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) 만입사년수,
				(SYSDATE - HIRE_DATE) 입사일수,
				NEXT_DAY(SYSDATE, '일요일') 다음일요일,
				TO_CHAR(HIRE_DATE,'yyyy/MM/dd hh:mi:ss DAY') 입사일의요일,
				LAST_DAY(HIRE_DATE) 해당월의말일
				FROM EMPLOYEES	
				
-- 변환함수
-- TO_CHAR 타입을 CHAR(문자)로 바꿈
		SELECT 	HIRE_DATE, 
				TO_CHAR(HIRE_DATE, 'YYYY') 년도,
				TO_CHAR(HIRE_DATE, 'RR') 년도2자리,
				TO_CHAR(HIRE_DATE, 'MM') 월,
				TO_CHAR(HIRE_DATE, 'mon') 월2,
				TO_CHAR(HIRE_DATE, 'dd') 일,
				TO_CHAR(HIRE_DATE, 'DAY') 요일,
				TO_CHAR(HIRE_DATE, 'DY') 요일2,
				TO_CHAR(HIRE_DATE, 'YYYY/MM/DD HH24:MI:SS') 연월일시분초
		FROM EMPLOYEES
		
-- 숫자가 문자로

		SELECT FIRST_NAME , SALARY, TO_CHAR(SALARY, 'L999,999') -- L붙이면 원 표시
		FROM EMPLOYEES
		
-- 문자를 날짜로
				
		SELECT * FROM EMPLOYEES
		WHERE HIRE_DATE < '2016-10-10' -- 묵시적형변환이 되어 비교는 가능(원래는 안됨)
		
		SELECT * FROM EMPLOYEES
		WHERE HIRE_DATE < TO_DATE('2016-10-10', 'yyyy-mm-dd') -- 강제형변환(명시적형변환)
		
		SELECT * FROM EMPLOYEES
		WHERE SALARY >= TO_NUMBER('10000') -- 강제형변환
		
--NVL 함수
		-- NULL이면 2번째 인자에 지정한 값으로 치환한다.
		-- NVL2는 반대로 널이 아니면 2번째 인자값, 널이면 3번째 인자값이다.(DECODE랑 유사)
		SELECT FIRST_NAME, SALARY, COMMISSION_PCT, 
				NVL(COMMISSION_PCT, 0),
				NVL2(COMMISSION_PCT, 'NOT NULL', '널널널') NVL2함수,
				NVL(TO_CHAR(DEPARTMENT_ID), '단독작업') AS "부서코드",
				COALESCE(COMMISSION_PCT, DEPARTMENT_ID, SALARY) NULL인아닌것찾기
		FROM EMPLOYEES
		WHERE 