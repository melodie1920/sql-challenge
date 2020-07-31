-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT 
	 emp.emp_no AS "Employee Number"
	,emp.last_name AS "Last Name"
	,emp.first_name AS "First Name"
	,emp.sex AS "Sex"
	,s.salary AS "Salary"
FROM employee AS emp
	INNER JOIN salary AS s
		ON emp.emp_no = s.emp_no
;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT
	 first_name AS "First Name"
	,last_name AS "Last Name"
	,hire_date AS "Hire Date"
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = '1986'
;

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
SELECT
	 d.dept_no AS "Department Number"
	,d.dept_name AS "Department Name"
	,dm.emp_no AS "Manager Employee Number"
	,e.last_name AS "Manager Last Name"
	,e.first_name AS "Manager First Name"
FROM department AS d
	INNER JOIN department_manager AS dm
		ON d.dept_no = dm.dept_no
	INNER JOIN employee AS e
		ON dm.emp_no = e.emp_no
;

-- List the department of each employee with the following information: employee number, last name, first name, and department name.
SELECT
	 ed.emp_no AS "Employee Number"
	,e.last_name AS "Employee Last Name"
	,e.first_name AS "Employee First Name"
	,d.dept_name AS "Department Name"
FROM department AS d
	INNER JOIN employee_department AS ed
		ON d.dept_no = ed.dept_no
	INNER JOIN employee AS e
		ON ed.emp_no = e.emp_no
;

-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT
	 first_name AS "Employee First Name"
	,last_name AS "Employee Last Name"
	,sex AS "Sex"
FROM employee
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%'
;

-- List all employees in the Sales department, including their employee number, last name, first name, and department name.
SELECT
	 e.emp_no AS "Employee Number"
	,e.last_name AS "Employee Last Name"
	,e.first_name AS "Employee First Name"
	,d.dept_name AS "Department Name"
FROM employee AS e
	INNER JOIN employee_department AS ed
		ON e.emp_no = ed.emp_no
	INNER JOIN department AS d
		ON ed.dept_no = d.dept_no
WHERE d.dept_name = 'Sales'
;

-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.
SELECT
	 e.emp_no AS "Employee Number"
	,e.last_name AS "Employee Last Name"
	,e.first_name AS "Employee First Name"
	,d.dept_name AS "Department Name"
FROM employee AS e
	INNER JOIN employee_department AS ed
		ON e.emp_no = ed.emp_no
	INNER JOIN department AS d
		ON ed.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales','Development')
;

-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT 
	 last_name AS "Employee Last Name"
	,COUNT(*) AS "Employee Count"
FROM employee
GROUP BY last_name
ORDER BY "Employee Count" DESC
;
