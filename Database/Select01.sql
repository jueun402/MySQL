-- Select01.sql -- 

-- 한줄 주석 -- 
/* 여러  
	줄
    주석
*/

-- select 컬럼, ,, 컬럼  from 데이터베이스.테이블 ;

select * from empdb.dept;
select * from employees.employees;

use empdb;

select * from dept;
select * from emp;
select * from salgrade;

use employees;
select * from employees;

use empdb;
select * from emp;
select * from dept;
select * from salgrade;

-- 직원들의 이름, 사번, 급여는 ?

select ename, empno, sal
from emp;

-- 부서들의 부서명, 위치는 ?
select dname, loc
from dept;

-- 직원들의 이름, 사번, 업무, 급여, 입사일자는 ?

select 	ename as "사원이름", -- 컬럼(Column) 별칭
		empno "사번", 
        job as 업무, 
        sal '급여', 
        hiredate "입사 일자"
from emp;

-- 직원들의 job은 ?
select distinct job -- distinct <-- 중복제거 
from emp;

select distinct job, sal from emp;
select distinct ename, job from emp;

select job, sal from emp;

select ename, empno, job
from emp
order by ename asc; -- asc[기본값] 오름차순, desc 내림차순

select ename, empno, job
from emp
order by ename desc; 

select ename, empno, job
from emp
order by ename; 

-- 직원들의 부서번호(내림차순), job(오름차순), 이름, 사번 출력

use empdb;
select deptno, job, ename, empno
from emp
order by deptno desc, job asc; 

--------------------------------------
select ename, empno, sal
from emp
order by ename
	limit 5;

select ename, empno, sal
from emp
order by ename
	limit 5,3;
