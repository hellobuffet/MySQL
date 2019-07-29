create view empvu100 as select empno,ename, salary from employee where deptno = 100;
select * from empvu100;
create view salvu100 as select empno id, ename name, salary*12 'annual_salary' from employee where deptno = 100;
select * from salvu100;
create view salvu100_1(id,name,annual_salary) as select empno id, ename name, salary*12 'annual_salary' from employee where deptno = 100;
select * from salvu100_1;

create view dept_sum_vw (name,minsal,maxsal,avgsal) as select d.dname,min(e.salary),max(e.salary),avg(e.salary) from employee e ,department d where e.deptno = d.deptno group by d.dname;
select * from  dept_sum_vw ;
select * from empvu100;
update empvu100 set ename='孫大為' where empno = 1003;
update empvu100 set title = 'sa' where empno = 1009;
delete from empvu100 where empno = 1009;

create view emp_sal_vw as select empno,ename,salary from employee where salary <=4000 with check option;
alter view emp_sal_vw as select empno,ename,salary from employee where salary <=40000 with check option;
select * from emp_sal_vw;
update emp_sal_vw set salary = 40001 where empno = 1002;
show index  from employee;
create unique index employeeindex on employee;