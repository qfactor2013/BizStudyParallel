========================================
		������ �Լ�
========================================

1. �̸��� 'adam' �� ������ �޿��� �Ի����� ��ȸ�Ͻÿ�.

select salary, hire_date
from employees
where first_name = initcap('adam')
 
select salary, hire_date
from employees
where lower(first_name) = 'adam' 
 

2. ���� ���� 'united states of america' �� ������ ���� �ڵ带 ��ȸ�Ͻÿ�.

select  country_id
from countries
where lower(country_name) = 'united states of america'


3. 'Adam�� �Ի����� 2005/11/02 �̰�, �޿��� 7000 �Դϴ�.' �̷� ������ ����
������ ��ȸ�Ͻÿ�.

select first_name || '�� �Ի����� '|| hire_date ||
       ' �̰�, �޿��� '|| salary ||  ' �Դϴ�.' ��������
from employees

4. �̸��� 5���� ������ �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where length(first_name) <= 5 

5. 2006�⵵�� �Ի��� ������ �̸�, �Ի����� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date
from employees
where to_char(hire_date, 'yyyy') = '2006'

select first_name, salary, hire_date
from employees
where hire_date between '2006-01-01' and '2006-12-31'

6. 15�� �̻� ��� �ټ��� �������� �̸�, �Ի���, �޿�, �ٹ������� ��ȸ�Ͻÿ�.
select first_name, salary, hire_date,
      months_between(sysdate,hire_date)/12
from employees
where months_between(sysdate,hire_date)/12 >= 15








