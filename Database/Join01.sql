-- Join01.sql --

-- Join --
	- 일반 join : join --> where 조건
	- ANSI join: join --> from  테이블 ( ) join 테이블 on (join 조건)

smith의 이름, 소속 부서명은 ?;

select ename, dname
from emp, dept
where (emp.deptno = dept.deptno)
 and  (ename = 'smith');
 
research 부서 소속 직원들의 부서명, 위치, 직원이름, 사번은 ?;

select dname, loc, ename, empno
from dept, emp 
where (dept.deptno = emp.deptno )
 and  (dname = 'research');

sales 부서의 직원들의 이름, 사번, 부서이름은?;

select ename, empno, dname
from emp, dept 
where (emp.deptno = dept.deptno)
 and (dname = 'sales');

King의 이름, 사번, job, 부서명, 위치는 ?;

select ename, empno, job, dname, loc
from emp, dept 
where (emp.deptno = dept.deptno)
 and  (ename = 'King');

smith의 이름, 사번, 부서명, 부서번호는 ?;

select emp.ename, emp.empno, dept.dname, dept.deptno
from emp, dept
where (emp.deptno = dept.deptno)
 and  (emp.ename = 'smith');

select e.ename, e.empno, d.dname, d.deptno
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.ename = 'smith');

부서이름별 인원수는?;

select d.dname,count(e.empno)
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname;

부서이름별 평균급여는?;

select d.dname,avg(e.sal)
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname;

부서이름별 평균급여가 2000이 넘는 부서와 평균급여는?;

select d.dname, avg(e.sal) '평균급여'
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname
having (avg(e.sal) >= 2000); 

-------------------------------------------

smith의 이름, 급여, 급여등급은?;

select e.ename, e.sal, s.grade
from emp e, salgrade s 
where ( e.sal between s.losal and s.hisal )
 and  ( e.ename = 'smith');

3 급여등급의 급여등급, 해당 직원의 이름, 급여는?;

select s.grade , e.ename , e.sal
from salgrade s, emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade = 3 );


1,4 급여등급의 급여등급, 해당 직원의 이름, 급여는?;

select s.grade , e.ename , e.sal
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade in (1,4) );


급여등급별 인원수는?;

select s.grade , count(e.empno)
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
group by s.grade ;


sales 부서의 부서명, 소속직원이름, 사번, 급여, 급여등급은?;

select d.dname, e.ename, e.empno , e.sal, s.grade
from dept d, emp e, salgrade s 
where ( d.deptno = e.deptno )
 and  (e.sal between s.losal and s.hisal)
 and ( d.dname = 'sales');


research 부서 소속 직원들의 부서명, 부서번호, 이름, 사번, 급여, 급여등급은 ?;

select d.dname, d.deptno , e.ename , e.empno , e.sal , s.grade 
from dept d, emp e, salgrade s 
where ( d.deptno = e.deptno )
 and  (e.sal between s.losal and s.hisal)
 and (d.dname = 'research'  );
 
King 의 이름, 사번, 급여, 급여등급, 부서명은 ?;

select e.ename, e.empno , e.sal, s.grade , d.dname 
from emp e, salgrade s, dept d 
where ( d.deptno = e.deptno )
 and  (e.sal between s.losal and s.hisal)
 and (e.ename = 'King');
 

smith의 이름과 직속상관의 이름은 ?;

select ee.ename, me.ename
from emp ee, emp me
where (ee.mgr = me.empno)
 and (ee.ename = 'smith');


ford의 이름, 사번, 부하직원의 이름, 사번은?;

select me.ename , me.empno , ee.ename , ee.empno
from emp me, emp ee
where (me.empno  = ee.mgr)
 and (me.ename = 'ford');


King 의 이름, 부서명, 부하직원의 이름, 부서명은?;

select me.ename,dd.dname , ee.ename, dd.dname 
from emp me, dept dd, emp ee
where ( me.deptno = dd.deptno )
 and  ( me.empno = ee.mgr )
 and  ( ee.deptno = dd.deptno )
 and  ( me.ename = 'King' );

King 의 이름, 부서명, 부하직원의 이름, 부서명은?;

select me.ename, md.dname , ee.ename, ed.dname 
from emp me, dept md, emp ee, dept ed
where ( me.deptno = md.deptno )
 and  ( me.empno = ee.mgr )
 and  ( ee.deptno = ed.deptno )
 and  (me.ename = 'King');

4 급여등급의 해당하는 직원들의 이름, 사번, 부서명, 급여등급과
   그 직원들의 부하직원의 이름, 사번, 부서명, 급여등급은?;
   
select me.ename, me.empno, md.dname, ms.grade,
	   ee.ename, ee.empno, ed.dname, es.grade
from salgrade ms, emp me, dept md,
	 salgrade es, emp ee, dept ed
where ( me.sal between ms.losal and ms.hisal )	 
 and  ( me.deptno = md.deptno )
 and  ( me.empno = ee.mgr )
 and  ( ee.deptno = ed.deptno )
 and  ( ee.sal between es.losal and es.hisal )
 and  ( ms.grade = 4 );

-----------------------------------------------
 
drop table dept2;

create table dept2 
select * from dept;

drop table emp2;

create table emp2
select ename,empno,deptno 
from emp 
where ename like '%K%' or ename like '%S';

select * from emp2;
select * from dept2;

insert into emp2 values('Tom',7777,null);

select * from emp2;
select * from dept2;

-- emp2 , dept2 

전 직원들의 이름, 사번, 부서명, 위치, 부서번호는 ?

select *
from emp2 e, dept2 d 
where (e.deptno = d.deptno);

-- Tom ? Operation ?

전 직원들의 이름, 사번, 부서명, 위치, 부서번호는 (모든 직원 출력)?;

select *
from emp2 e, dept2 d 
where e.deptno = d.deptno;
