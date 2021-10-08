use employees;

SELECT 
    e.emp_no,
    e.first_name,
    e.last_name,
CASE WHEN 
max(de.to_date) > sysdate() THEN 'is still employed' ELSE 'Not an employee anymore'
END AS current_employee
from employees e
join dept_emp de on e.emp_no = de.emp_no
group by de.emp_no
limit 100;
