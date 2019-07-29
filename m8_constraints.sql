CREATE TABLE emp1 (
    empon DECIMAL(4) PRIMARY KEY,
    ename VARCHAR(30) NOT NULL,
    hiredate DATE NOT NULL,
    email varchar(30) unique,
    deptno DECIMAL(3) NOT NULL,
    salary INT,
    title VARCHAR(20) NOT NULL default 'engineer',
    constraint emp_deptno_fk foreign key (deptno) references department(deptno)
);
select * from dept;
insert into dept value (600,'Public Relations',default);
update dept set cityno = default where deptno = 500;

select * from emp_copy;

ALTER TABLE `db01`.`emp1` 
DROP FOREIGN KEY `emp_deptno_fk`;
ALTER TABLE `db01`.`emp1` 
ADD CONSTRAINT `emp_deptno_fk`
  FOREIGN KEY (`deptno`)
  REFERENCES `db01`.`department` (`deptno`)
  ON UPDATE CASCADE;

create table mem(memno int primary key auto_increment, mname varchar(30) not null)auto_increment=100;
select *  from mem;
select last_insert_id();
insert into mem(mname) values ('DAVID'),('DAVID1'),('DAVID2'),('DAVID3');