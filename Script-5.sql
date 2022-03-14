-- ����� �̸��� ��, �ش� ����� �Ŵ��� id�� �Ŵ��� �̸��� ���� ����϶�
SELECT a.first_name, 
	a.last_name,
	a.manager_id,
	b.first_name,
	b.last_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+);
-- ���տ�����
-- UNION
SELECT department_id
FROM employees 
ORDER BY department_id;-- NULL, 10, 20, ... 110

SELECT department_id 
FROM departments;		-- 10, 20, ..., 270

-- UNION : ������, �ߺ� ����
SELECT department_id 
FROM employees 
UNION 
SELECT department_id 
FROM departments;
--UNION ALL : ������, �ߺ� ���
SELECT department_id 
FROM employees 
UNION ALL 
SELECT department_id 
FROM departments;
--INTERSECT : ������
SELECT department_id 
FROM employees 
INTERSECT 
SELECT department_id 
FROM departments;

--MINUS : ������, �� �� ������ �ٲ�� ����� �ٲ��
SELECT department_id 
FROM employees 
MINUS 
SELECT department_id 
FROM departments;

SELECT department_id 
FROM departments 
MINUS 
SELECT department_id 
FROM employees;



-- first_name�� Joshua�� ����� �޴� ���ް� ���� ������ ������
-- �޴� ������ ��� ������ ����϶�
SELECT *
FROM employees 
WHERE salary = 2500;

SELECT salary 
FROM employees 
WHERE first_name = 'Joshua';


SELECT *
FROM employees 
WHERE salary = (
	SELECT salary 
	FROM employees 
	WHERE first_name = 'Joshua'
);

-- David�� �޴� salary �� ���� ������ salary �޴� ������ �������
-- ���������� ���� ����� �������� ������ ������ 
-- �񱳿�����(������ ������)�� ����� �� ����
SELECT *
FROM employees 
WHERE salary = (
	SELECT salary 
	FROM employees 
	WHERE first_name = 'David'
);

SELECT salary 
	FROM employees 
	WHERE first_name = 'David';

-- ���� �� ���������� ������ �����ڿ� �Բ� ����� �����ϴ�
-- IN, ...
SELECT *
FROM employees 
WHERE salary IN (
	SELECT salary 
	FROM employees 
	WHERE first_name = 'David'
);
SELECT *
FROM employees 
WHERE salary IN (4800, 9500, 6800);


-- ��ü ���� ������ ��� �̻��� �޴� ������ �̸��� ���� ����϶�
SELECT AVG(salary)
FROM employees;

SELECT first_name, last_name 
FROM employees 
WHERE salary >= (
	SELECT AVG(salary)
	FROM employees
);

-- department_name�� 'Sales'�� �μ��� department_id�� ��ġ�ϴ� �����
-- �̸��� ���� ����Ͻÿ�
SELECT department_id 
FROM departments 
WHERE department_name = 'Sales';

SELECT first_name, last_name
FROM employees 
WHERE department_id = (
	SELECT department_id 
	FROM departments 
	WHERE department_name = 'Sales'
);

-- ���� �� ��������
-- �μ� �� �ּ� ������ �޴� ������ �̸��� ���� ����ϱ�
SELECT department_id, MIN(salary)
FROM employees 
GROUP BY department_id;

SELECT first_name, last_name, salary 
FROM employees 
WHERE (department_id, salary) IN (
	SELECT department_id, MIN(salary)
	FROM employees 
	GROUP BY department_id
);
-- �̷� ������� �ؼ��Ѵ�
--SELECT first_name, last_name, salary 
--FROM employees 
--WHERE (department_id, salary) IN (100, 6900);
--									30,  2500
--									NULL,7000
--									...
--�Ի絿�⺰ �ּҺ����� �޴� ����� �̸��� ��, �Ի���, ������
-- �Ի��� ������������ ���
SELECT hire_date, min(salary)
FROM employees 
GROUP BY hire_date;

SELECT first_name, last_name, hire_date, salary 
FROM employees 
WHERE (hire_date, salary) IN (
	SELECT hire_date, min(salary)
	FROM employees 
	GROUP BY hire_date
);

-- ���� ������ �޴� ��� �� ���� �ʰ� ���� ����� �̸��� ��, �Ի��� ������
--���� ������������ ����Ͻÿ�
SELECT salary, max(hire_date)
FROM employees
GROUP BY salary;

SELECT first_name, last_name, hire_date, salary 
FROM employees 
WHERE (salary, hire_date) IN (
	SELECT salary, max(hire_date)
	FROM employees
	GROUP BY salary
);


-- �μ� �� ���� ���� 3���� �̸�, ��, department_id, salary, ���� ����϶�
SELECT first_name, last_name, department_id, salary, 
	RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) r
FROM employees;

-- ���������� ���̺� �ڸ��� ���ȴٸ� �ش� �������� ����� ����� ������ ���̺��̶�� ������
-- �� ����ϸ� �ȴ�
SELECT first_name, last_name, department_id, salary, r
FROM (
	SELECT first_name, last_name, department_id, salary, 
		RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) r
	FROM employees
) temp
WHERE r <= 3;
-------------------------------------------------
-- INSERT ������ �����ϱ�
INSERT INTO departments 
VALUES (271, 'TEST', 101, 1700);

SELECT * FROM departments;

ROLLBACK;
COMMIT;

-- �÷� �̸��� ��������� ���ָ� �������� ���� �� �ִ� ����
INSERT INTO departments 
(department_id, location_id, manager_id, department_name)
VALUES (272, NULL, NULL, 'TEST');

COMMIT;

-- �÷��̸��� ��������� ������ ��� ������ �����ϸ�
-- �������� ��� �⺻������ ������ ���� ����
INSERT INTO departments 
(department_id, department_name)
VALUES (273, 'Test');

COMMIT;

CREATE TABLE TBL_USER(
   user_id varchar2(30) NOT NULL PRIMARY KEY,
   user_pw varchar2(30) NOT NULL,
   user_gender char(1) NOT NULL,
   user_age number(3) NOT NULL,
   user_address varchar2(30),
   join_date DATE,
   grade varchar2(10) DEFAULT 'normal' NOT NULL
);
CREATE TABLE USER_ACCESS_DATE(
   user_id varchar2(30) PRIMARY KEY,
   last_access_date DATE DEFAULT sysdate NOT NULL,
   CONSTRAINT access_date_fk FOREIGN KEY(user_id)
   REFERENCES TBL_USER(user_id)
);





