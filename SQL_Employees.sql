-- DROP TABLE IF EXISTS departments;
-- DROP TABLE IF EXISTS dept_emp;
-- DROP TABLE IF EXISTS dept_manager;
-- DROP TABLE IF EXISTS employees;
-- DROP TABLE IF EXISTS salaries;
-- DROP TABLE IF EXISTS titles;
---------------------------
-- CREATE TABLE employees(
-- 	emp_no int NOT NULL PRIMARY KEY,
-- 	emp_title_id varchar(30) NOT NULL,
-- 	birth_date date NOT NULL,
-- 	first_name varchar(20) NOT NULL,
-- 	last_name varchar(20) NOT NULL,
-- 	sex char(1) NOT NULL,
-- 	hire_date date NOT NULL);

-- select * from employees;
-------------------------
-- creating department table
-------------------------
-- CREATE TABLE departments(
-- 	dept_no varchar(10) NOT NULL PRIMARY KEY,
-- 	dept_name VARCHAR(30) NOT NULL);
	
-- SELECT * FROM departments;

-------------------------
--creating dept_emp table
-------------------------

-- CREATE TABLE dept_emp(
-- 	emp_no int NOT NULL,
-- 	dept_no varchar(10) NOT NULL,
-- 	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
-- 	FOREIGN KEY(dept_no) REFERENCES departments(dept_no));

--select * from dept_emp;

-------------------------
-- creating dept_managers TABLES
-------------------------

-- CREATE TABLE dept_manager(
-- 	dept_no varchar(10) NOT NULL,
-- 	emp_no int NOT NULL,
-- 	FOREIGN KEY(emp_no) REFERENCES employees(emp_no),
--  	FOREIGN KEY(dept_no) REFERENCES departments(dept_no));
	
	--select * from dept_manager;
------------------------
-- creating salaries table
------------------------

-- CREATE TABLE salaries(
-- 	emp_no int NOT NULL,
-- 	salary int NOT NULL,
-- 	FOREIGN KEY(emp_no) REFERENCES employees(emp_no));

--SELECT * FROM salaries;
-------------------------
--creating table titles
-------------------------

-- CREATE TABLE titles(
-- 	title_id varchar(10) PRIMARY KEY NOT NULL,
-- 	title varchar(30) NOT NULL);

	--SELECT * FROM titles;
-------------------------
-- adding foreign key to emplye TABLE
-------------------------
-- 	ALTER TABLE employees
-- 	ADD FOREIGN KEY (emp_title_id) REFERENCES TITLES(TITLE_ID);
-------------------------
-- List the employee number, last name, first name, sex,
-- and salary of each employee.
-------------------------
-- select e.emp_no,e.first_name,e.last_name,e.sex,s.salary
-- from employees as e
-- inner join salaries as s
-- on e.emp_no = s.emp_no;
---------------------------
-- List the first name, last name, 
-- and hire date for the employees who were hired in 1986.
----------------------------
-- select * from employees;

-- select first_name,last_name,hire_date
-- from employees
-- where hire_date BETWEEN '19860101' AND '19861231';

----------------------------
-- List the manager of each department along with their department number, 
-- department name,employee number, last name, and first name.
-----------------------------
-- SELECT DM.dept_no,D.dept_name,E.emp_no,E.last_name,E.first_name
-- FROM dept_manager AS DM
-- INNER JOIN departments AS D
-- ON DM.dept_no = D.dept_no
-- INNER JOIN employees AS E
-- ON E.emp_no = DM.emp_no;
------------------------------
-- List the department number for each employee along with that 
-- employee’s employee number, last name, first name, 
-- and department name.
-------------------------------
-- SELECT  D.dept_no,E.emp_no,E.first_name,E.last_name,D.dept_name
-- FROM employees AS E
-- INNER JOIN dept_emp AS DE
-- ON DE.emp_no = E.emp_no
-- INNER JOIN departments AS D
-- ON D.dept_no = DE.dept_no
------------------------------
-- List first name, last name, and sex of each employee whose
-- first name is Hercules and whose last name begins
-- with the letter B.
------------------------------
-- SELECT first_name,last_name,sex
-- FROM employees WHERE 
-- first_name = 'Hercules' AND last_name LIKE 'B%';
-------------------------------

-- List each employee in the Sales department, 
-- including their employee number, last name, and first name.
-------------------------------
-- select emp_no,last_name,first_name
-- from employees
-- where emp_no IN
-- 	(select emp_no
-- 	from dept_emp
-- 	where dept_no IN
-- 		(select dept_no
-- 		from departments
-- 		where dept_name='Sales'));
-- -----------------------------

-- List each employee in the Sales and
-- Development departments, including their employee number, 
-- last name, first name, and department name.
------------------------------
-- SELECT e.emp_no,E.last_name,E.first_name,D.dept_name
-- FROM dept_emp AS DE 
-- INNER JOIN EMPLOYEES AS E
-- ON E.EMP_NO = DE.emp_no
-- INNER JOIN departments AS D
-- ON D.dept_no = DE.dept_no
-- WHERE D.DEPT_NAME='Sales' or D.dept_name='Development';

-------------------------------

-- List the frequency counts, in descending order, of all the employee 
-- last names (that is, how many employees share each last name)
--------------------------------
-- SELECT last_name,count(emp_no) 
-- FROM employees
-- Group by last_name
-- order by count(emp_no) DESC;


