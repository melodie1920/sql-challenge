-- Create tables for the assignment --
CREATE TABLE title (
	title_id VARCHAR(255) PRIMARY KEY,
	title VARCHAR(255)
);

CREATE TABLE employee (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(255),
	birth_date DATE,
	first_name VARCHAR(255),
	last_name VARCHAR(255),
	sex VARCHAR(255),
	hire_date DATE,
	FOREIGN KEY (emp_title_id) REFERENCES title(title_id)
);

CREATE TABLE department (
	dept_no VARCHAR(255) PRIMARY KEY,
	dept_name VARCHAR(255)
);

CREATE TABLE employee_department (
	emp_no INT,
	dept_no VARCHAR(255),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE department_manager (
	dept_no VARCHAR(255),
	emp_no INT,
	FOREIGN KEY (emp_no) REFERENCES employee(emp_no),
	FOREIGN KEY (dept_no) REFERENCES department(dept_no)
);

CREATE TABLE salary (
	emp_no INT PRIMARY KEY,
	salary NUMERIC
);