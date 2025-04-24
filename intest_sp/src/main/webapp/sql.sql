drop table tbl_specialty;
drop table tbl_region;
drop table tbl_sales;

create table tbl_specialty (
s_code varchar2(10) not null primary key,
s_name varchar2(20),
s_price varchar2(10)
);

insert into tbl_specialty values ('T01', '강화 인삼', 50000);
insert into tbl_specialty values ('T02', '제주 감귤', 15000);
insert into tbl_specialty values ('T03', '영덕 대게', 120000);
insert into tbl_specialty values ('T04', '나주 배', 30000);
insert into tbl_specialty values ('T05', '전주 비빔밥', 10000);
insert into tbl_specialty values ('T06', '속초 오징어', 20000);
insert into tbl_specialty values ('T07', '거창 사과', 25000);
insert into tbl_specialty values ('T08', '하동 녹차', 20000);
insert into tbl_specialty values ('T09', '보성 녹차', 22000);

create table tbl_region(
r_code varchar2(10) not null primary key,
r_name varchar2(20)
);

insert into tbl_region values ('R01', '강화군');
insert into tbl_region values ('R02', '제주도');
insert into tbl_region values ('R03', '영덕군');
insert into tbl_region values ('R04', '나주시');
insert into tbl_region values ('R05', '전주시');
insert into tbl_region values ('R06', '속초시');

create table tbl_sales(
sale_num number(10) not null primary key,
s_code varchar2(10) not null,
sale_date date,
r_code varchar2(10) not null,
sale_count number(10)
);

insert into tbl_sales values (10001, 'T01', '2024-03-29', 'R01', 50);
insert into tbl_sales values (10002, 'T02', '2024-03-29', 'R02', 40);
insert into tbl_sales values (10003, 'T03', '2024-03-29', 'R03', 20);
insert into tbl_sales values (10004, 'T03', '2024-03-29', 'R01', 30);
insert into tbl_sales values (10005, 'T04', '2024-03-29', 'R04', 40);
insert into tbl_sales values (10006, 'T02', '2024-03-29', 'R04', 30);
insert into tbl_sales values (10007, 'T01', '2024-03-29', 'R03', 40);
insert into tbl_sales values (10008, 'T06', '2024-03-29', 'R06', 10);
insert into tbl_sales values (10009, 'T07', '2024-03-29', 'R05', 10);
insert into tbl_sales values (10010, 'T08', '2024-03-29', 'R05', 10);
insert into tbl_sales values (10011, 'T09', '2024-04-08', 'R05', 10);

select count(*) +1 as next_seq from tbl_specialty;


select
sa.sale_num, sp.s_name,
to_char(sa.sale_date, 'YYYY-MM-DD'),
re.r_name, sa.sale_count, to_char(sp.s_price,'999,999'),
to_char(sum(sp.s_price*sale_count), '999,999,999')
from tbl_sales sa, tbl_specialty sp, tbl_region re
where sa.r_code = re.r_code and sa.s_code = sp.s_code
group by sa.sale_num, sp.s_name, sa.sale_date, re.r_name, sa.sale_count, sp.s_price
order by sa.sale_num;