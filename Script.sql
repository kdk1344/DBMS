-- �ּ� : ��ǻ�Ͱ� �ؼ����� �ʴ´�
-- ������ �޾��ִ� �ּ�
/*
 * �����ٿ�
 * ���ļ�
 * �ּ�ó��
 * 
 */



SELECT fiRSt_Name 
FROM employees;

-- �������� �÷��� ���ÿ� ��ȸ�ϱ�
SELECT first_name, last_name
FROM employees;

-- * : ���(all)
SELECT * 
FROM employees;

-- ��� �̸�, ��� ��, ������ ����϶�
SELECT first_name, last_name, salary
FROM employees;

-- ORDER BY : ����
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary DESC; -- salary �÷��� �������� �������� ����

SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary ASC; -- salary �÷��� �������� �������� ����

SELECT first_name, last_name, salary 
FROM employees 
ORDER BY first_name;-- ASC �� ������ �����ϴ�
--���� �������� ��쿡�� ���ĺ� ������ ���� ������ �ȴ�

SELECT first_name, last_name, hire_date
FROM employees 
ORDER BY hire_date;-- ��¥ �������� ��쿡�� �ð� ������ ���� ������ �ȴ�

-- ORDER BY ���� �������� �÷��� �������� ���
-- ���� �÷����� ������ ����ǰ�, �ڿ� �÷��� ������ ����ȴ�
SELECT first_name, 
	last_name, 
	hire_date,
	salary 
FROM employees 
ORDER BY salary ASC, hire_date DESC;
-- �� ������ ������ �Ǵ� �÷��� ����� �ʿ�� ����
SELECT first_name, last_name 
FROM employees 
ORDER BY salary;

-- DISTINCT : �ߺ��� ���� �����Ͽ� ����� �� ����Ѵ�
SELECT DISTINCT salary
FROM employees
ORDER BY salary;

-- DISTINCT �� ���� �÷��� �������� ��� �ش� �÷����� ���������� ����Ͽ� �����Ѵ�
SELECT DISTINCT job_id, hire_date 
FROM employees;

-- �÷��̸��� ��Ī(alias) �����ϱ�
SELECT first_name "�̸�", -- AS �� ������ �����ϴ�
	last_name AS ��, -- �ֵ���ǥ�� ������ �����ϴ�
	employee_id AS "��� ��ȣ",-- ���Ⱑ ���� ��� �ֵ���ǥ ���� �Ұ���
	salary ���� -- AS �� �ֵ���ǥ ��� ���� ����
FROM employees;
-- ��Ī�� ������ ��� ��Ī �̸����� ������ �� �� �ִ�
SELECT salary ����
FROM employees 
ORDER BY ����;

----------------------------------------
--������
-- ���Ῥ���� || 
SELECT first_name �̸�, last_name ��, first_name || last_name ����
FROM employees
ORDER BY ����;

-- ���� || ���� --> ����� ����
SELECT first_name || salary 
FROM employees;

-- ���� || ���� --> ����� ����
SELECT salary || employee_id 
FROM employees;

-- ��¥ || ���� --> ����� ����
SELECT hire_date || salary 
FROM employees;

-- ���� ������ ��� ���� �˷��ֱ� ���ؼ� ���� ����ǥ�� �����ش�
-- ��������ǥ�� ������������ ����Ÿ���� ���̶�� �ǹ�
SELECT first_name || '��'
FROM employees;

-- dual ���̺� : ���� Ȯ���� �� ����ϴ� ���̺�
-- �ٸ� ���̺��� ������ �ʿ䰡 ���� �� ����Ѵ�
SELECT '�ȳ�' || '�ϼ���'
FROM dual;

SELECT first_name || ' ' || last_name ����
FROM employees;

-- �̸��� ���� ����� ������ �÷��� �����̶�� ��Ī����,
-- ��� �̸��� �ּҴ� �̸���@koreait.com ����, �̸��� �ּ� ��� ��Ī�� �־� ����϶�
SELECT first_name || ' ' || last_name ����,
	email || '@koreait.com' "�̸��� �ּ�"
FROM employees;

--���������
SELECT salary,
	salary + 10,
	salary - 10,
	salary * 10,
	salary / 3
FROM employees;

-- ����Ÿ�� �����Ϳ����� ��� �Ұ���
-- ��¥ +- ���� : �ش� ��¥���� �ϼ���ŭ �������ų� ������
SELECT hire_date, 
	hire_date + 10,
	hire_date - 10,
	hire_date + 1/24/60 -- �� �� �ʴ� �Ϸ� ȯ���Ͽ� ���ش�
FROM employees;
-- * / ��� �Ұ�

-- sysdate : �ý��ۻ��� ���� �ð��� ��Ÿ���� ��ɾ�
SELECT sysdate 
FROM dual;

-- ��¥ - ��¥ --> ����, �ϼ�
SELECT sysdate,
	hire_date,
	sysdate - hire_date 
FROM employees;

-- ������� �Ի��� �� 100�� �ڿ��� ���� ���޿��� 10% �λ��� ���ʽ��� �ش�
-- �̶� ������� ����, ��������, ���ʽ� ����, ���ʽ����� �������� 
-- ���ʽ� ������ ���� �������� ����϶�
SELECT first_name || ' ' || last_name ����,
	salary ��������,
	salary * 1.1 "���ʽ� ����",
	hire_date + 100 "���ʽ����� ������"
FROM employees;

SELECT first_name, salary 
FROM employees 
ORDER BY salary DESC;

