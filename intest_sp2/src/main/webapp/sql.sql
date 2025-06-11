select count(*) +1 from tbl_specialty

select
sa.sale_num, sp.s_name,
to_char(sa.sale_date, 'YYYY-MM-DD'),
re.r_name, sa.sale_count, to_char(sp.s_price,'999,999'),
to_char(sum(sp.s_price*sale_count), '999,999,999')
from tbl_sales sa, tbl_specialty sp, tbl_region re
where sa.r_code = re.r_code and sa.s_code = sp.s_code
group by sa.sale_num, sp.s_name, sa.sale_date, re.r_name, sa.sale_count, sp.s_price
order by sa.sale_num;

select to_char(sum(sum(sp.s_price*sa.sale_count)),'999,999,999')
from tbl_specialty sp, tbl_sales sa
where sa.s_code = sp.s_code
group by sa.sale_count, sp.s_price;