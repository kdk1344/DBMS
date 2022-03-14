--테이블 명 : task
--컬럼명		데이터타입			제약조건
--user_id		varchar2(200)	primary key
--user_pw		varchar2(200)	null값을 허용하지 않음
--user_age	number(3)		0초과의 값만 허용, null값 허용X
--user_email	varchar2(50)	중복X, null값 X
--join_date	date			기본값으로 시스템상 현재 시간, null x
--user_gender	char(1)			M또는 F 둘 중 하나만, null X, 기본값 : F
--manager_id	number(5)		sample8 테이블의 a 컬럼을 받아오는 외래키
CREATE TABLE task(
	user_id varchar2(200) PRIMARY KEY,
	USER_pw varchar2(200) NOT NULL,
	user_age number(3) CHECK (user_age > 0) NOT NULL,
	user_email varchar2(50) UNIQUE NOT NULL,
	join_date DATE DEFAULT sysdate NOT NULL,
	user_gender char(1) DEFAULT 'F' CHECK (user_gender IN ('M', 'F')) NOT NULL,
	manager_id number(5) REFERENCES sample8 (employee_id)
);

--컬럼 추가
ALTER TABLE task 
ADD (test NUMBER(5) DEFAULT 5 UNIQUE);

--제약조건 추가
ALTER TABLE task 
ADD CONSTRAINT task_fk FOREIGN KEY (test) REFERENCES sample8 (employee_id);

ALTER TABLE task 
ADD (test2 NUMBER(5));

--컬럼 수정
ALTER TABLE task 
MODIFY (test2 varchar2(100) DEFAULT 'a' NOT NULL);

ALTER TABLE task 
ADD test3 number(3);

--not null 제약조건 추가
ALTER TABLE task 
MODIFY test3 NOT NULL;

--컬럼 삭제
ALTER TABLE TASK 
DROP COLUMN test3;

--제약조건 삭제
ALTER TABLE task 
DROP CONSTRAINT sys_c007093;

--컬럼명 수정
ALTER TABLE task 
RENAME COLUMN test2 TO changed;

--테이블 명 수정
ALTER TABLE task 
RENAME TO task2;


--제약조건 비활성화
ALTER TABLE task2 
disable CONSTRAINT sys_c007099;

--제약조건 활성화
ALTER TABLE task2 
enable CONSTRAINT sys_c007099;

--TRUNCATE : 테이블 안의 모든 데이터 삭제(DELETE WHERE절 없이 사용한 결과)
TRUNCATE TABLE task2;

--DROP : 테이블 삭제
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

--SAVEPOINT : 특정 시점으로 되돌아가게 만드는 명령어
INSERT INTO sample15 
VALUES (11);

SAVEPOINT s1;

INSERT INTO sample15 
VALUES (12);

SAVEPOINT s2;

INSERT INTO sample15 
VALUES (13);

SELECT * FROM sample15;

-- savepoint 포인트 이름;
-- rollback to 포인트 이름; --> 해당 포인트까지 롤백 된다
-- 특정 부분에서 트랜잭션을 취소시킬 수 있는 명령어
ROLLBACK TO s1;

COMMIT;

----------------------------------------------------------------
CREATE USER user01 IDENTIFIED BY 1234;


--USER01 계정에게 employees 테이블을 SELECT 할 권한 부여하기
GRANT SELECT ON employees TO user01;
GRANT INSERT ON employees TO user01;
GRANT DELETE ON employees TO user01;
GRANT UPDATE ON employees TO user01;
GRANT SELECT, INSERT, DELETE, UPDATE ON employees TO user01;






