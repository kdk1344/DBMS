--id는 abc123, pw 1234 , 성별 F, 나이는 20 주소는 서울시 역삼동
--grade 는 normal 회원가입일자는 시스템 상 현재 시간인 회원 정보를 
-- 삽입하라
INSERT INTO tbl_user 
(USER_ID, USER_PW, USER_GENDER, USER_AGE, USER_ADDRESS, JOIN_DATE, GRADE)
VALUES ('abc123', '1234', 'F', 20, '서울시 역삼동', sysdate, 'normal');

-- id는 abc123 인 회원의 최근 접속일은 현재 시각이다 이를 테이블에 추가하라
INSERT INTO user_access_date 
(USER_ID, LAST_ACCESS_DATE)
VALUES ('abc123', sysdate);

-- id는 def123인 회원의 최근접속일은 현재 시각이다 이를 테이블에 추가하라
INSERT INTO USER_ACCESS_DATE 
(USER_ID, LAST_ACCESS_DATE)
VALUES ('def123', sysdate);
--id는 def123, pw는 5555 성별은 M 나이는 25 주소지 미입력
--회원가입일자 2020년 5월 15일, grade는 normal인 회원 정보를 테이블에 추가하라
INSERT INTO TBL_USER 
(USER_ID, USER_PW, USER_GENDER, USER_AGE, JOIN_DATE)
VALUES ('def123', '5555', 'M', 25, to_date('20200515', 'YYYYMMDD'));

SELECT * FROM TBL_USER;

--id는 aaa, pw 0000, 성별은 여성, 나이는 15살 주소지는 미입력상태
-- 회원가입 일자는 200201, grade는 normal, 최근접속일은 210601인 데이터 삽입
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

-- tbl_user 테이블에서 aaa 아이디를 가진 회원이 
-- 본인의 주소지를 서울시 역삼동으로 수정했다
-- 테이블에 알맞은 값을 갱신하여라
UPDATE tbl_user 
SET USER_ADDRESS = '서울시 역삼동'
WHERE USER_ID = 'aaa';

SELECT * FROM TBL_USER tu;

-- 20년도에 회원가입한 회원의 등급을 'vip'로 승격하고자 한다
-- 알맞게 테이블의 값을 갱신하여라
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
-- 행 삭제
DELETE FROM departments
WHERE LOWER(department_name) = 'test';

SELECT * FROM departments;


-- 최근 접속일로부터 현재까지 6개월 이상 접속하지 않은 회원 정보를
-- 삭제하여라
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

--table 생성과 동시에 제약조건 달기
--컬럼수준에서 제약조건 설정하기
--테이블수준에서 제약조건 설정하기

--primary key 제약조건 설정
CREATE TABLE sample2(
	a NUMBER(3) PRIMARY KEY,
	b varchar2(200)
);

-- PK 는 테이블 당 한개만 존재해야한다
--CREATE TABLE sample3(
--	a NUMBER(3) PRIMARY KEY,
--	b varchar2(200) PRIMARY KEY
--);

CREATE TABLE sample3(
	a NUMBER(3),
	b varchar2(200),
	CONSTRAINT sp3_pk PRIMARY KEY (a)
);
-- a 컬럼과 b컬럼을 복합적으로 PK로 사용할 수 있다
CREATE TABLE sample4(
	a NUMBER(3),
	b varchar2(200),
	CONSTRAINT sp4_pk PRIMARY KEY (a, b)
);

--foreign key 제약조건
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

-- foreign key를 설정 할 때는 제공하는 테이블의 컬럼이 
-- UNIQUE 제약조건이 있어야 한다(PRIMARY KEY도 포함됨..)
CREATE TABLE sample8(
	employee_id NUMBER(3) UNIQUE ,
	manager_id number(3) REFERENCES sample8 (employee_id)
);

-- not null
CREATE TABLE sample9(
	a number(3) NOT NULL 
);

-- NOT NULL 제약조건은 테이블 수준에서 달 수 없다
--CREATE TABLE sample10(
--	a number(3),
--	CONSTRAINT sp10_nn NOT NULL (a)
--);

-- UNIQUE 
-- 중복된 값을 허용하지 않는 제약조건
CREATE TABLE sample10(
	a number(3) UNIQUE,
	b date
);

-- 테이블 수준에서 제약조건을 달면 여러개의 컬럼을 복합적으로 적용하게
-- 만들 수 있다
CREATE TABLE sample11(
	a number(3),
	b DATE,
	CONSTRAINT sp11_u1 UNIQUE (a),
	CONSTRAINT sp11_u2 UNIQUE (a, b)
);

--CHECK : 저장될 값의 범위 설정
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

-- 기본값 설정
-- DEFAULT
CREATE TABLE saple14(
	a DATE DEFAULT sysdate,
	b DATE,
	c DATE
);

INSERT INTO saple14
(c)
VALUES (to_date('200202', 'YYMMDD'));

--여러개의 제약 조건을 동시에 달기
--default만 맨 앞에 써주면 되고, 나머지는 순서 관련 없음
CREATE TABLE sample15(
	a number(3) DEFAULT 15 CHECK (a BETWEEN 10 AND 20) UNIQUE NOT NULL
);

--테이블 명 : task
--컬럼명		데이터타입			제약조건
--user_id		varchar2(200)	primary key
--user_pw		varchar2(200)	null값을 허용하지 않음
--user_age	number(3)		0초과의 값만 허용, null값 허용X
--user_email	varchar2(50)	중복X, null값 X
--join_date	date			기본값으로 시스템상 현재 시간, null x
--user_gender	char(1)			M또는 F 둘 중 하나만, null X, 기본값 : F
--manager_id	number(5)		sample8 테이블의 a 컬럼을 받아오는 외래키




