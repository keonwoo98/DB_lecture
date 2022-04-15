-- Q10. 2020년 7월 요일별 Daily Revenue를 구해주세요. 어느 요일이 Revenue가 가장 높고 낮나요?

SELECT	DATE_FORMAT(date_at, '%w') AS day_of_week,
		DATE_FORMAT(date_at, '%W') AS day_name,
		ROUND(AVG(revenue), 0) AS revenue
FROM (
	SELECT	DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') AS date_at,
			SUM(price) AS revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1
)rev
GROUP BY 1, 2
ORDER BY 1;
