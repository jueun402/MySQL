-- Where01.sql -- 

select * from emp;

describe emp; -- table ���� Ȯ��
desc emp;

----------------------------------

smith �̸��� ���,job�� ?

select empno,job
from emp 
where (ename = 'smith');

clerk ������ �ϴ� �������� �̸�, ����, �����?;

select ename, job, empno
from emp 
where (job = 'clerk');

30�� �μ����� salesman �� �������� �̸�, �μ���ȣ,  job�� ?;

select ename, deptno,  job
from emp
where (deptno = 30 )
 and  (job = 'salesman' );

�޿��� 3000 �̻��� �������� �̸�, ���, �޿��� ?;

select ename, empno, sal 
from emp
where (sal >= 3000);

�޿��� 1550 ~ 3000 ������ �������� �̸�, ���, �޿���?;

select ename, empno, sal 
from emp
where (sal >= 1550)
 and  (sal <= 3000);

select ename, empno, sal 
from emp
where (sal between 1550 and 3000);

�޿��� 1200 ~ 3000 ������ ������ �� ������ salesman ��
�������� �̸�, ���, ����, �޿���?;

select ename, empno, job, sal
from emp
where (sal between 1200 and 3000)
 and (job = 'salesman');

�޿��� 1250,1600,3000 �� ������ �� ������ analyst ��
�������� �̸�, ���, ����, �޿���?

select ename, empno, job, sal
from emp
where ((sal = 1250) or  (sal = 1600) or (sal = 3000))
 and  (job = 'analyst'); 
 
select ename, empno, job, sal
from emp
where (sal in (1250,1600,3000) )
 and  (job = 'analyst'); 
 
 s �� �����ϴ� �̸��� ���� �������� �̸�, ���, �޿���?;

select ename, empno, sal
from emp
where (ename like 's%'); -- % �����ڸ� �ƹ��ų�, _ ���ڸ� �ƹ��ų�

�տ��� �ι�° �ڸ��� A�� �������� �̸�, �����?;

select ename, empno
from emp
where ename like '_A%';

�ڿ��� �ι�° �ڸ��� E�� �������� �̸�, �����?;

select ename, empno
from emp
where ename like '%E_';


-------------------------------
is null
is not null


Ŀ�̼��� �ִ� �������� �̸�, Ŀ�̼���?;

select ename, comm
from emp  
where (comm is not null) and (comm > 0 );

select ename, comm
from emp  
where (comm > 0 );

Ŀ�̼��� ����(null,0) �������� �̸�, Ŀ�̼���?;

select ename, comm
from emp  
where (comm is null) or( comm = 0 );
--where (comm < 0 );

-----------------------------------
select 20 + 10, 20 - 10,20 * 10,20 / 10
from dual;

select concat('Ko','rea')
from dual;

�������� �̸�, 1��ġ �޿���? (12���� sal);

select ename, 12 * sal
from emp;

select ifnull(null,0);

�������� �̸�, 1�� �ҵ���? (1��ġ �޿� + Ŀ�̼�);

select ename, (12 * sal) + ifnull(comm,0)
from emp;

��� �������� �̸�, 1�� �ҵ� ǥ��
��) smith�� 1�� �ҵ��� 100000

select concat(ename,'�� 1�� �ҵ��� ', (12 * sal) + ifnull(comm,0)) as "�޿�ǥ��"
from emp;




 