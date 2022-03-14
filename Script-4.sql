-- 집계함수 그룹함수
-- COOUNT()
SELECT COUNT(salary)
FROM employees;

-- NULL값은 무시한다
SELECT COUNT(commission_pct)
FROM employees;

-- *을 사용하면 테이블에 존재하는 모든 행의 갯수를 알려준다
SELECT COUNT(*)
FROM employees;

--SUM()
-- 집계함수는 NULL값을 무시한다
SELECT SUM(salary)
FROM employees;

SELECT SUM(commission_pct) / COUNT(commission_pct) 
FROM employees;

-- 집계함수는 NULL값을 제외하고 연산하기 때문에
-- NULL값도 포함해서 다루어야 한다면 NVL()을 활용하여 특정값으로 변경한 후 사용한다
SELECT SUM(NVL(commission_pct, 0)) / COUNT(*)
FROM employees;

-- AVG() 
-- 35명에 대한 평균
SELECT AVG(commission_pct) 
FROM employees;

-- 107명에 대한 평균
SELECT AVG(NVL(commission_pct, 0))
FROM employees;

-- MAX(), MIN()
SELECT MAX(salary),
	MIN(salary)
FROM employees;

-- GROUP BY : 그룹화하여 그룹별로 집계함수가 적용된다
-- department_id 별로 총salary, 평균salary, 최대salary, 최소salary
SELECT department_id,
	SUM(salary),
	AVG(salary),
	MAX(salary),
	MIN(salary)
FROM employees
WHERE department_id IS NOT NULL 
GROUP BY department_id
ORDER BY department_id;

-- department_id 중에서도 manager_id별로 그룹화
-- GROUP BY 대그룹, 중그룹, 소그룹,.....
SELECT department_id, manager_id,
	AVG(salary)
FROM employees 
WHERE department_id IS NOT NULL 
GROUP BY department_id, manager_id 
ORDER BY department_id;

-- 그룹함수는 WHERE 절에서 사용할 수 없다
--SELECT department_id,
--	SUM(salary)
--FROM employees 
--WHERE SUM(salary) > 7000
--GROUP BY department_id;

-- HAVING 절 : 그룹함수를 조건에 적용하고 싶을 때 사용한다
SELECT department_id,
	SUM(salary) 봉급총합
FROM employees 
GROUP BY department_id; 
-- GROUP BY와 HAVING절은 서로 위치가 바뀌어도 무관하나
-- 논리적으로 그룹화를 한 뒤에 조건을 설정하는 것이 읽기 쉽다
SELECT department_id,	-- 5 department_id와 그룹별salary총합을
	SUM(salary) 봉급총합
FROM employees 			--1 employees 테이블에서
WHERE employee_id > 110	--2 employee_id 가 110 초과인 행들만 골라내고
GROUP BY department_id 	--3 department_id별로 그룹화 하여
HAVING SUM(salary) > 7000--4 그룹별 salary 총합이 7000초과인 행들만
ORDER BY department_id;  --6 department_id 오름차순으로 조회하겠다
--------------------------------------------------
--내부조인 동등조인
--사원의 이름과 성, 부서명 을 출력
SELECT first_name, last_name, department_name
FROM employees, departments
WHERE employees.department_id = departments.department_id;

-- 테이블을 여러개 참조해야 하는 경우에는 alias를 설정하면 보다 쉽게
-- 사용할 수 있다
-- 컬럼이름에서 모호성이 발생할 수 있다 따라서 어떤 테이블에 속한 컬럼인지
-- 명시적으로 표현하는 것이 바람직하다
SELECT e.first_name, 
	e.last_name, 
	e.department_id, 
	d.department_name
FROM employees e, departments d 
WHERE e.department_id = d.department_id;

-- 각 부서 명과 부서 별 관리자 이름과 성을 출력하라
SELECT d.DEPARTMENT_NAME, e.FIRST_NAME ,e.LAST_NAME 
FROM departments d, employees e
WHERE d.MANAGER_ID = e.EMPLOYEE_ID;


-- 외부조인 : 값이 꼭 일치하지 않더라도 조회한다
-- left outer join
SELECT d.DEPARTMENT_NAME , e.FIRST_NAME , e.LAST_NAME 
FROM departments d, employees e
WHERE d.MANAGER_ID = e.EMPLOYEE_ID(+);

-- right outer join
SELECT d.DEPARTMENT_NAME , e.FIRST_NAME , e.LAST_NAME 
FROM departments d, employees e
WHERE d.MANAGER_ID(+) = e.EMPLOYEE_ID;



-- Finance 부서에 속한 직원의 이름과 성을 출력하라
SELECT e.first_name, e.last_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_name = 'Finance'
ORDER BY e.employee_id DESC;

-- ANSI 방식 내부 조인 
SELECT e.first_name, e.last_name, d.department_name
FROM employees e
INNER JOIN departments d ON (e.department_id = d.department_id)
WHERE e.employee_id > 110;

-- ANSI 방식 외부 조인
SELECT d.department_name, e.first_name, e.last_name
FROM departments d
LEFT OUTER JOIN employees e ON (d.manager_id = e.employee_id);









