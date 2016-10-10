========================================
		������ �Լ�
========================================

1. �̸��� 'adam' �� ������ �޿��� �Ի����� ��ȸ�Ͻÿ�.

select first_name||' '||last_name, salary, hire_date from employees where LOWER(first_name) = 'adam'

select first_name||' '||last_name, salary, hire_date from employees where first_name = initcap('adam')

2. ���� ���� 'united states of america' �� ������ ���� �ڵ带 ��ȸ�Ͻÿ�.

select country_id from countries where LOWER(country_name) = 'united states of america'

3. 'Adam�� �Ի����� 2005/11/02 �̰�, �޿��� 7000 �Դϴ�.' �̷� ������ ����
������ ��ȸ�Ͻÿ�.

select initcap(first_name)||' �� �Ի����� '|| TO_CHAR(hire_date, 'yyyy/mm/dd') 
		|| '�̰�, �޿��� ' || salary || ' �Դϴ�.' ���
from employees
where lower(first_name) = 'adam'


4. �̸��� 5���� ������ �������� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

select first_name||' '||last_name, salary, hire_date from employees where length(first_name) < 6 


5. 2006�⵵�� �Ի��� ������ �̸�, �Ի����� ��ȸ�Ͻÿ�.

select first_name||' '||last_name, hire_date from employees where SUBSTR(HIRE_DATE, 1, 2) = '06'

--�ε����� �ɷ������� ���������ϴ°��� �� ����.

select first_name||' '||last_name, hire_date from employees where hire_date between '2006-01-01' and '2006-12-31'

6. 15�� �̻� ��� �ټ��� �������� �̸�, �Ի���, �޿�, �ٹ������� ��ȸ�Ͻÿ�.

select first_name||' '||last_name, hire_date, SALARY 
from employees where (FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12)) >= 15



7. �� �μ��� �ο����� ��ȸ�ϵ� �ο����� 5�� �̻��� �μ��� ��µǵ��� �Ͻÿ�.






8. �� �μ��� �ִ�޿��� �ּұ޿��� ��ȸ�Ͻÿ�.
   ��, �ִ�޿��� �ּұ޿��� ���� �μ��� ������ �Ѹ��� ���ɼ��� ���⶧���� 
   ��ȸ������� ���ܽ�Ų��.




   
9. �μ��� 50, 80, 110 ���� ������ �߿��� �޿��� 5000 �̻� 24000 ���ϸ� �޴�
   �������� ������� �μ��� ��� �޿��� ��ȸ�Ͻÿ�.
   ��, ��ձ޿��� 8000 �̻��� �μ��� ��µǾ�� �ϸ�, ��°���� ��ձ޿��� ����
   �μ����� ��µǵ��� �ؾ� �Ѵ�.






