use employees;

show databases;
select * from employees limit 10;

-- SELECT 
--     m.dept_no, m.emp_no, d.dept_name
-- FROM
--     dept_manager_dup m
--         JOIN
--     departments_dup d ON m.dept_no = d.dept_no
-- -- GROUP BY m.emp_no
-- ORDER BY dept_no;

use employees;

select m.dept_no, m.emp_no, d.dept_name 
from dept_manager_dup m 
join departments_dup d 
on m.dept_no = d.dept_no order by dept_no;