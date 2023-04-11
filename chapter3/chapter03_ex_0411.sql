/*NewBook ���̺� ����*/
create table NewBook(
    bookid NUMBER PRIMARY KEY,
    bookname varchar2(20) NOT NULL,
    publisher varchar2(20) UNIQUE,
    price NUMBER DEFAULT 10000 CHECK(price > 1000)
);

/*NewCustomer ���̺� ����*/
create table NewCustomer(
    custid NUMBER PRIMARY KEY,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30)
);

/*NewOrders ���̺� ����*/
create table NewOrders(
    orderid NUMBER,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);

/*Į�� �߰� Add*/
alter table NewBook ADD isbn VARCHAR2(13);

/*Į�� ���� Modify*/
alter table NewBook MODIFY isbn NUMBER;

/*Į�� ���� Drop Column*/
alter table NewBook DROP COLUMN isbn;

/*Į���� �������� ����*/
alter table NewBook Modify bookid NUMBER NOT NULL;

/*Į���� �Ӽ� �⺻Ű�� ����*/
alter table NewBook ADD PRIMARY KEY(bookid);

/*���̺� ����*/
drop table NewBook;

/*Book ���̺� ���ο� ���� '������ ����' ����*/
insert into Book(bookid, bookname, publisher, price)
values(11, '������ ����', '�Ѽ����м���', 90000);

/*Ʃ�� �߰� ���� Ȯ��*/
select * from book;

/*Book ���̺� ���ο� ���� '������ ����' ����. ������ ����*/
insert into Book(bookid, bookname, publisher)
values(14, '������ ����', '�Ѽ����м���');

/*���Ե��� ���(Imported_Book)�� Book ���̺� ��� ����*/
/*������ �Ӽ��� ������ Ȯ��*/
select * from Imported_Book;

/*�뷮 ���� (bulk insert)*/
insert into Book(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price
from Imported_Book;

/*Ʃ�� ���� ���� Ȯ��*/
select * from Customer;

/*Customer ���̺��� ����ȣ�� 5�� ���� �ּҸ� '���ѹα� �λ�'���� �����ϱ�*/
/*����*/
update Customer
set address='���ѹα� �λ�'
where custid=5;

/*���� ����*/
update Customer
set address=(select address from Customer where name='�迬��')
where name='�ڼ���';

/*Customer ���̺��� ����ȣ�� 5�� ���� ����*/
delete from Customer
where custid=5;

/*RollBack���� ����*/
ROLLBACK;