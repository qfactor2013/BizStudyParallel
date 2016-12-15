select * 
from EMPLOYEES;

desc EMPLOYEES;

select employee_id "사원 번호", first_name, 
       salary 급여, salary*0.1 as "10급여10"
from "EMPLOYEES"
where  "FIRST_NAME" = 'Alexander'
and salary >= 5000 
--값(literal) : ' ' 
--식별자(identifier) : 칼럼이름, "대문자" , 소문자
--산술연산자, 비교연산자, 논리연산자
--Alias(별명):as 예약어는 생략가능 , 영문자시작, ""안의 특수문자는 무관

select employee_id, first_name||' '||last_name, 
         concat( concat(first_name, ' '),last_name)  ,
          salary, COMMISSION_PCT, 
           salary+salary*nvl(COMMISSION_PCT,0) 커미션추가 
from employees 
where  COMMISSION_PCT is not null --is  null, is not null

--직원이 근무하는 부서 
-- distinct : 중복제거 
select distinct department_id, first_name, last_name
from employees
order by 1,2,3
--where department_id is not null;
--부서배치가 되지않은 직원?
select *
from employees
where department_id is null;

--문자데이터, 날짜데이터 literal =>' ' 
select *
from employees
where hire_date >= '2006.01.01'
and (salary >= 6000
or department_id = 80 )

--논리연산자 : not > and > or
--우선순위는 ()로 변경한다. 
select * from emp
where not deptno=10

select * from emp
where deptno<>10


select * from emp
where 300<=  comm  and  comm <=1000

select * from emp
where  comm  between  300 and 1000

select * from emp
where  comm=300 or comm = 500 or comm=1400

select * from emp
where  comm in ( 300, 500, 1400   )


select * from emp
where  comm in   (300 )   

select * from emp
where  comm not in   (300, 500 )  

select * from emp
where substr(ename,1,1) = 'M'

select * from emp
where ename like 'M%' --M뒤에 0자리이상의 아무 문자나 가능

select * from emp
where ename like 'M_____'

select *
from employees
where first_name like '%is%'; --%  0 자리이상

where first_name like 'L___'; --_ 1자리 

select employee_id 직원번호, first_name, salary 급여
from employees 
where department_id = 80
order by 3 desc, 급여 asc 

order by 직원번호 desc --기본(default) asc(오름차순) , desc(내림차순)




