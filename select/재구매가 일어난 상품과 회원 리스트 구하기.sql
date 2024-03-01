SELECT USER_ID, PRODUCT_ID
FROM ONLINE_SALE
GROUP BY USER_ID, PRODUCT_ID
HAVING COUNT(*) >= 2
ORDER BY USER_ID ASC, PRODUCT_ID DESC

/*
Group by : 데이터 조회시 그룹으로 묶어 조회한다. (select distinct xxx 와 유사하지만 그룹바이는 집합 연산)

HAVING : 그룹화 한 결과에 조건을 걸 수 있다. WHERE과 비슷
COUNT() : 레코드의 개수 반환
SUM() : 레코드의 합
AVG() : 레코드의 평균값
MAX(), MIN() : 레코드의 최대, 최소값

*/