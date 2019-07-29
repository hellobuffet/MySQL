SELECT 
    ename, salary
FROM
    employee
WHERE
    salary > (SELECT 
            salary
        FROM
            employee
        WHERE
            ename = '潘麗珍');
            
SELECT 
    ename, title, salary
FROM
    employee
WHERE
    title = (SELECT 
            title
        FROM
            employee
        WHERE
            empon = 1002)
        AND salary > (select salary from employee where empon=1005);
        
select deptno,MIN(salary) 'Minimum Salary' from employee Group by deptno having min(salary) >(select salary from employee where empon=1005employee);

select ename, title, salary, round(salary * 100 / (select sum(salary) from employee where deptno=100),1) 'Percentage' from employee where deptno;

SELECT 
	deptno,
    ename,
    title,
    salary,
    ROUND(salary * 100 /t.total,1) 'Percentage'
FROM
    employee, (select sum(salary) 'total' from employee where deptno = 100) t
WHERE
    deptno=100;
select * from employee where deptno =100;


select empon, ename from employee where salary = (select min(salary) from employee group by deptno);
-- Error Code: 1242. Subquery returns more than 1 row

	desc employee;
    desc department;
    alter table employee change empon empno decimal(4,0);
    
    
    
    SELECT 
    ename, title, salary
FROM
    employee
WHERE
    salary < ANY (SELECT 
            salary
        FROM
            employee
        WHERE
            title = 'senior engineer')
        AND title <> 'senior engineer';
-- salary < (select max(salary) from employee where title = 'senior engineer')    
    
    SELECT 
    ename, title, salary
FROM
    employee
WHERE
    salary < ALL (SELECT 
            salary
        FROM
            employee
        WHERE
            title = 'senior engineer')
        AND title <> 'senior engineer';
-- salary < (select min(salary) from employee where title = 'senior engineer')

select ename from emp where empno IN (select distinct mgrno from emp);
select ename from emp where empno not in (select distinct mgrno from emp);
select ename from emp where empno not in (select distinct mgrno from emp where mgrno is not null);

SELECT 
    e.ename,
    e.title,
    e.salary,
    ROUND(salary * 100 / (SELECT 
                    SUM(salary)
                FROM
                    employee
                WHERE
                    deptno = e.deptno),
            1) 'Percentage'
FROM
    employee e
WHERE
    e.deptno = 100;
    
    SELECT 
    ename, salary, deptno
FROM
    employee e
WHERE
    salary IN (SELECT 
            MIN(salary)
        FROM
            employee
        GROUP BY deptno
        HAVING deptno = e.deptno);
        
        
SELECT 
    ename, salary, deptno
FROM
    employee e
WHERE
    salary = (SELECT 
            MIN(salary)
        FROM
            employee
        WHERE
            deptno = e.deptno);
            
create table emp100 as select empno,ename,salary*12 'annuakSalary', hiredate from employee where deptno=100;
select * from emp100;