-- GroupByHaving01.sql --

��� �������� �޿� �հ�, �޿� ���, �ִ� �޿�, �ּ� �޿�;

select sum(sal), avg(sal), max(sal), min(sal)
from emp;

������ ��� �������� �޿� �հ�, �޿� ���, �ִ� �޿�, �ּ� �޿�;

select job, sum(sal), avg(sal), max(sal), min(sal)
from emp
group by job;


�μ���ȣ�� ��ձ޿���?;

select deptno, avg(sal)
from emp
group by deptno;

������ ��ձ޿��� 3000 �̻��� ������ �����?;

select job, avg(sal)
from emp 
-- where (��ձ޿��� 3000 �̻�)
group by job
having (avg(sal) >= 3000);


�μ���ȣ�� ��ձ޿��� 2000 �̻��� �μ���ȣ�� ��ձ޿��� ?;

select deptno,  avg(sal)
from emp
group by deptno
having (avg(sal) >= 2000);

������ 1�� �ҵ������ 30000 �̻��� ������ �ҵ������? ( 1�� �ҵ� => 12���� �޿� + Ŀ�̼�);

select job, ((sal * 12) + ifnull(comm,0)) '�ҵ����'
from emp 
group by job
having ( avg((sal * 12) + ifnull(comm,0)) >= 30000);


salesman ������ �ϴ� �������� ��ձ޿���?;

select job, avg(sal)
from emp 
where (job = 'salesman' );

�� �������� ?;

select count(empno)
from emp;

�� ������ ������?;

select count(distinct job)
from emp;


select deptno, job, count(empno)
from emp
group by deptno, job
order by deptno, job;






