-- Q20. 2020년 7월 신규 유저가 하루 안에 결제로 넘어가는 비율과 결제까지 소요되는 시간을 구해주세요.

WITH rt_tbl AS (
	SELECT A.*
		 , B.customer_id AS paying_user
		 , B.purchased_at
		 , TIME_TO_SEC(TIMEDIFF(B.purchased_at, A.created_at)) / 3600 AS diff_hours
	FROM fastcampus.tbl_customer A
	LEFT JOIN (
		SELECT customer_id
			 , MIN(purchased_at) AS purchased_at
		FROM fastcampus.tbl_purchase
		GROUP BY customer_id
	) B
	ON A.customer_id = B.customer_id
	AND B.purchased_at < A.created_at + INTERVAL 1 DAY
	WHERE A.created_at >= '2020-07-01'
	AND A.created_at < '2020-08-01'
)

SELECT ROUND(COUNT(paying_user) / COUNT(customer_id) * 100, 2)
FROM rt_tbl
UNION ALL
SELECT ROUND(AVG(diff_hours), 2)
FROM rt_tbl
