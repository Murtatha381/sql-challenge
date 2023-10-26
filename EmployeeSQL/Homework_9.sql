--create employee table and import data
Drop Table employee;
create table employee (
	emp_no INT NOT NULL PRIMARY KEY,
	emp_title_id VARCHAR(255) NOT NULL,
	birth_date DATE NOT NULL,
	first_name VARCHAR(255) NOT NULL,
	last_name VARCHAR(255) NOT NULL,
	sex VARCHAR(255) NOT NULL,
	hire_date DATE NOT NULL
);
select * from employee

--create salaries table and import data
Drop Table salaries;
create table salaries (
	emp_no INT NOT NULL,
	salary INT NOT NULL
);
select * from salaries

--create titles table and import data
Drop Table titles;
create table titles (
	emp_title_id VARCHAR(255) NOT NULL,
	title VARCHAR(255) NOT NULL
);
select * from titles

--create departments table and import data
Drop Table departments;
create table departments (
	dept_no VARCHAR(255) NOT NULL PRIMARY KEY,
	dept_name VARCHAR(255) NOT NULL
);
select * from departments

--create dept_emp table and import data
Drop Table dept_emp;
create table dept_emp (
	emp_no INT NOT NULL,
	dept_no VARCHAR(255) NOT NULL
);
select * from dept_emp

--create dept_manager table and import data
Drop Table dept_manager;
create table dept_manager (
	dept_no VARCHAR(255) NOT NULL,
	emp_no INT NOT NULL
);
select * from dept_manager

--List the employee number, last name, first name, sex, and salary of each employee
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
INNER JOIN salaries ON
salaries.emp_no = employee.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986
SELECT first_name, last_name, hire_date
FROM employee
WHERE EXTRACT(YEAR FROM hire_date) = 1986;

--List the manager of each department along with their department number, department name, employee number, last name, and first name
SELECT employee.emp_no, employee.last_name, employee.first_name, employee.sex, salaries.salary
FROM employee
INNER JOIN salaries ON
salaries.emp_no=employee.emp_no;

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name
SELECT e.emp_no, e.last_name, e.first_name, d.dept_no, d.dept_name
FROM employee e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no;

--List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B 
SELECT first_name, last_name, sex
FROM employee
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';

--List each employee in the Sales department, including their employee number, last name, and first name
SELECT e.emp_no, e.last_name, e.first_name
FROM employee e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';

--List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name 
SELECT e.emp_no, e.last_name, e.first_name, d.dept_name
FROM employee e
INNER JOIN dept_emp de ON e.emp_no = de.emp_no
INNER JOIN departments d ON de.dept_no = d.dept_no
WHERE d.dept_name IN ('Sales', 'Development');

--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)
SELECT last_name, COUNT(*) as last_name_count
FROM employee
GROUP BY last_name
ORDER BY last_name_count DESC, last_name;





