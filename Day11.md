# **Advanced Features**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 데이터 삭제, 수정**

**데이터 삭제**

```sql
DELETE FROM [테이블 이름]
WHERE 조건식;
```

**데이터 수정**

```sql
UPDATE [테이블 이름]
SET [컬럼 이름] = [새 값]
WHERE 조건식;
```

## **2. 제약 조건**

* 데이터를 입력할 때 실행되는 **데이터 입력 규칙**
* 테이블을 만들거나 변경하면서 설정
	* `CREATE TABLE` 및 `ALTER TABLE` 구문

**제약 조건의 종류**

|제약 조건|의미|
|:--:|:--:|
|NOT NULL|이 컬럼에는 NULL 값을 저장할 수 없다|
|UNIQUE|이 컬럼의 값들은 서로 다른 값을 가져야 한다|
|DEFAULT|이 컬럼에 입력값이 없을 시 기본값이 설정된다|
|PRIMARY KEY|이 컬럼은 테이블의 `기본 키`다<br/>NOT NULL과 UNIQUE 특징을 모두 가진다
|FOREIGN KEY|이 컬럼은 테이블의 `외래 키`다<br/>이 컬럼은 다른 테이블의 특정 컬럼을 참조한다|

```sql
CREATE TABLE [테이블 이름] (
	[컬럼 이름] [데이터 타입] [제약 조건],
	[컬럼 이름] [데이터 타입] [제약 조건],
	...
);
```

**예시**

```sql
CREATE TABLE new_mypokemon(
	number INT PRIMARY KEY,
	name VARCHAR(20) UNIQUE,
	type VARCHAR(10) NOT NULL,
	attack INT DEFAULT 0,
	defense INT DEFAULT 100,
	FOREIGN KEY(number) REFERENCES mypokemon(number)
	-- FOREIGN KEY는 참조하는 테이블의 PRIMARY KEY여야 함
);
```

## **3. 권한과 DCL**

**SQL 분류**

|분류|종류|의미|
|:--:|:--:|:--:|
|DDL<br/>(Data Definition Language)|CREATE<br/>ALTER<br/>DROP<br/>RENAME<br/>TRUNCATE|데이터 정의어|
|DML<br/>(Date Manipulation Language)|SELECT<br/>INSERT<br/>UPDATE<br/>DELETE|데이터 조작어|
|DCL<br/>(Data Control Languate)|GRANT<br/>REVOKE|데이터 제어어|
|TCL<br/>(Transaction Control Languate)|COMMIT<br/>ROLLBACK<br/>SAVEPOINT|트랜잭션 제어어|

**권한 예시**

![](https://images.velog.io/images/dogfootbirdfoot/post/de042249-c5c9-4512-b35a-ab30ede7341b/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-02-03%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%204.23.49.png)

**사용자 확인하기**

```sql
# MySQL 기본 데이터베이스인 mysql 데이터베이스 선택하기
USE mysql;

# 사용자 목록 조회하기
SELECT user, host FROM user;
```

**사용자 생성, 삭제하기**

```sql
#사용자 생성하기
CREATE USER [사용자 이름]@[ip 주소];

# 비밀번호와 함께 사용자 생성하기
CREATE USER [사용자 이름]@[ip 주소] IDENTIFIED BY '[사용자 비밀번호]';

# 사용자 삭제하기
DROP USER [사용자 이름];
```

**권한 부여하기**

```sql
# 권한 부여하기
GRANT [권한] ON [데이터베이스 이름].[테이블 이름] TO [사용자 이름]@[ip 주소];

# 권한 확인하기
SHOW GRANT FOR [사용자 이름]@[ip 주소];

# 권한 삭제하기
REVOKE [권한] ON [데이터베이스 이름].[테이블 이름] FROM [사용자 이름]@[ip 주소];

# 권한 적용하기
FLUSH PRIVILEGES;
```

**예시**

```sql
# newuser@%에게 mydb.mytb에 대한 모든 권한 부여하기
GRANT ALL PRIVILEGES ON mydb.mytb TO newuser@%;
-- ip 주소가 %이면 해당 아이디를 가지는 모든 ip에서의 접근을 허용한다는 의미

# newuser@%에게 모든 데이터베이스, 모든 테이블에 대한 SELECT, INSERT 권한 부여하기
GRANT SELECT, INSERT ON *.* TO newuser@%;
```

## **4. 트랜잭션과 TCL**

**트랜잭션**
* 데이터베이스의 데이터 상태를 바꾸는 작업 묶음

![](https://images.velog.io/images/dogfootbirdfoot/post/03bb3f44-c138-4cd2-8e55-f31968afe3cb/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-02-03%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%205.18.35.png)

```sql
#트랜잭션 시작하기
START TRANSACTION

# 트랜잭션 확정하기
COMMIT;

# 트랜잭션 이전으로 돌아가기
ROLLBACK;
```

**세이브포인트**
* 트랜잭션 내 특정한 저장 시점

![](https://images.velog.io/images/dogfootbirdfoot/post/deca7720-4321-4a7d-a49f-5c9f805e5016/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA%202022-02-03%20%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE%205.18.50.png)

```sql
# 세이브포인트 만들기
SAVEPOINT [세이브포인트 이름];

# 세이브포인트로 돌아가기
ROLLBACK TO [세이브포인트 이름];
```
