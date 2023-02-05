--Create Table 'departments'
CREATE TABLE departments(
	dept_no VARCHAR(4) PRIMARY KEY NOT NULL,
	dept_name VARCHAR(30) NOT NULL
);

--Create Table 'titles'
CREATE TABLE titles(
	title_id VARCHAR(5) PRIMARY KEY NOT NULL,
	title VARCHAR(30) NOT NULL
);

--Create Table 'employees'
CREATE TABLE employees(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	emp_title VARCHAR(5) NOT NULL,
	FOREIGN KEY (emp_title) REFERENCES titles(title_id),
	birth_date VARCHAR(10),
	first_name VARCHAR(30) NOT NULL,
	last_name VARCHAR(30),
	sex VARCHAR,
	hire_date VARCHAR(10) NOT NULL
);

--Create Table 'dept_emp'
CREATE TABLE dept_emp(
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

--Create Table 'dept_manager'
CREATE TABLE dept_manager(
	dept_no VARCHAR(4) NOT NULL,
	FOREIGN KEY (dept_no) REFERENCES departments(dept_no),
	emp_no INTEGER NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	PRIMARY KEY (dept_no, emp_no)
);

--Create Table 'salaries'
CREATE TABLE salaries(
	emp_no INTEGER PRIMARY KEY NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees(emp_no),
	salary FLOAT
);

SELECT * FROM departments;

SELECT * FROM titles;

SELECT * FROM employees;

SELECT * FROM dept_emp;

SELECT * FROM dept_manager;

SELECT * FROM salaries;