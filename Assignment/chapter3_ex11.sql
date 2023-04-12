/*(1) ~ (4)*/
/*극장 테이블 생성*/
create table theater(
    movienum NUMBER,
    theaname varchar2(20),
    location varchar2(20),
    PRIMARY KEY(movienum)
);

/*상영관 테이블 생성*/
/*영화 가격은 20,000원을 넘지 않아야 한다*/
/*상영관 번호는 1부터 10 사이이다*/
create table mtheater(
    movienum NUMBER,
    mtheanum NUMBER CHECK(1 <= mtheanum AND mtheanum <= 10),
    moviename varchar2(20),
    price NUMBER CHECK(price < 20000),
    seatcount NUMBER,
    PRIMARY KEY(movienum, mtheanum)
);

/*고객 테이블 생성*/
create table theacust(
    custnum NUMBER,
    custname varchar2(20),
    address varchar2(20),
    PRIMARY KEY(custnum)
);

/*예약 테이블 생성*/
/*상영관 번호는 1부터 10 사이이다*/
/*같음 사람이 같은 좌석번호를 두 번 예약하지 않아야 한다.*/
create table reserv(
    movienum NUMBER,
    theanum NUMBER CHECK(1 <= theanum AND theanum <= 10),
    custnum NUMBER,
    seatnum NUMBER UNIQUE,
    reserdate DATE,
    PRIMARY KEY(movienum, theanum, custnum)
);

/*값 넣기*/
/*극장 테이블*/
insert into theater
values (1, '롯데', '잠실');
insert into theater
values (2, '메가', '강남');
insert into theater
values (3, '대한', '잠실');

/*삽입 값 확인*/
select * from theater;

/*상영관 테이블*/
insert into mtheater
values (1, 1, '어려운 영화', 15000, 48);
insert into mtheater
values (3, 1, '멋진 영화', 7500, 120);
insert into mtheater
values (3, 2, '재밌는 영화', 8000, 110);

/*삽입 값 확인*/
select * from mtheater;

/*예약 테이블*/
insert into reserv
values (3, 2, 3, 15, '2020-09-01');
insert into reserv
values (3, 1, 4, 16, '2020-09-01');
insert into reserv
values (1, 1, 9, 48, '2020-09-01');


/*삽입 값 확인*/
select * from reserv;

/*고객 테이블*/
insert into theacust
values (3, '홍길동', '강남');
insert into theacust
values (4, '김철수', '잠실');
insert into theacust
values (5, '박영희', '강남');

/*삽입 값 확인*/
select * from theacust;

/*단순질의 (1) 모든 극장의 이름과 위치를 보이시오.*/
select theaname, location from theater;

/*단순질의 (2) '잠실'에 있는 극장을 보이시오.*/
select * from theater where location='잠실';

/*단순질의 (3) '잠실'에 사는 고객의 이름을 오름차순으로 보이시오.*/
select custname from theacust where address='잠실' order by custname;

/*단순질의 (4) 가격이 8,000원 이하이 영화의 극장번호, 상영관번호, 영화제목을 보이시오.*/
select movienum, mtheanum, moviename from mtheater where price <= 8000;

/*단순질의 (5) 극장 위치와 고객의 주소가 같은 고객을 보이시오.*/
select distinct theater.location as location, theacust.address as address, custname
from theater, theacust where theater.location = theacust.address;

/*집계질의 (1) 극장의 수는 몇개인가?*/
select count(*) AS "극장의 수" from theater;

/*집계질의 (2) 상여되는 영화의 평균 가격은 얼마인가?*/
select AVG(SUM(price)) AS "영화의 평균 가격" from mtheater group by price;

/*집계질의 (3) 2020년 9월 1일에 영화를 관람한 고객의 수는 얼마인가?*/
select count(reserdate) AS "관람한 고객의 수" from reserv group by reserdate;

/*부속질의와 조인 (1) '대한'극장에서 상영된 영화 제목을 보이시오.*/
select mtheater.moviename AS "영화제목"
from theater, mtheater
where theater.movienum = mtheater.movienum
AND theaname = '대한';

/*부속질의와 조인 (2) '대한'극장에서 영화를 본 고객의 이름을 보이시오.*/
select theacust.custname AS "고객의 이름"
from theater, reserv, theacust
where theater.movienum = reserv.movienum
AND theacust.custnum = reserv.custnum
AND theater.theaname = '대한';

/*부속질의와 조인 (3) '대한'극장의 전체 수입을 보이시오.*/
select sum(price) AS "전체수입"
from theater, mtheater
where theater.movienum = mtheater.movienum
AND theater.theaname = '대한';

/*그룹질의 (1) 극장별 상영관 수를 보이시오.*/
select theater.theaname AS "극장", count(mtheanum) AS "상영관 수"
from theater, mtheater
where theater.movienum = mtheater.movienum
group by theaname;

/*그룹질의 (2) '잠실'에 있는 극장의 상영관을 보이시오.*/
select mtheater.mtheanum AS "잠실에 있는 상영관"
from theater, mtheater
where theater.movienum = mtheater.movienum
AND theater.location = '잠실'
group by mtheanum;

/*그룹질의 3,4 다시 해볼것...!!*/
/*그룹질의 (3) 2020년 9월 1일의 극장별 평균 관람 고객 수를 보이시오.*/
select theater.theaname AS "극장", count(*) AS "관람 고객 수"
from theater, reserv
where theater.movienum = reserv.movienum
AND reserdate = '2020-09-01'
group by theaname;

/*그룹질의 (4) 2020년 9월 1일에 가장 많은 고객이 관람한 영화를 보이시오.*/
select moviename
from mtheater, reserv
where mtheater.movienum = reserv.movienum
AND mtheater.mtheanum = reserv.theanum
AND reserdate = '2020-09-01'
group by moviename;
