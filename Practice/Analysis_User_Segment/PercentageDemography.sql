-- Q15. Q14 결과의 성, 연령을 "남성(25~29세)"와 같이 통합해주시고, 각 성, 연령이 전체 고객에서 얼마나 차지하는지 분포(%)를 알려주세요.
--		역시 분포가 높은 순서대로 알려주세요.

SELECT concat(CASE WHEN gender = 'M' THEN '남성'
			WHEN gender = 'F' THEN '여성'
			WHEN gender = 'Others' THEN '기타'
			WHEN LENGTH(gender) < 1 THEN '기타'
			END
	 , '('
	 , CASE WHEN age IS NULL THEN '무응답'
			WHEN age <= 15 THEN '15세 이하'
			WHEN age <= 20 THEN '16~20세'
			WHEN age <= 25 THEN '21~25세'
			WHEN age <= 30 THEN '26~30세'
			WHEN age <= 35 THEN '31~35세'
			WHEN age <= 40 THEN '36~40세'
			WHEN age <= 45 THEN '41~45세'
			WHEN age >= 46 THEN '46세 이상'
			END
	 , ')') AS segment
     , ROUND(COUNT(*) / (SELECT COUNT(*) FROM fastcampus.tbl_customer) * 100, 2) AS percentage -- Scala Subquery
FROM fastcampus.tbl_customer
GROUP BY 1
ORDER BY 2 DESC;
