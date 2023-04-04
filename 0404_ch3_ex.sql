/*1_5 �������� ������ ������ ���ǻ� ��*/
select count(DISTINCT publisher)
from Customer, Orders, Book
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������'); 

/*1_6 �������� ������ ������ �̸�, ����, ������ �ǸŰ����� ����*/
select bookname, price, price-saleprice
from Customer, Orders, Book
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');

/*1_7 �������� �������� ���� ������ �̸�*/
select bookname from Book, Orders, Customer
MINUS
select bookname from Book, Orders, Customer
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');

/*2_9 �ֹ� �ݾ��� �Ѿװ� �ֹ��� ��� �ݾ�*/
select sum(saleprice), avg(saleprice) from Orders;

/*2_10 ���� �̸��� ���� ���ž�*/
select name, sum(saleprice) from Orders, Customer group by name where Orders.custid=Customer.custid GROUP BY name;

/*2_11 ���� �̸��� ���� ������ ���� ���*/
select name, bookname from Book, Orders, Customer where Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;

/*2_12 ������ ����(Book ���̺�)�� �ǸŰ���(Orders ���̺�)�� ���̰� ���� ���� �ֹ�*/
select * from Book, Orders where Book.bookid=Orders.bookid AND price-saleprice=(select max(price-saleprice) from Book, Orders where Book.bookid=Orders.bookid);

/*2_13 ������ �Ǹž� ��պ��� �ڽ��� ���ž� �����  ������ ���� �̸�*/
select name from Customer, Orders where Customer.custid=Orders.custid GROUP BY name HAVING avg(saleprice) > (select avg(saleprice) from Orders);