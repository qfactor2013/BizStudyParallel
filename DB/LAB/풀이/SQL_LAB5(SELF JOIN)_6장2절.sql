-- SELF JOIN
1. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.

select emp.first_name||emp.last_name,  m.first_name 
from employees emp, employees m
where emp.manager_id = m.employee_id 
order by 1

2. ������ �̸��� ������ �̸��� ��ȸ�Ͻÿ�.
�����ڰ� ���� ���������� ��� ����Ͻÿ�.
 select emp.first_name||emp.last_name,  
             nvl(m.first_name , '����') �������̸�
from employees emp, employees m
where emp.manager_id = m.employee_id(+) 
order by 1


3. ������ �̸��� �����ڰ� �����ϴ� ������ ���� ��ȸ�Ͻÿ�.
��, ������������ 3�� �̻��� �����ڸ� ��µǵ��� �Ͻÿ�.
  select  substr(m.first_name,1,5) �������̸�, count(*) ������ 
from employees emp, employees m
where emp.manager_id = m.employee_id 
group by  m.first_name 
having count(*) >= 3
order by 1


