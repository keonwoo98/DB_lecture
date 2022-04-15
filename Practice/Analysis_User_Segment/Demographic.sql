-- Q14. 전체 유저의 Demographic을 알고 싶어요. 성, 연령별로 유저 숫자를 알려주세요.
--		참고로 기타 성별은 하나로, 연령은 5세 단위로 적당히 묶어주시고 유저 수가 높은 순서대로 보여주세요.

SELECT CASE WHEN LENGTH(gender) < 1 THEN 'Others'
			ELSE gender
			END AS gender
	 , CASE WHEN age <= 15 THEN '0_15세 이하'
			WHEN age <= 20 THEN '1_16~20세'
			WHEN age <= 25 THEN '2_21~25세'
			WHEN age <= 30 THEN '3_26~30세'
			WHEN age <= 35 THEN '4_31~35세'
			WHEN age <= 40 THEN '5_36~40세'
			WHEN age <= 45 THEN '6_41~45세'
			WHEN age >= 46 THEN '7_46세 이상'
			END AS AGE
	 , COUNT(*) AS user
FROM fastcampus.tbl_customer
GROUP BY 1, 2
ORDER BY 3 DESC;
