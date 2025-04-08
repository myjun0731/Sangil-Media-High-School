create table [테이블명](
컬럼명 데이터타입(수량) null여부 unique여부 
primary key(컬럼명..),
foreign key(외래키이름[보통컬럼명과동일하게하거나 비슷하게함]) references 외래키를참조할테이블(참조할테이블에서외래키로가져올컬럼명),
);

CREATE TABLE menu_tbl_007(
menu_cd varchar2(5) not null primary key,
menu_nm varchar2(30),
price number(8),
menu_fg char(1)
);

insert into menu_tbl_007 values('10001','아메리카노','3600',0);
insert into menu_tbl_007 values('10002','카페 라떼','4100',0);
insert into menu_tbl_007 values('10003','카페 모카','4600',0);
insert into menu_tbl_007 values('10004','카라멜 마키아또','5100',0);
insert into menu_tbl_007 values('10005','호지 티 라떼','5400',1);
insert into menu_tbl_007 values('10006','그린 티 라떼','5400',1);
insert into menu_tbl_007 values('10007','차이 티 라떼','4100',1);

CREATE TABLE size_tbl_007(
size_cd varchar2(2) not null PRIMARY KEY,
size_nm varchar2(20),
plus_price varchar2(4)
);

insert into size_tbl_007 values('S1','short','0');
insert into size_tbl_007 values('T1','tall','500');
insert into size_tbl_007 values('G1','grade','1000');
insert into size_tbl_007 values('V1','venti','1500');

CREATE TABLE store_tbl_007(
store_cd varchar2(4) not null PRIMARY KEY,
store_nm varchar2(20),
store_loc varchar2(2),
open_date date
);

insert into store_tbl_007 values('A001','동부이촌동점','0','20181001');
insert into store_tbl_007 values('A002','이태원점','0','20181101');
insert into store_tbl_007 values('A003','서울타워점','0','20181201');
insert into store_tbl_007 values('A004','소공동점','1','20190101');
insert into store_tbl_007 values('A005','명동길점','1','20190201');
insert into store_tbl_007 values('A006','충무로역점','1','20190301');

CREATE TABLE sale_tbl_003(
sale_ymd varchar2(8) not null PRIMARY KEY,
sale_no varchar2(4),
store_cd varchar2(3),
menu_cd varchar2(5),
size_cd varchar2(2),
sale_cnt number(3),
pay_type varchar2(2)
);

insert into sale_tbl_003 values('20190429','0001','01','A001','10001','T1','4','02');
insert into sale_tbl_003 values('20190429','0002','01','A004','10002','S1','1','02');
insert into sale_tbl_003 values('20190429','0003','02','A004','10006','S1','1','02');
insert into sale_tbl_003 values('20190429','0004','01','A002','10006','T1','1','01');
insert into sale_tbl_003 values('20190429','0005','01','A005','10001','G1','1','01');
insert into sale_tbl_003 values('20190429','0006','02','A005','10003','S1','2','02');
insert into sale_tbl_003 values('20190429','0007','01','A003','10002','T1','3','02');
insert into sale_tbl_003 values('20190429','0008','01','A006','10001','S1','4','02');

drop table menu_tbl_007;
drop table size_tbl_007;
drop table store_tbl_007;
drop table sale_tbl_003;