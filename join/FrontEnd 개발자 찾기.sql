-- & 비트 연산
select distinct ID, EMAIL, FIRST_NAME, LAST_NAME
from developers d join skillcodes s on d.skill_code & s.code = s.code
where s.category like 'Front End'
order by d.id