--�׷� �Լ�
--������ �Լ�

--length ���ڿ��� ����
select first_name, length(first_name) 
from employees

select count(*) null���԰Ǽ�, count(employee_id) ������, count(department_id) ������,
		sum(salary) �հ�, avg(salary) ���, sum(salary)/count(salary) ���2,
		max(salary) �ִ�޿�, min(salary) �ּұ޿�,
		max(first_name) ���ĺ����������, min(first_name) ���ĺ�ù��°���, 
		max(hire_date) �ֱٳ�¥, min(hire_date) �����ȳ�¥
from EMPLOYEES


--�������Լ�
--select���� group�Լ�(�����Լ�)�� ������ ���� Į���� 
--�ݵ�� group by �� ����� �Ѵ�.
select department_id,
		count(*) null���԰Ǽ�, count(employee_id) ������, count(department_id) ������,
		sum(salary) �հ�, avg(salary) ���, sum(salary)/count(salary) ���2,
		max(salary) �ִ�޿�, min(salary) �ּұ޿�,
		max(first_name) ���ĺ����������, min(first_name) ���ĺ�ù��°���, 
		max(hire_date) �ֱٳ�¥, min(hire_date) �����ȳ�¥
from EMPLOYEES
group by DEPARTMENT_id
having count(*) > 1		-- �׷쿡 ������ �ɾ���
order by null���԰Ǽ�				-- group by�� having�̶� ������ �ٲ��� �ȴ�.(count(*)�� ���İ���!)

--�ؼ�����
--from -> where -> group by > having > select  > order by
--�ۼ�����1 : select > from > where > group by > having > order by
--�ۼ�����2����) : select > from > where > having by  >b>olrder



select department_id, job_id, count(*)
from EMPLOYEES
group by department_id, job.id 
order by 1

							-- �÷� �̸��� �ָ� NULL�� ����
select count(distinct job_id), count(job_id), count(distinct department_id)
from EMPLOYEES