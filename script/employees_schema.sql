CREATE TABLE departments (
	dept_no VARCHAR (30) PRIMARY KEY,
	dept_name VARCHAR (255) NOT NULL
	);
	

CREATE TABLE titles (
	title_id VARCHAR(30) PRIMARY KEY,
	title VARCHAR (255) NOT NULL
	);
	
CREATE TYPE sex_type AS ENUM('M', 'F');
CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	emp_title_id VARCHAR(30) NOT NULL,
	birth_date Date NOT NULL,
	first_name VARCHAR (255) NOT NULL,
	last_name VARCHAR (255) NOT NULL,
	sex sex_type NOT NULL,
	hire_date Date NOT NULL,
	CONSTRAINT fk_title
      FOREIGN KEY(emp_title_id) 
	  REFERENCES titles(title_id)
	);
	
CREATE TABLE dept_emp (
	emp_no INT ,
	dept_no VARCHAR (30),
	PRIMARY KEY(emp_no,dept_no ),
	CONSTRAINT fk_employee
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no),
	CONSTRAINT fk_dept
      FOREIGN KEY(dept_no) 
	  REFERENCES departments(dept_no)
	);
	
CREATE TABLE dept_manager (
	dept_no VARCHAR (30) ,
	emp_no INT,
	PRIMARY KEY(dept_no,emp_no ),
	CONSTRAINT fk_employee
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no),
	CONSTRAINT fk_dept
      FOREIGN KEY(dept_no) 
	  REFERENCES departments(dept_no)
	);
	
CREATE TABLE salaries (
	emp_no INT PRIMARY KEY,
	salary INT NOT NULL,
	CONSTRAINT fk_employee
      FOREIGN KEY(emp_no) 
	  REFERENCES employees(emp_no)
	);