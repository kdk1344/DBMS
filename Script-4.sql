-- �����Լ� �׷��Լ�
-- COOUNT()
SELECT COUNT(salary)
FROM employees;

-- NULL���� �����Ѵ�
SELECT COUNT(commission_pct)
FROM employees;

-- *�� ����ϸ� ���̺� �����ϴ� ��� ���� ������ �˷��ش�
SELECT COUNT(*)
FROM employees;

--SUM()
-- �����Լ��� NULL���� �����Ѵ�
SELECT SUM(salary)
FROM employees;

SELECT SUM(commission_pct) / COUNT(commission_pct) 
FROM employees;

-- �����Լ��� NULL���� �����ϰ� �����ϱ� ������
-- NULL���� �����ؼ� �ٷ��� �Ѵٸ� NVL()�� Ȱ���Ͽ� Ư�������� ������ �� ����Ѵ�
SELECT SUM(NVL(commission_pct, 0)) / COUNT(*)
FROM employees;

-- AVG() 
-- 35�� ���� ���
SELECT AVG(commission_pct) 
FROM employees;

-- 107�� ���� ���
SELECT AVG(NVL(commission_pct, 0))
FROM employees;

-- MAX(), MIN()
SELECT MAX(salary),
	MIN(salary)
FROM employees;

-- GROUP BY : �׷�ȭ�Ͽ� �׷캰�� �����Լ��� ����ȴ�
-- department_id ���� ��salary, ���salary, �ִ�salary, �ּ�salary
SELECT department_id,
	SUM(salary),
	AVG(salary),
	MAX(salary),
	MIN(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY department_id
ORDER BY department_id;

-- department_id �߿����� manager_id���� �׷�ȭ
-- GROUP BY ��׷�, �߱׷�, �ұ׷�,.....
SELECT department_id, manager_id,
	AVG(salary)
FROM employees 
WHERE department_id IS NOT NULL 
GROUP BY department_id, manager_id 
ORDER BY department_id;

-- �׷��Լ��� WHERE ������ ����� �� ����
--SELECT department_id,
--	SUM(salary)
--FROM employees 
--WHERE SUM(salary) > 7000
--GROUP BY department_id;

-- HAVING �� : �׷��Լ��� ���ǿ� �����ϰ� ���� �� ����Ѵ�
SELECT department_id,
	SUM(salary) ��������
FROM employees 
GROUP BY department_id; 
-- GROUP BY�� HAVING���� ���� ��ġ�� �ٲ� �����ϳ�
-- �������� �׷�ȭ�� �� �ڿ� ������ �����ϴ� ���� �б� ����
SELECT department_id,	-- 5 department_id�� �׷캰salary������
	SUM(salary) ��������
FROM employees 			--1 employees ���̺���
WHERE employee_id > 110	--2 employee_id �� 110 �ʰ��� ��鸸 ��󳻰�
GROUP BY department_id 	--3 department_id���� �׷�ȭ �Ͽ�
HAVING SUM(salary) > 7000--4 �׷캰 salary ������ 7000�ʰ��� ��鸸
ORDER BY department_id;  --6 department_id ������������ ��ȸ�ϰڴ�
--------------------------------------------------
--�������� ��������
--����� �̸��� ��, �μ��� �� ���
SELECT first_name, last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

-- ���̺��� ������ �����ؾ� �ϴ� ��쿡�� alias�� �����ϸ� ���� ����
-- ����� �� �ִ�
-- �÷��̸����� ��ȣ���� �߻��� �� �ִ� ���� � ���̺� ���� �÷�����
-- ��������� ǥ���ϴ� ���� �ٶ����ϴ�
SELECT e.first_name, 
	e.last_name, 
	e.department_id, 
	d.department_name
FROM employees e, departments d 
WHERE e.department_id = d.department_id;

-- �� �μ� ��� �μ� �� ������ �̸��� ���� ����϶�
SELECT d.DEPARTMENT_NAME, e.FIRST_NAME ,e.LAST_NAME 
FROM departments d, employees e
WHERE d.MANAGER_ID = e.EMPLOYEE_ID;


-- �ܺ����� : ���� �� ��ġ���� �ʴ��� ��ȸ�Ѵ�
-- left outer join
SELECT d.DEPARTMENT_NAME , e.FIRST_NAME , e.LAST_NAME 
FROM departments d, employees e
WHERE d.MANAGER_ID = e.EMPLOYEE_ID(+);

-- right outer join
SELECT d.DEPARTMENT_NAME , e.FIRST_NAME , e.LAST_NAME 
FROM departments d, employees e
WHERE d.MANAGER_ID(+) = e.EMPLOYEE_ID;



-- Finance �μ��� ���� ������ �̸��� ���� ����϶�
SELECT e.first_name, e.last_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_name = 'Finance'
ORDER BY e.employee_id DESC;

-- ANSI ��� ���� ���� 
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON (e.department_id = d.department_id)
WHERE e.employee_id > 110;

-- ANSI ��� �ܺ� ����
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT OUTER JOIN employees e ON (d.manager_id = e.employee_id);









