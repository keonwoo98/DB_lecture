-- Q1. 2020년 7월의 총 Revenue를 구해주세요.

SELECT SUM(price)
FROM fastcampus.tbl_purchase
WHERE purchased_at >= '2020-07-01'
AND purchased_at < '2020-08-01';
