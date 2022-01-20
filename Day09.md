# **Handling Multiple Tables**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 여러 테이블 한번에 다루기**

[집합 연산 그림]

합집합 : `UNION`, `UNION ALL`

교집합 : `INTERSECT`

차집합 : `MINUS`

> MySQL에서는 INTERSECT와 MINUS 키워드가 존재하지 않기 때문에 해당 두 표현은 JOIN을 통해 구현한다.

## **2. 데이터에 데이터 더하기**

**`UNION`, `UNION ALL`**
* 형식 : `[쿼리 A] UNION [쿼리 B]`, `[쿼리 A] UNION ALL [쿼리 B]`
* [쿼리 A]와 [쿼리 B]의 결과 값을 합쳐서 보여준다.
* `UNION`은 동일한 값은 **제외하고** 보여주며, `UNION ALL`은 동일한 값도 **포함하여** 보여준다.
* [쿼리 A]와 [쿼리 B]의 결과 값의 개수가 같아야 한다.
    * 다를 경우, 에러 발생
* `ORDER BY`는 쿼리 가장 마지막에 작성 가능하고, [쿼리 A]에서 가져온 컬럼으로만 가능하다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
UNION
SELECT [컬럼 이름]
FROM [테이블 B 이름];
```

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
UNION ALL
SELECT [컬럼 이름]
FROM [테이블 B 이름];
```

## **3. 데이터에서 데이터 빼기**

**교집합**

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름] AS A
INNER JOIN [테이블 B 이름] AS B
ON A.[컬럼1 이름] = B.[컬럼1 이름]
AND ...
AND A.[컬럼n 이름] = B.[컬럼n 이름];
```
> 교집합을 확인하고 싶은 컬럼은 모두 다 기준으로 두고 합쳐줘야 함(단순 INNER JOIN과의 차이점)

**차집합**

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름] AS A
LEFT JOIN [테이블 B 이름] AS B
ON A.[컬럼1 이름] = B.[컬럼1 이름]
AND ...
AND A.[컬럼n 이름] = B.[컬럼n 이름]
WHERE B.[컬럼 이름] IS NULL;
```
> 차집합을 확인하고 싶은 컬럼은 모두 다 기준으로 두고 합쳐줘야 함

## **4. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number int,
		name varchar(20),
		type varchar(10),
		attack int,
		defense int
);

CREATE TABLE friendpokemon (
		number int,
		name varchar(20),
		type varchar(10),
		attack int,
		defense int
);

INSERT INTO mypokemon (number, name, type, attack, defense) VALUES	(10, 'caterpie', 'bug', 30, 35),
		(25, 'pikachu', 'electric', 55, 40),
		(26, 'raichu', 'electric', 90, 55),
		(133, 'eevee', 'normal', 55, 50),
		(152, 'chikoirita', 'grass', 49, 65);

INSERT INTO friendpokemon (number, name, type, attack, defense)
VALUES	(26, 'raichu', 'electric', 80, 60),
		(125, 'electabuzz', 'electric', 83, 57),
		(137, 'porygon', 'normal', 60, 70),
		(153, 'bayleef', 'grass', 62, 80),
		(172, 'pichu', 'electric', 40, 15),
		(470, 'leafeon', 'grass', 110, 130);

SELECT type
FROM mypokemon
UNION
SELECT type
FROM friendpokemon;

/*
SELECT DISTINCT type
FROM mypokemon
UNION
SELECT DISTINCT type
FROM friendpokemon;
*/

-- DISTINCT : 중복 제거

SELECT number, name, 'my' AS whose
FROM mypokemon
WHERE type = 'grass'
UNION ALL
SELECT number, name, "friend's" AS whose
FROM friendpokemon
WHERE type = 'grass';
```
