-- Q5. 7월에 가장 많이 구매한 고객 Top 3와 Top 10 ~ 15 고객을 뽑아주세요.

-- Top 3
SELECT customer_id, SUM(price) AS Revenue
FROM fastcampus.tbl_purchase
WHERE purchased_at >= '2020-07-01'
AND purchased_at < '2020-08-01'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 3;

-- Top 10 ~ 15
SELECT customer_id, SUM(price) AS Revenue
FROM fastcampus.tbl_purchase
WHERE purchased_at >= '2020-07-01'
AND purchased_at < '2020-08-01'
GROUP BY 1
ORDER BY 2 DESC
LIMIT 6 OFFSET 9;
