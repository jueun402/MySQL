
-- Union01.sql --

DDL (���� -> DB object : table, index, database, view , function, stored procedure,,,)
	-- create(����), alter(����), drop(����) 

-- create/alter/drop  DB Object[Table]

create table t10 (�÷� Ÿ��, �÷� Ÿ��,,,,,)

create table t10 (id int, txt varchar(10));
create table t20 (id int, txt varchar(10));

DML (���� -> Data)
	-- insert(�Է�), update(����), delete(����)
	-- select(��ȸ)

insert into t10 values(10,'A');
insert into t10 values(20,'B');
insert into t10 values(30,'C');

select * from t10;

insert into t20 values (20,'B'),(30,'C'),(40,'D');

select * from t20;

-- ������

select * from t10
union all
select * from t20;

select * from t10
union
select * from t20;

select empno,ename from emp
union
select id,txt from t10;

select ename,empno from emp
union
select * from t10;

--> ������ ��ġ�ؾ� �ȴ�. 
-- select empno,ename,sal from emp
-- union
-- select * from t10;

-- ������

select * from t10
where id in (select id from t20);

-- ������
select * from t10   -- t10 - t20
where id not in (select id from t20);

select * from t20	-- t20 - t10
where id not in (select id from t10);






