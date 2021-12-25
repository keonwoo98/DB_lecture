# **Introduction to Database**

> 본 글은 Fastcampus의 MySQL Database 강의를 수강하며 정리한 내용입니다.  
> [강의 링크](https://fastcampus.co.kr/data_online_sql)

## **1. 데이터베이스**

**데이터란?**

* 컴퓨터가 처리할 수 있는 문자, 숫자, 소리, 그림 따위의 형태로 된 **정보**

**데이터베이스란?**

* 여러 사람이 공유하고 사용할 목적으로 통합 관리되는 **데이터 저장소**

**데이터베이스의 특징**

* 자료를 **구조화**하여 저장하기 때문에, 효율적인 관리가 가능하다.
* 여러 업무에 여러 사용자가 **동시에** 사용 가능하다.
* 사용자가 데이터베이스의 기능을 사용하기 위해서는 **응용 프로그램**을 활용해야 한다.

## **2. DBMS**

**DBMS란?**

* Database Management System
* 데이터베이스의 기능을 제공하는 프로그램

**DBMS 종류**

* Oracle
* MySQL
* SQL Server (Microsoft)
* Maria DB

## **3. SQL**

**SQL이란?**

* Structed Query Language
* 데이터베이스와 대화하기 위해 사용하는 **약속**의 언어

**쿼리(Query)란?**

* SQL로 쓰인 데이터베이스에 명령을 내리는 문장

**예제 :**

```SQL
SELECT *
FROM employee
WHERE gender = 'M';
```

> [MySQL 공식 홈페이지 설치 링크](https://www.mysql.com/downloads/)