-- Q19. 2020년 7월에 일별로 구매 금액 기준으로 가장 많이 지출한 고객 Top 3를 뽑아주세요.

SELECT *
FROM (
	SELECT DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') AS d_date
		 , customer_id
		 , SUM(price) AS revenue
		 , DENSE_RANK() OVER (PARTITION BY DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') ORDER BY SUM(price) DESC) AS rank_rev
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1, 2
) sub
WHERE rank_rev < 4;
