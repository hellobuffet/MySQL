SELECT 
    ename, emp.deptno, dname
FROM
    emp,
    dept
WHERE
    emp.deptno = dept.deptno;
--  equal join2/6 
-- ======================================================================
SELECT 
    ename, emp.deptno, dname
FROM
    emp
        JOIN
    dept ON emp.deptno = dept.deptno;
--  equal join2/6 ansi join
-- ======================================================================


select ename, emp.deptno, dname from emp join dept using(deptno);

select ename, emp.deptno, dname from emp natural join dept ;
-- natural join

select ename, emp.deptno, dname from emp, dept where emp.deptno = dept.deptno and title = 'manager';

select e.ename, e.deptno, d.dname from emp e ,dept d where e.deptno = d.deptno;
-- 增加別名
SELECT 
    e.ename, d.dname, c.cname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
        JOIN
    city c ON d.cityno = c.cityno;
-- 


SELECT 
    e.ename, d.dname, c.cname
FROM
    emp e
        JOIN
    dept d ON e.deptno = d.deptno
        JOIN
    city c ON d.cityno = c.cityno;
--  equal join6/6 以emp為主，join dept and city

SELECT 
    e.ename, d.dname, c.cname
FROM
    emp e,
    dept d,
    city c
WHERE
    e.deptno = d.deptno
        AND d.cityno = c.cityno;
-- equal join5/6 先下要join的資料庫，從where下合併條件
        



SELECT 
    e.ename, e.salary, g.level
FROM
    emp e,
    grade g
WHERE
    e.salary BETWEEN g.lowest AND g.highest;
    
    
select e.ename, d.dname, e.salary, g.level from emp e , dept d,grade g where e.deptno=d.deptno and e.salary between g.lowest and g.highest;

-- =====================================================================================
SELECT 
    *
FROM
    emp e,
    dept d,
    city c
WHERE
    e.deptno = d.deptno
        AND d.cityno = c.cityno;
-- =====================================================================================
    --  以左邊的資料為主，就算右邊沒有連結資料也印出=
SELECT 
    e.ename, e.deptno, d.dname
FROM
    emp e
        LEFT JOIN
    dept d ON e.deptno = d.deptno;
-- ====================================================================================
    -- 以右邊的資料為主，就算左邊沒有連結資料也印出
SELECT 
    e.ename, d.deptno, d.dname
FROM
    emp e
        right JOIN
    dept d ON e.deptno = d.deptno;
-- =====================================================================================
-- UNION 把兩邊的資料都全部印出
SELECT 
    e.ename, e.deptno, d.dname
FROM
    emp e
        LEFT JOIN
    dept d ON e.deptno = d.deptno 
UNION SELECT 
    e.ename, d.deptno, d.dname
FROM
    emp e
        RIGHT JOIN
    dept d ON e.deptno = d.deptno;
-- =====================================================================================
SELECT 
    worker.ename AS 'worker name',
    manager.ename AS 'manager name'
FROM
    emp worker,
    emp manager
WHERE
    worker.mgrno = manager.empno;
-- JOIN自己來尋找主管名稱

