SQL �ֿ� �Լ�

���ó�¥�� �ð� -> 	ORACLE : SYSDATE, 
					SYBASE : GETDATE()
					
SELECT SYSDATE FROM EMPLOYEES -- �̷��� �ϸ� �������� �ε�ð��� �����ϱ�....
SELECT SYSDATE FROM DUAL	  -- DUAL ���̺��� �ִ�.

SELECT ABS(10-20), ROUND(2.6), CEIL(2.4), FLOOR(2.6), SIGN(100-50) FROM DUAL
--		���밪		�ݿø�		�ø�		����		��/��������

SELECT ROUND(34.5678,2), ROUND(1234.5678, -2) FROM DUAL
--		�Ҽ���2�ڸ�������,    10������ �ݿø�

SELECT MOD(10,3) FROM DUAL
--	���� ������

SELECT 	FIRST_NAME,
		INITCAP(EMAIL), 	--ù���ڸ� �빮�� 
		UPPER(FIRST_NAME) �빮��, 
		LOWER(FIRST_NAME) �ҹ���,
		SUBSTR(EMAIL,1,3) AS "ó��3���ڸ�������",
		LENGTH(EMAIL) AS "�ڸ���"		 -- ���ڰ����� ����
		,INSTR(EMAIL, 'A') AS "Ư��������ġã��"
		,LPAD(FIRST_NAME, 10, '*') AS "����ä���"
		,RPAD(FIRST_NAME, 10, '*') AS "������ä���"
		,LTRIM(FIRST_NAME, 'A') AS "�����ڸ���"
		,RTRIM(FIRST_NAME, 'n') AS "�������ڸ���"
		,TRIM('a' from 'aaaaORACLEaaaaa') AS "�����ڸ���"
		FROM EMPLOYEES

--��¥�Լ�

		SELECT SYSDATE ����, HIRE_DATE �Ի���, MONTHS_BETWEEN(SYSDATE, HIRE_DATE) �Ի簳����,
				FLOOR(MONTHS_BETWEEN(SYSDATE, HIRE_DATE)/12) ���Ի���,
				(SYSDATE - HIRE_DATE) �Ի��ϼ�,
				NEXT_DAY(SYSDATE, '�Ͽ���') �����Ͽ���,
				TO_CHAR(HIRE_DATE,'yyyy/MM/dd hh:mi:ss DAY') �Ի����ǿ���,
				LAST_DAY(HIRE_DATE) �ش���Ǹ���
				FROM EMPLOYEES	
				
-- ��ȯ�Լ�
-- TO_CHAR Ÿ���� CHAR(����)�� �ٲ�
		SELECT 	HIRE_DATE, 
				TO_CHAR(HIRE_DATE, 'YYYY') �⵵,
				TO_CHAR(HIRE_DATE, 'RR') �⵵2�ڸ�,
				TO_CHAR(HIRE_DATE, 'MM') ��,
				TO_CHAR(HIRE_DATE, 'mon') ��2,
				TO_CHAR(HIRE_DATE, 'dd') ��,
				TO_CHAR(HIRE_DATE, 'DAY') ����,
				TO_CHAR(HIRE_DATE, 'DY') ����2,
				TO_CHAR(HIRE_DATE, 'YYYY/MM/DD HH24:MI:SS') �����Ͻú���
		FROM EMPLOYEES
		
-- ���ڰ� ���ڷ�

		SELECT FIRST_NAME , SALARY, TO_CHAR(SALARY, 'L999,999') -- L���̸� �� ǥ��
		FROM EMPLOYEES
		
-- ���ڸ� ��¥��
				
		SELECT * FROM EMPLOYEES
		WHERE HIRE_DATE < '2016-10-10' -- ����������ȯ�� �Ǿ� �񱳴� ����(������ �ȵ�)
		
		SELECT * FROM EMPLOYEES
		WHERE HIRE_DATE < TO_DATE('2016-10-10', 'yyyy-mm-dd') -- ��������ȯ(���������ȯ)
		
		SELECT * FROM EMPLOYEES
		WHERE SALARY >= TO_NUMBER('10000') -- ��������ȯ
		
--NVL �Լ�
		-- NULL�̸� 2��° ���ڿ� ������ ������ ġȯ�Ѵ�.
		-- NVL2�� �ݴ�� ���� �ƴϸ� 2��° ���ڰ�, ���̸� 3��° ���ڰ��̴�.(DECODE�� ����)
		SELECT FIRST_NAME, SALARY, COMMISSION_PCT, 
				NVL(COMMISSION_PCT, 0),
				NVL2(COMMISSION_PCT, 'NOT NULL', '�γγ�') NVL2�Լ�,
				NVL(TO_CHAR(DEPARTMENT_ID), '�ܵ��۾�') AS "�μ��ڵ�",
				COALESCE(COMMISSION_PCT, DEPARTMENT_ID, SALARY) NULL�ξƴѰ�ã��
		FROM EMPLOYEES
		WHERE 