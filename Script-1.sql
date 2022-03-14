-- ��üȭ�� ��� : ctrl + m

-- WHERE��
-- salary�� 5000�̻��� ������� first_name, last_name ������ ��ȸ�ϱ�
SELECT first_name, last_name, salary--3 first_name, last_name, salary�� �ش��ϴ� ���� ��ȸ�ϰڴ�
FROM employees 						--1 employees ���̺���
WHERE salary >= 5000;				--2 salary�� 5000 �̻��� �ุ ��� ��

-- first_name�� David�� ����� 
-- first_name, last_name, salary�� ����Ͻÿ�
-- ���� �빮�� �ҹ��� ���п� �����ؾ��Ѵ�
SELECT first_name, last_name, salary 
FROM employees 
WHERE first_name = 'David';

-- WHERE ���� ORDER BY ���� ���ÿ� ����ϴ� ���
-- ORDER BY�� WHERE �ڿ� �ۼ��Ѵ�
SELECT first_name, last_name, salary--3 first_name, last_name, salary�÷���
FROM employees 						--1 employees ���̺� ����
WHERE first_name = 'David'			--2 first_name�� 'David'�� �ุ ��� ��
ORDER BY salary DESC;				--4 salary ������������ �����Ͽ� ��ȸ�϶�

-- �巡�� , ctrl + / : �ּ�
--SELECT first_name, salary ����
--FROM employees 
--WHERE ���� >= 5000; --������ �����ϱ� �����̱� ������ ��Ī ���� �Ұ���

--���� first_name�� David�� �ƴ� ��� ���� ��� �÷� ��ȸ�ϱ�
SELECT * 
FROM employees 
WHERE first_name <> 'David';


-- ��������
-- �������� ������ ������ �� ����Ѵ�

-- first_name�� David �̸鼭 ���ÿ� salary�� 5000�̻��� ��� ��
-- first_name, salary�� ����϶�
SELECT first_name, salary 
FROM employees 
WHERE first_name = 'David' 
AND salary >= 5000;

-- first_name�� David�� ��� Ȥ�� salary�� 10000 �̻��� �����
-- first_name�� salary�� ����϶�
SELECT first_name, salary 
FROM employees 
WHERE first_name = 'David' 
OR salary >= 10000
ORDER BY salary;

-- NOT ���� --> �ش� ������ �������� �ʴ� ��쿡��
SELECT first_name, salary 
FROM employees 
WHERE NOT first_name = 'David';

-- ����
-- first_name, last_name, salary �÷��� ���
-- salary 5000 �̻�, 10000 ������ ����� �߿���
SELECT first_name, last_name, salary, salary * 1.1 ���ʽ�
FROM employees 
WHERE salary >= 5000 
AND salary <= 10000
ORDER BY salary;


-- first_name�� Julia Ȥ�� David Ȥ�� Alexis �� ������� 
-- first_name, salary
SELECT first_name, salary 
FROM employees 
WHERE first_name = 'Julia' 
OR first_name = 'David' 
OR first_name = 'Alexis';

-- SQL������
--BETWEEN a AND b : a �̻� b������ ����
--salary�� 5000�̻� 10000������ �����
SELECT first_name, salary 
FROM employees 
WHERE salary BETWEEN 5000 AND 10000
ORDER BY salary;


-- �̸��� �ٸ��� ���̺�� �˷��ý��� ����� �߿��� 5000�̻� 10000������ �����
SELECT first_name, salary 
FROM employees 
WHERE (first_name = 'Julia' OR first_name = 'David' OR first_name = 'Alexis') 
AND salary BETWEEN 5000 AND 10000;

--IN (��, ��, ��,...) : ���� �� �ϳ��� ����
SELECT first_name, salary 
FROM employees 
WHERE first_name IN ('David', 'Julia', 'Alexis');

--LIKE

-- % : ~�̶� �ؼ��Ѵ�
SELECT first_name 
FROM employees 
WHERE first_name LIKE '%en%';

SELECT first_name 
FROM employees 
WHERE first_name LIKE '%en';

SELECT first_name 
FROM employees 
WHERE first_name LIKE '%e%n%';

-- _ : �ڸ���
SELECT first_name 
FROM employees 
WHERE first_name LIKE '___en';

-- IS NULL : �ΰ��� ����
SELECT first_name, manager_id 
FROM employees 
WHERE manager_id IS NULL;

-- IS NOT NULL : �ΰ��� �ƴ� ����
SELECT first_name, manager_id 
FROM employees 
WHERE manager_id IS NOT NULL;

-- ���� : �巡��, ctrl + alt + �Ʒ�ȭ��ǥ
-- �ű�� : �巡��, ctrl + shift + ���Ʒ�ȭ��ǥ

-- ���� n���� ������
-- rownum : ����Ŭ���� �� ��ȣ�� �����ϴ� �̸�
SELECT * 
FROM employees 
WHERE rownum <= 10
ORDER BY salary;


SELECT rownum, first_name 
FROM employees
WHERE rownum <= 10
ORDER BY salary;

---------------------------------------------------------
-- ���� �� �Լ�
-- ����Ÿ�� �Լ�
-- LOWER(), UPPER(), INITCAP()
SELECT LOWER('ADFSDF') 
FROM dual;

SELECT first_name ����,
	LOWER(first_name),
	UPPER(first_name)
FROM employees;

SELECT first_name, salary 
FROM employees 
WHERE LOWER(first_name) = 'david';

SELECT email,
	INITCAP(email)
FROM employees;

-- SUBSTR(����, ����, ��) : �ش� ���ڸ� ���ۺ��� ������ �߶��ش�
SELECT SUBSTR(job_id, 1, 2)
FROM employees;

-- REPLACE(���ڿ���, ���ڸ�, ���ڷ�) : ���ڸ� �ٲ��ִ� �Լ�
SELECT job_id , REPLACE(job_id, 'IT', 'a')
FROM employees;

-- CONCAT(����, ����) : ���ڿ� ���ڸ� �������ִ� �Լ�
SELECT CONCAT(first_name, ' '),
	CONCAT(CONCAT(first_name, ' '), last_name)
FROM employees;

-- LENGTH(����) : ������ ���̸� �˷��ִ� �Լ�
SELECT email, 
	LENGTH(email),
	LENGTH(email) + 3
FROM employees;

-- first_name�� last_name�� email�� ����� ��ȹ�̴�
-- �������� ��ȣ�� ���� email�� �ڿ��� �����ڸ� ������ �� ����ϰ��� �Ѵ�
-- ex) ABANDA --> ABA




