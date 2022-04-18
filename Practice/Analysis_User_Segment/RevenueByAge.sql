-- Q17. 2020년 7월, 성별, 연령대에 따라 구매 건수와 총 Revenue를 구해주세요.

SELECT CASE WHEN B.gender = 'M' THEN '남성'
			WHEN B.gender = 'F' THEN '여성'
			WHEN B.gender = 'Others' THEN '기타'
			WHEN LENGTH(B.gender) < 1 THEN '기타'
			END as gender
	 , CASE WHEN age IS NULL THEN '무응답'
			WHEN age <= 15 THEN '15세 이하'
			WHEN age <= 20 THEN '16~20세'
			WHEN age <= 25 THEN '21~25세'
			WHEN age <= 30 THEN '26~30세'
			WHEN age <= 35 THEN '31~35세'
			WHEN age <= 40 THEN '36~40세'
			WHEN age <= 45 THEN '41~45세'
			WHEN age >= 46 THEN '46세 이상'
			END as age
		, COUNT(*) AS cnt
		, SUM(price) AS revenue
FROM fastcampus.tbl_purchase A
LEFT JOIN fastcampus.tbl_customer B
ON A.customer_id = B.customer_id
WHERE A.purchased_at >= '2020-07-01'
AND A.purchased_at < '2020-08-01'
GROUP BY 1, 2
ORDER BY 4 DESC;
