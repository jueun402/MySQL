-- DML01.sql --

select * from dept2;

insert into dept2(deptno,dname,loc) values(50,'IT','Seoul');

insert into dept2(dname,loc,deptno) values('OP','Pusan',60);

insert into dept2 values(70,'AD','ILSAN');

insert into dept2 values (80,'MKT','Jeju'),
						 (90,'Dev','Jeju');

select * from dept2;

desc dept;

-- deptno int primary key 
-- dname  varchar(20)
-- loc    varchar(20)
-------------------------------
create table dept3 (deptno int auto_increment primary key,
					dname  varchar(20),
					loc    varchar(20) 			);
				
				
insert into dept3 values(null,'IT','Seoul');

insert into dept3 values(null,'OP','Jeju');
insert into dept3 values(null,'AD','Pusan');

alter table dept3 auto_increment=100; -- 시작 : 100

insert into dept3 values(null,'IT','Seoul');
insert into dept3 values(null,'OP','Jeju');
insert into dept3 values(null,'AD','Pusan');

alter table dept3 auto_increment=1000; -- 시작 : 1000

set @@auto_increment_increment=3; -- 3씩 증가

insert into dept3 values(null,'IT','Seoul');
insert into dept3 values(null,'OP','Jeju');
insert into dept3 values(null,'AD','Pusan');

select * from dept3;

---------------------------------------------------------------
-- Data가 들어있는 Table 복사
create table dept4
select * from dept;

select * from dept4;


create table dept5 (deptno int primary key,
					dname  varchar(20),
					loc    varchar(20) 			);

select * from dept5;

-- 비어있는 Table에 Data만 복사
insert into dept5
select * from dept;

select * from dept5;

----------------------------------------------------
-- data 수정 : update 

select * from dept2;

--> 90번 부서의 위치를 LA 로 수정
1) 출력
select loc
from dept2
where (deptno = 90);

2) 수정문
update dept2
 set loc = 'LA'
where (deptno = 90);

select * from dept2;

--> 70,90번 부서의 위치를 Jeju로 수정해주세요

1) 출력
select loc
from dept2
where (deptno in(70,90));

2) 수정문
update dept2
set loc = 'Jeju'
where (deptno in(70,90));

select * from dept2;

--> 80번 부서의 이름은 Admin, 위치는 Pusan 으로 수정해주세요

1) 출력
select dname, loc
from dept2
where (deptno = 80);

2) 수정
update dept2
 set dname ='Admin', loc = 'Pusan'
where (deptno = 80);

select * from dept2;

-- data 삭제 : delete 

80번 부서를 삭제

select *
from dept2
where (deptno = 80);

delete from dept2
where (deptno = 80);

select * from dept2;


-------------------------------------
emp 에서 
clerk 업무를 하면서 RESEARCH 부서인 직원과
manager 업무를 하면서 Accounting 부서인 직원들의 이름, 사번, job, 부서명을 출력하세요

select e.ename, e.empno, e.job, d.dname
from emp e, dept d
where (e.deptno = d.deptno)
  and (		((e.job = 'clerk' ) and  (d.dname ='RESEARCH') )
  		or  ((e.job = 'manager') and  (d.dname = 'Accounting') )   );

select e.ename, e.empno, e.job, d.dname
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.job,d.dname) in (('clerk','Research') , ('manager','Accounting'));

------------------------------------------------------
70 번 부서, Jeju 위치인 부서를 삭제

select *
from dept2
where (deptno,loc) in ((70,'Jeju'));

delete
from dept2
where (deptno,loc) in ((70,'Jeju'));

select * from dept2;
