-- Select01.sql -- 

-- ���� �ּ� -- 
/* ����  
	��
    �ּ�
*/

-- select �÷�, ,, �÷�  from �����ͺ��̽�.���̺� ;

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

-- �������� �̸�, ���, �޿��� ?

select ename, empno, sal
from emp;

-- �μ����� �μ���, ��ġ�� ?
select dname, loc
from dept;

-- �������� �̸�, ���, ����, �޿�, �Ի����ڴ� ?

select 	ename as "����̸�", -- �÷�(Column) ��Ī
		empno "���", 
        job as ����, 
        sal '�޿�', 
        hiredate "�Ի� ����"
from emp;

-- �������� job�� ?
select distinct job -- distinct <-- �ߺ����� 
from emp;

select distinct job, sal from emp;
select distinct ename, job from emp;

select job, sal from emp;

select ename, empno, job
from emp
order by ename asc; -- asc[�⺻��] ��������, desc ��������

select ename, empno, job
from emp
order by ename desc; 

select ename, empno, job
from emp
order by ename; 

-- �������� �μ���ȣ(��������), job(��������), �̸�, ��� ���

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
