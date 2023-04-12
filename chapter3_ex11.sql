/*(1) ~ (4)*/
/*���� ���̺� ����*/
create table theater(
    movienum NUMBER,
    theaname varchar2(20),
    location varchar2(20),
    PRIMARY KEY(movienum)
);

/*�󿵰� ���̺� ����*/
/*��ȭ ������ 20,000���� ���� �ʾƾ� �Ѵ�*/
/*�󿵰� ��ȣ�� 1���� 10 �����̴�*/
create table mtheater(
    movienum NUMBER,
    mtheanum NUMBER CHECK(1 <= mtheanum AND mtheanum <= 10),
    moviename varchar2(20),
    price NUMBER CHECK(price < 20000),
    seatcount NUMBER,
    PRIMARY KEY(movienum, mtheanum)
);

/*�� ���̺� ����*/
create table theacust(
    custnum NUMBER,
    custname varchar2(20),
    address varchar2(20),
    PRIMARY KEY(custnum)
);

/*���� ���̺� ����*/
/*�󿵰� ��ȣ�� 1���� 10 �����̴�*/
/*���� ����� ���� �¼���ȣ�� �� �� �������� �ʾƾ� �Ѵ�.*/
create table reserv(
    movienum NUMBER,
    theanum NUMBER CHECK(1 <= theanum AND theanum <= 10),
    custnum NUMBER,
    seatnum NUMBER UNIQUE,
    reserdate DATE,
    PRIMARY KEY(movienum, theanum, custnum)
);

/*�� �ֱ�*/
/*���� ���̺�*/
insert into theater
values (1, '�Ե�', '���');
insert into theater
values (2, '�ް�', '����');
insert into theater
values (3, '����', '���');

/*���� �� Ȯ��*/
select * from theater;

/*�󿵰� ���̺�*/
insert into mtheater
values (1, 1, '����� ��ȭ', 15000, 48);
insert into mtheater
values (3, 1, '���� ��ȭ', 7500, 120);
insert into mtheater
values (3, 2, '��մ� ��ȭ', 8000, 110);

/*���� �� Ȯ��*/
select * from mtheater;

/*���� ���̺�*/
insert into reserv
values (3, 2, 3, 15, '2020-09-01');
insert into reserv
values (3, 1, 4, 16, '2020-09-01');
insert into reserv
values (1, 1, 9, 48, '2020-09-01');


/*���� �� Ȯ��*/
select * from reserv;

/*�� ���̺�*/
insert into theacust
values (3, 'ȫ�浿', '����');
insert into theacust
values (4, '��ö��', '���');
insert into theacust
values (5, '�ڿ���', '����');

/*���� �� Ȯ��*/
select * from theacust;

/*�ܼ����� (1) ��� ������ �̸��� ��ġ�� ���̽ÿ�.*/
select theaname, location from theater;

/*�ܼ����� (2) '���'�� �ִ� ������ ���̽ÿ�.*/
select * from theater where location='���';

/*�ܼ����� (3) '���'�� ��� ���� �̸��� ������������ ���̽ÿ�.*/
select custname from theacust where address='���' order by custname;

/*�ܼ����� (4) ������ 8,000�� ������ ��ȭ�� �����ȣ, �󿵰���ȣ, ��ȭ������ ���̽ÿ�.*/
select movienum, mtheanum, moviename from mtheater where price <= 8000;

/*�ܼ����� (5) ���� ��ġ�� ���� �ּҰ� ���� ���� ���̽ÿ�.*/
select distinct theater.location as location, theacust.address as address, custname
from theater, theacust where theater.location = theacust.address;

/*�������� (1) ������ ���� ��ΰ�?*/
select count(*) AS "������ ��" from theater;

/*�������� (2) �󿩵Ǵ� ��ȭ�� ��� ������ ���ΰ�?*/
select AVG(SUM(price)) AS "��ȭ�� ��� ����" from mtheater group by price;

/*�������� (3) 2020�� 9�� 1�Ͽ� ��ȭ�� ������ ���� ���� ���ΰ�?*/
select count(reserdate) AS "������ ���� ��" from reserv group by reserdate;

/*�μ����ǿ� ���� (1) '����'���忡�� �󿵵� ��ȭ ������ ���̽ÿ�.*/
select mtheater.moviename AS "��ȭ����"
from theater, mtheater
where theater.movienum = mtheater.movienum
AND theaname = '����';

/*�μ����ǿ� ���� (2) '����'���忡�� ��ȭ�� �� ���� �̸��� ���̽ÿ�.*/
select theacust.custname AS "���� �̸�"
from theater, reserv, theacust
where theater.movienum = reserv.movienum
AND theacust.custnum = reserv.custnum
AND theater.theaname = '����';

/*�μ����ǿ� ���� (3) '����'������ ��ü ������ ���̽ÿ�.*/
select sum(price) AS "��ü����"
from theater, mtheater
where theater.movienum = mtheater.movienum
AND theater.theaname = '����';

/*�׷����� (1) ���庰 �󿵰� ���� ���̽ÿ�.*/
select theater.theaname AS "����", count(mtheanum) AS "�󿵰� ��"
from theater, mtheater
where theater.movienum = mtheater.movienum
group by theaname;

/*�׷����� (2) '���'�� �ִ� ������ �󿵰��� ���̽ÿ�.*/
select mtheater.mtheanum AS "��ǿ� �ִ� �󿵰�"
from theater, mtheater
where theater.movienum = mtheater.movienum
AND theater.location = '���'
group by mtheanum;

/*�׷����� 3,4 �ٽ� �غ���...!!*/
/*�׷����� (3) 2020�� 9�� 1���� ���庰 ��� ���� �� ���� ���̽ÿ�.*/
select theater.theaname AS "����", count(*) AS "���� �� ��"
from theater, reserv
where theater.movienum = reserv.movienum
AND reserdate = '2020-09-01'
group by theaname;

/*�׷����� (4) 2020�� 9�� 1�Ͽ� ���� ���� ���� ������ ��ȭ�� ���̽ÿ�.*/
select moviename
from mtheater, reserv
where mtheater.movienum = reserv.movienum
AND mtheater.mtheanum = reserv.theanum
AND reserdate = '2020-09-01'
group by moviename;
