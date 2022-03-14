--user_tab_privs_made : 부여 한 권한 보기
SELECT * FROM user_tab_privs_made;

-- GRANT : 권한 부여, TO 를 사용한다
GRANT SELECT ON employees TO user01;

-- REVOKE : 권한 회수, FROM을 사용한다
REVOKE SELECT ON employees FROM user01;
REVOKE INSERT, DELETE ON employees FROM user01;

--계층관계가 저장되어있는 테이블 만들기
CREATE TABLE emp(
	이름 varchar2(50) PRIMARY KEY,
	직급 varchar2(50),
	상사 varchar2(50),
	CONSTRAINT emp_fk FOREIGN KEY (상사) REFERENCES emp (이름)
);

INSERT INTO emp 
VALUES ('김철수', '사장', null);

INSERT INTO emp 
VALUES ('유재석', '부장', '김철수');

INSERT INTO emp 
VALUES ('박명수', '과장', '유재석');

INSERT INTO emp 
VALUES ('정준하', '과장', '유재석');

INSERT INTO emp 
VALUES ('정형돈', '대리', '정준하');

INSERT INTO emp 
VALUES ('하하', '사원', '정형돈');

INSERT INTO emp 
VALUES ('노홍철', '사원', '정형돈');
--계층형 질의(쿼리)
SELECT 이름, 직급, 상사
FROM emp 
START WITH 상사 is NULL 
CONNECT BY PRIOR 이름 = 상사;
-- PRIOR 부모 = 자식 : 부모노드 -> 자식노드순서(순방향)

SELECT 이름, 직급, 상사
FROM emp 
START WITH 이름 = '하하'
CONNECT BY PRIOR 상사 = 이름;
-- PRIOR 자식 = 부모 : 자식노드 -> 부모노드 순서대로진행(역방향)

--가상 컬럼
SELECT LEVEL, 이름, 직급, 상사, connect_by_isleaf
FROM emp 
START WITH 상사 is NULL 
CONNECT BY PRIOR 이름 = 상사;

-- connect_by_iscycle : NOCYCLE을 사용했을때만 사용 가능하다

-- 함수
--sys_connect_by_path(컬럼명, 연결문자)
--connect_by_root(컬럼명)

SELECT 이름, 직급, 상사,
	SYS_CONNECT_BY_PATH(이름, '/'),
	connect_by_root(이름)
FROM emp 
START WITH 상사 IS NULL 
CONNECT BY PRIOR 이름 = 상사;




