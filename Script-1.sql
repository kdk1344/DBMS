-- 전체화면 모드 : ctrl + m

-- WHERE절
-- salary가 5000이상인 사람들의 first_name, last_name 데이터 조회하기
SELECT first_name, last_name, salary--3 first_name, last_name, salary에 해당하는 값을 조회하겠다
FROM employees 						--1 employees 테이블에서
WHERE salary >= 5000;				--2 salary가 5000 이상인 행만 골라낸 후

-- first_name이 David인 사람의 
-- first_name, last_name, salary를 출력하시오
-- 값은 대문자 소문자 구분에 유의해야한다
SELECT first_name, last_name, salary 
FROM employees 
WHERE first_name = 'David';

-- WHERE 절과 ORDER BY 절을 동시에 사용하는 경우
-- ORDER BY를 WHERE 뒤에 작성한다
SELECT first_name, last_name, salary--3 first_name, last_name, salary컬럼을
FROM employees 						--1 employees 테이블 에서
WHERE first_name = 'David'			--2 first_name이 'David'인 행만 골라낸 후
ORDER BY salary DESC;				--4 salary 내림차순으로 정렬하여 조회하라

-- 드래그 , ctrl + / : 주석
--SELECT first_name, salary 봉급
--FROM employees 
--WHERE 봉급 >= 5000; --별명을 설정하기 이전이기 때문에 별칭 적용 불가능

--직원 first_name이 David가 아닌 모든 행의 모든 컬럼 조회하기
SELECT * 
FROM employees 
WHERE first_name <> 'David';


-- 논리연산자
-- 여러개의 조건을 연결할 때 사용한다

-- first_name이 David 이면서 동시에 salary가 5000이상인 행들 중
-- first_name, salary를 출력하라
SELECT first_name, salary 
FROM employees 
WHERE first_name = 'David' 
AND salary >= 5000;

-- first_name이 David인 사람 혹은 salary가 10000 이상인 사람의
-- first_name과 salary를 출력하라
SELECT first_name, salary 
FROM employees 
WHERE first_name = 'David' 
OR salary >= 10000
ORDER BY salary;

-- NOT 조건 --> 해당 조건을 만족하지 않는 경우에만
SELECT first_name, salary 
FROM employees 
WHERE NOT first_name = 'David';

-- 예제
-- first_name, last_name, salary 컬럼을 출력
-- salary 5000 이상, 10000 이하인 사람들 중에서
SELECT first_name, last_name, salary, salary * 1.1 보너스
FROM employees 
WHERE salary >= 5000 
AND salary <= 10000
ORDER BY salary;


-- first_name인 Julia 혹은 David 혹은 Alexis 인 사람들의 
-- first_name, salary
SELECT first_name, salary 
FROM employees 
WHERE first_name = 'Julia' 
OR first_name = 'David' 
OR first_name = 'Alexis';

-- SQL연산자
--BETWEEN a AND b : a 이상 b이하인 조건
--salary가 5000이상 10000이하인 사람들
SELECT first_name, salary 
FROM employees 
WHERE salary BETWEEN 5000 AND 10000
ORDER BY salary;


-- 이름이 줄리아 데이비드 알렉시스인 사람들 중에서 5000이상 10000이하인 사람들
SELECT first_name, salary 
FROM employees 
WHERE (first_name = 'Julia' OR first_name = 'David' OR first_name = 'Alexis') 
AND salary BETWEEN 5000 AND 10000;

--IN (값, 값, 값,...) : 값들 중 하나인 조건
SELECT first_name, salary 
FROM employees 
WHERE first_name IN ('David', 'Julia', 'Alexis');

--LIKE

-- % : ~이라 해석한다
SELECT first_name 
FROM employees 
WHERE first_name LIKE '%en%';

SELECT first_name 
FROM employees 
WHERE first_name LIKE '%en';

SELECT first_name 
FROM employees 
WHERE first_name LIKE '%e%n%';

-- _ : 자릿수
SELECT first_name 
FROM employees 
WHERE first_name LIKE '___en';

-- IS NULL : 널값인 조건
SELECT first_name, manager_id 
FROM employees 
WHERE manager_id IS NULL;

-- IS NOT NULL : 널값이 아닌 조건
SELECT first_name, manager_id 
FROM employees 
WHERE manager_id IS NOT NULL;

-- 복사 : 드래그, ctrl + alt + 아래화살표
-- 옮기기 : 드래그, ctrl + shift + 위아래화살표

-- 상위 n개의 데이터
-- rownum : 오라클에서 행 번호를 관리하는 이름
SELECT * 
FROM employees 
WHERE rownum <= 10
ORDER BY salary;


SELECT rownum, first_name 
FROM employees
WHERE rownum <= 10
ORDER BY salary;

---------------------------------------------------------
-- 단일 행 함수
-- 문자타입 함수
-- LOWER(), UPPER(), INITCAP()
SELECT LOWER('ADFSDF') 
FROM dual;

SELECT first_name 기준,
	LOWER(first_name),
	UPPER(first_name)
FROM employees;

SELECT first_name, salary 
FROM employees 
WHERE LOWER(first_name) = 'david';

SELECT email,
	INITCAP(email)
FROM employees;

-- SUBSTR(문자, 시작, 끝) : 해당 문자를 시작부터 끝까지 잘라준다
SELECT SUBSTR(job_id, 1, 2)
FROM employees;

-- REPLACE(문자에서, 문자를, 문자로) : 문자를 바꿔주는 함수
SELECT job_id , REPLACE(job_id, 'IT', 'a')
FROM employees;

-- CONCAT(문자, 문자) : 문자와 문자를 연결해주는 함수
SELECT CONCAT(first_name, ' '),
	CONCAT(CONCAT(first_name, ' '), last_name)
FROM employees;

-- LENGTH(문자) : 문자의 길이를 알려주는 함수
SELECT email, 
	LENGTH(email),
	LENGTH(email) + 3
FROM employees;

-- first_name과 last_name과 email을 출력할 계획이다
-- 개인정보 보호를 위해 email은 뒤에서 세글자를 제외한 후 출력하고자 한다
-- ex) ABANDA --> ABA




