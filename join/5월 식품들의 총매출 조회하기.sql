SELECT o.PRODUCT_ID, p.PRODUCT_NAME, p.price * sum(o.amount) as TOTAL_SALES
from food_order o
    join food_product p on o.product_id = p.product_id
where date_format(o.produce_date, '%Y-%m') = '2022-05'
group by p.PRODUCT_NAME
order by TOTAL_SALES DESC, PRODUCT_ID