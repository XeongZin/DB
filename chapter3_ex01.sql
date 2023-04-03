select * from book;

select bookname from book where bookid=1;   //(1) 도서번호가 1인 도서의 이름
select bookname from book where price>=20000;   //(2) 가격이 2만원 이상인 도서의 이름
select sum(saleprice) from orders where custid=1;   //(3) 박지성의 총 구매액
select sum(saleprice) from customer orders where customer.custid=orders.custid and customer.name like '박지성';    //(3-2) 박지성의 총 구매액2
select count(*) from orders where custid=1; //(4)


