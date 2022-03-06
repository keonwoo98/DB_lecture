-- Q3. 7월에 Active 유저의 구매율(Paying Rate)은 어떻게 되나요?

SELECT COUNT(DISTINCT customer_id)
FROM fastcampus.tbl_purchase
WHERE purchased_at >= '2020-07-01'
AND purchased_at < '2020-08-01';

SELECT COUNT(DISTINCT customer_id)
FROM fastcampus.tbl_visit
WHERE visited_at >= '2020-07-01'
AND visited_at < '2020-08-01';

SELECT ROUND(11174 / 16414 * 100, 2);
