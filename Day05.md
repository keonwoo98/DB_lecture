# **Sort Data**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 데이터 줄 세우기**

**`ORDER BY`**
* 가져온 데이터를 정렬해주는 키워드
* 형식 : `ORDER BY [컬럼 이름]`
* 입력한 [컬럼 이름]의 값을 기준으로 모든 row 정렬
* 기본 정렬 규칙은 오름차순
	* `ORDER BY [컬럼 이름]` = `ORDER BY [컬럼 이름] ASC`
* 내림차순 정렬
	* `ORDER BY [컬럼 이름] DESC`
* 여러 컬럼으로 정렬 시엔, [컬럼 이름]을 복수 개로 입력
	* `ORDER BY [컬럼 1], [컬럼 2]`는 [컬럼 1] 기준으로 정렬 후 동일한 row 간에 [컬럼 2] 기준으로 정렬
* 컬럼 번호로도 정렬 가능
	* 컬럼 번호는 `SELECT`절의 컬럼 이름의 순서를 의미


**오름차순 정렬**

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [조건식]
ORDER BY [컬럼 이름] ASC(생략 가능);
```

**내림차순 정렬**

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [조건식]
ORDER BY [컬럼 이름] DESC;
```

**컬럼 번호를 이용한 정렬 예시**

```SQL
SELECT [컬럼 1], [컬럼 2], [컬럼 3], [컬럼 4]
FROM [테이블 이름]
WHERE [조건식]
ORDER BY 3 DESC, 4;
```

## **2. 데이터 순위 만들기**

**`RANK`**
* 데이터를 정렬해 순위를 만들어주는 함수
* 형식 : `RANK() OVER (ORDER BY [컬럼 이름])`
* `ORDER BY`와 함께 사용
* `SELECT`절에 사용하며, 정렬된 순서에 순위를 붙인 새로운 컬럼을 보여준다.
	* 테이블의 실제 데이터에는 영향을 미치지 않는다.

```SQL
SELECT [컬럼 이름], ..., RANK() OVER (ORDER BY [컬럼 이름])
FROM [테이블 이름]
WHERE [조건식];
```

**RANK와 비슷한 기능의 함수들**

|함수|기능|
|:--:|:--:|
|RANK|공동 순위가 있으면 다음 순서로 건너 뜀|
|DENSE_RANK|공동 순위가 있어도 다음 순서를 뛰어 넘지 않음|
|ROW_NUMBER|공동 순위를 무시함|

## **3. 문자형 데이터**

MySQL 내의 다양한 타입의 데이터는 '함수'를 사용하여 변형할 수 있다.

**함수란?**
* `f(x) = y`
* `f` : function, 함수 이름
* `x` : input, 함수를 적용할 값 또는 컬럼 이름
* `y` : output, 함수를 적용한 결과 값
* 예시 : `LENGTH("abc") = 3`

> 아래 예시들에서 "ABC"에는 보통 컬럼 이름 또는 다른 함수가 들어감

**`LOCATE`**
* 예시 : `LOCATE("A", "ABC")`
	* "ABC"에서 "A"는 몇 번째 위치에 있는지 검색해 위치 반환
* 문자가 여러 개 라면 **가장 먼저 찾은 문자의 위치**를 가져온다.
* 만약 찾는 문자가 없다면 **0**을 가져온다.

**`SUBSTRING`**
* 예시 : `SUBSTRING("ABC", 2)`
	* "ABC"에서 2번째 문자부터 반환
* 만약 입력한 숫자가 문자열의 길이보다 크다면 아무것도 가져오지 않는다.

**`RIGHT`**
* 예시 : `RIGHT("ABC", 1)`
	* "ABC"에서 오른쪽 1번째 문자까지 반환

**`LEFT`**
* 예시 : `LEFT("ABC", 1)`
	* "ABC"에서 왼쪽에서 1번째 문자까지 반환

**`UPPER`**
* 예시 : `UPPER("abc")`
	* "abc"를 대문자로 바꿔 반환

**`LOWER`**
* 예시 : `LOWER("ABC")`
	* "ABC"를 소문자로 바꿔 반환

**`LENGTH`**
* 예시 : `LENGTH("ABC")`
	* "ABC"의 글자 수를 반환

**`CONCAT`**
* 예시 : `CONCAT("ABC", "DEF")`
	* "ABC" 문자열과 "DEF" 문자열을 합쳐 반환

**`REPLACE`**
* 예시 : `REPLACE("ABC", "A", "Z")`
	* "ABC"의 "A"를 "Z"로 바꿔 반환

## **4. 숫자형 데이터**

**`ABS`**
* 숫자의 절대값 반환
* 형식 : `ABS(숫자)`
* `FLOAT` 데이터 타입은 입력 값의 근사치를 저장

**`CEILING`**
* 숫자를 정수로 올림해서 반환
* 형식 : `CEILING(숫자)`

**`FLOOR`**
* 숫자를 정수로 내림해서 반환
* 형식 : `FLOOR(숫자)`

**`ROUND`**
* 숫자를 소수점 자릿수까지 반올림해서 반환
* 형식 : `ROUND(숫자, 자릿수)`
* 자릿수에 0 입력 시 소수점 없이 정수만 반환

**`TRUNCATE`**
* 숫자를 소수점 자릿수까지 버림해서 반환
* 형식 : `TRUNCATE(숫자, 자릿수)`
* 자릿수에 0 입력 시 소수점 없이 정수만 반환

**`POWER`**
* 숫자A의 숫자B 제곱 반환
* 형식 : `POWER(숫자A, 숫자B)`

**`MOD`**
* 숫자A를 숫자B로 나눈 나머지 반환
* 형식 : `MOD(숫자A, 숫자B)`
* 2로 나누면 짝수인지 홀수인지 확인 가능

## **5. 날짜형 데이터**

**`NOW`**
* 현재 날짜와 시간 반환
* 형식 : `NOW()`
* 입력값 필요 없음

**`CURRENT_DATE`**
* 현재 날짜 반환
* 형식 : `CURRENT_DATE()`
* 입력값 필요 없음

**`CURRENT_TIME`**
* 현재 시간 반환
* 형식 : `CURRENT_TIME()`
* 입력값 필요 없음

**`YEAR`**
* 날짜의 연도 반환
* 형식 : `YEAR(날짜)`

**`MONTH`**
* 날짜의 월 반환
* 형식 : `MONTH(날짜)`

**`MONTHNAME`**
* 날짜의 월을 영어로 반환
* 형식 : `MONTHNAME(날짜)`
* 예시 :
	```SQL
	SELECT NOW(), YEAR(NOW()), MONTH(NOW()), MONTHNAME(NOW());
	```

**`DAYNAME`**
* 날짜의 요일을 영어로 반환
* 형식 : `DAYNAME(날짜)`

**`DAYOFMONTH`**
* 날짜의 일 반환
* 형식 : `DAYOFMONTH(날짜)`

**`DAYOFWEEK`**
* 날짜의 요일을 숫자로 반환
* 형식 : `DAYOFWEEK(날짜)`

**`WEEK`**
* 날짜가 해당 연도에 몇 번째 주인지 반환
* 형식 : `WEEK(날짜)`
* 예시 :
	```SQL
	SELECT NOW(), DAYNAME(NOW()), DAYOFMONTH(NOW()), DAYOFWEEK(NOW()), WEEK(NOW());
	```

**`HOUR`**
* 시간의 시 반환
* 형식 : `HOUR(시간)`

**`MINUTE`**
* 시간의 분 반환
* 형식 : `MINUTE(시간)`

**`SECOND`**
* 시간의 초 반환
* 형식 : `SECOND(시간)`
* 예시 :
	```SQL
	SELECT NOW(), HOUR(NOW()), MINUTE(NOW()), SECOND(NOW());
	```

**`DATE_FORMAT`**
* 날짜/시간의 형식을 지정한 형식으로 바꿔 반환
* 형식 : `DATE_FORMAT(날짜/시간, 형식)`
* 예시 :
	```SQL
	SELECT DATE_FORMAT('1998-07-19 21:30:58', '%Y년 %m월 %d일 %H시 %i분 %s초') AS formatted_date;
	```

**`DATEDIFF`**
* 날짜1과 날짜2의 차이 반환 (날짜1 - 날짜2)
* 형식 : `DATEDIFF(날짜1, 날짜2)`

**`TIMEDIFF`**
* 시간1과 시간2의 차이 반환 (시간1 - 시간2)
* 형식 : `TIMEDIFF(시간1, 시간2)`
* 예시 :
	```SQL
	SELECT DATEDIFF(‘2022-01-01 00:00:00’, ‘2021-12-25 12:00:00’) AS DATE_DIFF,
		TIMEDIFF(‘2022-01-01 00:00:00’, ‘2021-12-25 12:00:00’) AS TIME_DIFF;
	```

**형식 지정자**

![](https://images.velog.io/images/dogfootbirdfoot/post/e7d2d66c-73d2-40a8-a8a7-f5c110cd05ea/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-01-11%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%203.21.41.png)

## **6. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number INT,
		name VARCHAR(20),
		type VARCHAR(10),
		attack INT,
		defense INT,
		capture_date DATE
);

INSERT INTO mypokemon (number, name, type, attack, defense, capture_date)
VALUES	(10, 'caterpie', 'bug', 30, 35, '2019-10-14'),
		(25, 'pikachu', 'electric', 55, 40, '2018-11-04'),
		(26, 'raichu', 'electric', 90, 55, '2019-05-28'),
		(125, 'electabuzz', 'electric', 83, 57, '2020-12-29'),
		(133, 'eevee', 'normal', 55, 50, '2021-10-03'),
		(137, 'porygon', 'normal', 60, 70, '2021-01-16'),
		(152, 'chikoirita', 'grass', 49, 65, '2020-03-05'),
		(153, 'bayleef', 'grass', 62, 80, '2022-01-01');

SELECT name, LENGTH(name)
FROM mypokemon
ORDER BY 2;

SELECT name, RANK() OVER (ORDER BY defense DESC) AS defense_rank
FROM mypokemon;

SELECT name, DATEDIFF('2022-02-14', capture_date) AS days
FROM mypokemon;
```
