
hr/hr
========================================
		SELECT �⺻
========================================

1. �޿��� 15000 �̻��� �������� �̸�, �޿�, �μ�id�� ��ȸ�Ͻÿ�.

SELECT DEPARTMENT_ID �μ�ID, FIRST_NAME||' '||LAST_NAME �����̸�, SALARY �޿� 
FROM EMPLOYEES WHERE SALARY >= 15000

2. ���� �߿��� ������ 170000 �̻��� �������� �̸�, ������ ��ȸ�Ͻÿ�.
   ������ �޿�(salary)�� 12�� ���� ���Դϴ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		(SALARY*12) AS "����"
FROM EMPLOYEES WHERE (SALARY*12) >= 170000

3. ���� �߿��� �μ�id�� ���� ������ �̸��� �޿��� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�"
FROM EMPLOYEES WHERE DEPARTMENT_ID IS NULL


4. 2004�� ������ �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�",
		HIRE_DATE AS "�Ի���",
FROM EMPLOYEES WHERE SUBSTR(HIRE_DATE, 0, 4) <= '2004' -- ������ �����ϴ°ſ��� ��ݰ� ����!

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�",
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES WHERE HIRE_DATE < '2004.01.01'



-- �������� -- 
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID
FROM EMPLOYEES WHERE DEPARTMENT_ID IN ('80','50') 
AND SALARY >= 13000

2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 20000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 0, 2) >= '05'
AND SALARY BETWEEN 1300 AND 20000


-- SQL �񱳿����� --
1. 80, 50 �� �μ��� ���������鼭 �޿��� 13000 �̻��� ������ �̸�, �޿�, �μ�id
�� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID" 
FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ('80', '50')
AND SALARY >= 13000


2. 2005�� ���Ŀ� �Ի��� ������ �߿��� �޿��� 1300 �̻� 30000 ������ �������� 
�̸�, �޿�, �μ�id, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 0, 2) >= '05'
AND SALARY BETWEEN 1300 AND 20000


3. 2005�⵵ �Ի��� ������ ������ ����Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES
WHERE SUBSTR(HIRE_DATE, 0, 2) = '05'

4. �̸��� D�� �����ϴ� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE 'D%'


5. 12���� �Ի��� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES 
WHERE SUBSTR(HIRE_DATE, 4, 2) = '12'



6. �̸��� le �� �� ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES 
WHERE FIRST_NAME LIKE '%le%' OR LAST_NAME LIKE '%le%'


7. �̸��� m���� ������ ������ �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES 
WHERE LAST_NAME LIKE '%m'



8. �̸��� ����° ���ڰ� r�� �̸�, �޿�, �Ի����� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		DEPARTMENT_ID AS "�μ�ID", 
		HIRE_DATE AS "�Ի���"
FROM EMPLOYEES 
WHERE first_name LIKE '__r%'



9. Ŀ�̼��� �޴� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		COMMISSION_PCT AS "Ŀ�̼�"
FROM EMPLOYEES 
WHERE commission_pct is not null


10. Ŀ�̼��� ���� �ʴ� ������ �̸�, Ŀ�̼�, �޿��� ��ȸ�Ͻÿ�.

SELECT FIRST_NAME||' '||LAST_NAME AS "�����̸�",
		SALARY AS "�޿�", 
		COMMISSION_PCT AS "Ŀ�̼�"
FROM EMPLOYEES 
WHERE commission_pct is null


11. 2000��뿡 �Ի��ؼ� 30, 50, 80 �� �μ��� ���������鼭, 
�޿��� 5000 �̻� 17000 ���ϸ� �޴� ������ ��ȸ�Ͻÿ�. 
��, Ŀ�̼��� ���� �ʴ� �������� �˻� ��󿡼� ���ܽ�Ű��, ���� �Ի��� ������ 
���� ��µǾ�� �ϸ� �Ի����� ���� ��� �޿��� ���� ������ ���� ��µǷ� �Ͻÿ�.


SELECT * FROM EMPLOYEES
WHERE DEPARTMENT_ID IN ('30', '50', '80')
AND SUBSTR(HIRE_DATE, 0, 2) >= '00'
AND SALARY BETWEEN 5000 AND 17000
AND COMMISSION_PCT IS NOT NULL
ORDER BY HIRE_DATE ASC , SALARY DESC

-- ������ �� 2�ڸ��� �˻��Ǵ°�?
-- RR �������� �Ǿ��־ �׷���!
-- �⵵ FORMAT
-- RR : 50~99 	: 	19~
--		00~49	:	20~

 ALTER SESSION SET NLS_DATE_FORMAT = 'YYYY/MM/DD'

