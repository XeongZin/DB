/*���� ���� ������ �Ѽ�*/
select count(*) from book;

/*���缭���� ������ ����ϴ� ���ǻ��� �Ѽ�*/
select count(distinct publisher) from book;

/*��� ���� �̸�, �ּ�*/
select name, address from customer;

/*2020�� 7��4��~7��7�� ���̿� �ֹ����� ������ �ֹ���ȣ*/
select * from orders where orderdate between to_date('2020-07-04','YYYY-MM-DD') and to_date('2020-07-07','YYYY-MM-DD');

/*2020�� 7��4��~7��9�� ���̿� �ֹ����� ������ ������ ������ �ֹ���ȣ*/
select * from orders where orderdate not between to_date('2020-07-04','YYYY-MM-DD') and to_date('2020-07-09','YYYY-MM-DD');

/*���� '��'���� ���� �̸��� �ּ�*/
select name, address from customer where name like '��%';

/*���� '��'���̰� �̸��� '��'�� ������ ���� �̸��� �ּ�*/
select name, address from customer where name like '��%��';