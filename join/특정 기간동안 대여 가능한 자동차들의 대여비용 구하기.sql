select c.CAR_ID, c.CAR_TYPE, round(c.daily_fee * 30 * (100 - p.discount_rate) / 100) as FEE
from car_rental_company_car c
         join car_rental_company_rental_history h on c.car_id = h.car_id
         join car_rental_company_discount_plan p on c.car_type = p.car_type
-- 2022년 11월 1일부터 2022년 11월 30일까지 대여 가능 (렌탈 기록이 없어야함)
where c.car_id not in (
    select car_id
    from car_rental_company_rental_history
    where end_date >= '2022-11-01' and start_date <= '2022-12-01')
  -- 30일간의 대여
  and p.duration_type like '30%'
group by c.car_id
-- '세단' 또는 'SUV' 금액이 50만원 이상 200만원 미만
having c.car_type in ('세단', 'SUV') and (FEE >= 500000 and FEE < 2000000)
-- 대여 금액을 기준으로 내림차순 정렬하고, 대여 금액이 같은 경우 자동차 종류를 기준으로 오름차순 정렬, 자동차 종류까지 같은 경우 자동차 ID를 기준으로 내림차순 정렬
order by FEE desc, car_type, car_id desc