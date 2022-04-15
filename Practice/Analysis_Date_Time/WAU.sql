-- Q7. 2020년 7월의 평균 WAU(Weekly Active Users)를 구해주세요.

SELECT ROUND(AVG(users), 0)
FROM (
	SELECT COUNT(DISTINCT customer_id) AS users
	FROM fastcampus.tbl_visit
	WHERE visited_at >= '2020-07-05'
	AND visited_at < '2020-07-26'
	GROUP BY DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%Y-%m-%U')
)WAU;

-- OR --

SELECT ROUND(AVG(users), 0)
FROM (
	SELECT DATE_FORMAT(visited_at - INTERVAL 9 HOUR, '%Y-%m-%U') AS date_at, COUNT(DISTINCT customer_id) as users
	FROM fastcampus.tbl_visit
	WHERE visited_at >= '2020-07-05'
	AND visited_at < '2020-07-26'
	GROUP BY 1
)WAU;
