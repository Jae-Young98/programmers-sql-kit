SELECT DATE_FORMAT(O.SALES_DATE, '%Y') AS YEAR,
        DATE_FORMAT(O.SALES_DATE, '%m') AS MONTH,
        COUNT(DISTINCT U.USER_ID) AS PUCHASED_USERS,
        ROUND(COUNT(DISTINCT U.USER_ID)/(SELECT COUNT(*) FROM USER_INFO WHERE joined LIKE '2021%'), 1) AS PUCHASED_RATIO
FROM USER_INFO U
JOIN ONLINE_SALE O
ON U.USER_ID = O.USER_ID
WHERE U.JOINED LIKE '2021%'
GROUP BY YEAR, MONTH
ORDER BY YEAR, MONTH

/*

우선 user table과 online table을 user_id로 join을 시킨 뒤 where절로 2021년 가입한 회원들만 추려준다.
문제에서 원하는 년도와 월은 DATE_FORMAT()을 이용하여 추출한 뒤 column명을 year, month로 지정하여 나중에 group by (column명)
년, 월별로 그룹을 묶어준 뒤 해당 월에 구입한 회원 총 수를 count()를 이용해 구해준다.
(주의) join 된 테이블 결과는 한 회원이 여러 번 구매 이력이 있을 수 있기 때문에 distinct를 이용하여 중복 회원 id를 제거해 준 뒤 count
상품 구매 회원 비율을 구하기 위해 2021년에 가입한 총 회원 수를 구해줘야 된다.
(SELECT COUNT(*) FROM USER_INFO WHERE joined LIKE '2021%') 서브 쿼리를 이용해 간단하게 구해준다.
문제에서 둘째 자리에서 반올림을 해줘야 하기 때문에 round() 이용해 준다.
order by

*/