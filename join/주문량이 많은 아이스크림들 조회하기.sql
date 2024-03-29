SELECT FH.FLAVOR
FROM FIRST_HALF FH
JOIN JULY JL ON FH.FLAVOR = JL.FLAVOR
GROUP BY FH.FLAVOR
ORDER BY SUM(FH.TOTAL_ORDER) + SUM(JL.TOTAL_ORDER) DESC LIMIT 3