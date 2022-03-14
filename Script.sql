-- 주석 : 컴퓨터가 해석하지 않는다
-- 설명을 달아주는 주석
/*
 * 여러줄에
 * 걸쳐서
 * 주석처리
 * 
 */



SELECT fiRSt_Name 
FROM employees;

-- 여러개의 컬럼을 동시에 조회하기
SELECT first_name, last_name
FROM employees;

-- * : 모든(all)
SELECT * 
FROM employees;

-- 사원 이름, 사원 성, 연봉을 출력하라
SELECT first_name, last_name, salary
FROM employees;

-- ORDER BY : 정렬
SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary DESC; -- salary 컬럼을 기준으로 내림차순 정렬

SELECT first_name, last_name, salary 
FROM employees 
ORDER BY salary ASC; -- salary 컬럼을 기준으로 오름차순 정렬

SELECT first_name, last_name, salary 
FROM employees 
ORDER BY first_name;-- ASC 는 생략이 가능하다
--문자 데이터의 경우에는 알파벳 순서에 따라 정렬이 된다

SELECT first_name, last_name, hire_date
FROM employees 
ORDER BY hire_date;-- 날짜 데이터의 경우에는 시간 순서에 따라 정렬이 된다

-- ORDER BY 절에 여러개의 컬럼이 쓰여있을 경우
-- 앞쪽 컬럼부터 정렬이 진행되고, 뒤에 컬럼에 정렬이 적용된다
SELECT first_name, 
	last_name, 
	hire_date,
	salary 
FROM employees 
ORDER BY salary ASC, hire_date DESC;
-- 꼭 정렬의 기준이 되는 컬럼을 출력할 필요는 없다
SELECT first_name, last_name 
FROM employees 
ORDER BY salary;

-- DISTINCT : 중복된 값은 제외하여 출력할 때 사용한다
SELECT DISTINCT salary
FROM employees
ORDER BY salary;

-- DISTINCT 에 여러 컬럼이 적혀있을 경우 해당 컬럼들을 복합적으로 고려하여 적용한다
SELECT DISTINCT job_id, hire_date 
FROM employees;

-- 컬럼이름에 별칭(alias) 설정하기
SELECT first_name "이름", -- AS 는 생략이 가능하다
	last_name AS 성, -- 쌍따옴표는 생략이 가능하다
	employee_id AS "사원 번호",-- 띄어쓰기가 있을 경우 쌍따옴표 생략 불가능
	salary 봉급 -- AS 와 쌍따옴표 모두 생략 가능
FROM employees;
-- 별칭을 설정한 경우 별칭 이름으로 정렬을 할 수 있다
SELECT salary 봉급
FROM employees 
ORDER BY 봉급;

----------------------------------------
--연산자
-- 연결연산자 || 
SELECT first_name 이름, last_name 성, first_name || last_name 성함
FROM employees
ORDER BY 성함;

-- 문자 || 숫자 --> 연결된 문자
SELECT first_name || salary 
FROM employees;

-- 숫자 || 숫자 --> 연결된 문자
SELECT salary || employee_id 
FROM employees;

-- 날짜 || 숫자 --> 연결된 문자
SELECT hire_date || salary 
FROM employees;

-- 문자 데이터 라는 것을 알려주기 위해서 작은 따옴표로 감싸준다
-- 작은따옴표가 감싸져있으면 문자타입의 값이라는 의미
SELECT first_name || '님'
FROM employees;

-- dual 테이블 : 값을 확인할 때 사용하는 테이블
-- 다른 테이블을 참고할 필요가 없을 때 사용한다
SELECT '안녕' || '하세요'
FROM dual;

SELECT first_name || ' ' || last_name 성함
FROM employees;

-- 이름과 성을 띄어쓰기로 연결한 컬럼은 성함이라는 별칭으로,
-- 사원 이메일 주소는 이메일@koreait.com 으로, 이메일 주소 라는 별칭을 주어 출력하라
SELECT first_name || ' ' || last_name 성함,
	email || '@koreait.com' "이메일 주소"
FROM employees;

--산술연산자
SELECT salary,
	salary + 10,
	salary - 10,
	salary * 10,
	salary / 3
FROM employees;

-- 문자타입 데이터에서는 사용 불가능
-- 날짜 +- 숫자 : 해당 날짜에서 일수만큼 더해지거나 빼진다
SELECT hire_date, 
	hire_date + 10,
	hire_date - 10,
	hire_date + 1/24/60 -- 시 분 초는 일로 환산하여 써준다
FROM employees;
-- * / 사용 불가

-- sysdate : 시스템상의 현재 시간을 나타내는 명령어
SELECT sysdate 
FROM dual;

-- 날짜 - 날짜 --> 숫자, 일수
SELECT sysdate,
	hire_date,
	sysdate - hire_date 
FROM employees;

-- 사원들이 입사한 후 100일 뒤에는 원래 봉급에서 10% 인상한 보너스를 준다
-- 이때 사원들의 성함, 원래봉급, 보너스 봉급, 보너스봉급 수령일을 
-- 보너스 봉급이 높은 순서부터 출력하라
SELECT first_name || ' ' || last_name 성함,
	salary 원래봉급,
	salary * 1.1 "보너스 봉급",
	hire_date + 100 "보너스봉급 수령일"
FROM employees;

SELECT first_name, salary 
FROM employees 
ORDER BY salary DESC;

