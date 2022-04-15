-- Q9. 2020년 7월의 평균 Weekly Revenue를 구해주세요.

SELECT ROUND(AVG(revenue), 0)
FROM (
	SELECT DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%U') AS date_at, SUM(price) AS revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-05'
	AND purchased_at < '2020-07-26'
	GROUP BY 1
	ORDER BY 1
)rev;
