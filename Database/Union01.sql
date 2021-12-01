
-- Union01.sql --

DDL (정의 -> DB object : table, index, database, view , function, stored procedure,,,)
	-- create(생성), alter(변경), drop(제거) 

-- create/alter/drop  DB Object[Table]

create table t10 (컬럼 타입, 컬럼 타입,,,,,)

create table t10 (id int, txt varchar(10));
create table t20 (id int, txt varchar(10));

DML (조작 -> Data)
	-- insert(입력), update(수정), delete(삭제)
	-- select(조회)

insert into t10 values(10,'A');
insert into t10 values(20,'B');
insert into t10 values(30,'C');

select * from t10;

insert into t20 values (20,'B'),(30,'C'),(40,'D');

select * from t20;

-- 합집합

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

--> 개수는 일치해야 된다. 
-- select empno,ename,sal from emp
-- union
-- select * from t10;

-- 교집합

select * from t10
where id in (select id from t20);

-- 차집합
select * from t10   -- t10 - t20
where id not in (select id from t20);

select * from t20	-- t20 - t10
where id not in (select id from t10);






