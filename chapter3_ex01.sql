select * from book;

select bookname from book where bookid=1;   //(1) ������ȣ�� 1�� ������ �̸�
select bookname from book where price>=20000;   //(2) ������ 2���� �̻��� ������ �̸�
select sum(saleprice) from orders where custid=1;   //(3) �������� �� ���ž�
select sum(saleprice) from customer orders where customer.custid=orders.custid and customer.name like '������';    //(3-2) �������� �� ���ž�2
select count(*) from orders where custid=1; //(4)


