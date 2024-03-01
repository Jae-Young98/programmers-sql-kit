SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE, PRODUCT_ID, USER_ID, SALES_AMOUNT
FROM ONLINE_SALE
WHERE SALES_DATE >= '2022-03-01' AND SALES_DATE <= '2022-03-31'
UNION ALL
SELECT DATE_FORMAT(SALES_DATE, '%Y-%m-%d') as SALES_DATE, PRODUCT_ID, NULL AS USER_ID, SALES_AMOUNT
FROM OFFLINE_SALE
WHERE SALES_DATE >= '2022-03-01' AND SALES_DATE <= '2022-03-31'
ORDER BY SALES_DATE, PRODUCT_ID, USER_ID

/*

UNION : 여러 개의 SELECT 문의 결과를 단일 결과 세트로 연결 표현 (합친 결과에서 중복 행은 하나만 표시)
==> distinct 키워드를 따로 명시하지 않아도 기본적으로 중복 레코드 제거
- UNION 내의 각 SELECT 문은 같은 수의 열을 가져야 한다.
- 각각 SELECT 문의 열은 또한 동일한 순서로 있어야 한다.
- 열은 호환되는 데이터 형식을 가져야 한다.

UNION ALL : 데이터 값이 중복되더라도 조건에 일치하는 데이터를 모두 표시한다.

JOIN 과 UNION 의 차이
UNION : 하나의 결과 세트만 나타냄 (새로운 행으로 결합, 수직결합)
JOIN : 적어도 하나의 속성이 공통인 두 테이블 속성을 결합하고자 할 때 사용 (새로운 열로 결합, 수평결합)

*/