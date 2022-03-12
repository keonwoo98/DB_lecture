-- Q8. 2020년 7월의 Daily Revenue는 증가하는 추세인가요? 평균 Daily Revenue도 구해주세요.

SELECT ROUND(AVG(revenue), 0)
FROM (
	SELECT DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d') as date_at, SUM(price) as revenue
	FROM fastcampus.tbl_purchase
	WHERE purchased_at >= '2020-07-01'
	AND purchased_at < '2020-08-01'
	GROUP BY 1
	ORDER BY 1
)rev;

-- OR --

SELECT ROUND(AVG(revenue), 0)
FROM (
	SELECT SUM(price) as revenue
    FROM fastcampus.tbl_purchase
    WHERE purchased_at >= '2020-07-01'
    AND purchased_at < '2020-08-01'
    GROUP BY DATE_FORMAT(purchased_at - INTERVAL 9 HOUR, '%Y-%m-%d')
)rev;
