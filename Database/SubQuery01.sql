-- SubQuery01.sql --

smith와 같은 job을 가진 직원들의 이름, job은? 

1) smith의 job ?

select job
from emp 
where (ename = 'smith');

2) CLERK job을 가진 직원들의 이름, job은? 

select ename, job
from emp 
where (job = 'CLERK');

3) 결 합

select ename, job
from emp 
where (job = (select job
				from emp 
				where (ename = 'smith') ) );
				
----------------------------------------------------

smith와 같은 급여등급을 가진 직원들의 이름, 급여, 급여등급은?

1) smith 급여등급 ?

select s.grade
from emp e, salgrade s 
where (e.sal between s.losal and s.hisal)
 and  (e.ename = 'smith');

2) 1 급여등급을 가진 직원들의 이름, 급여, 급여등급은?

select e.ename, e.sal, s.grade 
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade = 1);

3) 결 합

select e.ename, e.sal, s.grade 
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade = ( select s.grade
					from emp e, salgrade s 
					where (e.sal between s.losal and s.hisal)
					 and  (e.ename = 'smith') ));
					
					
-------------------------------------------------
smith와 같은 부서인 직원들의 이름, 부서명은?

1) smith 부서번호?

select deptno
from emp
where (ename = 'smith');

2) 20 부서인 직원들의 이름, 부서명은?

select e.ename, d.dname
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.deptno = 20);

3) 결 합

select e.ename, d.dname
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.deptno = ( select deptno
					from emp
					where (ename = 'smith') ));


smith와 같은 부서인 직원들의 이름, job은?

1) smith 부서번호?

select deptno
from emp
where (ename = 'smith');

2) 20 부서인 직원들의 이름, job은?

select ename, job
from emp 
where (deptno = 20);

3) 결 합

select ename, job
from emp 
where (deptno = ( select deptno
					from emp
					where (ename = 'smith') ) );

전 직원의 평균급여보다 급여를 많이 받는 직원들의 이름, 급여, 급여등급은?

1) 전 직원의 평균급여

select avg(sal)
from emp;

2) 2073 급여보다 급여를 많이 받는 직원들의 이름, 급여, 급여등급은?

select e.ename , e.sal, s.grade 
from emp e, salgrade s 
where (e.sal between s.losal and s.hisal)
 and  ( e.sal > 2073 );

3) 결 합

select e.ename , e.sal, s.grade 
from emp e, salgrade s 
where (e.sal between s.losal and s.hisal)
 and  ( e.sal > (select avg(sal)
				 from emp) );
------------------------------------------------------				
allen의 직속상관과 같은 상관을 모시는 직원들의
이름, 사번, 부서명, 직속상관이름은?
(단, allen 제외)

1) allen의 직속상관 사번 ?

select mgr
from emp
where (ename = 'allen');

2) 7698 사번이 직속상관이 직원들의 이름, 사번, 부서명, 직속상관 이름은 ?

select ee.ename, ee.empno, ed.dname, me.ename
from emp ee, dept ed, emp me
where ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno)
 and  ( ee.mgr = 7698 );

3) 결 합
select ee.ename, ee.empno, ed.dname, me.ename
from emp ee, dept ed, emp me
where ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno)
 and  ( ee.mgr = ( select mgr
					from emp
					where (ename = 'allen') ) );

4) 변 형
select ee.ename, ee.empno, ed.dname, me.ename
from emp ee, dept ed, emp me
where ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno)
 and  ( ee.mgr = ( select mgr
					from emp
					where (ename = 'allen') ) )
 and  ( ee.ename != 'allen');

---------------------------------------------
salesman 업무를 하는 직원들의 급여보다 많은 급여를 받는 직원들의
이름, 급여는?

1) salesman 업무를 하는 직원들의 급여

select sal
from emp
where (job = 'salesman');

2) 급여보다 많은 급여를 받는 직원들의 이름, 급여는?

select ename, sal
from emp 
where (sal > x);

3) 결 합

select ename, sal
from emp 
where (sal >  all  ( select sal
				  from emp
				  where (job = 'salesman')) );


select ename, sal
from emp 
where (sal >  ( select max(sal)
				  from emp
				  where (job = 'salesman')) );

--------------------------------------------------
-- 
-- 과제속 Quiz)
-- 
-- Martin 직원의 job 소속직원들의 평균급여보다 급여를 낮게 받는 직원들의 
--      이름, job, 부서명, 급여, 급여등급, 상관이름, 상관부서명은 ?

1) Martin 직원의 job ?
select job
from emp 
where (ename = 'Martin');

2) SALESMAN job 소속직원들의 평균급여 ?

select avg(sal)
from emp
where (job = 'SALESMAN');

3) 1400 급여보다 급여를 낮게 받는 직원들의 
   이름, job, 부서명, 급여, 급여등급, 상관이름, 상관부서명은 ?
   
select  ee.ename, ee.job, ed.dname, ee.sal, 
		es.grade , me.ename, md.dname
from emp ee, dept ed, salgrade es , emp me, dept md
where (ee.deptno = ed.deptno)
 and  (ee.sal between es.losal and es.hisal)
 and  (ee.mgr = me.empno)
 and  (me.deptno = md.deptno)
 and  (ee.sal < 1400);
   
4) 결 합

select  ee.ename, ee.job, ed.dname, ee.sal, 
		es.grade , me.ename, md.dname
from emp ee, dept ed, salgrade es , emp me, dept md
where (ee.deptno = ed.deptno)
 and  (ee.sal between es.losal and es.hisal)
 and  (ee.mgr = me.empno)
 and  (me.deptno = md.deptno)
 and  (ee.sal < ( select avg(sal)
					from emp
					where (job = ( select job
									from emp 
									where (ename = 'Martin')))));



     
     
     
     
     
     
     
