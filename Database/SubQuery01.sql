-- SubQuery01.sql --

smith�� ���� job�� ���� �������� �̸�, job��? 

1) smith�� job ?

select job
from emp 
where (ename = 'smith');

2) CLERK job�� ���� �������� �̸�, job��? 

select ename, job
from emp 
where (job = 'CLERK');

3) �� ��

select ename, job
from emp 
where (job = (select job
				from emp 
				where (ename = 'smith') ) );
				
----------------------------------------------------

smith�� ���� �޿������ ���� �������� �̸�, �޿�, �޿������?

1) smith �޿���� ?

select s.grade
from emp e, salgrade s 
where (e.sal between s.losal and s.hisal)
 and  (e.ename = 'smith');

2) 1 �޿������ ���� �������� �̸�, �޿�, �޿������?

select e.ename, e.sal, s.grade 
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade = 1);

3) �� ��

select e.ename, e.sal, s.grade 
from salgrade s , emp e
where (e.sal between s.losal and s.hisal)
 and  (s.grade = ( select s.grade
					from emp e, salgrade s 
					where (e.sal between s.losal and s.hisal)
					 and  (e.ename = 'smith') ));
					
					
-------------------------------------------------
smith�� ���� �μ��� �������� �̸�, �μ�����?

1) smith �μ���ȣ?

select deptno
from emp
where (ename = 'smith');

2) 20 �μ��� �������� �̸�, �μ�����?

select e.ename, d.dname
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.deptno = 20);

3) �� ��

select e.ename, d.dname
from emp e, dept d
where (e.deptno = d.deptno)
 and  (e.deptno = ( select deptno
					from emp
					where (ename = 'smith') ));


smith�� ���� �μ��� �������� �̸�, job��?

1) smith �μ���ȣ?

select deptno
from emp
where (ename = 'smith');

2) 20 �μ��� �������� �̸�, job��?

select ename, job
from emp 
where (deptno = 20);

3) �� ��

select ename, job
from emp 
where (deptno = ( select deptno
					from emp
					where (ename = 'smith') ) );

�� ������ ��ձ޿����� �޿��� ���� �޴� �������� �̸�, �޿�, �޿������?

1) �� ������ ��ձ޿�

select avg(sal)
from emp;

2) 2073 �޿����� �޿��� ���� �޴� �������� �̸�, �޿�, �޿������?

select e.ename , e.sal, s.grade 
from emp e, salgrade s 
where (e.sal between s.losal and s.hisal)
 and  ( e.sal > 2073 );

3) �� ��

select e.ename , e.sal, s.grade 
from emp e, salgrade s 
where (e.sal between s.losal and s.hisal)
 and  ( e.sal > (select avg(sal)
				 from emp) );
------------------------------------------------------				
allen�� ���ӻ���� ���� ����� ��ô� ��������
�̸�, ���, �μ���, ���ӻ���̸���?
(��, allen ����)

1) allen�� ���ӻ�� ��� ?

select mgr
from emp
where (ename = 'allen');

2) 7698 ����� ���ӻ���� �������� �̸�, ���, �μ���, ���ӻ�� �̸��� ?

select ee.ename, ee.empno, ed.dname, me.ename
from emp ee, dept ed, emp me
where ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno)
 and  ( ee.mgr = 7698 );

3) �� ��
select ee.ename, ee.empno, ed.dname, me.ename
from emp ee, dept ed, emp me
where ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno)
 and  ( ee.mgr = ( select mgr
					from emp
					where (ename = 'allen') ) );

4) �� ��
select ee.ename, ee.empno, ed.dname, me.ename
from emp ee, dept ed, emp me
where ( ee.deptno = ed.deptno )
 and  ( ee.mgr = me.empno)
 and  ( ee.mgr = ( select mgr
					from emp
					where (ename = 'allen') ) )
 and  ( ee.ename != 'allen');

---------------------------------------------
salesman ������ �ϴ� �������� �޿����� ���� �޿��� �޴� ��������
�̸�, �޿���?

1) salesman ������ �ϴ� �������� �޿�

select sal
from emp
where (job = 'salesman');

2) �޿����� ���� �޿��� �޴� �������� �̸�, �޿���?

select ename, sal
from emp 
where (sal > x);

3) �� ��

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
-- ������ Quiz)
-- 
-- Martin ������ job �Ҽ��������� ��ձ޿����� �޿��� ���� �޴� �������� 
--      �̸�, job, �μ���, �޿�, �޿����, ����̸�, ����μ����� ?

1) Martin ������ job ?
select job
from emp 
where (ename = 'Martin');

2) SALESMAN job �Ҽ��������� ��ձ޿� ?

select avg(sal)
from emp
where (job = 'SALESMAN');

3) 1400 �޿����� �޿��� ���� �޴� �������� 
   �̸�, job, �μ���, �޿�, �޿����, ����̸�, ����μ����� ?
   
select  ee.ename, ee.job, ed.dname, ee.sal, 
		es.grade , me.ename, md.dname
from emp ee, dept ed, salgrade es , emp me, dept md
where (ee.deptno = ed.deptno)
 and  (ee.sal between es.losal and es.hisal)
 and  (ee.mgr = me.empno)
 and  (me.deptno = md.deptno)
 and  (ee.sal < 1400);
   
4) �� ��

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



     
     
     
     
     
     
     
