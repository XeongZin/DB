/*������ȣ�� 1�� ������ �̸�*/
select bookname from book where bookid=1;

/*������ 20000�� �̻��� ������ �̸�*/
select bookname from book where price>=20000;

/*�������� �� ���ž�*/
select sum(saleprice) from orders where custid=1;

/*�������� �� ���ž�2*/
SELECT sum(saleprice) FROM Customer, Orders WHERE Customer.custid=Orders.custid AND Customer.name LIKE '������';

/**/
SELECT count(*) FROM Orders WHERE custid=1;

/**/
SELECT count(DISTINCT publisher) FROM Customer, Orders, Book WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');

/**/
SELECT bookname, price, price-saleprice FROM Customer, Orders, Book WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');

/**/
SELECT bookname FROM Book, Orders, Customer
MINUS
SELECT booknmae FROM Book, Orders, Customer
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='������');


