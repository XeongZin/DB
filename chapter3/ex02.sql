/*(1) 마당 서점 도서의 총수*/
select count(*) from book;

/*(2) 마당서점에 도서를 출고하는 출판사의 총수*/
select count(distinct publisher) from book;

/*(3) 모든 고객의 이름, 주소*/
select name, address from customer;

/*(4) 2020년 7월4일~7월7일 사이에 주문받은 도서의 주문번호*/
select * from orders where orderdate between to_date('2020-07-04','YYYY-MM-DD') and to_date('2020-07-07','YYYY-MM-DD');

/*(5) 2020년 7월4일~7월9일 사이에 주문받은 도서를 제외한 도서의 주문번호*/
select * from orders where orderdate not between to_date('2020-07-04','YYYY-MM-DD') and to_date('2020-07-09','YYYY-MM-DD');

/*(6) 성이 '김'씨인 고객의 이름과 주소*/
select name, address from customer where name like '김%';

/*(7) 성이 '김'씨이고 이름이 '이'로 끝나는 고객의 이름과 주소*/
select name, address from customer where name like '김%아';

/*(9) 주문 금액의 총액과 주문의 평균 금액*/
select sum(saleprice), avg(saleprice) from Orders;

/*(10) 고객의 이름과 고객별 구매액*/
select name, sum(saleprice) from Orders, Customer group by name where Orders.custid=Customer.custid GROUP BY name;

/*(11) 고객의 이름과 고객이 구매한 도서 목록*/
select name, bookname from Book, Orders, Customer where Orders.bookid=Book.bookid AND Orders.custid=Customer.custid;

/*(12) 도서의 가격(Book 테이블)과 판매가격(Orders 테이블)의 차이가 가장 많은 주문*/
select * from Book, Orders where Book.bookid=Orders.bookid AND price-saleprice=(select max(price-saleprice) from Book, Orders where Book.bookid=Orders.bookid);

/*(13) 도서의 판매액 평균보다 자신의 구매액 평균이  더높은 고객의 이름*/
select name from Customer, Orders where Customer.custid=Orders.custid GROUP BY name HAVING avg(saleprice) > (select avg(saleprice) from Orders);
