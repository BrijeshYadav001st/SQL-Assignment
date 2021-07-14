CREATE DATABASE incredible;

USE incredible;

CREATE TABLE employees(
emp_no INT(11) NOT NULL PRIMARY KEY,
birth_date DATE,
first_name VARCHAR(14),
last_name VARCHAR(16),
gender ENUM('M','F'),
hire_date DATE,
dept_no CHAR(4)
);

CREATE TABLE departments(
dept_no CHAR(4) NOT NULL PRIMARY KEY,
dept_name VARCHAR(40),
dept_id INT(11),
FOREIGN KEY(dept_id) REFERENCES employees(emp_no) ON DELETE SET NULL
);

ALTER TABLE employees
ADD FOREIGN KEY(dept_no)
REFERENCES departments(dept_no)
ON DELETE SET NULL;

CREATE TABLE dept_emp(
emp_no INT(11) NOT NULL,
dept_no CHAR(4) NOT NULL,
from_date DATE,
to_date DATE ,
PRIMARY KEY (emp_no,dept_no)
);


CREATE TABLE dept_manager(
emp_no INT(11) NOT NULL,
dept_no CHAR(4) NOT NULL,
from_date DATE,
to_date DATE,
PRIMARY KEY (emp_no,dept_no)
);


CREATE TABLE salaries(
emp_no INT(11) NOT NULL PRIMARY KEY,
salary INT(11),
from_date DATE,
to_date DATE
);

CREATE TABLE titles(
emp_no INT(11) NOT NULL PRIMARY KEY,
title VARCHAR(50),
from_date DATE ,
to_date DATE
);


SELECT * FROM employees;

INSERT INTO employees VALUES(101,'1999-02-10','Brijesh','Yadav','M','2019-07-01',NULL);

INSERT INTO departments VALUES('A1','CS',101);

UPDATE employees SET dept_no = 'A1' WHERE emp_no = 101;

INSERT INTO employees VALUES(102,'1999-08-02','Md','Sarmad','M','2019-07-02',NULL);

INSERT INTO departments VALUES('A2','IT',102);

UPDATE employees SET dept_no = 'A2' WHERE emp_no = 102;

INSERT INTO employees VALUES(103,'1999-03-10','Ishu','Ayush','M','2019-04-05','A1');

INSERT INTO employees VALUES(104,'1999-11-10','Aria','Joshi','F','2019-08-05',NULL);

INSERT INTO departments VALUES('A3','ME',104);

UPDATE employees SET dept_no = 'A3' WHERE emp_no = 104;

INSERT INTO employees VALUES(105,'1999-06-10','Sofia','','F','2019-04-05','A3');



SELECT * FROM departments;

INSERT INTO departments VALUES('A4','Civil',105);


SELECT * FROM dept_emp;

INSERT INTO dept_emp VALUES(101,'A1','2019-07-01','2020-09-01');
INSERT INTO dept_emp VALUES(102,'A2','2019-07-02','2021-05-03');
INSERT INTO dept_emp VALUES(103,'A1','2019-04-05','2021-06-08');
INSERT INTO dept_emp VALUES(105,'A3','2019-05-05','2021-02-05');
INSERT INTO dept_emp VALUES(106,'A6','2019-07-01','2021-07-02');


SELECT * FROM dept_manager;

INSERT INTO dept_manager VALUES(101,'A1','2019-07-01','2020-08-01');
INSERT INTO dept_manager VALUES(102,'A2','2019-07-02','2021-02-03');
INSERT INTO dept_manager VALUES(103,'A1','2019-04-05','2021-01-08');
INSERT INTO dept_manager VALUES(105,'A3','2019-05-05','2021-01-05');
INSERT INTO dept_manager VALUES(106,'A6','2019-07-01','2021-05-02');


SELECT * FROM salaries;

INSERT INTO salaries VALUES(101,20000,'2019-07-01','2020-09-01');
INSERT INTO salaries VALUES(102,30000,'2019-07-02','2021-05-03');
INSERT INTO salaries VALUES(103,15000,'2019-04-05','2021-06-08');
INSERT INTO salaries VALUES(104,34000,'2019-08-05','2021-02-05');
INSERT INTO salaries VALUES(106,28000,'2019-07-01','2021-07-02');


SELECT * FROM titles;

-- INSERT

INSERT INTO titles VALUES(101,'Software Engineer','2019-07-01','2020-09-01');
INSERT INTO titles VALUES(102,'Data Scientist','2019-07-02','2021-05-03');
INSERT INTO titles VALUES(103,'Project Head','2019-04-05','2021-06-08');
INSERT INTO titles VALUES(104,'Manager','2019-08-05','2021-02-05');
INSERT INTO titles VALUES(105,'Architect','2019-05-05','2021-02-05');

-- READ

SELECT * FROM titles;

-- UPDATE

UPDATE titles SET title = 'Data Analyst' WHERE emp_no = 103;

-- DELETE

DELETE FROM titles WHERE emp_no = 105;
