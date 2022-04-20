-- Q18. 2020년 7월 일별 매출의 전일 대비 증감폭, 증감률을 구해주세요.

WITH tbl_revenue AS (
	SELECT DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') AS d_date
		 , SUM(price) AS revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1
	ORDER BY 1
)

SELECT *
	 , revenue - LAG(revenue) OVER(ORDER BY d_date ASC) AS diff_revenue
	 , ROUND((revenue - LAG(revenue) OVER(ORDER BY d_date ASC)) / LAG(revenue) OVER(ORDER BY d_date ASC) * 100, 2) AS chg_revenue
FROM tbl_revenue;
