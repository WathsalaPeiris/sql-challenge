--List employee number, last name, first name, sex and salary of each employee
SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employees e
LEFT JOIN salaries s
ON e.emp_no = s.emp_no;

--List the first name, last name and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employees
WHERE hire_date LIKE '%1986';

--List the manager of each department along with their department number, department name,
--employee number, last name and first name
SELECT d.dept_no, d.dept_name, dm.emp_no AS manager_emp_no, e.last_name AS manager_last_name, e.first_name AS manager_first_name
FROM departments d
LEFT JOIN dept_manager dm
ON dm.dept_no = d.dept_no
LEFT JOIN employees e
ON dm.emp_no = e.emp_no;

--List the department number for each employee along with that employee's employee number,
--last name, first name and department name
SELECT e.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM employees e
LEFT JOIN dept_emp de
ON de.emp_no = e.emp_no
LEFT JOIN departments d
ON de.dept_no = d.dept_no;

--List first name, last name and sex of each employee whoose first name is Hercules 
--and whoose last name begins with the letter B
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules'
AND last_name LIKE 'B%';

--Select all from departments and note down the department no of Sales department and Development department
SELECT * FROM departments;
--Note down the dept_no of Sales Department
--Sales - d007
--Development - d005

--List each employee in the Sales department including their employee no, 
--last name and first name
SELECT de.dept_no, de.emp_no, e.last_name, e.first_name
FROM dept_emp de
JOIN employees e
ON de.emp_no = e.emp_no
WHERE de.dept_no = 'd007';

--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name and department name
SELECT de.emp_no, e.last_name, e.first_name, de.dept_no, d.dept_name
FROM dept_emp de
JOIN employees e
ON de.emp_no = e.emp_no
JOIN departments d
ON de.dept_no = d.dept_no
WHERE de.dept_no = 'd007' OR de.dept_no = 'd005';

--List the frequency counts, in descending order,of all the employees last names
SELECT last_name, COUNT(last_name) AS "last_name_count"
FROM employees
GROUP BY last_name
ORDER BY last_name_count DESC;
