-- GroupByHaving01.sql --

모든 직원들의 급여 합계, 급여 평균, 최대 급여, 최소 급여;

select sum(sal), avg(sal), max(sal), min(sal)
from emp;

업무별 모든 직원들의 급여 합계, 급여 평균, 최대 급여, 최소 급여;

select job, sum(sal), avg(sal), max(sal), min(sal)
from emp
group by job;


부서번호별 평균급여는?;

select deptno, avg(sal)
from emp
group by deptno;

업무별 평균급여가 3000 이상인 업무와 평균은?;

select job, avg(sal)
from emp 
-- where (평균급여가 3000 이상)
group by job
having (avg(sal) >= 3000);


부서번호별 평균급여가 2000 이상인 부서번호와 평균급여는 ?;

select deptno,  avg(sal)
from emp
group by deptno
having (avg(sal) >= 2000);

업무별 1년 소득평균이 30000 이상인 업무와 소득평균은? ( 1년 소득 => 12개월 급여 + 커미션);

select job, ((sal * 12) + ifnull(comm,0)) '소득평균'
from emp 
group by job
having ( avg((sal * 12) + ifnull(comm,0)) >= 30000);


salesman 업무를 하는 직원들의 평균급여는?;

select job, avg(sal)
from emp 
where (job = 'salesman' );

전 직원수는 ?;

select count(empno)
from emp;

전 업무의 개수는?;

select count(distinct job)
from emp;


select deptno, job, count(empno)
from emp
group by deptno, job
order by deptno, job;






