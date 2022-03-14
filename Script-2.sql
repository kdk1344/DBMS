-- first_name�� last_name�� email�� ����� ��ȹ�̴�
-- �������� ��ȣ�� ���� email�� �ڿ��� �����ڸ� ������ �� ����ϰ��� �Ѵ�
-- ex) ABANDA --> ABA
-- ABCDEFGHI --> ABCDEF
SELECT first_name, 
	last_name, 
	email, 
	LENGTH(email),
	SUBSTR(email, 1, LENGTH(email) - 3)
FROM employees;

-- INSTR(����1, ����2) --> ����1 �ȿ��� ����2�� ��ġ�� �˷��ִ� �Լ�
SELECT INSTR('apple', 'l')
FROM dual;

-- �ߺ��Ǵ� ���ڰ� ���� ��� ���� �տ� �����ϴ� ������ ��ġ�� �˷��ش�
SELECT INSTR('apple', 'p')
FROM dual;

-- �� ���ڰ� �ƴϴ��� ��ġ�� ã�� �� ������, ���ʿ� �����ϴ� ���ڸ� �������� ��ġ�� �˷��ش�
SELECT INSTR('apple', 'pl') 
FROM dual;

-- INSTR(����1, ����2, ����) : ����1���� ����2�� �ش� ���ں��� ã�� �����Ѵ�
SELECT INSTR('apple', 'p', 3)
FROM dual;

-- ���࿡ ���� ���ڸ� ã�� ��쿡�� 0�� ����� ���´�
SELECT INSTR('apple', 'k')
FROM dual;

-- 'fsdojiofwogwoh' �ι�° o�� �����ϴ� ��ġ�� ����Ͻÿ�
SELECT INSTR('fsdjiofwogwoh', 'o'),
	INSTR('fsdjiofwogwoh', 'o', INSTR('fsdjiofwogwoh', 'o')+1)
FROM dual;

SELECT first_name, INSTR(first_name, 'o'),
	INSTR(first_name, 'o', INSTR(first_name, 'o') + 1) 
FROM employees;

SELECT first_name 
FROM employees 
WHERE INSTR(first_name, 'o', INSTR(first_name, 'o') + 1) <> 0;


-- RTRIM(����1, ����2) : ����1���� ����2�� �����ʺ��� ����������
-- LTRIM(����1, ����2) : ����1���� ����2�� ���ʺ��� ����������
SELECT RTRIM('eeeabcedfeee', 'e'),
	LTRIM('eeeabcedfeee', 'e'),
	RTRIM('   ab  cd   '), -- ���� ���ڸ� �����ϸ� ���Ⱑ ��������
	LTRIM('   ab  cd   ')
FROM dual;

-- TRIM(����) : �ش� ������ ���� ���⸦ �������ִ� �Լ�
SELECT TRIM('   ab   ef   ')
FROM dual;

--RPAD(����1, ����, ����2) : ����1�� �ڸ����� ���ڷ� ���� ��, ������ �� ������ ����2�� ä��� �Լ�
--LPAD(����1, ����, ����2) : ����1�� �ڸ����� ���ڷ� ���� ��, ���� �� ������ ����2�� ä��� �Լ�
SELECT RPAD('apple', 10, '!'),
	LPAD('apple', 10, '!')
FROM dual;

-- �������� �̸��Ͽ��� ���� �α��ڸ� ����� ����ϵ� ������ ���ڴ� *�� ǥ���Ͽ� ����ϱ�
-- ex) ABANDA --> AB****@koreait.com
-- �����ּ� ����Ű : �巡��, ctrl + shift + /
SELECT /*email,
	SUBSTR(email, 1, 2),
	RPAD(SUBSTR(email, 1, 2), LENGTH(email), '*'),*/
	CONCAT(RPAD(SUBSTR(email, 1, 2), LENGTH(email), '*'), '@koreait.com') �̸����ּ� 
FROM employees;

------------------------------------------------------------------------------
--����Ÿ�� �Լ�
-- ROUND(����1, ����2) : ����1�� �ݿø��Ͽ� ����2 �ڸ������� ǥ���ϴ� �Լ�
SELECT ROUND(13.512, -1), -- 10���ڸ����� �ݿø�
	ROUND(13.512),  -- ���� �ÿ��� �������� �ݿø�
	ROUND(13.512, 0),  -- 1���ڸ����� �ݿø�
	ROUND(13.512, 1),  -- �Ҽ����Ʒ�1�ڸ����� �ݿø�
	ROUND(13.512, 2)   -- �Ҽ����Ʒ�2�ڸ����� �ݿø�
FROM dual;

-- TRUNC(����1, ����2) : ����1�� �߶󳻾� ����2���� ǥ���ϴ� �Լ�
SELECT TRUNC(16.512, -1),
	TRUNC(16.512, 0),
	TRUNC(16.512),
	TRUNC(16.512, 1),
	TRUNC(16.512, 2) 
FROM dual;

--FLOOR(����) : �ش� ���ڸ� ������ �����ϴ� �Լ�
--CEIL(����) : �ش� ���ڸ� ������ �ø��ϴ� �Լ�
SELECT FLOOR(13.512),
	CEIL(13.012)
FROM dual;

SELECT TRUNC(13.5),
	FLOOR(13.5),
	TRUNC(-15.5),
	FLOOR(-15.5) 
FROM dual;
-- SIGN(����) : �ش� ���� ��ȣ�� �˷��ִ� �Լ�, ��� : 1, ���� : -1, 0 : 0 �� ����� ���´�
SELECT SIGN(15),
	SIGN(-15),
	SIGN(0) 
FROM dual;

-- MOD(����1, ����2) : ����1�� ����2�� �������� �� ������
SELECT MOD(10, 3) 
FROM dual;

-- POWER(����1, ����2) : ����1�� ����2�ŵ�����(��)�� ����� �����Ѵ�
SELECT POWER(10, 3)
FROM dual;

-- SQRT(����) : square root, �ش� ������ �������� ���Ѵ�
SELECT SQRT(100)
FROM dual;

----------------------------------------------------------------
-- ��¥Ÿ���Լ�

-- MONTHS_BETWEEN(��¥1, ��¥2) : ��¥2���� ��¥1���� ����� �������� ����Ÿ������ �˷��ִ� �Լ�
-- �Ի��� ���κ��� ������� ����� ��������
SELECT hire_date, sysdate,
	TRUNC(MONTHS_BETWEEN(sysdate, hire_date))
FROM employees;

--ADD_MONTH(��¥, ����) : �ش� ��¥�� ������ ���Ѵ�, ��� : ��¥Ÿ��
-- 31�� �� ��� ������ ���� ����� ���´� ex) 3/31 --> 4/30
SELECT sysdate,
	ADD_MONTHS(sysdate, 1)
FROM dual;

--SELECT * 
--FROM employees
--WHERE salary = '10000'; -- '10000' : ����Ÿ���� ���ε� ��ǻ�Ͱ� ������ ����Ÿ������ �ٲپ� ������ �ȴ�

-- NEXT_DAY(��¥, ����) --> �ش� ��¥�κ��� ���ƿ��� ������ ��ĥ���� �˷��ִ� �Լ�
-- ���� : 1 :�Ͽ��� ~ 7 : �����
SELECT sysdate,
	NEXT_DAY(sysdate, 2)
FROM dual;

SELECT sysdate,
	NEXT_DAY(sysdate, '�ݿ���') 
FROM dual;

SELECT sysdate,
	NEXT_DAY(sysdate, '��')
FROM dual;

-- ��� �������� �Ի��� �� �����Ͽ��� ���� ������ �޴´�
-- �������� �̸�, �Ի���, ��������, �Ի��� ��ĥ���� ������ �޴��� ����϶�
SELECT first_name �̸�, 
	hire_date �Ի���,
	NEXT_DAY(hire_date, '��') ������,
	NEXT_DAY(hire_date, '��') - hire_date 
FROM employees;

-- �Ի��� �� ���ݱ��� ������ ������� �Ǿ����� ����϶�
--SELECT TRUNC((sysdate - hire_date) / 365)
SELECT TRUNC(MONTHS_BETWEEN(sysdate, hire_date) / 12 )
FROM employees;


-- LAST_DAY(��¥) : �ش� ���� ������ ��¥�� ����Ѵ�
SELECT hire_date,
	LAST_DAY(hire_date)
FROM employees
ORDER BY hire_date;

-- ROUND(��¥, �ڸ���), TRUNC(��¥, �ڸ���)
SELECT sysdate,
	ROUND(sysdate, 'year'), -- �⵵���� �ݿø� (������ �ݿø�)
	ROUND(sysdate, 'month'),-- ������ �ݿø� (�Ͽ��� �ݿø�)
	ROUND(sysdate, 'dd'), -- �ϱ��� �ݿø�(�ð����� �ݿø�)
	TRUNC(sysdate, 'year'),-- �⵵���� ����(�� ���ϴ� ����)
	TRUNC(sysdate, 'month'),-- ������ ����(�� ���ϴ� ����)
	TRUNC(sysdate, 'dd') -- �ϱ��� ����(�ð����ϴ� ����)
FROM dual;

SELECT first_name, 
	/*hire_date,
	TRUNC(sysdate, 'year'),
	TRUNC(hire_date, 'year'),
	MONTHS_BETWEEN(TRUNC(sysdate, 'year') , TRUNC(hire_date, 'year')),
	MONTHS_BETWEEN(TRUNC(sysdate, 'year') , TRUNC(hire_date, 'year'))/12,*/
	MONTHS_BETWEEN(TRUNC(sysdate, 'year') , TRUNC(hire_date, 'year'))/12 +1 ����
FROM employees
ORDER BY ����;
--------------------------------------------------------------------------








