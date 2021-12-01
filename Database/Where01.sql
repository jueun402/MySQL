-- Where01.sql -- 

select * from emp;

describe emp; -- table 구조 확인
desc emp;

----------------------------------

smith 이름의 사번,job은 ?

select empno,job
from emp 
where (ename = 'smith');

clerk 업무를 하는 직원들의 이름, 업무, 사번은?;

select ename, job, empno
from emp 
where (job = 'clerk');

30번 부서에서 salesman 인 직원들의 이름, 부서번호,  job은 ?;

select ename, deptno,  job
from emp
where (deptno = 30 )
 and  (job = 'salesman' );

급여가 3000 이상인 직원들의 이름, 사번, 급여는 ?;

select ename, empno, sal 
from emp
where (sal >= 3000);

급여가 1550 ~ 3000 사이인 직원들의 이름, 사번, 급여는?;

select ename, empno, sal 
from emp
where (sal >= 1550)
 and  (sal <= 3000);

select ename, empno, sal 
from emp
where (sal between 1550 and 3000);

급여가 1200 ~ 3000 사이의 직원들 중 업무가 salesman 인
직원들의 이름, 사번, 업무, 급여는?;

select ename, empno, job, sal
from emp
where (sal between 1200 and 3000)
 and (job = 'salesman');

급여가 1250,1600,3000 인 직원들 중 업무가 analyst 인
직원들의 이름, 사번, 업무, 급여는?

select ename, empno, job, sal
from emp
where ((sal = 1250) or  (sal = 1600) or (sal = 3000))
 and  (job = 'analyst'); 
 
select ename, empno, job, sal
from emp
where (sal in (1250,1600,3000) )
 and  (job = 'analyst'); 
 
 s 로 시작하는 이름을 가진 직원들의 이름, 사번, 급여는?;

select ename, empno, sal
from emp
where (ename like 's%'); -- % 여러자리 아무거나, _ 한자리 아무거나

앞에서 두번째 자리가 A인 직원들의 이름, 사번은?;

select ename, empno
from emp
where ename like '_A%';

뒤에서 두번째 자리가 E인 직원들의 이름, 사번은?;

select ename, empno
from emp
where ename like '%E_';


-------------------------------
is null
is not null


커미션이 있는 직원들의 이름, 커미션은?;

select ename, comm
from emp  
where (comm is not null) and (comm > 0 );

select ename, comm
from emp  
where (comm > 0 );

커미션이 없는(null,0) 직원들의 이름, 커미션은?;

select ename, comm
from emp  
where (comm is null) or( comm = 0 );
--where (comm < 0 );

-----------------------------------
select 20 + 10, 20 - 10,20 * 10,20 / 10
from dual;

select concat('Ko','rea')
from dual;

직원들의 이름, 1년치 급여는? (12개월 sal);

select ename, 12 * sal
from emp;

select ifnull(null,0);

직원들의 이름, 1년 소득은? (1년치 급여 + 커미션);

select ename, (12 * sal) + ifnull(comm,0)
from emp;

모든 직원들의 이름, 1년 소득 표현
예) smith의 1년 소득은 100000

select concat(ename,'의 1년 소득은 ', (12 * sal) + ifnull(comm,0)) as "급여표현"
from emp;




 