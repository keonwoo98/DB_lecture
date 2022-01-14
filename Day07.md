# **Create Rules**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 조건 만들기**

**`IF`**
* 조건을 만들 때 사용하는 함수
* 형식 : `IF(조건식, 참일 때 값, 거짓일 때 값)`
* 주로 `SELECT` 절에 사용하는 함수로, 결과 값을 새로운 컬럼으로 반환한다.

**`IFNULL`**
* 데이터가 NULL인지 아닌지 확인해 NULL이라면 새로운 값을 반환하는 함수
* `ISNULL`과 유사하지만 `ISNULL`은 NULL인지 아닌지 확인만 한다.
* 형식 : `IFNULL([컬럼 이름], NULL일 때 값)`
* 해당 컬럼의 값이 NULL인 로우에서 NULL일 때 값을 반환한다.
* 주로 `SELECT` 절에 사용하는 함수로, 결과 값을 새로운 컬럼으로 반환한다.

## **2. 여러 조건 한번에 만들기**

조건을 **하나** 만들 때 사용하는 문법 : `IF`

조건을 **여러 개** 만들 때 사용하는 문법 : `CASE`

**`CASE`**
* 주로 `SELECT` 절에 사용하는 함수로, 결과 값을 새로운 컬럼으로 반환한다.
* `ELSE` 문장을 생략 시 NULL 값을 반환한다.

```SQL
-- 형식 1
CASE
	WHEN 조건식1 THEN 결과값1
	WHEN 조건식2 THEN 결과값2
	ELSE 결과값3
END
```

```SQL
-- 형식 2
CASE [컬럼 이름]
	WHEN 조건값1 THEN 결과값1
	WHEN 조건값2 THEN 결과값2
	ELSE 결과값3
END
```

## **3. 함수 만들기**

```SQL
CREATE FUNCTION [함수 이름]([입력값 이름] [데이터 타입], ...)
		RETURNS [결과값의 데이터 타입]
BEGIN
		DECLARE [임시값 이름] [데이터 타입];
		SET [임시값 이름] = [입력값 이름];
		쿼리;
		RETURN [결과값];
END
```

**함수 지우기**

```SQL
DROP FUNCTION [함수 이름];
```

**MySQL Workbench에서 함수 생성 시 주의할 점**

```SQL
SET GLOBAL log_bin_trust_function_creators = 1;
--사용자 계정에 function create 권한 생성

DELIMITER //	-- 함수의 시작 지정

CREATE FUNCTION [함수 이름]([입력값 이름] [데이터 타입], ...)
		RETURNS [결과값의 데이터 타입]
BEGIN
		DECLARE [임시값 이름] [데이터 타입];
		SET [임시값 이름] = [입력값 이름];
		쿼리;
		RETURN [결과값];
END

//
DELIMITER ;	-- 함수의 끝 지정
-- 키워드와 ; 사이에 공백 존재
```

## **4. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon; CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number int,
		name varchar(20),
		type varchar(10),
		attack int,
		defense int
);

INSERT INTO mypokemon (number, name, type, attack, defense)
VALUES	(10, 'caterpie', 'bug', 30, 35),
		(25, 'pikachu', 'electric', 55, 40),
		(26, 'raichu', 'electric', 90, 55), (125, 'electabuzz', 'electric', 83, 57),
		(133, 'eevee', 'normal', 55, 50), (137, 'porygon', 'normal', 60, 70),
		(152, 'chikoirita', 'grass', 49, 65), (153, 'bayleef', 'grass', 62, 80),
		(172, 'pichu', 'electric', 40, 15), (470, 'leafeon', 'grass', 110, 130);

CREATE FUNCTION isStrong(attack INT, defense INT)
		RETURNS VARCHAR(20)
BEGIN
		DECLARE atk INT;
		DECLARE dfs INT;
		DECLARE msg VARCHAR(20);
		SET atk = attack;
		SET dfs = defense;
		SELECT	CASE
					WHEN atk + dfs > 120 THEN "very strong"
					WHEN atk + dfs > 90 THEN "strong"
					ELSE "not strong"
				END INTO msg;
		RETURN msg;
END

SELECT name, isStrong(attack, defense) AS isStrong
FROM mypokemon;
```
