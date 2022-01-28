# **Add Condition to Condition**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 조건에 조건 더하기**

![](https://images.velog.io/images/dogfootbirdfoot/post/256b3960-fc4d-4e14-90bf-2483ccd022a1/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-01-28%20%E1%84%8B%E1%85%A9%E1%84%8C%E1%85%A5%E1%86%AB%209.21.43.png)

**서브 쿼리**
* 하나의 쿼리 내 포함된 또 하나의 쿼리
* 서브 쿼리는 반드시 괄호 안에 있어야 한다.
* `SELECT`, `FROM`, `WHERE`, `HAVING`, `ORDER BY` 절에 사용 가능
* `INSERT`, `UPDATE`, `DELETE` 문에도 사용 가능
* 서브 쿼리에는 `;`을 붙이지 않아도 된다.

## **2. SELECT 절의 서브 쿼리**

* **스칼라 서브 쿼리**라고도 한다.
* `SELECT` 절의 서브 쿼리는 반드시 결과값이 **하나의 값**이어야 한다.

```SQL
SELECT [컬럼 이름],
	(SELECT [컬럼 이름]
	 FROM [테이블 이름]
	 WHERE 조건식)
FROM [테이블 이름]
WHERE 조건식;
```

## **3. FROM 절의 서브 쿼리**

* **인라인 뷰 서브 쿼리**라고도 한다.
* `FROM` 절의 서브 쿼리는 반드시 결과값이 **하나의 테이블**이어야 한다.
* 서브 쿼리로 만든 테이블은 반드시 별명을 가져야 한다.

```SQL
SELECT [컬럼 이름]
FROM (SELECT [컬럼 이름]
	  FROM [테이블 이름]
	  WHERE 조건식) AS [테이블 별명]
WHERE 조건식;
```

## **4. WHERE 절의 서브 쿼리**

* **중첩 서브 쿼리**라고도 한다.
* `WHERE` 절의 서브 쿼리는 반드시 결과값이 **하나의 컬럼**이어야 한다. (`EXISTS` 제외)
	* 하나의 컬럼에는 여러 개의 값이 존재할 수 있다.
* 연산자와 함께 사용한다.
	* 보통 `WHERE [컬럼 이름][연산자][서브 쿼리]` 형식으로 사용한다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [컬럼 이름][연산자](SELECT [컬럼 이름]
					  FROM [테이블 이름]
					  WHERE 조건식);
```

### **4-1. 서브 쿼리에 사용하는 연산자**

**비교 연산자**

|연산자|활용|의미|
|:--:|:--:|:--:|
|=|A = [서브 쿼리]|A와 [서브 쿼리]의 결과값이 같다|
|!=|A != [서브 쿼리]|A와 [서브 쿼리]의 결과값이 같지 않다|
|>|A > [서브 쿼리]|A가 [서브 쿼리]의 결과값보다 크다|
|>=|A >= [서브 쿼리]|A가 [서브 쿼리]의 결과값보다 크거나 작다|
|<|A < [서브 쿼리]|A가 [서브 쿼리]의 결과값보다 작다|
|<=|A <= [서브 쿼리]|A가 [서브 쿼리]의 결과값보다 작거나 같다|

> 비교 연산자**만** 사용 시, `WHERE` 절의 서브 쿼리는 반드시 **하나의 값**이어야 한다.

**주요 연산자**

|연산자|활용|의미|
|:--:|:--:|:--:|
|IN|A IN ([서브 쿼리])|A가 [서브 쿼리]의 결과값 내에 있다|
|ALL|A < ALL([서브 쿼리])|A가 모든 [서브 쿼리]의 결과값보다 작다|
||A > ALL([서브 쿼리])|A가 모든 [서브 쿼리]의 결과값보다 크다|
|ANY|A < ANY([서브 쿼리])|A가 [서브 쿼리]의 결과값보다 하나라도 작다|
||A > ANY([서브 쿼리])|A가 [서브 쿼리]의 결과값보다 하나라도 크다|
|EXISTS|EXISTS([서브 쿼리])|[서브 쿼리]의 결과값이 존재한다|
||NOT EXISTS([서브 쿼리])|[서브 쿼리]의 결과값이 존재하지 않는다|

> 주요 연산자 사용 시, `WHERE` 절의 서브 쿼리는 반드시 결과값이 **하나의 컬럼**이어야 한다.  
> 단, `EXISTS`는 단독으로 사용하며, 결과값이 여러 컬럼이어도 된다.

**※ ALL**
* `<`와 사용 : [서브 쿼리]의 최솟값보다 작은 지 확인하는 연산자
* `>`와 사용 : [서브 쿼리]의 최댓값보다 큰 지 확인하는 연산자

**※ ANY**
* `<`와 사용 : [서브 쿼리]의 최댓값보다 작은 지 확인하는 연산자
* `>`와 사용 : [서브 쿼리]의 최솟값보다 큰 지 확인하는 연산자

**※ EXISTS**
* 값이 있는 지 확인할 때 사용하는 연산자로 True / False를 반환

## **5. 실습**

```SQL
DROP DATABASE IF EXISTS pokemon;

CREATE DATABASE pokemon;

USE pokemon;

CREATE TABLE mypokemon (
		number INT,
		name VARCHAR(20)
);

INSERT INTO mypokemon (number, name)
VALUES	(10, 'caterpie'),
		(25, 'pikachu'), (26, 'raichu'),
		(133, 'eevee'),
		(152, 'chikoirita');

CREATE TABLE ability (
		number INT,
		type VARCHAR(10),
		height FLOAT,
		weight FLOAT,
		attack INT,
		defense INT,
		speed int
);

INSERT INTO ability (number, type, height, weight, attack, defense, speed)
VALUES	(10, 'bug', 0.3, 2.9, 30, 35, 45),
		(25, 'electric', 0.4, 6, 55, 40, 90),
		(26, 'electric', 0.8, 30, 90, 55, 110),
		(133, 'normal', 0.3, 6.5, 55, 50, 55),
		(152, 'grass', 0.9, 6.4, 49, 65, 45);

SELECT number
FROM ability
WHERE weight = (SELECT MAX(weight) FROM ability);

SELECT number
FROM ability
WHERE speed < ANY(SELECT attack FROM ability WHERE type = 'electric');

SELECT name
FROM mypokemon
WHERE EXISTS (SELECT * FROM ability WHERE attack > defense);
```
