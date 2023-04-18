/*department table ����*/
create table department(
    deptno INTEGER not null primary key,
    deptname varchar2(20),
    manager varchar2(20)
);


/*employee table  ����*/
create table employee(
    empno INTEGER NOT NULL PRIMARY KEY,
    name varchar2(20),
    phoneno INTEGER,
    address varchar2(20),
    sex varchar2(20),
    position varchar2(20),
    deptno INTEGER REFERENCES department (deptno)
);

/*project table ����*/ 
create table project(
    projno INTEGER NOT NULL PRIMARY KEY,
    projname varchar2(20),
    deptno INTEGER REFERENCES department (deptno)
);

/*works table ����*/
create table works(
    projno INTEGER NOT NULL REFERENCES project (projno),
    empno INTEGER NOT NULL REFERENCES employee (empno),
    hourswored INTEGER,
    CONSTRAINT projno_empno_pk PRIMARY KEY(projno, empno)
);

/*department table ������*/
insert into department values(1,'IT', '����');
insert into department values(2,'Marketing', 'ȫ�浿');

/*employee table ������*/
insert into employee values(1, '�����', 01012341232, '����','��','Programmer',1);
insert into employee values(2, '�̼���', 01012323122, '����','��','Programmer',1);
insert into employee values(3, '�ڿ���', 01076851231, '����','��','Salesperson',2);
insert into employee values(4, 'ȫ�浿', 01012341546, '����','��','Manager',2);
insert into employee values(5, '����', 01012311112, '����','��','Manager',1);

/*project table ������*/
insert into project values(1,'�����ͺ��̽�',1);
insert into project values(2,'��������',2);

/*works table ������*/
insert into works values(1, 1, 3);
insert into works values(1, 2, 1);
insert into works values(2, 3, 1);
insert into works values(2, 4, 5);
insert into works values(1, 5, 1);