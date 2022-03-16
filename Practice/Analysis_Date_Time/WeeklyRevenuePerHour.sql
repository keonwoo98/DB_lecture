-- Q12. 2020년 7월 요일 및 시간대별 Revenue를 구해주세요.

SELECT day_of_week_at, hour_at, ROUND(AVG(revenue), 0)
FROM (
	SELECT	DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') as date_at,
			DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%W') as day_of_week_at,
			DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%H') as hour_at,
			SUM(price) as revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1, 2, 3
)rev
GROUP BY 1, 2
ORDER BY 3 DESC;
