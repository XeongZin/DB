/*NewBook 테이블 생성*/
create table NewBook(
    bookid NUMBER PRIMARY KEY,
    bookname varchar2(20) NOT NULL,
    publisher varchar2(20) UNIQUE,
    price NUMBER DEFAULT 10000 CHECK(price > 1000)
);

/*NewCustomer 테이블 생성*/
create table NewCustomer(
    custid NUMBER PRIMARY KEY,
    name varchar2(40),
    address varchar2(40),
    phone varchar2(30)
);

/*NewOrders 테이블 생성*/
create table NewOrders(
    orderid NUMBER,
    custid NUMBER NOT NULL,
    bookid NUMBER NOT NULL,
    saleprice NUMBER,
    orderdate DATE,
    PRIMARY KEY(orderid),
    FOREIGN KEY(custid) REFERENCES NewCustomer(custid) ON DELETE CASCADE
);

/*칼럼 추가 Add*/
alter table NewBook ADD isbn VARCHAR2(13);

/*칼럼 수정 Modify*/
alter table NewBook MODIFY isbn NUMBER;

/*칼럼 삭제 Drop Column*/
alter table NewBook DROP COLUMN isbn;

/*칼럼에 제약조건 적용*/
alter table NewBook Modify bookid NUMBER NOT NULL;

/*칼럼의 속성 기본키로 변경*/
alter table NewBook ADD PRIMARY KEY(bookid);

/*테이블 삭제*/
drop table NewBook;

/*Book 테이블에 새로운 도서 '스포츠 의학' 삽입*/
insert into Book(bookid, bookname, publisher, price)
values(11, '스포츠 의학', '한솔의학서적', 90000);

/*튜플 추가 여부 확인*/
select * from book;

/*Book 테이블에 새로운 도서 '스포츠 의학' 삽입. 가격은 미정*/
insert into Book(bookid, bookname, publisher)
values(14, '스포츠 의학', '한솔의학서적');

/*수입도서 목록(Imported_Book)을 Book 테이블에 모두 삽입*/
/*삽입전 속성이 같은지 확인*/
select * from Imported_Book;

/*대량 삽입 (bulk insert)*/
insert into Book(bookid, bookname, publisher, price)
select bookid, bookname, publisher, price
from Imported_Book;

/*튜플 변경 여부 확인*/
select * from Customer;

/*Customer 테이블에서 고객번호가 5인 고객의 주소를 '대한민국 부산'으로 변경하기*/
/*조건*/
update Customer
set address='대한민국 부산'
where custid=5;

/*하위 질의*/
update Customer
set address=(select address from Customer where name='김연아')
where name='박세리';

/*Customer 테이블에서 고객번호가 5인 고객을 삭제*/
delete from Customer
where custid=5;

/*RollBack으로 복구*/
ROLLBACK;