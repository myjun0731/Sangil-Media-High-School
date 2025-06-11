drop table tbl_jumin_201808;
drop table tbl_hosp_202108;
drop table tbl_vaccresv_202108;

create table tbl_jumin_201808(
    jumin varchar(14) not null primary key,
    pname varchar2(16),
    tel varchar2(13),
    address varchar2(10)
);

create table tbl_hosp_202108(
    hospcode char(4) not null primary key,
    hospname varchar2(10),
    hosptel varchar2(10),
    hospaddr varchar2(10)
);

create table tbl_vaccresv_202108(
    resvno char(8) not null primary key,
    jumin varchar(14),
    vcode char(4),
    hospcode char(4),
    resvdate char(8),
    resvtime char(4)
);

insert into tbl_jumin_201808 values('700101-1000001', '김주민', '010-1234-0001', '서울');
insert into tbl_jumin_201808 values('700101-2000002', '이주민', '010-1234-0002', '서울');
insert into tbl_jumin_201808 values('700101-1000003', '박주민', '010-1234-0003', '서울');
insert into tbl_jumin_201808 values('700101-2000004', '조주민', '010-1234-0004', '대전');
insert into tbl_jumin_201808 values('700101-1000005', '홍주민', '010-1234-0005', '대전');
insert into tbl_jumin_201808 values('700101-2000006', '나주민', '010-1234-0006', '대구');
insert into tbl_jumin_201808 values('700101-1000007', '황주민', '010-1234-0007', '대구');
insert into tbl_jumin_201808 values('700101-2000008', '용주민', '010-1234-0008', '광주');
insert into tbl_jumin_201808 values('700101-1000009', '백주민', '010-1234-0009', '광주');
insert into tbl_jumin_201808 values('700101-2000010', '송주민', '010-1234-0010', '광주');

insert into tbl_hosp_202108 values('H001', '가-병원', '1588-0001', '서울');
insert into tbl_hosp_202108 values('H002', '나-병원', '1588-0002', '대전');
insert into tbl_hosp_202108 values('H003', '다-병원', '1588-0003', '대구');
insert into tbl_hosp_202108 values('H004', '라-병원', '1588-0004', '광주');

insert into tbl_vaccresv_202108 values('20210001', '700101-1000001', 'V001', 'H001', '20210901', '0920');
insert into tbl_vaccresv_202108 values('20210002', '700101-2000002', 'V001', 'H002', '20210901', '1030');
insert into tbl_vaccresv_202108 values('20210003', '700101-1000003', 'V002', 'H003', '20210902', '1130');
insert into tbl_vaccresv_202108 values('20210004', '700101-2000004', 'V002', 'H001', '20210902', '1230');
insert into tbl_vaccresv_202108 values('20210005', '700101-1000005', 'V002', 'H002', '20210902', '1330');
insert into tbl_vaccresv_202108 values('20210006', '700101-2000006', 'V003', 'H003', '20210903', '1430');
insert into tbl_vaccresv_202108 values('20210007', '700101-1000007', 'V003', 'H001', '20210903', '1530');
insert into tbl_vaccresv_202108 values('20210008', '700101-2000008', 'V003', 'H002', '20210903', '1630');
insert into tbl_vaccresv_202108 values('20210009', '700101-1000009', 'V003', 'H003', '20210904', '1730');
insert into tbl_vaccresv_202108 values('20210010', '700101-2000010', 'V003', 'H001', '20210904', '1830');

select ju.pname, ju.jumin, decode(substr(ju.jumin, 8, 1), '1', '남', '2', '여'), ju.tel, va.resvdate, substr(va.resvtime, 0,2) || ':' || substr(va.resvtime, 3,2), ho.hospname, ho.hosptel, ho.hospaddr, decode(va.vcode, 'V001','A백신','V002','B백신','V003','C백신')
from tbl_vaccresv_202108 va, tbl_hosp_202108 ho, tbl_jumin_201808 ju
where va.jumin = ju.jumin and ho.hospcode = va.hospcode and ju.jumin like ;
