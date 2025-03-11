create table member_tbl_02(
custno number(6) not null Primary key,
custname varchar2(20),
phone varchar2(13),
address varchar2(60),
joindate date,
grade char(1),
city char(2)
);

create table money_tbl_02(
custno number(6),
salenol number(8),
pcost number(8),
amount number(4),
price number(8),
pcode varchar2(4),
sdate date,
CONSTRAINT money_tbl_02 PRIMARY KEY (custno, salenol)
);

insert into member_tbl_02 values(100001,'���ູ','010-1111-2222','���� ���빮�� �ְ�1��','20151202','A','01');
insert into member_tbl_02 values(100002,'���ູ','010-1111-3333','���� ���빮�� �ְ�2��','20151206','B','01');
insert into member_tbl_02 values(100003,'�����','010-1111-4444','�︪�� �︪�� ����1��','20151001','B','30');
insert into member_tbl_02 values(100004,'�ֻ��','010-1111-5555','�︪�� �︪�� ����2��','20151113','A','30');
insert into member_tbl_02 values(100005,'����ȭ','010-1111-6666','���ֵ� ���ֽ� �ܳ�����','20151225','B','60');
insert into member_tbl_02 values(100006,'������','010-1111-7777','���ֵ� ���ֽ� ��������','20151211','C','60');

