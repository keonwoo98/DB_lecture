-- Q21. 2020년 7월 기준 Day1 Retention(다음날 재방문율)을 일별로 구해주세요.

SELECT DATE_FORMAT(A.visited_at - INTERVAL 9 HOUR, '%Y-%m-%d') AS d_date
	 , COUNT(DISTINCT A.customer_id) AS active_users
	 , COUNT(DISTINCT B.customer_id) AS retained_users
	 , COUNT(DISTINCT B.customer_id) / COUNT(DISTINCT A.customer_id) AS retention
FROM fastcampus.tbl_visit A
LEFT JOIN fastcampus.tbl_visit B
ON A.customer_id = B.customer_id
AND DATE_FORMAT(A.visited_at - INTERVAL 9 HOUR, '%Y-%m-%d') = DATE_FORMAT(B.visited_at - INTERVAL 9 HOUR - INTERVAL 1 DAY, '%Y-%m-%d')
WHERE A.visited_at >= '2020-07-01'
AND A.visited_at < '2020-08-01'
GROUP BY 1
