select * from book;

// 1��
select bookname from book where bookid=1;   //(1) ������ȣ�� 1�� ������ �̸�
select bookname from book where price>=20000;   //(2) ������ 2���� �̻��� ������ �̸�
select sum(saleprice) from orders where custid=1;   //(3) �������� �� ���ž�
select sum(saleprice) from customer orders where customer.custid=orders.custid and customer.name like '������';    //(3-2) �������� �� ���ž�2
select count(*) from orders where custid=1; //(4)

// 2��
select count(*) from book;  //(1)
select count(distinct publisher) from book; //(2)
select name, address from customer; //(3)
select * from orders where orderdate between to_date('2020-07-04','YYYY-MM-DD') and to_date('2020-07-07','YYYY-MM-DD'); //(4)
select * from orders where orderdate not between to_date('2014-07-04','YYYY-MM-DD') and to_date('2014-07-07','YYYY-MM-DD'); //(5)
select name, address from customer where name like '��%';    //(6)
select name, address from customer where name like '��%��';   //(7)