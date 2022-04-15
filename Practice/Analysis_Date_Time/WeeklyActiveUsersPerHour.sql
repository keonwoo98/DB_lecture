-- Q13. 2020년 7월 요일 및 시간대별 Active Users를 구해주세요.

SELECT day_of_week_at, hour_at, ROUND(AVG(visit), 0)
FROM (
	SELECT	DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%Y-%m-%d') AS date_at,
			DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%W') AS day_of_week_at,
			DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%H') AS hour_at,
			COUNT(DISTINCT customer_id) AS visit
	FROM fastcampus.tbl_visit
	WHERE visited_at >= '2020-07-01'
	AND visited_at < '2020-08-01'
	GROUP BY 1, 2, 3
)rev
GROUP BY 1, 2
ORDER BY 3 DESC;
