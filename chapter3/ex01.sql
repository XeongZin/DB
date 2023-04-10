/*(1) 도서번호가 1인 도서의 이름*/
select bookname from book where bookid=1;

/*(2)가격이 20000원 이상인 도서의 이름*/
select bookname from book where price>=20000;

/*(3) 박지성의 총 구매액*/
select sum(saleprice) from orders where custid=1;

/*(4) 박지성의 총 구매액2*/
SELECT sum(saleprice) FROM Customer, Orders WHERE Customer.custid=Orders.custid AND Customer.name LIKE '박지성';

/*(5) 박지성이 구매한 도서의 수*/
SELECT count(*) FROM Orders WHERE custid=1;

/*(6) 박지성이 구매한 도서의 출판사 수*/
select count(DISTINCT publisher)
from Customer, Orders, Book
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성'); 

/*(7) 박지성이 구매한 도서의 이름, 가격, 정가와 판매가격의 차이*/
select bookname, price, price-saleprice
from Customer, Orders, Book
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');

/*(8) 박지성이 구매하지 않은 도서의 이름*/
SELECT bookname FROM Book, Orders, Customer
MINUS
SELECT booknmae FROM Book, Orders, Customer
WHERE (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');
