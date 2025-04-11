drop table member_tbl;
drop table board_tbl;
drop table comment_tbl;

create table member_tbl(
	mid varchar(8) not null primary key,
	mname varchar(20) not null,
	mpw varchar(20) not null,
	tf varchar(1)
);

create table board_tbl(
	bid varchar(99) not null primary key,
	mname varchar(20),
	title varchar2(99) not null,
	bdate date,
	contents varchar2(256),
	mid varchar(8) not null,
	good varchar(100),
	nogoood varchar(100)
);


create table comment_tbl(
	bid varchar(8) not null primary key,
	mname varchar(20) not null,
	mid varchar(8) not null,
	com_contents varchar2(256),
	cdate date
);

insert into board_tbl values ('1', 'test','응애','20241212','아슈바','test','0','0');