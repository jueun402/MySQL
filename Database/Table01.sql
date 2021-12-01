-- Table01.sql --
-- DDL : 정의 -> create, alter, drop --

CREATE TABLE t30(
	id int, 
	age int not null check(age>0)
);

insert into T30 values(10,10);

insert into T30 values(null,null);
insert into T30 values(null,-10);

select * from t30;

CREATE TABLE t31(
	id int, 
	age int not null,
	check(age>0)
);

insert into T31 values(10,10);

insert into T31 values(null,null);
insert into T31 values(null,-10);

select * from t30;

show table status;

------------------------------------------------
select sysdate(); 

create table userTbl(
	uNo int auto_increment primary key,
	uID varchar(10) not null unique,
	uName varchar(10) not null,
	uAge int not null check(uAge between 0 and 120) ,
	uAddr char(4) default '서울',
	mob1 char(3) check(mob1 in ('010','011','019') ),
	mob2 char(8),
	uDate datetime not null default now()
);

drop table usertbl ;

create table userTbl(
	uNo int auto_increment ,
	uID varchar(10) not null ,
	uName varchar(10) not null,
	uAge int not null  ,
	uAddr char(4) default '서울',
	mob1 char(3) ,
	mob2 char(8),
	uDate datetime not null default now(),
	
	constraint userTbl_uNo_pk primary key(uNo),
	constraint userTbl_uID_uk unique(uID),
	constraint userTbl_uAge_ck check(uAge between 0 and 120) ,
	constraint userTbl_umob1_ck check(mob1 in ('010','011','019') )
);

drop table buyTbl;

create table buyTbl(
	bNo int auto_increment,
	bname varchar(20) not null,
	price int  not null,
	amount int  not null,
	uNo int  not null,
	
	constraint buyTbl_bNo_pk primary key(bNo),
	constraint buyTbl_uNo_userTbl_fk foreign key (uNo) 
				references userTbl(uNo)
);

-- -------------------------------------------------------------

insert into buytbl values (null,'Pen',100,3,10);

insert into usertbl values (null,'uTom','Tom',30,default,'010','11111111',default);

insert into usertbl values ('uJane','Jane',40,default,'011','12121212',default);

insert into usertbl values (null,'uJane','Jane',200,default,'011','12121212',default);

select * from usertbl;
select * from buytbl;

insert into buytbl values (null,'Pen',100,3,1);

select * 
from usertbl u , buytbl b 
where (u.uNo = b.uNo);

---------------------------------------------
create table uTbl(
	uNo int not null,
	uID varchar(10) not null,
	uName varchar(10) not null,
	uAge int not null ,
	uAddr char(4) ,
	mob1 char(3) ,
	mob2 char(8),
	uDate datetime not null 
);

alter table uTbl 
 add constraint uTbl_uNo_pk primary key(uNo); -- 제약조건 추가
 
alter table utbl 
 alter column uAddr set default '서울'; -- 컬럼 변경
 
alter table utbl 
 add column height smallint; -- 컬럼 추가
 
alter table utbl 
 add column weight smallint ; -- 컬럼 추가
 
alter table utbl 
 drop column weight; -- 컬럼 제거 
 
 
select * 
from usertbl u , buytbl b 
where (u.uNo = b.uNo); 

