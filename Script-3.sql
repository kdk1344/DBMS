-- 타입변환 함수
-- TO_CHAR()
-- 숫자 --> 문자
-- TO_CHAR(숫자) : 숫자를 문자타입으로 바꿔준다
SELECT TO_CHAR(9454663.248)
FROM dual;

-- TO_CHAR(숫자, '지정형식')
-- 9: 자릿수
-- 0: 빈공간을 0으로 채우기
-- $: $기호
-- L: 지역 화폐 기호
-- .: 지정위치에 소수점 설정
-- ,: 지정 위치에 쉼표 설정
SELECT TO_CHAR(123, 'L099,999,999,999.999') 
FROM dual;

--SELECT TO_CHAR(12345, '999') 
--FROM dual;

-- 사원 임금을 총 5자리, 콤마를 숫자 형식에 알맞게 부여하여 
-- 마지막에 원화표시를 붙여 문자타입으로 출력하라
SELECT TO_CHAR(salary, '99,999L')
FROM employees;

--날짜 --> 문자
-- TO_CHAR(날짜) --> '년년/월월/일일'
SELECT TO_CHAR(sysdate)
FROM dual;

-- TO_CHAR(날짜, '지정형식')
-- Y : 년
-- M : 월
-- D : 일
-- DAY : 요일
-- AM / PM : 오전오후
-- HH : 시간(12시간 형식)
-- HH24 : 시간(24시간 형식)
-- MI : 분
-- SS : 초
SELECT TO_CHAR(sysdate, 'YYYY-MM-DD') 
FROM dual;

SELECT TO_CHAR(sysdate, 'YYMMDD'),
	TO_CHAR(sysdate, 'YYYY/MM.DD DAY PM HH24:MI:SS'),
	TO_CHAR(sysdate, 'YYYY"년"MM"월"DD"일"') -- 특수문자가 아닌 문자를 사용할 때는
										--지정형식이 아니란걸 쌍따옴표를 통해 알려준다
FROM dual;

-- 오늘은 2022/02월23일 수요일 19시 45분
-- 출력하기
SELECT TO_CHAR(sysdate, '"오늘은" YYYY/MM"월"DD"일" DAY HH24"시" MI"분"') 
FROM dual;

-- 사원 중 2005년 9월 28일에 입사한 사람의 모든 컬럼 출력하기
SELECT *
FROM employees 
WHERE TO_CHAR(hire_date, 'YYYY"년" MM"월" DD"일"') = '2005년 09월 28일';

-- 문자 --> 날짜
--TO_DATE(문자, '지정형식')
SELECT TO_DATE('051115', 'YYMMDD') 
FROM dual;

-- 문자 --> 숫자
--TO_NUMBER(문자) , 숫자모양의 문자가 아닐 경우에는 오류 발생
SELECT TO_NUMBER('150')
FROM dual;
-----------------------------------------------------------------
SELECT first_name, manager_id
FROM employees;

-- NVL(컬럼, 값): 해당 컬럼의 NULL값을 값으로 바꾸는 함수 
SELECT first_name, manager_id,
	NVL(manager_id, 100)
FROM employees;

-- NULL값이 연산에 사용될 경우 계산 결과가 NULL값으로 나온다
SELECT salary + salary * commission_pct
FROM employees;

-- 모든 직원의 커미션을 포함연봉 salary 를 출력하여라
SELECT salary,
	NVL(commission_pct, 0),
	salary + salary * NVL(commission_pct, 0)
FROM employees;

-- DECODE(컬럼, 조건값, 조건이참일때값, 조건이거짓일때값) : 조건논리처리
SELECT salary, 
	DECODE(salary, 10000, 0, 20000),
	DECODE(salary, 10000, 11000, salary) 
FROM employees;

-- 부서id가 10인 사람들은 업무를 잘 해서 기존 salary에 10% 인상을 하려 한다
-- 모든 직원이 받게 될 salary를 출력하라
SELECT salary 기본급여, department_id,
	DECODE(department_id, 10, salary*1.1, salary)
FROM employees 
ORDER BY department_id;

SELECT salary 기본급여, department_id 부서,
	DECODE(department_id, 50, salary * 1.1, DECODE(department_id, 80, salary*0.9,salary)) 조정급여
FROM employees
ORDER BY department_id;

-- DECODE() 해석 순서: 겉의 DECODE 조건부터 해석한다
SELECT department_id,
	DECODE(department_id, 50, 'check1', DECODE(department_id,50,'check2','check3')) 
FROM employees
ORDER BY department_id;

-- CASE 표현식
-- 특정 조건에 있는 행의 값을 특정한 값으로 변경할 때 사용할 수 있다
-- 부서가 50은 1.1배, 80 : 0.9배, 나머지는 원래 수령액
SELECT department_id, 
	salary, 
	CASE department_id -- 컬럼의 값이 같은지 비교하는 경우에는 컬럼을 앞에 써줄 수 있다
		WHEN 50 THEN salary *1.1  -- department_id = 50
		WHEN 80 THEN salary * 0.9 -- department_id = 80
		ELSE salary 
	END 조정급여,
	CASE 
		WHEN department_id = 50 THEN '인상됨'
		WHEN department_id = 80 THEN '감축됨'
		ELSE '유지'
	END 비고
FROM employees 
ORDER BY department_id;
	
-- employee_id<=110 인 사원은 salary 0.9배
-- 110 < employee_id <= 120 인 사원은 salary 1.1배
-- 나머지 인 사원은 salary를 받는다
SELECT employee_id, salary,
	ROUND(CASE 
		WHEN employee_id <= 110 THEN salary * 0.9
		WHEN /*employee_id > 110 AND */employee_id <= 120 THEN salary * 1.1
		ELSE salary 
	END) 조정급여
FROM employees
ORDER BY employee_id;

SELECT department_id, salary,
	CASE 
		WHEN department_id = 50 OR department_id = 70 THEN salary * 0.9
		ELSE salary 
	END 
FROM employees
ORDER BY department_id;
---------------------------------------------------------
-- 윈도우 함수 
-- 순위함수
-- RANK() : 순위를 메기되 중복되는 값이 있는 경우 건너띈다
-- DENSE_RANK() : 순위를 메기되 중복되는 값이 있어도 건너뛰지 않는다
-- ROW_NUMBER() : 순위를 메기되 중복되는 값이 업게 메긴다(행번호를 메긴다)
SELECT salary, first_name, 
	RANK() OVER(ORDER BY salary DESC) r,
	DENSE_RANK() OVER(ORDER BY salary DESC) dr,
	ROW_NUMBER() OVER(ORDER BY salary DESC) rn
FROM employees
ORDER BY employee_id;

-- 윈도우 함수는 조건 자리에 사용할 수 없다
--SELECT first_name, salary,
--	RANK() OVER(ORDER BY salary DESC)
--FROM employees 
--WHERE RANK() OVER(ORDER BY salary DESC) <= 10;

-- 그룹별로 묶어서 순위를 파악하고 싶을 때는 partition by를 활용한다
SELECT first_name, department_id, salary,
	RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) r,
	DENSE_RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) dr,
	ROW_NUMBER() OVER(PARTITION BY department_id ORDER BY salary DESC) rn
FROM employees;


