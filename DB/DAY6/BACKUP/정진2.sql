SQL주요함수 

오늘날짜와 시간->oracle:sysdate, 
              sybase:getdate()

select sysdate, 100+200
from dual  

--숫자함수

select abs(10-20) , round(2.4) 반올림,
   ROUND(34.5678,2) 반올림2,
   ROUND(1294.5678,-2) 반올림3,
   ceil(2.1) 무조건올림,
   floor(2.6) 무조건버림 , sign(100-50) 부호,
   10/3 값_실수, FLOOR(MOD(10,3)) 몫, mod(10,3) 나머지 
from dual


select first_name, email,
       upper(first_name) 대문자, 
       lower(first_name) 소문자,
       initcap(email) 첫문자대문자 ,
       substr(email,1,3) 첫3문자 ,
       length(email) 자리수 ,
       instr(email, 'A') 위치 ,
       lpad(first_name, 10, '*') 왼쪽채우기 ,
       rpad(first_name, 10, '*') 오른쪽채우기,
       ltrim(first_name,'A') 왼쪽자르기 ,
       rtrim(first_name,'n') 오른쪽자르기,
       trim('a' from 'aaaaOracleaaaaa') 양쪽자르기 
from employees 

--날짜함수 

select sysdate 오늘, hire_date 입사일,
     months_between(sysdate, hire_date) 입사개월수, 
     floor(months_between(sysdate, hire_date)/12) 만입사년수,
     sysdate - hire_date 입사일수,
     to_char(hire_date,'yyyy/mm/dd hh:mi:ss DAY') 입사일의요일, 
     next_day(hire_date,'일요일') 다음일요일,
     last_day(hire_date) 말일 
from employees 

--변환함수 
select hire_date, 
       to_char(hire_date, 'YYYY') 년도,
       to_char(hire_date, 'RR') 년도2,
       to_char(hire_date, 'mm') 월,
       to_char(hire_date, 'mon') 월2,
       to_char(hire_date, 'dd') 일,
       to_char(hire_date, 'DAY') 요일,
       to_char(hire_date, 'dy') 요일2,
       to_char(hire_date, 'yyyy/mm/dd hh24:mi:ss') 일자시간
from employees


--숫자가 문자로 
select first_name, salary, to_char(salary,'L999,999') 
from employees

--문자를 날짜로 
select  *
from  employees
where hire_date < '2016-10-10' --자동형변환(묵시적) 

select  *
from  employees
where hire_date < to_date('2016-10-10','yyyy-mm-dd')
                       --강제형변환  
select  *
from  employees
where salary >= '10000'  --자동형변환

select  *
from  employees
where salary >= to_number('10000')  --강제형변환

select first_name, salary, 
       commission_pct, 
       nvl(commission_pct,0) nvl함수,
       nvl2(commission_pct,'null이 아니다.','null이다') nvl2함수,
       nvl(to_char(department_id),'부서배치안됨') 부서코드 ,
       nvl2(department_id,to_char(department_id),'부서배치안됨') nvl2함수2, 
       coalesce(commission_pct,department_id,salary) null아닌것찾기    
from employees






