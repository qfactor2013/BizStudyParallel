SQL�ֿ��Լ� 

���ó�¥�� �ð�->oracle:sysdate, 
              sybase:getdate()

select sysdate, 100+200
from dual  

--�����Լ�

select abs(10-20) , round(2.4) �ݿø�,
   ROUND(34.5678,2) �ݿø�2,
   ROUND(1294.5678,-2) �ݿø�3,
   ceil(2.1) �����ǿø�,
   floor(2.6) �����ǹ��� , sign(100-50) ��ȣ,
   10/3 ��_�Ǽ�, FLOOR(MOD(10,3)) ��, mod(10,3) ������ 
from dual


select first_name, email,
       upper(first_name) �빮��, 
       lower(first_name) �ҹ���,
       initcap(email) ù���ڴ빮�� ,
       substr(email,1,3) ù3���� ,
       length(email) �ڸ��� ,
       instr(email, 'A') ��ġ ,
       lpad(first_name, 10, '*') ����ä��� ,
       rpad(first_name, 10, '*') ������ä���,
       ltrim(first_name,'A') �����ڸ��� ,
       rtrim(first_name,'n') �������ڸ���,
       trim('a' from 'aaaaOracleaaaaa') �����ڸ��� 
from employees 

--��¥�Լ� 

select sysdate ����, hire_date �Ի���,
     months_between(sysdate, hire_date) �Ի簳����, 
     floor(months_between(sysdate, hire_date)/12) ���Ի���,
     sysdate - hire_date �Ի��ϼ�,
     to_char(hire_date,'yyyy/mm/dd hh:mi:ss DAY') �Ի����ǿ���, 
     next_day(hire_date,'�Ͽ���') �����Ͽ���,
     last_day(hire_date) ���� 
from employees 

--��ȯ�Լ� 
select hire_date, 
       to_char(hire_date, 'YYYY') �⵵,
       to_char(hire_date, 'RR') �⵵2,
       to_char(hire_date, 'mm') ��,
       to_char(hire_date, 'mon') ��2,
       to_char(hire_date, 'dd') ��,
       to_char(hire_date, 'DAY') ����,
       to_char(hire_date, 'dy') ����2,
       to_char(hire_date, 'yyyy/mm/dd hh24:mi:ss') ���ڽð�
from employees


--���ڰ� ���ڷ� 
select first_name, salary, to_char(salary,'L999,999') 
from employees

--���ڸ� ��¥�� 
select  *
from  employees
where hire_date < '2016-10-10' --�ڵ�����ȯ(������) 

select  *
from  employees
where hire_date < to_date('2016-10-10','yyyy-mm-dd')
                       --��������ȯ  
select  *
from  employees
where salary >= '10000'  --�ڵ�����ȯ

select  *
from  employees
where salary >= to_number('10000')  --��������ȯ

select first_name, salary, 
       commission_pct, 
       nvl(commission_pct,0) nvl�Լ�,
       nvl2(commission_pct,'null�� �ƴϴ�.','null�̴�') nvl2�Լ�,
       nvl(to_char(department_id),'�μ���ġ�ȵ�') �μ��ڵ� ,
       nvl2(department_id,to_char(department_id),'�μ���ġ�ȵ�') nvl2�Լ�2, 
       coalesce(commission_pct,department_id,salary) null�ƴѰ�ã��    
from employees






