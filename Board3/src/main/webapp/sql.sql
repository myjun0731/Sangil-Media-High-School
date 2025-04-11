drop table member_tbl;
drop table board_tbl;
drop table comment_tbl;

create table member_tbl(
	mid varchar(8) not null primary key,
	mname varchar(12) not null,
	mpw varchar(12) not null,
	tf varchar(1)
);

create table board_tbl(
	bid varchar(50) not null primary key,
	mname varchar(12),
	title varchar2(30) not null,
	bdate date,
	contents varchar2(256),
	mid varchar(8) not null,
	tag varchar(3) not null
);


create table comment_tbl(
	bid varchar(8) not null primary key,
	mname varchar(20) not null,
	mid varchar(8) not null,
	com_contents varchar2(256),
	cdate date
);

select bid, title, mname, bdate, mid from board_tbl where title like '%발%';