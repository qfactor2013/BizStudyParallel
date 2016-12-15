--�׷��Լ�

--�������Լ�
select first_name, length(first_name) �̸����� 
from employees
--�������Լ�
select  count(*) null���԰Ǽ� ,
        count(employee_id) ������,
        count(department_id) ������2,
        sum(salary) �հ�,
        avg(salary) ���,
        sum(salary)/count(salary) ���2,
        max(salary) �ִ�޿�,
        min(salary) �ּұ޿�,
        max(first_name) ���ĺ����������,
        min(first_name) ù��°���,
        max(HIRE_DATE) �ֱٻ��,
        min(HIRE_DATE) ����
from employees

--select���� group�Լ�(�����Լ�)�� ���������� Į����
--�ݵ�� group by���� �����Ѵ�.
select  department_id, count(*) null���԰Ǽ� ,
        count(employee_id) ������,
        count(department_id) ������2,
        sum(salary) �հ�,
        avg(salary) ���,
        sum(salary)/count(salary) ���2,
        max(salary) �ִ�޿�,
        min(salary) �ּұ޿�,
        max(first_name) ���ĺ����������,
        min(first_name) ù��°���,
        max(HIRE_DATE) �ֱٻ��,
        min(HIRE_DATE) ����
from employees
where salary > 0 
group by department_id
having count(*) > 1 
order by  2 desc

--having�� group by�� ������ 
--�ۼ�����2(����): select>from>where>having>group by>order by
--�ۼ�����1(�Ϲ���): select>from>where>group by>having>order by
--�ؼ�����: from>where>group by>having>select>order by 

select department_id, job_id, count(*)
from employees
group by department_id, job_id
order by 1

select count(distinct job_id), count(job_id),
       count(distinct department_id), count(department_id)
from employees

select distinct department_id
from employees


-----------------------------------------------
7. �� �μ��� �ο����� ��ȸ�ϵ� �ο����� 5�� �̻��� �μ��� ��µǵ��� �Ͻÿ�.
select department_id, count(*) 
from  employees 
group by department_id
having count(*) >= 5 
order by 2 desc


8. �� �μ��� �ִ�޿��� �ּұ޿��� ��ȸ�Ͻÿ�.
   ��, �ִ�޿��� �ּұ޿��� ���� �μ��� ������ �Ѹ��� ���ɼ��� ���⶧���� 
   ��ȸ������� ���ܽ�Ų��.
 
   select department_id, 
          max(salary) �ִ�޿�,min(salary) �ּұ޿�,
           count(*)
   from employees
   group by department_id
   having  max(salary)<>min(salary)
   order by 1
   
   
9. �μ��� 50, 80, 110 ���� ������ �߿��� 
�޿��� 5000 �̻� 24000 ���ϸ� �޴�
   �������� ������� �μ��� ��� �޿��� ��ȸ�Ͻÿ�.
   ��, ��ձ޿��� 8000 �̻��� �μ��� ��µǾ�� �ϸ�, 
   ��°���� ��ձ޿��� ����
   �μ����� ��µǵ��� �ؾ� �Ѵ�.
select department_id, avg(salary) ��ձ޿� 
from employees 
where department_id in (50, 80, 110)
and salary between 5000 and 24000
group by department_id
having avg(salary) >= 8000
order by ��ձ޿� desc

   


