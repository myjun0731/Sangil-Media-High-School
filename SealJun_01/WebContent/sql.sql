create table member_tbl_02 (
custno number(6) not null primary key,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate date,
grade char(1),
city char(2)
);

create table money_tbl_02 (
custno number(6) not null,
saleno number(8) not null,
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date,
primary key(custno, saleno)
);

insert into member_tbl_02 values(100001, '김행복', '010-1111-2222', '서울 동대문구 휘경1동', '20151202', 'A', '01');
insert into member_tbl_02 values(100002, '이축복', '010-1111-3333', '서울 동대문구 휘경2동', '20151206', 'B', '01');
insert into member_tbl_02 values(100003, '장믿음', '010-1111-4444', '울릉군 울릉읍 독도1리', '20151201', 'B', '30');
insert into member_tbl_02 values(100004, '최사랑', '010-1111-5555', '울릉군 울릉읍 독도2리', '20151213', 'A', '30');
insert into member_tbl_02 values(100005, '진평화', '010-1111-6666', '제주도 제주시 외나무골', '20151225', 'B', '60');
insert into member_tbl_02 values(100006, '차공단', '010-1111-7777', '제주도 제주시 감나무골', '20151211', 'C', '60');

insert into money_tbl_02 values(100001, 20160001, 500, 5, 2500, 'A001','20160101');
insert into money_tbl_02 values(100001, 20160002, 1000, 4, 4000, 'A002','20160101');
insert into money_tbl_02 values(100001, 20160003, 500, 3, 1500, 'A008','20160101');
insert into money_tbl_02 values(100002, 20160004, 2000, 1, 2000, 'A004','20160102');
insert into money_tbl_02 values(100002, 20160005, 500, 1, 500, 'A001','20160103');
insert into money_tbl_02 values(100003, 20160006, 1500, 2, 3000, 'A003','20160103');
insert into money_tbl_02 values(100004, 20160007, 500, 2, 1000, 'A001','20160104');
insert into money_tbl_02 values(100004, 20160008, 300, 1, 300, 'A005','20160104');
insert into money_tbl_02 values(100004, 20160009, 600, 1, 600, 'A006','20160104');
insert into money_tbl_02 values(100004, 20160020, 3000, 1, 3000, 'A007','20160106');

select member_tbl_02.custno, custname, grade, sum(amount*pcost)
from member_tbl_02, money_tbl_02
where member_tbl_02.custno = money_tbl_02.custno
group by member_tbl_02.custno, custname, grade
order by sum(amount*pcost) DESC;

select member_tbl_02.custno, custname, grade, sum(amount*pcost) from member_tbl_02, money_tbl_02 where member_tbl_02.custno = money_tbl_02.custno group by member_tbl_02.custno, custname, grade order by sum(amount*pcost) DESC;

select m1.custno, custname, grade, sum(amount*pcost) as total from member_tbl_02 m1, money_tbl_02 m2 where m1.custno = m2.custno group by m1.custno, custname, grade order by sum(amount*pcost) DESC;

select m1.custno, custname, grade, sum(amount*pcost) as total from member_tbl_02 m1, money_tbl_02 m2 where m1.custno = m2.custno group by m1.custno, custname, grade
order by
total
DESC;