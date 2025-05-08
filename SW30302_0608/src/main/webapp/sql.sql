drop table TBL_ITEM_01;
drop table TBL_SERVER_01;
drop table TBL_SAMPLE_01;

create table TBL_ITEM_01 (
    PCODE VARCHAR2(10) not null primary key,
    PNAME VARCHAR2(50),
    TYPE VARCHAR2(1),
    PRICE NUMBER(10)
);

create table TBL_SERVER_01 (
    SCODE VARCHAR2(10) not null primary key,
    SNAME VARCHAR2(20)
);

create table TBL_SAMPLE_01 (
    SALENO NUMBER(10) not null  primary key,
    PCODE VARCHAR2(10),
    SALEDATE DATE,
    AMOUNT NUMBER(10),
    SCODE VARCHAR2(10),
    ISBUY VARCHAR2(1) not null,
    CONSTRAINT fk_code FOREIGN KEY(SCODE) REFERENCES TBL_SERVER_01(SCODE) ON DELETE CASCADE,
    CONSTRAINT fk_code2 FOREIGN KEY(PCODE) REFERENCES TBL_ITEM_01(PCODE) ON DELETE CASCADE
);

insert into TBL_ITEM_01 values ('AA01', '코어 젬스톤', 'B', 6000);
insert into TBL_ITEM_01 values ('AA02', '수상한 큐브', 'B', 5500);
insert into TBL_ITEM_01 values ('AA03', '아케인리버 물방울석', 'C', 4000);
insert into TBL_ITEM_01 values ('AA04', '경험의 흔적', 'C', 4500);
insert into TBL_ITEM_01 values ('AA05', '노가다 목장갑', 'A', 7000);
insert into TBL_ITEM_01 values ('AA06', '하프 이어링', 'A', 6500);
insert into TBL_ITEM_01 values ('AA07', '파워 엘릭서', 'B', 5000);
insert into TBL_ITEM_01 values ('AA08', '희미한 낙인의 영혼석', 'C', 3500);
insert into TBL_ITEM_01 values ('AA09', '파란색 가운', 'A', 7500);

insert into TBL_SERVER_01 values ('S001', '엘리시움');
insert into TBL_SERVER_01 values ('S002', '크로아');
insert into TBL_SERVER_01 values ('S003', '스카니아');
insert into TBL_SERVER_01 values ('S004', '이노시스');
insert into TBL_SERVER_01 values ('S005', '베라');
insert into TBL_SERVER_01 values ('S006', '리부트2');

insert into TBL_SAMPLE_01 values (100001, 'AA01', to_date('20200901', 'YYYYMMDD'), 50, 'S002', 'N');
insert into TBL_SAMPLE_01 values (100002, 'AA03', to_date('20200831', 'YYYYMMDD'), 40, 'S001', 'N');
insert into TBL_SAMPLE_01 values (100003, 'AA04', to_date('20200831', 'YYYYMMDD'), 20, 'S003', 'N');
insert into TBL_SAMPLE_01 values (100004, 'AA04', to_date('20200830', 'YYYYMMDD'), 30, 'S004', 'N');
insert into TBL_SAMPLE_01 values (100005, 'AA05', to_date('20200831', 'YYYYMMDD'), 40, 'S002', 'N');
insert into TBL_SAMPLE_01 values (100006, 'AA03', to_date('20200829', 'YYYYMMDD'), 30, 'S006', 'N');
insert into TBL_SAMPLE_01 values (100007, 'AA01', to_date('20200902', 'YYYYMMDD'), 40, 'S003', 'N');
insert into TBL_SAMPLE_01 values (100008, 'AA04', to_date('20200830', 'YYYYMMDD'), 10, 'S002', 'N');
insert into TBL_SAMPLE_01 values (100009, 'AA01', to_date('20200827', 'YYYYMMDD'), 20, 'S003', 'Y');
insert into TBL_SAMPLE_01 values (100010, 'AA05', to_date('20200828', 'YYYYMMDD'), 30, 'S006', 'Y');
insert into TBL_SAMPLE_01 values (100011, 'AA01', to_date('20200830', 'YYYYMMDD'), 40, 'S003', 'N');
insert into TBL_SAMPLE_01 values (100012, 'AA03', to_date('20200827', 'YYYYMMDD'), 50, 'S003', 'Y');
insert into TBL_SAMPLE_01 values (100013, 'AA04', to_date('20200831', 'YYYYMMDD'), 50, 'S004', 'N');
insert into TBL_SAMPLE_01 values (100014, 'AA05', to_date('20200901', 'YYYYMMDD'), 20, 'S001', 'N');
insert into TBL_SAMPLE_01 values (100015, 'AA01', to_date('20200827', 'YYYYMMDD'), 30, 'S004', 'Y');

select ISBUY from TBL_SAMPLE_01 where SALENO;

select sa.saleno,
i.pname,
sa.saledate,
se.sname,
sa.amount, 
to_char(sum(i.price*sa.amount),'999,999,999')|| ' 메소',   sa.isbuy
from tbl_sample_01 sa,tbl_server_01 se,tbl_item_01 i
where  i.pcode = sa.pcode and se.scode = sa.scode and i.pname like '%  select  %'
group by sa.saleno, i.pname,sa.saledate,se.sname,
sa.amount,sa.isbuy order by sa.saleno;


select * from TBL_ITEM_01 order by PCODE;