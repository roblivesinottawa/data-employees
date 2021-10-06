show databases;
use employees;
show tables;
describe departments;
select * from departments;
select * from employees where first_name = 'Elvis' limit 10;
select count(*) from employees where first_name = 'Elvis' and gender = 'F';

SHOW DATABASES;
USE employees;
SHOW TABLES;
SELECT * FROM employees WHERE first_name LIKE ('%JACK%');
SELECT * FROM employees;

SELECT 
    first_name, COUNT(first_name) AS names_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name ASC;

select * from employees order by first_name desc limit 5;

SELECT first_name as first, last_name as last from employees where emp_no = 999901 order by first;

select * from employees order by emp_no desc limit 10;

show databases;
use sales;

show tables;
select * from sales;
select * from customers;
insert into customers (f_name, l_name, gender, email_address) values ('Peter', 'Quill', 'M', 'peter.quill@gmail.com');
select * from customers;
update customers set email_address = 'peter.parker@gmail.com' where customer_id = 2;
select * from customers;

UPDATE customers 
SET 
    email_address = 'tony_stark@icloud.com'
WHERE
    customer_id = 3;
    
select * from customers;

SELECT 
    f_name AS Name
FROM
    customers
GROUP BY Name
HAVING COUNT(number_of_complaints) >= 0
ORDER BY Name;



use employees;

insert into employees(emp_no, birth_date, first_name, last_name, gender, hire_date) values (999902, '1973-03-26', 'Patricia', 'Lawrence', 'F', '2005-01-01');

select * from employees order by first_name desc limit 10;


select * from departments limit 10;

CREATE TABLE departments_dup (
    dept_no CHAR(4) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);


select * from departments_dup;

insert into departments_dup (dept_no, dept_name) select * from departments;

select * from departments_dup;

SELECT 
    *
FROM
    employees
WHERE
    emp_no = 999901;
    
UPDATE employees 
SET 
    first_name = 'Stella',
    last_name = 'Parkinson',
    birth_date = '1990-12-31',
    gender = 'F'
WHERE
    emp_no = 999901;

select * from employees where emp_no = 999903;

ROLLBACK;


SELECT 
    dept_no, IFNULL(dept_name, 'Department not provided') as Department_Name
FROM
    departments_dup;
    
SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    departments_dup
ORDER BY dept_no ASC;


SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

SELECT 
    IFNULL(dept_no, 'n/a') AS dept_no,
    IFNULL(dept_name, 'Department not provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    departments_dup
ORDER BY dept_no ASC;

drop table if exists dept_manager_dup;

CREATE TABLE dept_manager_dup (
    emp_no INT(11) NOT NULL,
    dept_no CHAR(4) NULL,
    from_date DATE NOT NULL,
    to_date DATE NULL
);

select * from dept_manager_dup;
select * from dept_manager;

insert into dept_manager_dup select * from dept_manager;

select * from dept_manager_dup;

insert into dept_manager_dup (emp_no, from_date) values (999904, '2017-01-01'), (999905, '2017-01-01'), (999906, '2017-01-01'), (999907, '2017-01-01');

DELETE FROM dept_manager_dup 
WHERE
    dept_no = 'd001';
    
select * from dept_manager_dup;

SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager m
        INNER JOIN
    departments d ON m.dept_no = d.dept_no
ORDER BY m.dept_no;

show tables;

use employees;


SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        INNER JOIN
    departments_dup d ON m.dept_no = d.dept_no
ORDER BY dept_no;


SELECT 
    m.dept_no, m.emp_no, d.dept_name
FROM
    dept_manager_dup m
        JOIN
    departments_dup d ON m.dept_no = d.dept_no
-- GROUP BY m.emp_no
ORDER BY dept_no;


use employees;
# remove the duplicates from the two tables
delete from dept_manager_dup where emp_no = '110228'; 
delete from departments_dup where dept_no = 'd009';





