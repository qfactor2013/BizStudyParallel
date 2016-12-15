--DML(CRUD)

--BLOB = BINARY LARGE OBJECT BYTE
--CLOB = CHARACTER LARGE OBJECT BYTE
-- ������ ���������ϴ�.
--DDL
drop table emp; -- �ſ� ����!!
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
	ON DELETE SET NULL,   -- �ܷ�Ű, ON DELETE SET NULL�ϸ� �θ� �������� NULL�� �ʱ�ȭ��
	constraint pk_emp 
	primary key(empid)  						-- �⺻Ű
);

--���̺� �����ϱ�, ���������� not null�� ����ȴ�.
create table emp2
as select employee_id, first_name,
			salary, hire_date, department_id
from employees
where department_id = 80


create table emp3
as select employee_id, first_name,
			salary, hire_date, department_id
from employees
where 1=0  -- ������ �����ϰ� ���� ��

-- delete�� �ѹ��� �����ϳ� tuncate�� ����Ŀ���̶� ���� �Ұ���



select * from emp2


alter table emp
modify gender char(1) 
constraint chk_gender 
check(gender in ('M', 'F')); -- gender Į�� �������� ����

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

select * from emp -- �η� ����� �� Ȯ���� �� ����
select * from tab

insert into emp(empid, empname, phone, email, deptid) 
values(6,'qfactor','010-0000-0000', 'qfactor3@gmail.com', 300); -- DEPARTMENT_ID�� ��� �ȵ�
delete from emp; 
-- ���� DB�� �ݿ��ϱ� : commit;
-- ����ϱ� : rollback;
rollback;



empid number,
empname varchar2(21),
gender char(1),
birhdat date,
 

insert into EMP values(10,'���α�', 'M', '010-7889-6677', null, null, null)

insert into emp(empid, EMPname, birthday, phone)  
(select employee_id, first_name, hire_date, substr(phone_number,1,13) from EMPLOYEES)

update emp 
set address = '�������'

select * from emp;

update emp
set gender = 'F'
where gender is null

delete from EMP
where empname like 'D%'


-- �������� 2���� �÷��� ���̺�
-- ���̺� ���� ���� Ȯ��
select *--table_name, constraint_name, constraint_type 
from user_constraints 
where table_name = 'EMP'

select * from user_cons_columns
where table_name = 'EMP2';

select * from 

--ORA-00054 ���ǻ�����϶� ���������ϴ� ��ɾ�
select a.sid, a.serial# from v$session a, v$lock b, dba_objects c
where a.sid = b.sid and b.id1 = c.object_id
and b.type = 'TM' and c.object_name = 'emp' --���̺��̸�

alter system kill session '50,535' -- �׾��!


-- constraint �������� : column level, table level
--							not null, unique, promary key, foreign key, check


-- Transaction ���� ��ɾ�
-- commit, rollback, savepoit

select * from emp;
-- savepoint�� �������α׷��ܿ����� ����� ���� ���� ����.
savepoint A
~~
Savepoint B
~~
ROLLBACK B;

COMMIT;


-- UNION �÷������� ������ Ÿ�� ��ġ�ؾ���
-- UNION ALL �ϰ� �Ǹ� �ߺ��� �Ǿ ���´�.
SELECT '����' ����, FIRST_NAME, SALARY, EMAIL
FROM EMPLOYEES
UNION ALL
SELECT '����' ����, FIRST_NAME, SALARY, EMAIL
FROM EMPLOYEES
UNION ALL
SELECT '�μ�', DEPARTMENT_NAME, LOCATION_ID, ''
FROM DEPARTMENTS
ORDER BY 1


-- VIEW �� ������ ���̺�, ������ ���� ����Ѵ�. (�������� ���� ��ü)

CREATE OR REPLACE VIEW MY_VIEW
AS (
select e.first_name, d.department_name, j.job_title, d.location_id
from EMPLOYEES e, JOBS j, DEPARTMENTS d 
where e.department_id = d.department_id 
and e.job_id	= j.job_id				
)

SELECT * FROM MY_VIEW	-- �ϳ��� �� ������.

SELECT FIRST_NAME, JOB_TITLE, DEPARTMENT_NAME, CITY
FROM MY_VIEW, LOCATIONS
WHERE MY_VIEW.LOCATION_ID = LOCATIONS.LOCATION_ID

-- view ���� ���̺�
select * from user_views


--index 
-- PK�� unique ���������� �ڵ����� index�� ������ (�׷��� ���� �� �ݵ�� �ɾ������)
-- index�� ȿ������ ���
-- where���̳� join ���ǿ� �ַ� ���Ǵ� �÷�
-- ���̺� ����� ���� ��
-- unique �÷��̳� null�� ���� �÷�
-- �˻������ ��ü �������� 5% �̸� �϶�

-- ��ȿ������ ���
-- ���̺��� ���� ���, ���� �����ϴ� ���, ��ȸ��� ��û�� �����͸� �������� ���

-- index ���Ұ� : �ε��� �÷��� ���� ����, ������ ��, is not null ��




--�Ϲ����� SQL Ʃ�� ���

--1. �������ڴ� ���ε庯��(?)�� ����Ѵ�.
--2. �ε����÷��� ���� x
--3. OR���ٴ� AND
--4. �׷��Լ����� HAVING ���� ������ WHERE������ �����͸� ���͸��Ѵ�.
--5. DISTINCT�� ������ ������� �ʴ´�.
--6. IN, NOT IN ��ſ� EXISTS, NOT EXISTS �� ����Ѵ�.
--7. SET ������ ���� UNION ALL�� ����Ѵ�.
--8. ������ WHERE ������ �ε��� �÷��� ����Ѵ�.
--9. �ε��� �÷��� ����ϴ� �����ڴ� ������ ���� ������(=)�� ����Ѵ�.



-- SEQUENCE
--	������ ���׷����Ͱ� �ڵ����� �����Ѵ�.
-- �ַ� PK�� ������ ���� ����Ѵ�.
-- ���� ����ڰ� ���� �����ϴ�.
-- ���̺� ������, �������̺��� ��������


CREATE TABLE BOARD (
	BOARDNO NUMBER PRIMARY KEY,
	TITLE VARCHAR2(20),
	CONTENTS VARCHAR2(100)
)

CREATE SEQUENCE BOARD_SEQ;

INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'DB ����', 'DB ������Ʈ���')
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'DB ����', 'DB ������Ʈ���')
INSERT INTO BOARD VALUES(BOARD_SEQ.NEXTVAL, 'DB ����', 'DB ������Ʈ���')

SELECT * FROM BOARD