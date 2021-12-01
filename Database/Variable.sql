-- Variable.sql --

SQL 도 언어입니다. 

프로그래밍 기초

변수
연산자(산술,연결,논리,비교,,,,)
조건문(IF else)
반복문(FOR ,, )
예외처리(try catch)
함수(블록) --> FUNCTION

-- > Stored Procedure 라는 DB 객체 

---------------------------------------------
-- java 에서는 
int i = 10;
SYSTEM.OUT.println(i);

SET @i = 10;
SELECT @i;

SET @j= 20;
SELECT @i + @j;

set @iSal = 3000;

select *
from emp
where sal > @iSal;


set @iSal = 2500;
prepare eQuery
	from 'select * from emp where sal > ?';
execute eQuery using @iSal;

delimiter $$ 
create procedure usp_emp1()
begin
 select * from emp;
end $$;
delimiter;

call usp_emp1();

-- --------------------------
delimiter $$ 
create procedure usp_emp2(in iSal int)
begin
 select * from emp where sal > iSal;
end $$

-- call usp_emp2();
call usp_emp2(2500);

call usp_emp2(2999);
