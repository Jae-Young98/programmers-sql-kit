SELECT COUNT(USER_ID) as USERS
FROM USER_INFO
WHERE YEAR(JOINED) = 2021 AND AGE >= 20 AND AGE <= 29

/*

COUNT(*) : 전체 행 갯수
COUNT(컬럼) : 컬럼 데이터 갯수

*/