-- Q16. 2020년 7월, 성별에 따라 구매 건수와 총 Revenue를 구해주세요. 남녀 이외의 성별은 하나로 묶어주세요.

SELECT CASE WHEN B.gender = 'M' THEN '남성'
			WHEN B.gender = 'F' THEN '여성'
			WHEN B.gender = 'Others' THEN '기타'
			WHEN LENGTH(B.gender) < 1 THEN '기타'
			END as gender
		, COUNT(*) AS cnt
		, SUM(price) AS revenue
FROM fastcampus.tbl_purchase A
LEFT JOIN fastcampus.tbl_customer B
ON A.customer_id = B.customer_id
WHERE A.purchased_at >= '2020-07-01'
AND A.purchased_at < '2020-08-01'
GROUP BY 1;
