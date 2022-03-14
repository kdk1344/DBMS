-- 사원의 이름과 성, 해당 사원의 매니저 id와 매니저 이름과 성을 출력하라
SELECT a.first_name, 
	a.last_name,
	a.manager_id,
	b.first_name,
	b.last_name
FROM employees a, employees b
WHERE a.manager_id = b.employee_id(+);
-- 집합연산자
-- UNION
SELECT department_id
FROM employees 
ORDER BY department_id;-- NULL, 10, 20, ... 110

SELECT department_id 
FROM departments;		-- 10, 20, ..., 270

-- UNION : 합집합, 중복 제외
SELECT department_id 
FROM employees 
UNION 
SELECT department_id 
FROM departments;
--UNION ALL : 합집합, 중복 허용
SELECT department_id 
FROM employees 
UNION ALL 
SELECT department_id 
FROM departments;
--INTERSECT : 교집합
SELECT department_id 
FROM employees 
INTERSECT 
SELECT department_id 
FROM departments;

--MINUS : 차집합, 앞 뒤 순서가 바뀌면 결과가 바뀐다
SELECT department_id 
FROM employees 
MINUS 
SELECT department_id 
FROM departments;

SELECT department_id 
FROM departments 
MINUS 
SELECT department_id 
FROM employees;



-- first_name이 Joshua인 사람이 받는 봉급과 같은 수준의 봉급을
-- 받는 직원의 모든 정보를 출력하라
SELECT *
FROM employees 
WHERE salary = 2500;

SELECT salary 
FROM employees 
WHERE first_name = 'Joshua';


SELECT *
FROM employees 
WHERE salary = (
	SELECT salary 
	FROM employees 
	WHERE first_name = 'Joshua'
);

-- David가 받는 salary 와 같은 수준의 salary 받는 직원의 모든정보
-- 서브쿼리의 실행 결과가 여러개가 나오기 때문에 
-- 비교연산자(단일행 연산자)에 사용할 수 없다
SELECT *
FROM employees 
WHERE salary = (
	SELECT salary 
	FROM employees 
	WHERE first_name = 'David'
);

SELECT salary 
	FROM employees 
	WHERE first_name = 'David';

-- 다중 행 서브쿼리는 다중행 연산자와 함께 사용이 가능하다
-- IN, ...
SELECT *
FROM employees 
WHERE salary IN (
	SELECT salary 
	FROM employees 
	WHERE first_name = 'David'
);
SELECT *
FROM employees 
WHERE salary IN (4800, 9500, 6800);


-- 전체 직원 연봉의 평균 이상을 받는 직원의 이름과 성을 출력하라
SELECT AVG(salary)
FROM employees;

SELECT first_name, last_name 
FROM employees 
WHERE salary >= (
	SELECT AVG(salary)
	FROM employees
);

-- department_name이 'Sales'인 부서와 department_id가 일치하는 사람의
-- 이름과 성을 출력하시오
SELECT department_id 
FROM departments 
WHERE department_name = 'Sales';

SELECT first_name, last_name
FROM employees 
WHERE department_id = (
	SELECT department_id 
	FROM departments 
	WHERE department_name = 'Sales'
);

-- 다중 열 서브쿼리
-- 부서 별 최소 봉급을 받는 직원의 이름과 봉급 출력하기
SELECT department_id, MIN(salary)
FROM employees 
GROUP BY department_id;

SELECT first_name, last_name, salary 
FROM employees 
WHERE (department_id, salary) IN (
	SELECT department_id, MIN(salary)
	FROM employees 
	GROUP BY department_id
);
-- 이런 방식으로 해석한다
--SELECT first_name, last_name, salary 
--FROM employees 
--WHERE (department_id, salary) IN (100, 6900);
--									30,  2500
--									NULL,7000
--									...
--입사동기별 최소봉급을 받는 사람의 이름과 성, 입사일, 봉급을
-- 입사일 오름차순으로 출력
SELECT hire_date, min(salary)
FROM employees 
GROUP BY hire_date;

SELECT first_name, last_name, hire_date, salary 
FROM employees 
WHERE (hire_date, salary) IN (
	SELECT hire_date, min(salary)
	FROM employees 
	GROUP BY hire_date
);

-- 같은 봉급을 받는 사람 별 제일 늦게 들어온 사람의 이름과 성, 입사일 봉급을
--봉급 내림차순으로 출력하시오
SELECT salary, max(hire_date)
FROM employees
GROUP BY salary;

SELECT first_name, last_name, hire_date, salary 
FROM employees 
WHERE (salary, hire_date) IN (
	SELECT salary, max(hire_date)
	FROM employees
	GROUP BY salary
);


-- 부서 별 연봉 상위 3명의 이름, 성, department_id, salary, 순위 출력하라
SELECT first_name, last_name, department_id, salary, 
	RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) r
FROM employees;

-- 서브쿼리가 테이블 자리에 사용된다면 해당 서브쿼리 사용의 결과를 가상의 테이블이라고 생각한
-- 후 사용하면 된다
SELECT first_name, last_name, department_id, salary, r
FROM (
	SELECT first_name, last_name, department_id, salary, 
		RANK() OVER (PARTITION BY department_id ORDER BY salary DESC) r
	FROM employees
) temp
WHERE r <= 3;
-------------------------------------------------
-- INSERT 데이터 삽입하기
INSERT INTO departments 
VALUES (271, 'TEST', 101, 1700);

SELECT * FROM departments;

ROLLBACK;
COMMIT;

-- 컬럼 이름을 명시적으로 써주면 가독성을 높일 수 있다 권장
INSERT INTO departments 
(department_id, location_id, manager_id, department_name)
VALUES (272, NULL, NULL, 'TEST');

COMMIT;

-- 컬럼이름이 명시적으로 써있을 경우 생략이 가능하며
-- 생략했을 경우 기본값으로 설정된 값이 들어간다
INSERT INTO departments 
(department_id, department_name)
VALUES (273, 'Test');

COMMIT;

CREATE TABLE TBL_USER(
   user_id varchar2(30) NOT NULL PRIMARY KEY,
   user_pw varchar2(30) NOT NULL,
   user_gender char(1) NOT NULL,
   user_age number(3) NOT NULL,
   user_address varchar2(30),
   join_date DATE,
   grade varchar2(10) DEFAULT 'normal' NOT NULL
);
CREATE TABLE USER_ACCESS_DATE(
   user_id varchar2(30) PRIMARY KEY,
   last_access_date DATE DEFAULT sysdate NOT NULL,
   CONSTRAINT access_date_fk FOREIGN KEY(user_id)
   REFERENCES TBL_USER(user_id)
);





