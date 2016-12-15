--DML(CRUD)

--BLOB = BINARY LARGE OBJECT BYTE
--CLOB = CHARACTER LARGE OBJECT BYTE
-- 여러개 설정가능하다.
--DDL
drop table emp; -- 매우 조심!!
create table emp(
	empid number,
	empname varchar2(21),
	gender char(1),
	birthday date,
	phone varchar2(20) not null,
	email varchar2(20) constraint email_uni unique,		
	deptid number(4)
	constraint fk_dept 
	references departments(department_id) 
	ON DELETE SET NULL,   -- 외래키, ON DELETE SET NULL하면 부모를 지웠을때 NULL로 초기화됨
	constraint pk_emp 
	primary key(empid)  						-- 기본키
);

--테이블 복사하기, 제약조건은 not null만 복사된다.
create table emp2
as select employee_id, first_name,
			salary, hire_date, department_id
from employees
where department_id = 80


create table emp3
as select employee_id, first_name,
			salary, hire_date, department_id
from employees
where 1=0  -- 구조만 복사하고 싶을 때

-- delete는 롤백이 가능하나 tuncate는 오토커밋이라 복구 불가능



select * from emp2


alter table emp
modify gender char(1) 
constraint chk_gender 
check(gender in ('M', 'F')); -- gender 칼럼 제약조건 수정

alter table emp
modify phone varchar2(13)

alter table EMP
add address varchar2(100)

alter table EMP
modify birthday date default sysdate

desc emp;


--DML
insert into emp(empid, empname, gender, birthday) values(1,'qfactor','M', '2016-10-12');
insert into emp(empid, empname, gender, birthday) values(2,'qfactor','M', '2016-10-12');

insert into emp(empid, empname, phone, email, deptid) 
values(4,'qfactor','010-0000-0000', 'qfactor@gmail.com', 270);
insert into emp(empid, empname, phone, email, deptid) 
values(5,'qfactor','010-0000-0000', 'qfactor2@gmail.com', 100);
insert into emp(empid, empname, phone, email, deptid, gender) 
values(6,'qfactor','010-0000-0000', 'qfactor3@gmail.com', 260, 'M');
insert into emp(empid, empname, phone, email, deptid, gender) 
values(7,'qfactor','010-0000-0000', 'qfactor4@gmail.com', 260, 'F');
insert into emp(empid, empname, phone, email, deptid, gender) 
values(8,'qfactor','010-0000-0000', 'qfactor5@gmail.com', 260, 'M');
insert into emp(empid, empname, phone, email, deptid, gender, birthday) 
values(9,'qfactor','010-0000-0000', 'qfactor6@gmail.com', 260, 'M', '1995-01-01');


DELETE DEPARTMENTS WHERE DEPARTMENT_ID = 270

select * from emp -- 널로 변경된 걸 확인할 수 있음
select * from tab

insert into emp(empid, empname, phone, email, deptid) 
values(6,'qfactor','010-0000-0000', 'qfactor3@gmail.com', 300); -- DEPARTMENT_ID가 없어서 안됨
delete from emp; 
-- 실제 DB에 반영하기 : commit;
-- 취소하기 : rollback;
rollback;



empid number,
empname varchar2(21),
gender char(1),
birhdat date,
 

insert into EMP values(10,'전민규', 'M', '010-7889-6677', null, null, null)

insert into emp(empid, EMPname, birthday, phone)  
(select employee_id, first_name, hire_date, substr(phone_number,1,13) from EMPLOYEES)

update emp 
set address = '테헤란로'

select * from emp;

update emp
set gender = 'F'
where gender is null

delete from EMP
where empname like 'D%'


-- 제약조건 2가지 컬럼과 테이블
-- 테이블 제약 조건 확인
select *--table_name, constraint_name, constraint_type 
from user_constraints 
where table_name = 'EMP'

select * from user_cons_columns
where table_name = 'EMP2';

select * from 

--ORA-00054 세션사용중일때 강제종료하는 명령어
select a.sid, a.serial# from v$session a, v$lock b, dba_objects c
where a.sid = b.sid and b.id1 = c.object_id
and b.type = 'TM' and c.object_name = 'emp' --테이블이름

alter system kill session '50,535' -- 죽어라!


-- constraint 제약조건 : column level, table level
--							not null, unique, promary key, foreign key, check


-- Transaction 제어 명령어
-- commit, rollback, savepoit

select * from emp;
-- savepoint는 응용프로그램단에서는 사용할 일이 별로 없다.
savepoint A
~~
Savepoint B
~~
ROLLBACK B;

COMMIT;


-- UNION 컬럼갯수와 데이터 타입 일치해야함
-- UNION ALL 하게 되면 중복이 되어도 나온다.
SELECT '직원' 제목, FIRST_NAME, SALARY, EMAIL
FROM EMPLOYEES
UNION ALL
SELECT '직원' 제목, FIRST_NAME, SALARY, EMAIL
FROM EMPLOYEES
UNION ALL
SELECT '부서', DEPARTMENT_NAME, LOCATION_ID, ''
FROM DEPARTMENTS
ORDER BY 1


-- VIEW 는 가상의 테이블, 보안을 위해 사용한다. (쿼리문을 가진 객체)

CREATE OR REPLACE VIEW MY_VIEW
AS (
select e.first_name, d.department_name, j.job_title, d.location_id
from EMPLOYEES e, JOBS j, DEPARTMENTS d 
where e.department_id = d.department_id 
and e.job_id	= j.job_id				
)

SELECT * FROM MY_VIEW	-- 하나로 잘 묶었다.

SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
FROM MY_VIEW, LOCATIONS
WHERE MY_VIEW.LOCATION_ID = LOCATIONS.LOCATION_ID

-- view 정보 테이블
select * from user_views


--index 
-- PK와 unique 제약조건은 자동으로 index를 설정함 (그래서 조인 시 반드시 걸어줘야함)
-- index가 효율적인 경우
-- where절이나 join 조건에 주로 사용되는 컬럼
-- 테이블 행수가 많을 때
-- unique 컬럼이나 null이 많은 컬럼
-- 검색결과가 전체 데이터의 5% 미만 일때

-- 비효율적인 경우
-- 테이블이 작은 경우, 자주 갱신하는 경우, 조회결과 엄청난 데이터를 가져오는 경우

-- index 사용불가 : 인덱스 컬럼에 대한 가공, 부정형 비교, is not null 비교




--일반적인 SQL 튜닝 기법

--1. 가변인자는 바인드변수(?)를 사용한다.
--2. 인덱스컬럼의 가공 x
--3. OR보다는 AND
--4. 그룹함수에서 HAVING 보다 가급적 WHERE절에서 데이터를 필터링한다.
--5. DISTINCT는 가급적 사용하지 않는다.
--6. IN, NOT IN 대신에 EXISTS, NOT EXISTS 를 사용한다.
--7. SET 연산자 사용시 UNION ALL을 사용한다.
--8. 가급적 WHERE 절에는 인덱스 컬럼을 사요한다.
--9. 인덱스 컬럼에 사용하는 연산자는 가급적 동등 연산자(=)를 사용한다.



-- SEQUENCE
--	시퀀스 제네레이터가 자동으로 생성한다.
-- 주로 PK값 생성을 위해 사용한다.
-- 여러 사용자가 공유 가능하다.
-- 테이블에 독립적, 여러테이블에서 참조가능


CREATE TABLE BOARD (
	BOARDNO NUMBER PRIMARY KEY,
	TITLE VARCHAR2(20),
	CONTENTS VARCHAR2(100)
)

CREATE SEQUENCE BOARD_SEQ;

INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'DB 수업', 'DB 오브젝트배움')
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'DB 수업', 'DB 오브젝트배움')
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'DB 수업', 'DB 오브젝트배움')

SELECT * FROM BOARD



select *
from user_constraints
where table_name='EMPLOYEES';