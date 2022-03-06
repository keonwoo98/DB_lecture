-- Q4. 7월에 구매 유저의 월 평균 구매금액은 어떻게 되나요?
-- ARPPU(Average Revenue Per Paying User)

SELECT AVG(Revenue)
FROM (
	SELECT customer_id, SUM(price) AS Revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1
)rev;
