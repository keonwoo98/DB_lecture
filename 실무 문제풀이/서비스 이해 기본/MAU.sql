-- Q2. 2020년 7월의 MAU(Monthly Active Users)를 구해주세요.

SELECT COUNT(DISTINCT customer_id)
FROM fastcampus.tbl_visit
WHERE visited_at >= '2020-07-01'
AND visited_at < '2020-08-01';

/*
COUNT(*) -> 모든 테이블에 있는 모든 레코드를 조회
COUNT(customer_id) -> NULL을 제외한 로우 카운트
COUNT(distinct customer_id) -> 중복을 제외한 로우 카운트
*/
