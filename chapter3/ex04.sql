/*새로운 도서 ('스포츠 세계', '대한미디어', 10000원)이 마당서점에 입고되었다. 삽입이 안 될 경우 필요한 데이터가 더 있는지 찾아보시오*/
insert into Book(bookname, publisher, price)
values('스포츠 세계', '대한미디어', 10000);
/*원인 : bookid가 NOT NULL 이므로 bookid를 추가하여야 한다.*/

/*'삼성당'에서 출판한 도서를 삭제하시오*/
delete from Book
where publisher='삼성당';
select * from Book;
ROLLBACK;

/*'이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안 되면 원인을 생각해 보시오*/
delete from Book
where publisher='이상미디어';
select * from Book;
/*원인 : 이상미디어에서 출판한 도서중 Orders 테이블에서 사용하는 칼럼이 있으므로 삭제 불가
(참조 무결성(외래키 무결성))*/

/*출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.*/
update Book
set publisher='대한출판사'
where publisher='대한미디어';
select * from Book;
ROLLBACK;

/*테이블 생성 출판사에 대한 정보를 저장하는 테이블 생성*/
create table Bookcompany(
    name varchar2(20) PRIMARY KEY,
    address varchar2(20),
    begin DATE
);

/*테이블 수정 */
alter table Bookcompany ADD webaddress varchar2(30);
select * from Bookcompany;

/*Bookcompany 테이블에 투플 삽입*/
insert into Bookcompany(name, address, begin, webaddress)
values('한빛아카데미', '서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');
select * from Bookcompany;
