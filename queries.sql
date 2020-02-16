-- List the following details of each employee: employee number, last name, first name, gender, and salary.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	e.gender,
	salary
from employees e
join salaries s on s.emp_no = e.emp_no;

-- List employees who were hired in 1986.
select
	*
from employees
where
	extract(year from hire_date) = 1986;
	
-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name, and start and end employment dates.
select
	dm.dept_no,
	d.dept_name,
	dm.emp_no,
	e.last_name,
	e.first_name,
	dm.from_date manager_start,
	dm.to_date manager_end
from dept_manager dm
join employees e on e.emp_no = dm.emp_no
join departments d on d.dept_no = dm.dept_no;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no;

-- List all employees whose first name is "Hercules" and last names begin with "B."
select
	*
from employees
where
	first_name = 'Hercules' and
	last_name ilike 'B%';

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where
	d.dept_name = 'Sales';
	
-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
select
	e.emp_no,
	e.last_name,
	e.first_name,
	d.dept_name
from employees e
join dept_emp de on de.emp_no = e.emp_no
join departments d on d.dept_no = de.dept_no
where
	d.dept_name in ('Sales','Development')
	
-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
select
	last_name,
	count(last_name) total
from employees
group by 1
order by 2 desc