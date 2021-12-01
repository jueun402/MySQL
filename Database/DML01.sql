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

alter table dept3 auto_increment=100; -- ���� : 100

insert into dept3 values(null,'IT','Seoul');
insert into dept3 values(null,'OP','Jeju');
insert into dept3 values(null,'AD','Pusan');

alter table dept3 auto_increment=1000; -- ���� : 1000

set @@auto_increment_increment=3; -- 3�� ����

insert into dept3 values(null,'IT','Seoul');
insert into dept3 values(null,'OP','Jeju');
insert into dept3 values(null,'AD','Pusan');

select * from dept3;

---------------------------------------------------------------
-- Data�� ����ִ� Table ����
create table dept4
select * from dept;

select * from dept4;


create table dept5 (deptno int primary key,
					dname  varchar(20),
					loc    varchar(20) 			);

select * from dept5;

-- ����ִ� Table�� Data�� ����
insert into dept5
select * from dept;

select * from dept5;

----------------------------------------------------
-- data ���� : update 

select * from dept2;

--> 90�� �μ��� ��ġ�� LA �� ����
1) ���
select loc
from dept2
where (deptno = 90);

2) ������
update dept2
 set loc = 'LA'
where (deptno = 90);

select * from dept2;

--> 70,90�� �μ��� ��ġ�� Jeju�� �������ּ���

1) ���
select loc
from dept2
where (deptno in(70,90));

2) ������
update dept2
set loc = 'Jeju'
where (deptno in(70,90));

select * from dept2;

--> 80�� �μ��� �̸��� Admin, ��ġ�� Pusan ���� �������ּ���

1) ���
select dname, loc
from dept2
where (deptno = 80);

2) ����
update dept2
 set dname ='Admin', loc = 'Pusan'
where (deptno = 80);

select * from dept2;

-- data ���� : delete 

80�� �μ��� ����

select *
from dept2
where (deptno = 80);

delete from dept2
where (deptno = 80);

select * from dept2;


-------------------------------------
emp ���� 
clerk ������ �ϸ鼭 RESEARCH �μ��� ������
manager ������ �ϸ鼭 Accounting �μ��� �������� �̸�, ���, job, �μ����� ����ϼ���

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
70 �� �μ�, Jeju ��ġ�� �μ��� ����

select *
from dept2
where (deptno,loc) in ((70,'Jeju'));

delete
from dept2
where (deptno,loc) in ((70,'Jeju'));

select * from dept2;
