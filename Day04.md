# **Get Data Fits in Condition**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 조건에 맞는 데이터 가져오기**

**`WHERE`**
* 가져올 데이터의 조건을 지정해주는 키워드
* 형식 : `WHERE [조건식]`
* 조건식이 True(참)이 되는 로우만 선택

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE 조건식;
```

## **2. 조건식**

* 조건식을 작성하는 데에는 다양한 방식이 있는데 보통 **연산자**를 사용한다.
* 조건식을 작성하며 원하는 데이터의 조건이 **True(참)** 이 되게끔 조건식을 만든다.
* MySQL에서는 True(참) 값은 1, False(거짓) 값은 0으로 표현한다.
* 연산자 종류
	* 비교 연산자 (=, >, < 등)
	* 논리 연산자 (NOT, AND, OR 등)
	* 기타 주요 연산자 (BETWEEN, IN 등)

## **3. 연산자**

**비교 연산자**

|연산자|활용|의미|예시|
|:--:|:--:|:--:|:--:|
|=|A = B|A와 B가 같다|1 = 1|
|!=|A != B|A와 B가 같지 않다|1 != 2|
|>|A > B|A가 B보다 크다|10 > 1|
|>=|A >= B|A가 B보다 크거나 같다|10 >= 10|
|<|A < B|A가 B보다 작다|10 < 100|
|<=|A <= B|A가 B보다 작거나 같다|10 <= 10|

**`=` 연산자 예시**

```SQL
SELECT number
FROM mypokemon
WHERE name = 'pikachu';
```

**`>` 연산자 예시**

```SQL
SELECT name
FROM mypokemon
WHERE speed > 50;
```

**`!=` 연산자 예시**

```SQL
SELCET name
FROM mypokemon
WHERE type != 'electric';
```

**논리 연산자**

|연산자|활용|의미|
|:--:|:--:|:--:|
|AND|A AND B|A와 B 모두 True이면 True|
|OR|A OR B|A와 B 둘 중 하나면 True이면 True|
|NOT|NOT A|A가 아니면 True|

**`AND` 연산자 예시**

```SQL
SELECT name
FROM mypokemon
WHERE speed <= 10 AND type = 'electric';
```

**`OR` 연산자 예시**

```SQL
SELECT name
FROM mypokemon
WHERE type = 'bug' OR type = 'normal';
```

**`NOT` 연산자 예시**

```SQL
SELECT name
FROM mypokemon
WHERE speed <= 100 AND NOT(type = 'bug');	-- type != 'bug'와 동일한 의미
```

**기타 주요 연산자**

**`BETWEEN`**
* 특정 범위 내의 데이터를 선택할 때 사용하는 연산자
* 형식 : `[컬럼 이름] BETWEEN A AND B`
* 해당 컬럼 값이 A와 B 사이에 포함되는 값을 가진 로우만 선택
* `[컬럼 이름] BETWEEN A AND B` 쿼리는 `A <= [컬럼 이름] AND [컬럼 이름] <= B`와 동일

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [컬럼 이름] BETWEEN [조건 1] AND [조건 2];
```

**BETWEEN 예시**

```SQL
SELECT name
FROM mypokemon
WHERE speed BETWEEN 50 AND 100;
```

**`IN`**
* 목록 내 포함되는 데이터를 선택할 때 사용하는 연산자
* 형식 : `[컬럼 이름] IN (A, B, ..., C)`
* 해당 컬럼의 값이 '()' 내의 값에 포함되는 값을 가진 로우만 선택
* `[컬럼 이름] IN (A, B)` 쿼리는 `[컬럼 이름] = A OR [컬럼 이름] = B`와 동일
* 목록을 넣을 값이 여러 개일 때, `OR` 연산자보다 표현 및 이해가 쉽다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [컬럼 이름] IN ([조건 1], [조건 2], ...);
```

**IN 예시**

```SQL
SELECT name
FROM mypokemon
WHERE type IN ('bug', 'normal');
```

## **4. 문자형 데이터 다루기**

**`LIKE`**
* 특정 문자열이 포함된 데이터를 선택하는 연산자
* 형식 : `[컬럼 이름] LIKE [검색할 문자열]`
* 해당 컬럼 값이 [검색할 문자열]을 포함하고 있는 로우만 선택
* [검색할 문자열] 내에 **와일드 카드**를 사용하여 검색 조건을 구체적으로 표현할 수 있다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [컬럼 이름] LIKE [검색할 문자열];
```

**LIKE 예시**

```SQL
SELECT name
FROM mypokemon
WHERE name LIKE '%a_%';		-- '%a%_'와 동일한 의미
```

**와일드 카드**

|와일드 카드|의미|
|:--:|:--:|
|%|0개 이상의 문자|
|_|1개의 문자|

**와일드카드 예시**
* `%e` : e로 끝나는 문자열
* `e%` : e로 시작하는 문자열
* `%e%` : e가 포함된 문자열
* `_e` : e로 끝나고 e 앞에 1개의 문자가 있는 문자열
* `%_e` : e로 끝나고 앞에 1개 이상의 문자가 있는 문자열
* `%_e_%` : e를 포함하고 e 앞뒤로 각각 1개 이상의 문자가 있는 문자열

## **5. NULL 데이터 다루기**

**`NULL`**
* 데이터 값이 존재하지 않는다는 표현
* 0이나 공백이 아닌 **알 수 없는 값**을 의미

**`IS NULL`**
* 데이터가 NULL인지 아닌지를 확인하는 연산자
* 형식 : `[컬럼 이름] IS NULL`
* 해당 컬럼이 NULL인 로우만 선택
* NULL이 아닌 데이터를 검색하고 싶다면 `IS NOT NULL`을 사용
* `[컬럼 이름] = NULL` 또는 `[컬럼 이름] != NULL`과 같은 표현은 허용되지 않는다.

```SQL
SELECT [컬럼 이름]
FROM [테이블 이름]
WHERE [컬럼 이름] IS NULL;
```

**IS NULL 예시**

```SQL
SELECT name
FROM mypokemon
WHERE number IS NULL;
```

**IS NOT NULL 예시**

```SQL
SELECT name
FROM mypokemon
WHERE type IS NOT NULL;
```

## **6. 실습**

```SQL
USE pokemon;

SELECT *
FROM mypokemon
WHERE name LIKE '%i%' AND speed <= 50;

SELECT name AS weak_pokemon
FROM mypokemon
WHERE attack < 50 OR defense < 50;

SELECT name, attack + defense + speed AS total
FROM mypokemon
WHERE attack + defense + speed >= 150;
```
