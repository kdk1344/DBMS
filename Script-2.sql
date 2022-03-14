-- first_name과 last_name과 email을 출력할 계획이다
-- 개인정보 보호를 위해 email은 뒤에서 세글자를 제외한 후 출력하고자 한다
-- ex) ABANDA --> ABA
-- ABCDEFGHI --> ABCDEF
SELECT first_name, 
	last_name, 
	email, 
	LENGTH(email),
	SUBSTR(email, 1, LENGTH(email) - 3)
FROM employees;

-- INSTR(문자1, 문자2) --> 문자1 안에서 문자2의 위치를 알려주는 함수
SELECT INSTR('apple', 'l')
FROM dual;

-- 중복되는 문자가 있을 경우 가장 앞에 존재하는 문자의 위치를 알려준다
SELECT INSTR('apple', 'p')
FROM dual;

-- 한 글자가 아니더라도 위치를 찾을 수 있으며, 앞쪽에 등장하는 문자를 기준으로 위치를 알려준다
SELECT INSTR('apple', 'pl') 
FROM dual;

-- INSTR(문자1, 문자2, 숫자) : 문자1에서 문자2를 해당 숫자부터 찾기 시작한다
SELECT INSTR('apple', 'p', 3)
FROM dual;

-- 만약에 없는 문자를 찾는 경우에는 0이 결과로 나온다
SELECT INSTR('apple', 'k')
FROM dual;

-- 'fsdojiofwogwoh' 두번째 o가 존재하는 위치를 출력하시오
SELECT INSTR('fsdjiofwogwoh', 'o'),
	INSTR('fsdjiofwogwoh', 'o', INSTR('fsdjiofwogwoh', 'o')+1)
FROM dual;

SELECT first_name, INSTR(first_name, 'o'),
	INSTR(first_name, 'o', INSTR(first_name, 'o') + 1) 
FROM employees;

SELECT first_name 
FROM employees 
WHERE INSTR(first_name, 'o', INSTR(first_name, 'o') + 1) <> 0;


-- RTRIM(문자1, 문자2) : 문자1에서 문자2를 오른쪽부터 지워나간다
-- LTRIM(문자1, 문자2) : 문자1에서 문자2를 왼쪽부터 지워나간다
SELECT RTRIM('eeeabcedfeee', 'e'),
	LTRIM('eeeabcedfeee', 'e'),
	RTRIM('   ab  cd   '), -- 지울 문자를 생략하면 띄어쓰기가 지워진다
	LTRIM('   ab  cd   ')
FROM dual;

-- TRIM(문자) : 해당 문자의 양쪽 띄어쓰기를 제거해주는 함수
SELECT TRIM('   ab   ef   ')
FROM dual;

--RPAD(문자1, 숫자, 문자2) : 문자1의 자릿수를 숫자로 만든 뒤, 오른쪽 빈 공간을 문자2로 채우는 함수
--LPAD(문자1, 숫자, 문자2) : 문자1의 자릿수를 숫자로 만든 뒤, 왼쪽 빈 공간을 문자2로 채우는 함수
SELECT RPAD('apple', 10, '!'),
	LPAD('apple', 10, '!')
FROM dual;

-- 직원들의 이메일에서 앞의 두글자만 떼어내서 출력하되 나머지 글자는 *로 표시하여 출력하기
-- ex) ABANDA --> AB****@koreait.com
-- 범위주석 단축키 : 드래그, ctrl + shift + /
SELECT /*email,
	SUBSTR(email, 1, 2),
	RPAD(SUBSTR(email, 1, 2), LENGTH(email), '*'),*/
	CONCAT(RPAD(SUBSTR(email, 1, 2), LENGTH(email), '*'), '@koreait.com') 이메일주소 
FROM employees;

------------------------------------------------------------------------------
--숫자타입 함수
-- ROUND(숫자1, 숫자2) : 숫자1을 반올림하여 숫자2 자릿수까지 표현하는 함수
SELECT ROUND(13.512, -1), -- 10의자리까지 반올림
	ROUND(13.512),  -- 생략 시에는 정수까지 반올림
	ROUND(13.512, 0),  -- 1의자리까지 반올림
	ROUND(13.512, 1),  -- 소수점아래1자리까지 반올림
	ROUND(13.512, 2)   -- 소수점아래2자리까지 반올림
FROM dual;

-- TRUNC(숫자1, 숫자2) : 숫자1을 잘라내어 숫자2까지 표현하는 함수
SELECT TRUNC(16.512, -1),
	TRUNC(16.512, 0),
	TRUNC(16.512),
	TRUNC(16.512, 1),
	TRUNC(16.512, 2) 
FROM dual;

--FLOOR(숫자) : 해당 숫자를 정수로 내림하는 함수
--CEIL(숫자) : 해당 숫자를 정수로 올림하는 함수
SELECT FLOOR(13.512),
	CEIL(13.012)
FROM dual;

SELECT TRUNC(13.5),
	FLOOR(13.5),
	TRUNC(-15.5),
	FLOOR(-15.5) 
FROM dual;
-- SIGN(숫자) : 해당 값의 부호를 알려주는 함수, 양수 : 1, 음수 : -1, 0 : 0 이 결과로 나온다
SELECT SIGN(15),
	SIGN(-15),
	SIGN(0) 
FROM dual;

-- MOD(숫자1, 숫자2) : 숫자1을 숫자2로 나누었을 때 나머지
SELECT MOD(10, 3) 
FROM dual;

-- POWER(숫자1, 숫자2) : 숫자1의 숫자2거듭제곱(승)의 결과를 연산한다
SELECT POWER(10, 3)
FROM dual;

-- SQRT(숫자) : square root, 해당 숫자의 제곱근을 구한다
SELECT SQRT(100)
FROM dual;

----------------------------------------------------------------
-- 날짜타입함수

-- MONTHS_BETWEEN(날짜1, 날짜2) : 날짜2에서 날짜1까지 몇개월이 지났는지 숫자타입으로 알려주는 함수
-- 입사한 날로부터 현재까지 몇개월이 지났는지
SELECT hire_date, sysdate,
	TRUNC(MONTHS_BETWEEN(sysdate, hire_date))
FROM employees;

--ADD_MONTH(날짜, 숫자) : 해당 날짜에 개월을 더한다, 결과 : 날짜타입
-- 31일 인 경우 마지막 날로 결과가 나온다 ex) 3/31 --> 4/30
SELECT sysdate,
	ADD_MONTHS(sysdate, 1)
FROM dual;

--SELECT * 
--FROM employees
--WHERE salary = '10000'; -- '10000' : 문자타입의 값인데 컴퓨터가 스스로 숫자타입으로 바꾸어 연산이 된다

-- NEXT_DAY(날짜, 요일) --> 해당 날짜로부터 돌아오는 요일이 며칠인지 알려주는 함수
-- 요일 : 1 :일요일 ~ 7 : 토요일
SELECT sysdate,
	NEXT_DAY(sysdate, 2)
FROM dual;

SELECT sysdate,
	NEXT_DAY(sysdate, '금요일') 
FROM dual;

SELECT sysdate,
	NEXT_DAY(sysdate, '금')
FROM dual;

-- 모든 직원들은 입사한 후 월요일에는 직원 교육을 받는다
-- 직원들의 이름, 입사일, 교육일자, 입사후 며칠만에 교육을 받는지 출력하라
SELECT first_name 이름, 
	hire_date 입사일,
	NEXT_DAY(hire_date, '월') 교육일,
	NEXT_DAY(hire_date, '월') - hire_date 
FROM employees;

-- 입사한 후 지금까지 직원들 몇년차가 되었는지 출력하라
--SELECT TRUNC((sysdate - hire_date) / 365)
SELECT TRUNC(MONTHS_BETWEEN(sysdate, hire_date) / 12 )
FROM employees;


-- LAST_DAY(날짜) : 해당 월의 마지막 날짜를 계산한다
SELECT hire_date,
	LAST_DAY(hire_date)
FROM employees
ORDER BY hire_date;

-- ROUND(날짜, 자릿수), TRUNC(날짜, 자릿수)
SELECT sysdate,
	ROUND(sysdate, 'year'), -- 년도까지 반올림 (월에서 반올림)
	ROUND(sysdate, 'month'),-- 월까지 반올림 (일에서 반올림)
	ROUND(sysdate, 'dd'), -- 일까지 반올림(시간에서 반올림)
	TRUNC(sysdate, 'year'),-- 년도까지 절삭(월 이하는 절삭)
	TRUNC(sysdate, 'month'),-- 월까지 절삭(일 이하는 절삭)
	TRUNC(sysdate, 'dd') -- 일까지 절삭(시간이하는 절삭)
FROM dual;

SELECT first_name, 
	/*hire_date,
	TRUNC(sysdate, 'year'),
	TRUNC(hire_date, 'year'),
	MONTHS_BETWEEN(TRUNC(sysdate, 'year') , TRUNC(hire_date, 'year')),
	MONTHS_BETWEEN(TRUNC(sysdate, 'year') , TRUNC(hire_date, 'year'))/12,*/
	MONTHS_BETWEEN(TRUNC(sysdate, 'year') , TRUNC(hire_date, 'year'))/12 +1 년차
FROM employees
ORDER BY 년차;
--------------------------------------------------------------------------








