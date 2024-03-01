SELECT MEMBER_ID, MEMBER_NAME, GENDER, DATE_FORMAT(DATE_OF_BIRTH, '%Y-%m-%d') as DATE_OF_BIRTH
FROM MEMBER_PROFILE
WHERE MONTH(DATE_OF_BIRTH) = 03 AND GENDER = 'W' AND TLNO IS NOT null
ORDER BY MEMBER_ID ASC

/*
DATE_FORMAT() 함수에 변환할 날짜와 '-, .' 등 구분자를 넣어 사용한다.

%Y 년도 (2024)
%y 년도 (24)

%d 일 (01, 22)
%e 일 (1, 22)

%T 시간 (12:30:00)
%r 시간 (15:30:00 PM)

%H 24시간 시간 (01, 14, 18)
%l 12시간 시간 (01, 02, 06)

%m 월 (01, 05, 15)
%c 월 (1, 9)
%M 월 (January, August)
%b 월 (Jan, Aug)

%W 요일 (Wednesday, friday)
%a 요일 (Wed, Fri)

%i 분 (00)

%S 초 (00)
*/