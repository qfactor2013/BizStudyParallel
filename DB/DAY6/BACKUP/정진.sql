select * 
from EMPLOYEES;

desc EMPLOYEES;

select employee_id "��� ��ȣ", first_name, 
       salary �޿�, salary*0.1 as "10�޿�10"
from "EMPLOYEES"
where  "FIRST_NAME" = 'Alexander'
and salary >= 5000 
--��(literal) : ' ' 
--�ĺ���(identifier) : Į���̸�, "�빮��" , �ҹ���
--���������, �񱳿�����, ��������
--Alias(����):as ������ �������� , �����ڽ���, ""���� Ư�����ڴ� ����

select employee_id, first_name||' '||last_name, 
         concat( concat(first_name, ' '),last_name)  ,
          salary, COMMISSION_PCT, 
           salary+salary*nvl(COMMISSION_PCT,0) Ŀ�̼��߰� 
from employees 
where  COMMISSION_PCT is not null --is  null, is not null

--������ �ٹ��ϴ� �μ� 
-- distinct : �ߺ����� 
select distinct department_id, first_name, last_name
from employees
order by 1,2,3
--where department_id is not null;
--�μ���ġ�� �������� ����?
select *
from employees
where department_id is null;

--���ڵ�����, ��¥������ literal =>' ' 
select *
from employees
where hire_date >= '2006.01.01'
and (salary >= 6000
or department_id = 80 )

--�������� : not > and > or
--�켱������ ()�� �����Ѵ�. 
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
where ename like 'M%' --M�ڿ� 0�ڸ��̻��� �ƹ� ���ڳ� ����

select * from emp
where ename like 'M_____'

select *
from employees
where first_name like '%is%'; --%  0 �ڸ��̻�

where first_name like 'L___'; --_ 1�ڸ� 

select employee_id ������ȣ, first_name, salary �޿�
from employees 
where department_id = 80
order by 3 desc, �޿� asc 

order by ������ȣ desc --�⺻(default) asc(��������) , desc(��������)




