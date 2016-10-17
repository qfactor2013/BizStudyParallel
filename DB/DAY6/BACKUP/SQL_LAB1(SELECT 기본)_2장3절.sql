
hr/hr
========================================
		SELECT �⺻
========================================

1. �޿��� 15000 �̻��� �������� �̸�, �޿�, �μ�id�� ��ȸ�Ͻÿ�.
--3��
select first_name, salary, department_id
from EMPLOYEES
where salary >= 15000



2. ���� �߿��� ������ 170000 �̻��� �������� �̸�, ������ ��ȸ�Ͻÿ�.
   ������ �޿�(salary)�� 12�� ���� ���Դϴ�.
   --3��
select first_name, salary*12 ����
from EMPLOYEES
where salary*12 >= 170000


3. ���� �߿��� �μ�id�� ���� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.
--1��
select first_name, salary 
from EMPLOYEES
where department_id is null; 

4. 2004�� ������ �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date 
from EMPLOYEES
where hire_date <= '2004/12/31'

-- �������� -- 
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.
--2��
select first_name, salary, hire_date 
from EMPLOYEES
where department_id in (80,50)
and salary >= 13000

2. 2005�� ���Ŀ� �Ի��� ������ �߿��� 
�޿��� 1300 �̻� 20000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.
--83�� 
select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date >= '2005/01/01'
and (salary between 1300 and 20000 )



-- SQL �񱳿����� --
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.
--2��
select first_name, salary, hire_date 
from EMPLOYEES
where (department_id = 80 or department_id = 50 )
and salary >= 13000



2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 30000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.

select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date >= '2005/01/01'
and salary >= 1300 and salary<= 20000 


3. 2005�⵵ �Ի��� ������ ������ ����Ͻÿ�.
--29��
select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date >= '2005/01/01' and 
      hire_date <= '2005/12/31'

select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date between '2005/01/01' and  '2005/12/31'

select first_name, salary, hire_date , department_id
from EMPLOYEES
where hire_date like '05%';

select first_name, salary, hire_date , department_id
from EMPLOYEES
where to_char(hire_date,'yyyy') = '2005';

4. �̸��� D�� �����ϴ� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
--9��
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like 'D%'


5. 12���� �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select *
from employees
where hire_date like '____/12/__'

�⵵format (default)
RR : 50~99 : 19~
     00~49 : 20~
�⵵format : yyyy
alter session set nls_date_format = 'yyyy/mm/dd'
     
     
6. �̸��� le �� �� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
--9��
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like '%le%'



7. �̸��� m���� ������ ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
--4��
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like '%m'


8. �̸��� ����° ���ڰ� r�� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
--11��
select first_name, salary, hire_date , department_id
from EMPLOYEES
where first_name like '__r%'



9. Ŀ�̼��� �޴� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.
--35��
select first_name, salary, hire_date , commission_pct
from EMPLOYEES
where commission_pct is not null 


10. Ŀ�̼��� ���� �ʴ� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.
--72��
select first_name, salary, hire_date , commission_pct
from EMPLOYEES
where commission_pct is  null 
11. 2000��뿡 �Ի��ؼ� 30, 50, 80 �� �μ��� ���������鼭, 
�޿��� 5000 �̻� 17000 ���ϸ� �޴� ������ ��ȸ�Ͻÿ�. 
��, Ŀ�̼��� ���� �ʴ� �������� �˻� ��󿡼� ���ܽ�Ű��, 
���� �Ի��� ������ 
���� ��µǾ�� �ϸ� �Ի����� ���� ��� �޿��� ���� ������ ���� ��µǷ� �Ͻÿ�.
--34�� 
select *
 from employees
 where to_char(hire_date,'yyyy') like '2%'
 and department_id in (30, 50, 80)
 and salary between 5000 and 17000
 and commission_pct is not null
order by hire_date , salary desc 

 

