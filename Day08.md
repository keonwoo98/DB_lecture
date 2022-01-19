# **Join Tables**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 테이블 합치기**

**`JOIN`**
* 같은 의미를 가지는 컬럼의 값을 기준으로 테이블을 합칠 때 사용하는 키워드

**JOIN의 종류**

![](https://images.velog.io/images/dogfootbirdfoot/post/9e4a9702-3da1-4261-9a4c-a561c11683f7/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-01-19%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%2012.56.55.png)

## **2. 기준으로 테이블 합치기**

**`INNER JOIN`**
* 두 테이블 모두에 있는 값만 합치기
* 기본 `JOIN`만 적을 시, 자동으로 `INNER JOIN`으로 인식된다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
INNER JOIN [테이블 B 이름]
ON [테이블 A 이름].[컬럼 A 이름] = [테이블 B 이름].[컬럼 B 이름]
WHERE 조건식;
```

## **3. 한쪽을 기준으로 테이블 합치기**

**`LEFT JOIN`**
* 왼쪽 테이블에 있는 값만 합치기

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
LEFT JOIN [테이블 B 이름]
ON [테이블 A 이름].[컬럼 A 이름] = [테이블 B 이름].[컬럼 B 이름]
WHERE 조건식;
```

**`RIGHT JOIN`**
* 오른쪽 테이블에 있는 값만 합치기

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
RIGHT JOIN [테이블 B 이름]
ON [테이블 A 이름].[컬럼 A 이름] = [테이블 B 이름].[컬럼 B 이름]
WHERE 조건식;
```

## **4. 다양한 방식으로 테이블 합치기**

**`OUTER JOIN`**
* 두 테이블에 있는 모든 값 합치기
* MySQL에서는 `OUTER JOIN` 키워드가 없다.
* 따라서 `UNION` 키워드를 사용하여 `LEFT JOIN`과 `RIGHT JOIN`을 함께 쓴다.
* `UNION` : 두 쿼리의 결과를 **중복을 제외**하고 합쳐서 보여주는 집합 연산자

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
LEFT JOIN [테이블 B 이름]
ON [테이블 A 이름].[컬럼 A 이름] = [테이블 B 이름].[컬럼 B 이름]
UNION
SELECT [컬럼 이름]
FROM [테이블 A 이름]
RIGHT JOIN [테이블 B 이름]
ON [테이블 A 이름].[컬럼 A 이름] = [테이블 B 이름].[컬럼 B 이름];
```

**`CROSS JOIN`**
* 두 테이블에 있는 모든 값을 각각 합치기
* `ON` 키워드가 없어도 된다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름]
CROSS JOIN [테이블 B 이름]
WHERE 조건식;
```

**`SELF JOIN`**
* 같은 테이블에 있는 값 합치기

```SQL
SELECT [컬럼 이름]
FROM [테이블 A 이름] AS t1
INNER JOIN [테이블 A 이름] AS t2
ON t1.[컬럼 A 이름] = t2.[컬럼 A 이름]
WHERE 조건식;
```

## **5. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number INT,
		name VARCHAR(20),
		type VARCHAR(10)
);

INSERT INTO mypokemon (number, name, type)
VALUES	(10, 'caterpie', 'bug'),
		(25, 'pikachu', 'electric'),
		(26, 'raichu', 'electric'),
		(133, 'eevee', 'normal'),
		(152, 'chikoirita', 'grass');

CREATE TABLE ability (
		number INT,
		height FLOAT,
		weight FLOAT,
		attack INT,
		defense INT,
		speed int
);

INSERT INTO ability (number, height, weight, attack, defense, speed)
VALUES	(10, 0.3, 2.9, 30, 35, 45),
		(25, 0.4, 6, 55, 40, 90),
		(125, 1.1, 30, 83, 57, 105),
		(133, 0.3, 6.5, 55, 50, 55),
		(137, 0.8, 36.5, 60, 70, 40),
		(152, 0.9, 6.4, 49, 65, 45),
		(153, 1.2, 15.8, 62, 80, 60),
		(172, 0.3, 2, 40, 15, 60),
		(470, 1, 25.5, 110, 130, 95);

SELECT name, attack, defense
FROM mypokemon
LEFT JOIN ability
ON mypokemon.number = ability.number;

SELECT ability.number, name
FROM mypokemon
RIGHT JOIN ability
ON mypokemon.number = ability.number;

SELECT ability.number, name
FROM ability
LEFT JOIN mypokemon
ON mypokemon.number = ability.number;

-- 위 두 쿼리는 동일한 의미를 지닌다.
```
