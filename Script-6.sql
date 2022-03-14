--id�� abc123, pw 1234 , ���� F, ���̴� 20 �ּҴ� ����� ���ﵿ
--grade �� normal ȸ���������ڴ� �ý��� �� ���� �ð��� ȸ�� ������ 
-- �����϶�
INSERT INTO tbl_user 
(USER_ID, USER_PW, USER_GENDER, USER_AGE, USER_ADDRESS, JOIN_DATE, GRADE)
VALUES ('abc123', '1234', 'F', 20, '����� ���ﵿ', sysdate, 'normal');

-- id�� abc123 �� ȸ���� �ֱ� �������� ���� �ð��̴� �̸� ���̺� �߰��϶�
INSERT INTO user_access_date 
(USER_ID, LAST_ACCESS_DATE)
VALUES ('abc123', sysdate);

-- id�� def123�� ȸ���� �ֱ��������� ���� �ð��̴� �̸� ���̺� �߰��϶�
INSERT INTO USER_ACCESS_DATE 
(USER_ID, LAST_ACCESS_DATE)
VALUES ('def123', sysdate);
--id�� def123, pw�� 5555 ������ M ���̴� 25 �ּ��� ���Է�
--ȸ���������� 2020�� 5�� 15��, grade�� normal�� ȸ�� ������ ���̺� �߰��϶�
INSERT INTO TBL_USER 
(USER_ID, USER_PW, USER_GENDER, USER_AGE, JOIN_DATE)
VALUES ('def123', '5555', 'M', 25, to_date('20200515', 'YYYYMMDD'));

SELECT * FROM TBL_USER;

--id�� aaa, pw 0000, ������ ����, ���̴� 15�� �ּ����� ���Է»���
-- ȸ������ ���ڴ� 200201, grade�� normal, �ֱ��������� 210601�� ������ ����
INSERT INTO tbl_user 
(USER_ID, USER_PW, USER_GENDER, USER_AGE, JOIN_DATE)
VALUES ('aaa', '0000', 'F', 15, to_date('200201', 'YYMMDD'));

INSERT INTO USER_ACCESS_DATE 
(USER_ID, LAST_ACCESS_DATE)
VALUES ('aaa', to_date('210601', 'YYMMDD'));

------------------------------------
--UPDATE 
UPDATE departments 
SET manager_id = 102
WHERE department_name = 'TEST';

SELECT * FROM departments;

-- tbl_user ���̺��� aaa ���̵� ���� ȸ���� 
-- ������ �ּ����� ����� ���ﵿ���� �����ߴ�
-- ���̺� �˸��� ���� �����Ͽ���
UPDATE tbl_user 
SET USER_ADDRESS = '����� ���ﵿ'
WHERE USER_ID = 'aaa';

SELECT * FROM TBL_USER tu;

-- 20�⵵�� ȸ�������� ȸ���� ����� 'vip'�� �°��ϰ��� �Ѵ�
-- �˸°� ���̺��� ���� �����Ͽ���
SELECT * 
FROM tbl_user 
WHERE JOIN_DATE >= TO_DATE('200101', 'YYMMDD')
AND join_date < TO_DATE('210101', 'YYMMDD');

UPDATE tbl_user 
SET grade = 'vip'
WHERE JOIN_DATE >= TO_DATE('200101', 'YYMMDD')
AND join_date < TO_DATE('210101', 'YYMMDD');

SELECT * FROM tbl_user;

-------------------------------------------
-- �� ����
DELETE FROM departments
WHERE LOWER(department_name) = 'test';

SELECT * FROM departments;


-- �ֱ� �����Ϸκ��� ������� 6���� �̻� �������� ���� ȸ�� ������
-- �����Ͽ���
SELECT * 
FROM USER_ACCESS_DATE uad 
WHERE MONTHS_BETWEEN(sysdate, LAST_ACCESS_DATE) >= 6;

DELETE USER_ACCESS_DATE uad 
WHERE MONTHS_BETWEEN(sysdate, LAST_ACCESS_DATE) >= 6;

SELECT * FROM USER_ACCESS_DATE uad;

--DELETE tbl_user 
--WHERE user_id = 'aaa';

DELETE tbl_user 
WHERE user_id NOT IN (
	SELECT user_id 
	FROM USER_ACCESS_DATE uad 
);

SELECT * FROM TBL_USER tu;

SELECT user_id 
FROM USER_ACCESS_DATE uad ;

-----------------------------
--CREATE 
CREATE TABLE sample1(
	a NUMBER(3),
	b VARCHAR2(200),
	c char(200),
	d DATE
);

--table ������ ���ÿ� �������� �ޱ�
--�÷����ؿ��� �������� �����ϱ�
--���̺���ؿ��� �������� �����ϱ�

--primary key �������� ����
CREATE TABLE sample2(
	a NUMBER(3) PRIMARY KEY,
	b varchar2(200)
);

-- PK �� ���̺� �� �Ѱ��� �����ؾ��Ѵ�
--CREATE TABLE sample3(
--	a NUMBER(3) PRIMARY KEY,
--	b varchar2(200) PRIMARY KEY
--);

CREATE TABLE sample3(
	a NUMBER(3),
	b varchar2(200),
	CONSTRAINT sp3_pk PRIMARY KEY (a)
);
-- a �÷��� b�÷��� ���������� PK�� ����� �� �ִ�
CREATE TABLE sample4(
	a NUMBER(3),
	b varchar2(200),
	CONSTRAINT sp4_pk PRIMARY KEY (a, b)
);

--foreign key ��������
CREATE TABLE sample5(
	a number(3) PRIMARY KEY,
	b number(3) REFERENCES sample3 (a)
);

CREATE TABLE sample6(
	a number(3),
	b number(3),
	CONSTRAINT sp6_pk PRIMARY KEY (a),
	CONSTRAINT sp6_fk FOREIGN KEY (b) REFERENCES sample3 (a)
);


CREATE TABLE sample7(
	employee_id NUMBER(3) PRIMARY KEY,
	manager_id number(3) REFERENCES sample7 (employee_id)
);

-- foreign key�� ���� �� ���� �����ϴ� ���̺��� �÷��� 
-- UNIQUE ���������� �־�� �Ѵ�(PRIMARY KEY�� ���Ե�..)
CREATE TABLE sample8(
	employee_id NUMBER(3) UNIQUE ,
	manager_id number(3) REFERENCES sample8 (employee_id)
);

-- not null
CREATE TABLE sample9(
	a number(3) NOT NULL 
);

-- NOT NULL ���������� ���̺� ���ؿ��� �� �� ����
--CREATE TABLE sample10(
--	a number(3),
--	CONSTRAINT sp10_nn NOT NULL (a)
--);

-- UNIQUE 
-- �ߺ��� ���� ������� �ʴ� ��������
CREATE TABLE sample10(
	a number(3) UNIQUE,
	b date
);

-- ���̺� ���ؿ��� ���������� �޸� �������� �÷��� ���������� �����ϰ�
-- ���� �� �ִ�
CREATE TABLE sample11(
	a number(3),
	b DATE,
	CONSTRAINT sp11_u1 UNIQUE (a),
	CONSTRAINT sp11_u2 UNIQUE (a, b)
);

--CHECK : ����� ���� ���� ����
CREATE TABLE sample12(
	age number(3) CHECK (age > 0),
	gender char(1) CHECK (gender IN ('M', 'F')),
	name varchar2(30) CHECK (name <> NULL)
);

CREATE TABLE sample13(
	age number(3),
	gender char(1),
	name varchar2(30),
	CONSTRAINT sp13_ck1 CHECK (age > 0),
	CONSTRAINT sp13_ck2 CHECK (gender IN ('M', 'F')),
	CONSTRAINT sp13_ck3 CHECK (name <> NULL)
);

-- �⺻�� ����
-- DEFAULT
CREATE TABLE saple14(
	a DATE DEFAULT sysdate,
	b DATE,
	c DATE
);

INSERT INTO saple14
(c)
VALUES (to_date('200202', 'YYMMDD'));

--�������� ���� ������ ���ÿ� �ޱ�
--default�� �� �տ� ���ָ� �ǰ�, �������� ���� ���� ����
CREATE TABLE sample15(
	a number(3) DEFAULT 15 CHECK (a BETWEEN 10 AND 20) UNIQUE NOT NULL
);

--���̺� �� : task
--�÷���		������Ÿ��			��������
--user_id		varchar2(200)	primary key
--user_pw		varchar2(200)	null���� ������� ����
--user_age	number(3)		0�ʰ��� ���� ���, null�� ���X
--user_email	varchar2(50)	�ߺ�X, null�� X
--join_date	date			�⺻������ �ý��ۻ� ���� �ð�, null x
--user_gender	char(1)			M�Ǵ� F �� �� �ϳ���, null X, �⺻�� : F
--manager_id	number(5)		sample8 ���̺��� a �÷��� �޾ƿ��� �ܷ�Ű




