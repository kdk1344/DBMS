--���̺� �� : task
--�÷���		������Ÿ��			��������
--user_id		varchar2(200)	primary key
--user_pw		varchar2(200)	null���� ������� ����
--user_age	number(3)		0�ʰ��� ���� ���, null�� ���X
--user_email	varchar2(50)	�ߺ�X, null�� X
--join_date	date			�⺻������ �ý��ۻ� ���� �ð�, null x
--user_gender	char(1)			M�Ǵ� F �� �� �ϳ���, null X, �⺻�� : F
--manager_id	number(5)		sample8 ���̺��� a �÷��� �޾ƿ��� �ܷ�Ű
CREATE TABLE task(
	user_id varchar2(200) PRIMARY KEY,
	USER_pw varchar2(200) NOT NULL,
	user_age number(3) CHECK (user_age > 0) NOT NULL,
	user_email varchar2(50) UNIQUE NOT NULL,
	join_date DATE DEFAULT sysdate NOT NULL,
	user_gender char(1) DEFAULT 'F' CHECK (user_gender IN ('M', 'F')) NOT NULL,
	manager_id number(5) REFERENCES sample8 (employee_id)
);

--�÷� �߰�
ALTER TABLE task 
ADD (test NUMBER(5) DEFAULT 5 UNIQUE);

--�������� �߰�
ALTER TABLE task 
ADD CONSTRAINT task_fk FOREIGN KEY (test) REFERENCES sample8 (employee_id);

ALTER TABLE task 
ADD (test2 NUMBER(5));

--�÷� ����
ALTER TABLE task 
MODIFY (test2 varchar2(100) DEFAULT 'a' NOT NULL);

ALTER TABLE task 
ADD test3 number(3);

--not null �������� �߰�
ALTER TABLE task 
MODIFY test3 NOT NULL;

--�÷� ����
ALTER TABLE TASK 
DROP COLUMN test3;

--�������� ����
ALTER TABLE task 
DROP CONSTRAINT sys_c007093;

--�÷��� ����
ALTER TABLE task 
RENAME COLUMN test2 TO changed;

--���̺� �� ����
ALTER TABLE task 
RENAME TO task2;


--�������� ��Ȱ��ȭ
ALTER TABLE task2 
disable CONSTRAINT sys_c007099;

--�������� Ȱ��ȭ
ALTER TABLE task2 
enable CONSTRAINT sys_c007099;

--TRUNCATE : ���̺� ���� ��� ������ ����(DELETE WHERE�� ���� ����� ���)
TRUNCATE TABLE task2;

--DROP : ���̺� ����
DROP TABLE task2;

--TCL
--SAVEPOINT
INSERT INTO sample15 
VALUES (10);

COMMIT;

INSERT INTO sample15 
VALUES (11);

ROLLBACK;

SELECT * FROM sample15;

--SAVEPOINT : Ư�� �������� �ǵ��ư��� ����� ��ɾ�
INSERT INTO sample15 
VALUES (11);

SAVEPOINT s1;

INSERT INTO sample15 
VALUES (12);

SAVEPOINT s2;

INSERT INTO sample15 
VALUES (13);

SELECT * FROM sample15;

-- savepoint ����Ʈ �̸�;
-- rollback to ����Ʈ �̸�; --> �ش� ����Ʈ���� �ѹ� �ȴ�
-- Ư�� �κп��� Ʈ������� ��ҽ�ų �� �ִ� ��ɾ�
ROLLBACK TO s1;

COMMIT;

----------------------------------------------------------------
CREATE USER user01 IDENTIFIED BY 1234;


--USER01 �������� employees ���̺��� SELECT �� ���� �ο��ϱ�
GRANT SELECT ON employees TO user01;
GRANT INSERT ON employees TO user01;
GRANT DELETE ON employees TO user01;
GRANT UPDATE ON employees TO user01;
GRANT SELECT, INSERT, DELETE, UPDATE ON employees TO user01;






