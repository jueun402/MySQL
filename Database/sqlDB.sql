DROP DATABASE IF EXISTS sqldb; -- ���� sqldb�� �����ϸ� �켱 �����Ѵ�.

CREATE DATABASE sqldb;

USE sqldb;

CREATE TABLE usertbl -- ȸ�� ���̺�
( userID  	CHAR(8) NOT NULL PRIMARY KEY, -- ����� ���̵�(PK)
  name    	VARCHAR(10) NOT NULL, -- �̸�
  birthYear   INT NOT NULL,  -- ����⵵
  addr	  	CHAR(2) NOT NULL, -- ����(���,����,�泲 ������ 2���ڸ��Է�)
  mobile1	CHAR(3), -- �޴����� ����(011, 016, 017, 018, 019, 010 ��)
  mobile2	CHAR(8), -- �޴����� ������ ��ȭ��ȣ(����������)
  height    	SMALLINT,  -- Ű
  mDate    	DATE  -- ȸ�� ������
);

CREATE TABLE buytbl -- ȸ�� ���� ���̺�(Buy Table�� ����)
(  num 		INT AUTO_INCREMENT NOT NULL PRIMARY KEY, -- ����(PK)
   userID  	CHAR(8) NOT NULL, -- ���̵�(FK)
   prodName 	CHAR(6) NOT NULL, --  ��ǰ��
   groupName 	CHAR(4)  , -- �з�
   price     	INT  NOT NULL, -- �ܰ�
   amount    	SMALLINT  NOT NULL, -- ����
   FOREIGN KEY (userID) REFERENCES usertbl(userID)
);

INSERT INTO usertbl VALUES('LSG', '�̽±�', 1987, '����', '011', '1111111', 182, '2008-8-8');
INSERT INTO usertbl VALUES('KBS', '�����', 1979, '�泲', '011', '2222222', 173, '2012-4-4');
INSERT INTO usertbl VALUES('KKH', '���ȣ', 1971, '����', '019', '3333333', 177, '2007-7-7');
INSERT INTO usertbl VALUES('JYP', '������', 1950, '���', '011', '4444444', 166, '2009-4-4');
INSERT INTO usertbl VALUES('SSK', '���ð�', 1979, '����', NULL  , NULL      , 186, '2013-12-12');
INSERT INTO usertbl VALUES('LJB', '�����', 1963, '����', '016', '6666666', 182, '2009-9-9');
INSERT INTO usertbl VALUES('YJS', '������', 1969, '�泲', NULL  , NULL      , 170, '2005-5-5');
INSERT INTO usertbl VALUES('EJW', '������', 1972, '���', '011', '8888888', 174, '2014-3-3');
INSERT INTO usertbl VALUES('JKW', '������', 1965, '���', '018', '9999999', 172, '2010-10-10');
INSERT INTO usertbl VALUES('BBK', '�ٺ�Ŵ', 1973, '����', '010', '0000000', 176, '2013-5-5');

INSERT INTO buytbl VALUES(NULL, 'KBS', '�ȭ', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'KBS', '��Ʈ��', '����', 1000, 1);
INSERT INTO buytbl VALUES(NULL, 'JYP', '�����', '����', 200,  1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '�����', '����', 200,  5);
INSERT INTO buytbl VALUES(NULL, 'KBS', 'û����', '�Ƿ�', 50,   3);
INSERT INTO buytbl VALUES(NULL, 'BBK', '�޸�', '����', 80,  10);
INSERT INTO buytbl VALUES(NULL, 'SSK', 'å'    , '����', 15,   5);
INSERT INTO buytbl VALUES(NULL, 'EJW', 'å'    , '����', 15,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', 'û����', '�Ƿ�', 50,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '�ȭ', NULL   , 30,   2);
INSERT INTO buytbl VALUES(NULL, 'EJW', 'å'    , '����', 15,   1);
INSERT INTO buytbl VALUES(NULL, 'BBK', '�ȭ', NULL   , 30,   2);

SELECT * FROM usertbl;
SELECT * FROM buytbl;