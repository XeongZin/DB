/*1_5 박지성이 구매한 도서의 출판사 수*/
select count(DISTINCT publisher)
from Customer, Orders, Book
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성'); 

/*1_6 박지성이 구매한 도서의 이름, 가격, 저가와 판매가격의 차이*/
select bookname, price, price-saleprice
from Customer, Orders, Book
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');

/*1_7 박지성이 구매하지 않은 도서의 이름*/
select bookname from Book, Orders, Customer
MINUS
select bookname from Book, Orders, Customer
where (Customer.custid=Orders.custid) AND (Book.bookid=Orders.bookid) AND (Customer.name='박지성');

/*2_9 주문 금액의 총액과 주문의 평균 금액*/
select sum(saleprice), avg(saleprice) from Orders;

/*2_10 고객의 이름과 고객별 구매액*/
select name, sum(saleprice) from Orders, Customer group by name where Orders.custid=Customer.custid GROUP BY name;

/*2_11 고객의 이름과 고객이 구매한 도서 목록*/
select name, bookname from Book, Orders, Customer where Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;

/*2_12 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
select * from Book, Orders where Book.bookid=Orders.bookid AND price-saleprice=(select max(price-saleprice) from Book, Orders where Book.bookid=Orders.bookid);

/*2_13 도서의 판매액 평균보다 자신의 구매액 평균이  더높은 고객의 이름*/
select name from Customer, Orders where Customer.custid=Orders.custid GROUP BY name HAVING avg(saleprice) > (select avg(saleprice) from Orders);