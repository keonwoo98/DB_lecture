# **Get Data**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 데이터 가져오기**

**`SELECT`**
* 가져올 **데이터** 또는 값을 가져올 **컬럼**을 선택하는 키워드
* 모든 쿼리에 필수 포함 키워드

1. 숫자, 문자, 데이터 가져오기
	* 형식 : `SELECT 데이터`
	* **예제 :**
		```SQL
		SELECT 123;		-- 결과 : 123
		SELECT 1 + 2 + 3;	-- 결과 : 6
		SELECT "ABC"		-- 결과 : "ABC"
		```
2. 컬럼을 선택해 컬럼의 값 가져오기
	* 형식 : `SELECT [컬럼 이름]`
3. `*`를 통해 컬럼 전체 가져오기
	* 형식 : `SELECT *`
	* `*`는 컬럼 전체(ALL)를 의미

**`FROM`**
* 데이터를 가져올 **테이블**을 지정하는 키워드
* 형식 : `FROM [테이블 이름]`
* 테이블이 어떤 데이터베이스 안에 있는지 데이터베이스 이름도 같이 명시해야 함
	* 단, `USE` 키워드를 통해 사용할 데이터베이스를 지정해 주었다면 생략 가능

**컬럼 하나만 선택**

```SQL
SELECT [컬럼 이름]
FROM [데이터베이스 이름].[테이블 이름];
```

> `.`을 통해 데이터베이스와 테이블을 분리해서 표현

**컬럼 여러 개 선택**

```SQL
SELECT [컬럼 이름], [컬럼 이름], ... [컬럼 이름]
FROM [데이터베이스 이름].[테이블 이름];
```

**컬럼 전체 선택**

```SQL
SELECT *
FROM [데이터베이스 이름].[테이블 이름];
```

**데이터베이스 지정**

```SQL
USE [데이터베이스 이름];	-- 데이터베이스 지정
SELECT [컬럼 이름]
FROM [테이블 이름];
```

## **2. 데이터 가져올 때 별명 붙이기**

**`AS`**
* 가져온 데이터에 **별명**을 지정하는 키워드
* 컬럼 이름에 부가 설명을 하거나 불필요한 내용 제거할 때 사용
* 형식 : `AS [컬럼 별명]`
* 테이블 내의 실제 컬럼 이름은 변하지 않으며, 별명은 쿼리 내에서만 유효
	* 만약 실제 이름을 변경하고 싶다면, `ALTER TABLE`구문 사용


```SQL
SELECT [컬럼 이름] AS [컬럼 별명]
FROM [테이블 이름];
```

## **3. 데이터 일부만 가져오기**

**`LIMIT`**
* 가져올 데이터의 **로우 개수**를 지정하는 키워드
* 데이터의 일부만 확인하고 싶을 때 사용
* 형식 : `LIMIT [로우 수]`
* 쿼리의 가장 마지막에 위치
* 만약 입력한 숫자가 전체 로우 수보다 크다면, 있는 로우까지만 가져옴

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
LIMIT [로우 수];
```

## **4. 중복 제거하기**

**`DISTINCT`**
* 중복된 데이터는 제외하고 같은 값은 한 번만 가져오는 키워드
* 컬럼에 어떤 값들이 있는지 확인하고 싶을 때 사용
* 형식 : `DISTINCT [컬럼 이름]`
* `SELECT`절에 위치하여 컬럼의 유일한 값들을 가져옴

```SQL
SELECT DISTINCT [컬럼 이름]
FROM [테이블 이름]
```

## **5. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number INT,
		name VARCHAR(20),
		type VARCHAR(20),
		height FLOAT,
		weight FLOAT,
		attack FLOAT,
		defense FLOAT,
		speed FLOAT
);

INSERT INTO mypokemon (number, name, type, height, weight, attack, defense, speed)
VALUES	(10, 'caterpie', 'bug', 0.3, 2.9, 30, 35, 45),
		(25, 'pikachu', 'electric', 0.4, 6, 55, 40, 90),
		(26, 'raichu', 'electric', 0.8, 30, 90, 55, 110),
		(133, 'eevee', 'normal', 0.3, 6.5, 55, 50, 55),
		(152, 'chikoirita', 'grass', 0.9, 6.4, 49, 65, 45);

SELECT name, height, weight
FROM mypokemon;

SELECT name, attack, defense, speed
FROM mypokemon;

SELECT name, attack + defense + speed AS total
FROM mypokemon;
```
