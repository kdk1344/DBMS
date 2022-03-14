--user_tab_privs_made : �ο� �� ���� ����
SELECT * FROM user_tab_privs_made;

-- GRANT : ���� �ο�, TO �� ����Ѵ�
GRANT SELECT ON employees TO user01;

-- REVOKE : ���� ȸ��, FROM�� ����Ѵ�
REVOKE SELECT ON employees FROM user01;
REVOKE INSERT, DELETE ON employees FROM user01;

--�������谡 ����Ǿ��ִ� ���̺� �����
CREATE TABLE emp(
	�̸� varchar2(50) PRIMARY KEY,
	���� varchar2(50),
	��� varchar2(50),
	CONSTRAINT emp_fk FOREIGN KEY (���) REFERENCES emp (�̸�)
);

INSERT INTO emp 
VALUES ('��ö��', '����', null);

INSERT INTO emp 
VALUES ('���缮', '����', '��ö��');

INSERT INTO emp 
VALUES ('�ڸ��', '����', '���缮');

INSERT INTO emp 
VALUES ('������', '����', '���缮');

INSERT INTO emp 
VALUES ('������', '�븮', '������');

INSERT INTO emp 
VALUES ('����', '���', '������');

INSERT INTO emp 
VALUES ('��ȫö', '���', '������');
--������ ����(����)
SELECT �̸�, ����, ���
FROM emp 
START WITH ��� is NULL 
CONNECT BY PRIOR �̸� = ���;
-- PRIOR �θ� = �ڽ� : �θ��� -> �ڽĳ�����(������)

SELECT �̸�, ����, ���
FROM emp 
START WITH �̸� = '����'
CONNECT BY PRIOR ��� = �̸�;
-- PRIOR �ڽ� = �θ� : �ڽĳ�� -> �θ��� �����������(������)

--���� �÷�
SELECT LEVEL, �̸�, ����, ���, connect_by_isleaf
FROM emp 
START WITH ��� is NULL 
CONNECT BY PRIOR �̸� = ���;

-- connect_by_iscycle : NOCYCLE�� ����������� ��� �����ϴ�

-- �Լ�
--sys_connect_by_path(�÷���, ���Ṯ��)
--connect_by_root(�÷���)

SELECT �̸�, ����, ���,
	SYS_CONNECT_BY_PATH(�̸�, '/'),
	connect_by_root(�̸�)
FROM emp 
START WITH ��� IS NULL 
CONNECT BY PRIOR �̸� = ���;




