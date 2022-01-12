# **Group Data**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 데이터 그룹화하기**

**`GROUP BY`**
* 컬럼에서 동일한 값을 가지는 로우를 그룹화하는 키워드
* 형식 : `GROUP BY [컬럼 이름]`
* 주로 그룹 별 데이터를 집계할 때 사용하며, 엑셀의 피벗 기능과 유사
* `GROUP BY`가 쓰인 쿼리의 `SELECT`절에는 **GROUP BY 대상 컬럼**과 **그룹 함수**만 사용 가능
	* `GROUP BY` 대상 컬럼이 아닌 컬럼을 `SELECT`하면, 에러 발생
* 여러 컬럼으로 그룹화 시, 키워드 뒤에 [컬럼 이름]을 복수 개로 입력
* 컬럼 번호로도 그룹화 가능
	* 컬럼 번호는 `SELECT`절의 컬럼 이름의 순서를 의미

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., [그룹 함수]
FROM [테이블 이름]
WHERE 조건식
GROUP BY [컬럼 이름];
```

## **2. 그룹에 조건 주기**

**`HAVING`**
* 가져올 데이터 그룹에 조건을 지정해주는 키워드
* 형식 : `HAVING 조건식`
* 조건식이 True(참)이 되는 그룹만 선택
* `HAVING`절의 조건식에서는 **그룹 함수**를 활용

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., [그룹 함수]
FROM [테이블 이름]
WHERE 조건식
GROUP BY [컬럼 이름];
HAVING 조건식
```

## **3. 그룹 함수**

**`COUNT`**
* 그룹의 값 수를 세는 함수
* 형식 : `COUNT([컬럼 이름])`
* `SELECT`, `HAVING`절에서 사용
* 집계할 컬럼 이름은 그룹의 기준이 되는 컬럼 이름과 같아도 되고, 같지 않아도 된다.
* `COUNT(1)`은 하나의 값을 1로 세어주는 표현으로 `COUNT` 함수에 자주 사용된다.
* `GROUP BY`가 없는 쿼리에서도 사용 가능하며, 이 때는 전체 로우에 함수가 적용된다.
* 테이블에 NULL 데이터가 없다면 `COUNT(*)` = `COUNT([컬럼 이름])`

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., COUNT([컬럼 이름])
FROM [테이블 이름]
GROUP BY [컬럼 이름];
HAVING 조건문
```

**`SUM`**
* 그룹의 합을 계산하는 함수
* 형식 : `SUM([컬럼 이름])`
* `SELECT`, `HAVING`절에서 사용
* 집계할 컬럼 이름은 그룹의 기준이 되는 컬럼 이름과 같아도 되고, 같지 않아도 된다.
* `GROUP BY`가 없는 쿼리에서도 사용 가능하며, 이 때는 전체 로우에 함수가 적용된다.

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., SUM([컬럼 이름])
FROM [테이블 이름]
GROUP BY [컬럼 이름];
HAVING 조건문
```

**`AVG`**
* 그룹의 평균을 계산하는 함수
* 형식 : `AVG([컬럼 이름])`
* `SELECT`, `HAVING`절에서 사용
* 집계할 컬럼 이름은 그룹의 기준이 되는 컬럼 이름과 같아도 되고, 같지 않아도 된다.
* `GROUP BY`가 없는 쿼리에서도 사용 가능하며, 이 때는 전체 로우에 함수가 적용된다.

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., AVG([컬럼 이름])
FROM [테이블 이름]
GROUP BY [컬럼 이름];
HAVING 조건문
```

**`MIN`**
* 그룹의 최솟값을 반환하는 함수
* 형식 : `MIN([컬럼 이름])`
* `SELECT`, `HAVING`절에서 사용
* 집계할 컬럼 이름은 그룹의 기준이 되는 컬럼 이름과 같아도 되고, 같지 않아도 된다.
* `GROUP BY`가 없는 쿼리에서도 사용 가능하며, 이 때는 전체 로우에 함수가 적용된다.

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., MIN([컬럼 이름])
FROM [테이블 이름]
GROUP BY [컬럼 이름];
HAVING 조건문
```

**`MAX`**
* 그룹의 최댓값을 반환하는 함수
* 형식 : `MAX([컬럼 이름])`
* `SELECT`, `HAVING`절에서 사용
* 집계할 컬럼 이름은 그룹의 기준이 되는 컬럼 이름과 같아도 되고, 같지 않아도 된다.
* `GROUP BY`가 없는 쿼리에서도 사용 가능하며, 이 때는 전체 로우에 함수가 적용된다.

```SQL
SELECT [GROUP BY 대상 컬럼 이름], ..., MAX([컬럼 이름])
FROM [테이블 이름]
GROUP BY [컬럼 이름];
HAVING 조건문
```

## **4. 쿼리 실행 순서**

**6가지 핵심 쿼리 키워드**

|키워드|문법|작성 순서|실행 순서|
|:--:|:--:|:--:|:--:|
|SELECT|SELECT [컬럼 이름]|1|5|
|FROM|FROM [테이블 이름]|2|1|
|WHERE|WHERE 조건식|3|2|
|GROUP BY|GROUP BY [컬럼 이름]|4|3|
|HAVING|HAVING 조건식|5|4|
|ORDER BY|ORDER BY [컬럼 이름]|6|6|


> `SELECT`는 모든 쿼리에 필수 키워드

**예시**

|입력 순서|쿼리|실행 순서|
|:--:|:--|:--:|
|1|SELECT type, COUNT(1), MAX(weight)|5|
|2|FROM pokemon.mypokemon|1|
|3|WHERE name LIKE '%a%'|2|
|4|GROUP BY type|3|
|5|HAVING MAX(height) > 1|4|
|6|ORDER BY 3;|6|

## **5. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number int,
		name varchar(20),
		type varchar(10),
		height float,
		weight float
);

INSERT INTO mypokemon (number, name, type, height, weight)
VALUES	(10, 'caterpie', 'bug', 0.3, 2.9),
		(25, 'pikachu', 'electric', 0.4, 6),
		(26, 'raichu', 'electric', 0.8, 30),
		(125, 'electabuzz', 'electric', 1.1, 30),
		(133, 'eevee', 'normal', 0.3, 6.5),
		(137, 'porygon', 'normal', 0.8, 36.5),
		(152, 'chikoirita', 'grass', 0.9, 6.4),
		(153, 'bayleef', 'grass', 1.2, 15.8),
		(172, 'pichu', 'electric', 0.3, 2),
		(470, 'leafeon', 'grass', 1, 25.5);

SELECT type, AVG(weight)
FROM mypokemon
WHERE LENGTH(name) > 5
GROUP BY type
HAVING AVG(weight) >= 20
ORDER BY 2 DESC;

SELECT type, MIN(height), MAX(height)
FROM mypokemon
WHERE number < 200
GROUP BY type
HAVING MAX(weight) >= 10 AND MIN(weight) >= 2
ORDER BY 2 DESC, 3 DESC;
```
