-- Join02.sql --

-- Join --
	- �Ϲ� join : join --> where ����
	- ANSI join: join --> from  ���̺� ( ) join ���̺� on (join ����)
	
-- ANSI Join 
select *
from emp2 e join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e inner join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e left outer join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e right outer join dept2 d on(e.deptno = d.deptno);

// mysql���� full outer join �ȵ�
-- select *
-- from emp2 e full outer join dept2 d on(e.deptno = d.deptno);

select *
from emp2 e left outer join dept2 d on(e.deptno = d.deptno)
union
select *
from emp2 e right outer join dept2 d on(e.deptno = d.deptno);

--------------------------------------------------

smith�� �̸�, �Ҽ� �μ����� ?;

select ename, dname
from emp, dept
where (emp.deptno = dept.deptno)
 and  (ename = 'smith');

select e.ename, d.dname
from emp e inner join dept d 
	on(e.deptno = d.deptno)
where (e.ename = 'smith');
----------------------------------------------------
research �μ��Ҽ� �������� �μ���, ��ġ, �̸�, �����?;

select d.dname, d.loc, e.ename, e.empno
from dept d inner join emp e
	on (d.deptno = e.deptno)
where (d.dname = 'research');

�μ��� ��ձ޿��� ?;

select d.dname, avg(e.sal)
from dept d inner join emp e
	on (d.deptno = e.deptno)
group by d.dname;


smith�� �̸�, ���, �޿�, �޿������?

select e.ename, e.empno ,e.sal , s.grade 
from emp e inner join salgrade s
	on(e.sal between s.losal and s.hisal)
where (e.ename = 'smith');

3�޿������ ���, �����̸�, �޿���?

select s.grade, e.ename, e.sal 
from salgrade s inner join emp e
	on (e.sal between s.losal and s.hisal)
where (s.grade = 3);

�޿���޺� ��������?

select s.grade, count(e.empno)
from salgrade s inner join emp e
	on (e.sal between s.losal and s.hisal)
group by s.grade;

King�� �̸�, ���, ������������ �̸�, �����?

select me.ename, me.empno , ee.ename ,ee.empno 
from emp me inner join emp ee
	on ( me.empno = ee.mgr )
where (me.ename = 'king');


3 �޿������ �޿����, �ش� ������ �̸�, �޿�, �μ����� ?;

select s.grade , e.ename , e.sal, d.dname
from salgrade s inner join emp e on(e.sal between s.losal and s.hisal)
				inner join dept d on(d.deptno = e.deptno)
where (s.grade = 3);				

-------------------------------------------------------
sales �μ��� �μ���, �Ҽ������̸�, ���, �޿�, �޿������?;

select d.dname, e.ename , e.empno , e.sal ,s.grade 
from dept d inner join emp e on ( d.deptno = e.deptno )
			inner join salgrade s on ( e.sal between s.losal and s.hisal )
where (d.dname = 'sales');

King �� �̸�, �μ���, ���������� �̸�, �μ�����?;

select me.ename, md.dname, ee.ename, ed.dname 
from emp me inner join dept md on (me.deptno = md.deptno)
			inner join emp ee on (me.empno = ee.mgr)
			inner join dept ed on (ee.deptno = ed.deptno)
where (me.ename = 'king');

King �� �̸��� ������������ �̸�,job,�μ���,�޿�,�޿������?;

select me.ename, ee.ename, ee.job, ed.dname, ee.sal , es.grade
from emp me inner join emp ee on (me.empno = ee.mgr)
			inner join dept ed on (ee.deptno = ed.deptno)
			inner join salgrade es on (ee.sal between es.losal and es.hisal)
where (me.ename = 'king');

-- emp2, dept2

-- outer join

��� �μ��� �������� ? 

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









