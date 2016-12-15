select * from EMPLOYEES;

desc employees;


select employee_id, first_name from employees


select 	employee_id "��� ��ȣ", first_name, 
		salary �޿�, salary*0.1 as "�޿�10%"     -- 3. �ش��ϴ� ���� �����´�.
		from "EMPLOYEES"        	  -- 1. ���� ���̺��� �����ͼ�
		where salary >= 5000		  -- 2. ������ �ѹ� ����
		and "FIRST_NAME" = 'Alexander'  -- ���� ã�� �������� �ݵ�� Ȭ����ǥ(single quotation)�� �ؾ��Ѵ�.
		"Alexander"   -- ������ �ٸ�!!
		--ORA-00904: "�޿�": invalid identifier  �ĺ��ڰ� �ùٸ��� �ʴ´�.		
		-- �ֵ���ǥ(double quotation)�� �ϰ� �Ǹ� ��ҹ��ڱ��� ��ġ�ϴ� ��Ȯ�� �˻��� �ϰ� �ȴ�.
			--��(literal) : ''(single quotation)
			--�ĺ���(identifier) : Į���̸�, "�빮��", �ҹ���
			--���������, �񱳿�����, �� ������ ����
-- Alias(����) : as  ������ �������� , �� �����ϸ� ���ڸ� �־�ߵȴ�.(Ư������X) ""�� ���θ� ��

		
		SELECT EMPLOYEE_ID, FIRST_NAME,
				SALARY, COMMISSION_PCT, SALARY+SALARY*COMMISSION_PCT Ŀ�̼��߰�
		FROM EMPLOYEES					-- SALARY�� �������� �ұ��ϰ� PCT�� NULL�̶� Ŀ�̼��߰��� NULL��
		
		SELECT EMPLOYEE_ID, FIRST_NAME,
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) Ŀ�̼��߰�
		FROM EMPLOYEES					-- NVL() �Լ��� �� ó���� ��(NULL�̸� 0)
		
		SELECT EMPLOYEE_ID, FIRST_NAME,
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) Ŀ�̼��߰�
		FROM EMPLOYEES	
		WHERE COMMISSION_PCT IS NOT NULL  -- NULL�� �ƴ� �͸� ã�´�.
		
		-- ���ڿ� ����
		SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME, -- ||�����ڴ� ����Ŭ��, SYBASE�� +  
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) Ŀ�̼��߰�
		FROM EMPLOYEES	
		WHERE COMMISSION_PCT IS NOT NULL
		
		-- CONCAT() �Լ��� �ִ�.
		SELECT EMPLOYEE_ID, FIRST_NAME||' '||LAST_NAME,
				CONCAT(	CONCAT(FIRST_NAME, ' '), LAST_NAME), -- CONCAT()�� ���ڰ� 2���ۿ� �ȵǼ�...
				SALARY, COMMISSION_PCT, SALARY+SALARY*NVL(COMMISSION_PCT,0) Ŀ�̼��߰�
		FROM EMPLOYEES	
		WHERE COMMISSION_PCT IS NOT NULL
		
		-- DISTINCT �ߺ��� �����ϴ� �����(�÷��� �߰��ϸ� �߰��� �÷����� �����Ͽ� �ߺ�üũ)
		SELECT DISTINCT DEPARTMENT_ID, FIRST_NAME, LAST_NAME
		FROM EMPLOYEES
		ORDER BY 1,2,3 --������������, �÷����� �ᵵ �ǰ� ���ڷ� ���� SELECT ���� ��õ� ���� ������ ����
		WHERE DEPARTMENT_ID IS NOT NULL
		
		--��¥�� �ݵ�� ����ǥ�� ���ξ� �Ѵ�.
		SELECT * FROM EMPLOYEES WHERE HIRE_DATE >= '2006.01.01' -- 2006-01-01, 2006/01/01
		
		--�������� : NOT > AND > OR �� �켱����
		--�켱������ ()�� �����Ѵ�.
		SELECT * FROM EMPLOYEES 
		WHERE HIRE_DATE >= '2006.01.01'
		AND (SALARY >= 6000 OR DEPARTMENT_ID = 80)
		
		SELECT * FROM EMP WHERE COMM >= 300 AND COMM <= 1000
		SELECT * FROM EMP WHERE COMM BETWEEN 300 AND 1000 -- ū ���� ���� ���� �� ����.
		
		SELECT * FROM EMP WHERE COMM = 300 OR COMM = 500 OR COMM = 1400
		SELECT * FROM EMP WHERE COMM IN (300, 500, 1400)
		-- substr, 1��° ���ں��� 1��° ���ڱ��� �ڸ�
		SELECT * FROM EMP WHERE SUBSTR(ENAME,1,1) = 'M'
		
		select * from employees where first_name like 'L%' -- L�ڿ� 0�ڸ� �̻��� �ƹ� ���ڳ� ����
		select * from employees where first_name like 'L___' -- �ڸ��� ����, L___ �� 4�ڸ�
		select * from employees where first_name like '%is%' -- �߾ӿ� is��� �ܾ ���� first_name�� ã��
		
		-- order by �� 
		SELECT EMPLOYEE_ID ������ȣ, FIRST_NAME, SALARY	 --3.
		FROM EMPLOYEES				-- 1. 
		WHERE DEPARTMENT_ID = 80	-- 2.
		ORDER BY ������ȣ desc		-- 4. default asc(��������), desc(��������)
		
		SELECT EMPLOYEE_ID ������ȣ, FIRST_NAME, SALARY	�޿� --3.
		FROM EMPLOYEES				-- 1. 
		WHERE DEPARTMENT_ID = 80	-- 2.
		ORDER BY 3 desc, �޿� asc	--4.
		
		
		SELECT * FROM tab
		
		