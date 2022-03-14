-- Ÿ�Ժ�ȯ �Լ�
-- TO_CHAR()
-- ���� --> ����
-- TO_CHAR(����) : ���ڸ� ����Ÿ������ �ٲ��ش�
SELECT TO_CHAR(9454663.248)
FROM dual;

-- TO_CHAR(����, '��������')
-- 9: �ڸ���
-- 0: ������� 0���� ä���
-- $: $��ȣ
-- L: ���� ȭ�� ��ȣ
-- .: ������ġ�� �Ҽ��� ����
-- ,: ���� ��ġ�� ��ǥ ����
SELECT TO_CHAR(123, 'L099,999,999,999.999') 
FROM dual;

--SELECT TO_CHAR(12345, '999') 
--FROM dual;

-- ��� �ӱ��� �� 5�ڸ�, �޸��� ���� ���Ŀ� �˸°� �ο��Ͽ� 
-- �������� ��ȭǥ�ø� �ٿ� ����Ÿ������ ����϶�
SELECT TO_CHAR(salary, '99,999L')
FROM employees;

--��¥ --> ����
-- TO_CHAR(��¥) --> '���/����/����'
SELECT TO_CHAR(sysdate)
FROM dual;

-- TO_CHAR(��¥, '��������')
-- Y : ��
-- M : ��
-- D : ��
-- DAY : ����
-- AM / PM : ��������
-- HH : �ð�(12�ð� ����)
-- HH24 : �ð�(24�ð� ����)
-- MI : ��
-- SS : ��
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD') 
FROM dual;

SELECT TO_CHAR(sysdate, 'YYMMDD'),
	TO_CHAR(sysdate, 'YYYY/MM.DD DAY PM HH24:MI:SS'),
	TO_CHAR(sysdate, 'YYYY"��"MM"��"DD"��"') -- Ư�����ڰ� �ƴ� ���ڸ� ����� ����
										--���������� �ƴ϶��� �ֵ���ǥ�� ���� �˷��ش�
FROM dual;

-- ������ 2022/02��23�� ������ 19�� 45��
-- ����ϱ�
SELECT TO_CHAR(sysdate, '"������" YYYY/MM"��"DD"��" DAY HH24"��" MI"��"') 
FROM dual;

-- ��� �� 2005�� 9�� 28�Ͽ� �Ի��� ����� ��� �÷� ����ϱ�
SELECT *
FROM employees 
WHERE TO_CHAR(hire_date, 'YYYY"��" MM"��" DD"��"') = '2005�� 09�� 28��';

-- ���� --> ��¥
--TO_DATE(����, '��������')
SELECT TO_DATE('051115', 'YYMMDD') 
FROM dual;

-- ���� --> ����
--TO_NUMBER(����) , ���ڸ���� ���ڰ� �ƴ� ��쿡�� ���� �߻�
SELECT TO_NUMBER('150')
FROM dual;
-----------------------------------------------------------------
SELECT first_name, manager_id
FROM employees;

-- NVL(�÷�, ��): �ش� �÷��� NULL���� ������ �ٲٴ� �Լ� 
SELECT first_name, manager_id,
	NVL(manager_id, 100)
FROM employees;

-- NULL���� ���꿡 ���� ��� ��� ����� NULL������ ���´�
SELECT salary + salary * commission_pct
FROM employees;

-- ��� ������ Ŀ�̼��� ���Կ��� salary �� ����Ͽ���
SELECT salary,
	NVL(commission_pct, 0),
	salary + salary * NVL(commission_pct, 0)
FROM employees;

-- DECODE(�÷�, ���ǰ�, ���������϶���, �����̰����϶���) : ���ǳ�ó��
SELECT salary, 
	DECODE(salary, 10000, 0, 20000),
	DECODE(salary, 10000, 11000, salary) 
FROM employees;

-- �μ�id�� 10�� ������� ������ �� �ؼ� ���� salary�� 10% �λ��� �Ϸ� �Ѵ�
-- ��� ������ �ް� �� salary�� ����϶�
SELECT salary �⺻�޿�, department_id,
	DECODE(department_id, 10, salary*1.1, salary)
FROM employees 
ORDER BY department_id;

SELECT salary �⺻�޿�, department_id �μ�,
	DECODE(department_id, 50, salary * 1.1, DECODE(department_id, 80, salary*0.9,salary)) �����޿�
FROM employees
ORDER BY department_id;

-- DECODE() �ؼ� ����: ���� DECODE ���Ǻ��� �ؼ��Ѵ�
SELECT department_id,
	DECODE(department_id, 50, 'check1', DECODE(department_id,50,'check2','check3')) 
FROM employees
ORDER BY department_id;

-- CASE ǥ����
-- Ư�� ���ǿ� �ִ� ���� ���� Ư���� ������ ������ �� ����� �� �ִ�
-- �μ��� 50�� 1.1��, 80 : 0.9��, �������� ���� ���ɾ�
SELECT department_id, 
	salary, 
	CASE department_id -- �÷��� ���� ������ ���ϴ� ��쿡�� �÷��� �տ� ���� �� �ִ�
		WHEN 50 THEN salary *1.1  -- department_id = 50
		WHEN 80 THEN salary * 0.9 -- department_id = 80
		ELSE salary 
	END �����޿�,
	CASE 
		WHEN department_id = 50 THEN '�λ��'
		WHEN department_id = 80 THEN '�����'
		ELSE '����'
	END ���
FROM employees 
ORDER BY department_id;
	
-- employee_id<=110 �� ����� salary 0.9��
-- 110 < employee_id <= 120 �� ����� salary 1.1��
-- ������ �� ����� salary�� �޴´�
SELECT employee_id, salary,
	ROUND(CASE 
		WHEN employee_id <= 110 THEN salary * 0.9
		WHEN /*employee_id > 110 AND */employee_id <= 120 THEN salary * 1.1
		ELSE salary 
	END) �����޿�
FROM employees
ORDER BY employee_id;

SELECT department_id, salary,
	CASE 
		WHEN department_id = 50 OR department_id = 70 THEN salary * 0.9
		ELSE salary 
	END 
FROM employees
ORDER BY department_id;
---------------------------------------------------------
-- ������ �Լ� 
-- �����Լ�
-- RANK() : ������ �ޱ�� �ߺ��Ǵ� ���� �ִ� ��� �ǳʶ��
-- DENSE_RANK() : ������ �ޱ�� �ߺ��Ǵ� ���� �־ �ǳʶ��� �ʴ´�
-- ROW_NUMBER() : ������ �ޱ�� �ߺ��Ǵ� ���� ���� �ޱ��(���ȣ�� �ޱ��)
SELECT salary, first_name, 
	RANK() OVER(ORDER BY salary DESC) r,
	DENSE_RANK() OVER(ORDER BY salary DESC) dr,
	ROW_NUMBER() OVER(ORDER BY salary DESC) rn
FROM employees
ORDER BY employee_id;

-- ������ �Լ��� ���� �ڸ��� ����� �� ����
--SELECT first_name, salary,
--	RANK() OVER(ORDER BY salary DESC)
--FROM employees 
--WHERE RANK() OVER(ORDER BY salary DESC) <= 10;

-- �׷캰�� ��� ������ �ľ��ϰ� ���� ���� partition by�� Ȱ���Ѵ�
SELECT first_name, department_id, salary,
	RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) r,
	DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) dr,
	ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) rn
FROM employees;


