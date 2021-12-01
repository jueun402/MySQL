DROP DATABASE IF EXISTS empDB;
CREATE DATABASE IF NOT EXISTS empDB;
USE empDB;

drop table IF EXISTs emp;
drop table IF EXISTs dept;
drop table IF EXISTs salgrade;
CREATE TABLE dept (
    deptno               int  NOT NULL  AUTO_INCREMENT,
    dname                varchar(20)    ,
    loc                  varchar(20)    ,
    CONSTRAINT pk_dept PRIMARY KEY ( deptno )
 ) engine=InnoDB;
 
CREATE TABLE emp (
    empno                int  NOT NULL  AUTO_INCREMENT,
    ename                varchar(20)    ,
    job                  varchar(20),
    mgr                  smallint    ,
    hiredate             date    ,
    sal                  numeric(7,2)    ,
    comm                 numeric(7,2)    ,
    deptno               int    ,
    CONSTRAINT pk_emp PRIMARY KEY ( empno )
 ) engine=InnoDB;

CREATE TABLE salgrade (
    grade int,
    losal int,
    hisal int
 ) engine=InnoDB;
 
CREATE INDEX idx_emp ON emp ( deptno );
 
ALTER TABLE emp ADD CONSTRAINT fk_emp_dept FOREIGN KEY ( deptno ) REFERENCES dept( deptno ) ON DELETE NO ACTION ON UPDATE NO ACTION;