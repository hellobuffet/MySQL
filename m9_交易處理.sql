start transaction;
insert into department values (601,'RD',1001);
insert into department values (602,'IT',NULL);
select * from department;
rollback;
select * from department;

start transaction;
insert into department values (601,'RD',1001);
insert into department values (602,'IT',NULL);
select * from department;
commit;
select * from department;


set autocommit=0;
insert into department values (603,'RD',1001);
insert into department values (604,'IT',NULL);
select * from department;
rollback;
select * from department;
insert into department values (603,'RD',1001);
insert into department values (604,'IT',NULL);
select * from department;
commit;
select * from department;
set autocommit = 1;

begin;
select empno,ename,salary from employee where empno in (1001,1002,1003);
update employee set salary = 60000 where empno = 1001;
savepoint a;
update employee set salary = 40000 where empno = 1002;
savepoint b;
update employee set salary = 80000 where empno = 1003;
rollback to a;
commit;
select empno,ename,salary from employee where empno in (1001,1002,1003);


begin;
select salary from employee where empno=1001;
update employee set salary = 60001 where empno = 1001;
commit;
select salary from employee where empno = 1001;