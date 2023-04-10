SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e 
JOIN salaries AS s
ON e.emp_no = s.emp_no;

SELECT first_name,last_name,hire_date
FROM employees
WHERE  hire_date <= '12/31/1986'::date
AND    hire_date   >= '01/01/1986'::date; 


--List the manager of each department along with their department number, 
--department name, employee number, last name, and first name.
SELECT dm.dept_no, dp.dept_name, emp.emp_no, emp.last_name, emp.first_name
FROM dept_manager AS dm 
JOIN departments dp
ON dm.dept_no = dp.dept_no
JOIN employees emp
ON emp.emp_no = dm.emp_no;


--List the department number for each employee along with that employee’s employee number,
--last name, first name, and department name.
SELECT d.dept_no, e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e 
JOIN dept_emp de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no;

--List the employee number, last name, first name, sex, and salary of each employee.
SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e 
JOIN salaries s
ON e.emp_no = s.emp_no;

--List first name, last name, and sex of each employee whose first name is
--Hercules and whose last name begins with the letter B.
SELECT first_name, last_name,sex 
FROM employees
WHERE first_name = 'Hercules'
	AND last_name LIKE 'B%' ;
	
	
--List each employee in the Sales department, 
--including their employee number, last name, and first name.
SELECT  e.emp_no, e.first_name, e.last_name
FROM employees AS e
JOIN dept_emp AS de
ON de.emp_no = e.emp_no
JOIN departments d
ON d.dept_no = de.dept_no
WHERE d.dept_name = 'Sales';


--List each employee in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.
SELECT  e.emp_no, e.first_name, e.last_name, d.dept_name
FROM employees AS e 
JOIN dept_emp AS de
ON e.emp_no = de.emp_no
JOIN departments AS d
ON d.dept_no = de.dept_no
WHERE d.dept_name IN ('Sales', 'Development');


--List the frequency counts, in descending order, 
--of all the employee last names (that is, how many employees share each last name).
SELECT last_name, count(emp_no) AS "frequency_counts"
FROM employees
GROUP BY last_name
ORDER BY frequency_counts DESC ;

