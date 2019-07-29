CREATE TABLE employee (
    empon DECIMAL(4) PRIMARY KEY,
    ename VARCHAR(30) NOT NULL,
    hiredate DATE NOT NULL,
    salary INT NOT NULL,
    deptno DECIMAL(3) NOT NULL,
    title VARCHAR(20) NOT NULL
);


CREATE TABLE `db01`.`department` (
    `deptno` DECIMAL(3) NOT NULL,
    `dname` VARCHAR(30) NOT NULL,
    `mgrno` DECIMAL(4) NULL,
    PRIMARY KEY (`deptno`)
);

show table status in db01;


show tables;
desc employee;


desc food1;

create table food(
	id char(5) primary key, 
    name varchar(30), 
    expiredate datetime, 
    placeid char(2), 
    price int unsigned, 
    catalog varchar(20)
);

create table place(
	id char(2) primary key,
    name varchar(20)
);

alter table food modify id char(5);
alter table food modify name varchar(30) ;

create table food1 like food;
	
    
CREATE TABLE new_table LIKE old_table;
-- 複製table
INSERT new_table SELECT * FROM old_table;
-- 複製資料-- 
    