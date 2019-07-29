select * from employee;
select  * from department;
SELECT 17 / 4, 17 DIV 4, 17 % 4, 17 + NULL;
SELECT 17 / 4, 17 DIV 4, 17 % 4;

desc employee;
select * from employee;


select ename as '員工姓名' ,salary * 12 AS '年薪' from employee;
SELECT 
    ename AS 'employee name', salary * 12 AS 'annual salary'
FROM
    employee;


select substring(ename,1,1) as '姓氏',substring(ename,2) as '姓名' from employee;
-- 抓取指定文字
select substring('David Wang',1,5);
select substring('David Wang',7);
select substring('David Wang',-4);
select substring('David Wang',-4,2);
select substring('David Wang',1,5);

select concat(ename,'is a ',title) as '員工' from employee;
-- 字串合併
select length('我是一個student') as 'length';
-- 計算byte
select char_length('我是一個student') as 'length';
-- 計算字元

select sysdate(),sysdate()+interval 365 day;


SELECT NOW(), SLEEP(2), NOW();
SELECT ADDDATE(CURDATE(), 5);
SELECT ADDDATE(CURDATE(), interval 5 day);

SELECT subDATE(CURDATE(), 5);
SELECT subDATE(CURDATE(), interval 5 day);    
    
select now(),year(now()),month(now()),day(now());

select empon,ename,datediff(now(),hiredate) div 365 as 'year' from employee;
    
select * from employee;
SELECT 
    empon,
    ename,
    salary,
    salary * IF(salary >= 5000, 2, 1.5) AS 'bonus'
FROM
    employee;
-- if條件
    
SELECT 
    empon,
    ename,
    salary,
    CASE
        WHEN salary > 100000 THEN 'A'
        WHEN salary BETWEEN 70000 AND 100000 THEN 'B'
        WHEN salary BETWEEN 50000 AND 69999 THEN 'C'
        WHEN salary BETWEEN 30000 AND 49999 THEN 'D'
        ELSE 'E'
    END AS 'grade'
FROM
    employee;
-- 多重條件
    
select deptno from employee;
SELECT DISTINCT
    deptno, title
FROM
    employee;
-- 刪除重複項目
show collation;

select * from employee;
select * from employee where salary between 56000 and 67000;
-- salary在56000和67000之間的項目
select *  from employee where salary IN(56000);
-- salary包含56000

select * from employee where ename like '%麗%';
-- 找名字有包含麗的名字

select * from employee where title like '%SA\_%';
-- 用\消去_的效果來搜尋包含SA_的TITLE
select * from employee where title like '%SA/_%'escape'/';
-- 設定/為削去字元

select * from employee where salary >=45000 and ename like '林%';
select * from employee where salary >=45000 or ename like '林%';

select * from employee where title not in ('manage','engineer');

select * from department where mgrno is not null;

select * from employee where salary not between 40000 and 60000;

select * from employee where ename not like '林%';

select * from employee order by hiredate DESC;


select empon,ename ,hiredate,salary,deptno,title from employee order by 3;
-- 選擇第三個欄位排序

select * from employee limit 0,100;

select * from employee limit 3;

select count(mgrno) as  'count' from department;

select deptno,avg(salary) as 'average' from employee group by deptno;

select  deptno,avg(salary) as 'avg' from employee group by deptno;

select deptno,avg(salary) as 'avg' from employee group by deptno order by avg(salary);

select deptno,title,sum(salary) as 'total' from employee group by deptno,title with rollup;

select title,sum(salary) as 'title' from employee where title not like '%SA%' group by title having sum(salary)> 100000 order by sum(salary) DESC;

select title,sum(salary) as 'title' from employee group by title;