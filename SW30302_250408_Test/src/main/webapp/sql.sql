create table member_tbl (
    id varchar2(5) not null primary key,
    name varchar2(20),
    gender varchar2(3)
);

create table score_tbl (
    id varchar2(5) not null primary key,
    korean number(3),
    english number(3),
    math number(3),
    history number(3)
);

insert into member_tbl values ('10301', '권기현', '남');
insert into member_tbl values ('10302', '구지우', '여');
insert into member_tbl values ('10303', '권태준', '남');
insert into member_tbl values ('10304', '금기연', '여');
insert into member_tbl values ('10305', '김영진', '남');
insert into member_tbl values ('10401', '김주현', '남');
insert into member_tbl values ('10402', '김태민', '여');
insert into member_tbl values ('10403', '임수민', '여');
insert into member_tbl values ('10404', '남상도', '남');
insert into member_tbl values ('10405', '조은호', '여');


insert into score_tbl values ('10301', 70, 80, 75, 95);
insert into score_tbl values ('10302', 80, 73, 80, 85);
insert into score_tbl values ('10303', 45, 75, 45, 75);
insert into score_tbl values ('10304', 65, 73, 65, 65);
insert into score_tbl values ('10305', 90, 100, 68, 95);
insert into score_tbl values ('10401', 95, 75, 84, 60);
insert into score_tbl values ('10402', 65, 70, 50, 94);
insert into score_tbl values ('10403', 80, 60, 100, 80);
insert into score_tbl values ('10404', 64, 50, 40, 65);
insert into score_tbl values ('10405', 55, 70, 80, 75);
--1St_List.jsp
SELECT
	id,
	name,
	substr(id, 0, 1),
	substr(id, 2, 2),
	substr(id, 4, 3),
	gender
FROM
	member_tbl;
	
	insert into score_tbl values (?,?,?,?,?);
	
	drop table member_tbl;
	drop table score_tbl;