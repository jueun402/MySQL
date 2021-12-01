-- Variable.sql --

SQL �� ����Դϴ�. 

���α׷��� ����

����
������(���,����,��,��,,,,)
���ǹ�(IF else)
�ݺ���(FOR ,, )
����ó��(try catch)
�Լ�(���) --> FUNCTION

-- > Stored Procedure ��� DB ��ü 

---------------------------------------------
-- java ������ 
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
