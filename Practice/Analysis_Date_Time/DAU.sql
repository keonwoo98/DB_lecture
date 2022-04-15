-- Q6. 2020년 7월의 평균 DAU(Daily Active Users)를 구해주세요. Active User 수가 증가하는 추세인가요?

SELECT ROUND(AVG(users), 0)
FROM (
	SELECT COUNT(DISTINCT customer_id) AS users
	FROM fastcampus.tbl_visit
	WHERE visited_at >= '2020-07-01'
	AND visited_at < '2020-08-01'
	GROUP BY DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%Y-%m-%d')
)DAU;

-- OR --

SELECT ROUND(AVG(users), 0)
FROM (
	SELECT DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%Y-%m-%d') as date_at, COUNT(DISTINCT customer_id) AS users
	FROM fastcampus.tbl_visit
	WHERE visited_at >= '2020-07-01'
	AND visited_at < '2020-08-01'
	GROUP BY 1
	ORDER BY 1
)DAU;
