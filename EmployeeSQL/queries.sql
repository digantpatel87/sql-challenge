--1. List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	e.emp_no as "employee number"
	,e.last_name as "last name"
	,e.first_name as  "first name"
	,e.sex
	,s.salary
From employees e
	INNER JOIN salaries s
		on e.emp_no = s.emp_no;
		
--2. List first name, last name, and hire date for employees who were hired in 1986.
SELECT 
	e.first_name as  "first name"
	,e.last_name as "last name"
	,e.hire_Date as "hire date"
From employees e
WHERE EXTRACT(YEAR FROM e.hire_Date) = '1986';
 
 
--3. List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT d.dept_no as "department number"
	,d.dept_name as "department name"
	,e.emp_no as "managers employee number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
FROM dept_manager dm
	inner join employees e
		on dm.emp_no = e.emp_no
	inner join departments d
		on dm.dept_no = d.dept_no;
		
--4. List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT e.emp_no as "employee number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,d.dept_name as "department name"
FROM dept_emp dm
	inner join employees e
		on dm.emp_no = e.emp_no
	inner join departments d
		on dm.dept_no = d.dept_no;

--5. List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT 
	e.last_name as "last name"
	,e.first_name as  "first name"
	,e.sex
From employees e
WHERE e.first_name = 'Hercules'
	and e.last_name ilike 'B%';



--6. List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "employee number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,d.dept_name as "department name"
FROM dept_emp dm
	inner join employees e
		on dm.emp_no = e.emp_no
	inner join departments d
		on dm.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--7. List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT e.emp_no as "employee number"
	,e.last_name as "Last Name"
	,e.first_name as "First Name"
	,d.dept_name as "department name"
FROM dept_emp dm
	inner join employees e
		on dm.emp_no = e.emp_no
	inner join departments d
		on dm.dept_no = d.dept_no
WHERE d.dept_name in ('Sales','Development');

--8. In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT Count(*)
	,e.last_name as "Last Name"
FROM employees e
GROUP BY e.last_name
ORDER BY 1 desc


		
		