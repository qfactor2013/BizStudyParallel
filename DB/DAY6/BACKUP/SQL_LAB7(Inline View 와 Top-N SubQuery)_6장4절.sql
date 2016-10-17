==========================================
	Inline View �� Top-N SubQuery
==========================================

1. �޿��� ���� ���� �޴� ���� 5���� ���� ������ ��ȸ�Ͻÿ�.

select *
from (
		select first_name, salary
		from employees
		order by salary desc )
where rownum <=5 		


2. Ŀ�̼��� ���� ���� �޴� ���� 3���� ���� ������ ��ȸ�Ͻÿ�.

select * 
from (  
		select first_name, commission_pct
		from employees
		where commission_pct is not null
		order by 2 desc  )
where rownum <=3 		


select first_name, commission_pct
from employees
order by 2 desc nulls  last 


--group by, having 
3. ���� �Ի��� ���� ��ȸ�ϵ�, �Ի��� ���� 5�� �̻��� ���� ����Ͻÿ�.

select to_char(hire_date,'mm') ��, count(*) �Ի��ڼ� 
from employees
group by to_char(hire_date,'mm')
having count(*) >=5
order by 1
4. �⵵�� �Ի��� ���� ��ȸ�Ͻÿ�. 
��, �Ի��ڼ��� ���� �⵵���� ��µǵ��� �մϴ�.
select to_char(hire_date,'yyyy') �⵵, count(*) �Ի��ڼ� 
from employees
group by to_char(hire_date,'yyyy')
order by 2 desc 
---------------------------------
--�μ���  ���޺� ������ �޿��հ�

--�μ��� �߰�
select department_id,job_id, sum(salary) �޿��հ�
from employees
group by rollup(department_id,job_id)
order by 1,2

--�������
select department_id,job_id, sum(salary) �޿��հ�
from employees
group by cube(department_id,job_id)
order by 1,2



