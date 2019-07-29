desc t1;  
create table t (a int, b char(10), c float);
-- 新增table-- 
alter table t add d varchar(30);
-- 增加欄位
alter table t add e varchar(30) first ;
-- 增加欄位於第一排
alter table t add f varchar(30) after e;
-- 增加欄位於E欄位之後
alter table t modify d varchar(50) first;
-- 修改D欄位屬性 
alter table t change f g decimal(10,2);
-- 修改F欄位名稱和屬性
alter table t drop c;
-- 刪除C欄位
alter table t rename t1;
-- 修改T table名稱
drop table t1;
-- 刪除T1 TABELE



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