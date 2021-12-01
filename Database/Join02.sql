-- Join02.sql --

-- Join --
	- 일반 join : join --> where 조건
	- ANSI join: join --> from  테이블 ( ) join 테이블 on (join 조건)
	
-- ANSI Join 
select *
from emp2 e join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e inner join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e left outer join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e right outer join dept2 d on(e.deptno = d.deptno);

// mysql에서 full outer join 안됨
-- select *
-- from emp2 e full outer join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e left outer join dept2 d on(e.deptno = d.deptno)
union
select *
from emp2 e right outer join dept2 d on(e.deptno = d.deptno);

--------------------------------------------------

smith의 이름, 소속 부서명은 ?;

select ename, dname
from emp, dept
where (emp.deptno = dept.deptno)
 and  (ename = 'smith');

select e.ename, d.dname
from emp e inner join dept d 
	on(e.deptno = d.deptno)
where (e.ename = 'smith');
----------------------------------------------------
research 부서소속 직원들의 부서명, 위치, 이름, 사번은?;

select d.dname, d.loc, e.ename, e.empno
from dept d inner join emp e
	on (d.deptno = e.deptno)
where (d.dname = 'research');

부서명별 평균급여는 ?;

select d.dname, avg(e.sal)
from dept d inner join emp e
	on (d.deptno = e.deptno)
group by d.dname;


smith의 이름, 사번, 급여, 급여등급은?

select e.ename, e.empno ,e.sal , s.grade 
from emp e inner join salgrade s
	on(e.sal between s.losal and s.hisal)
where (e.ename = 'smith');

3급여등급의 등급, 직원이름, 급여는?

select s.grade, e.ename, e.sal 
from salgrade s inner join emp e
	on (e.sal between s.losal and s.hisal)
where (s.grade = 3);

급여등급별 직원수는?

select s.grade, count(e.empno)
from salgrade s inner join emp e
	on (e.sal between s.losal and s.hisal)
group by s.grade;

King의 이름, 사번, 부하직원들의 이름, 사번은?

select me.ename, me.empno , ee.ename ,ee.empno 
from emp me inner join emp ee
	on ( me.empno = ee.mgr )
where (me.ename = 'king');


3 급여등급의 급여등급, 해당 직원의 이름, 급여, 부서명은 ?;

select s.grade , e.ename , e.sal, d.dname
from salgrade s inner join emp e on(e.sal between s.losal and s.hisal)
				inner join dept d on(d.deptno = e.deptno)
where (s.grade = 3);				

-------------------------------------------------------
sales 부서의 부서명, 소속직원이름, 사번, 급여, 급여등급은?;

select d.dname, e.ename , e.empno , e.sal ,s.grade 
from dept d inner join emp e on ( d.deptno = e.deptno )
			inner join salgrade s on ( e.sal between s.losal and s.hisal )
where (d.dname = 'sales');

King 의 이름, 부서명, 부하직원의 이름, 부서명은?;

select me.ename, md.dname, ee.ename, ed.dname 
from emp me inner join dept md on (me.deptno = md.deptno)
			inner join emp ee on (me.empno = ee.mgr)
			inner join dept ed on (ee.deptno = ed.deptno)
where (me.ename = 'king');

King 의 이름과 부하직원들의 이름,job,부서명,급여,급여등급은?;

select me.ename, ee.ename, ee.job, ed.dname, ee.sal , es.grade
from emp me inner join emp ee on (me.empno = ee.mgr)
			inner join dept ed on (ee.deptno = ed.deptno)
			inner join salgrade es on (ee.sal between es.losal and es.hisal)
where (me.ename = 'king');

-- emp2, dept2

-- outer join

모든 부서의 직원수는 ? 

select d.dname, count(e.empno)
from dept2 d left outer join emp2 e
	on(d.deptno = e.deptno)
group by d.dname;

select d.dname, count(e.empno)
from emp2 e right outer join dept2 d 
	on(d.deptno = e.deptno)
group by d.dname;

-- cross join --
select *
from emp2 e, dept2 d; 

select *
from emp2 e cross join dept2 d;









