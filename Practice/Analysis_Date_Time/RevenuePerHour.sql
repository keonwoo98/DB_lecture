-- Q11. 2020년 7월 시간대별 시간당 Revenue를 구해주세요. 어느 시간대가 Revenue가 가장 높고 낮나요?

SELECT hour_at, ROUND(AVG(revenue), 0)
FROM (
	SELECT	DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') AS date_at,
			DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%H') AS hour_at,
			SUM(price) AS revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1, 2
)rev
GROUP BY 1
ORDER BY 2 DESC;
