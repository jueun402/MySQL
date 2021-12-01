-- Join01.sql --

-- Join --
	- �Ϲ� join : join --> where ����
	- ANSI join: join --> from  ���̺� ( ) join ���̺� on (join ����)

smith�� �̸�, �Ҽ� �μ����� ?;

select ename, dname
from emp, dept
where (emp.deptno = dept.deptno)
 and  (ename = 'smith');
 
research �μ� �Ҽ� �������� �μ���, ��ġ, �����̸�, ����� ?;

select dname, loc, ename, empno
from dept, emp 
where (dept.deptno = emp.deptno )
 and  (dname = 'research');

sales �μ��� �������� �̸�, ���, �μ��̸���?;

select ename, empno, dname
from emp, dept 
where (emp.deptno = dept.deptno)
 and (dname = 'sales');

King�� �̸�, ���, job, �μ���, ��ġ�� ?;

select ename, empno, job, dname, loc
from emp, dept 
where (emp.deptno = dept.deptno)
 and  (ename = 'King');

smith�� �̸�, ���, �μ���, �μ���ȣ�� ?;

select emp.ename, emp.empno, dept.dname, dept.deptno
from emp, dept
where (emp.deptno = dept.deptno)
 and  (emp.ename = 'smith');

select e.ename, e.empno, d.dname, d.deptno
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.ename = 'smith');

�μ��̸��� �ο�����?;

select d.dname,count(e.empno)
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname;

�μ��̸��� ��ձ޿���?;

select d.dname,avg(e.sal)
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname;

�μ��̸��� ��ձ޿��� 2000�� �Ѵ� �μ��� ��ձ޿���?;

select d.dname, avg(e.sal) '��ձ޿�'
from dept d, emp e
where ( d.deptno = e.deptno )
group by d.dname
having (avg(e.sal) >= 2000); 

-------------------------------------------

smith�� �̸�, �޿�, �޿������?;

select e.ename, e.sal, s.grade
from emp e, salgrade s 
where ( e.sal between s.losal and s.hisal )
 and  ( e.ename = 'smith');

3 �޿������ �޿����, �ش� ������ �̸�, �޿���?;

select s.grade , e.ename , e.sal
from salgrade s, emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade = 3 );


1,4 �޿������ �޿����, �ش� ������ �̸�, �޿���?;

select s.grade , e.ename , e.sal
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade in (1,4) );


�޿���޺� �ο�����?;

select s.grade , count(e.empno)
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
group by s.grade ;


sales �μ��� �μ���, �Ҽ������̸�, ���, �޿�, �޿������?;

select d.dname, e.ename, e.empno , e.sal, s.grade
from dept d, emp e, salgrade s 
where ( d.deptno = e.deptno )
 and  (e.sal between s.losal and s.hisal)
 and ( d.dname = 'sales');


research �μ� �Ҽ� �������� �μ���, �μ���ȣ, �̸�, ���, �޿�, �޿������ ?;

select d.dname, d.deptno , e.ename , e.empno , e.sal , s.grade 
from dept d, emp e, salgrade s 
where ( d.deptno = e.deptno )
 and  (e.sal between s.losal and s.hisal)
 and (d.dname = 'research'  );
 
King �� �̸�, ���, �޿�, �޿����, �μ����� ?;

select e.ename, e.empno , e.sal, s.grade , d.dname 
from emp e, salgrade s, dept d 
where ( d.deptno = e.deptno )
 and  (e.sal between s.losal and s.hisal)
 and (e.ename = 'King');
 

smith�� �̸��� ���ӻ���� �̸��� ?;

select ee.ename, me.ename
from emp ee, emp me
where (ee.mgr = me.empno)
 and (ee.ename = 'smith');


ford�� �̸�, ���, ���������� �̸�, �����?;

select me.ename , me.empno , ee.ename , ee.empno
from emp me, emp ee
where (me.empno  = ee.mgr)
 and (me.ename = 'ford');


King �� �̸�, �μ���, ���������� �̸�, �μ�����?;

select me.ename,dd.dname , ee.ename, dd.dname 
from emp me, dept dd, emp ee
where ( me.deptno = dd.deptno )
 and  ( me.empno = ee.mgr )
 and  ( ee.deptno = dd.deptno )
 and  ( me.ename = 'King' );

King �� �̸�, �μ���, ���������� �̸�, �μ�����?;

select me.ename, md.dname , ee.ename, ed.dname 
from emp me, dept md, emp ee, dept ed
where ( me.deptno = md.deptno )
 and  ( me.empno = ee.mgr )
 and  ( ee.deptno = ed.deptno )
 and  (me.ename = 'King');

4 �޿������ �ش��ϴ� �������� �̸�, ���, �μ���, �޿���ް�
   �� �������� ���������� �̸�, ���, �μ���, �޿������?;
   
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

�� �������� �̸�, ���, �μ���, ��ġ, �μ���ȣ�� ?

select *
from emp2 e, dept2 d 
where (e.deptno = d.deptno);

-- Tom ? Operation ?

�� �������� �̸�, ���, �μ���, ��ġ, �μ���ȣ�� (��� ���� ���)?;

select *
from emp2 e, dept2 d 
where e.deptno = d.deptno;
