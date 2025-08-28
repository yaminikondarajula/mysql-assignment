CREATE DATABASE day2;
USE day2;

-- Create tables
CREATE TABLE department (
  deptid INT PRIMARY KEY,
  deptname VARCHAR(20)
);

CREATE TABLE employee (
  empid INT PRIMARY KEY,
  empname VARCHAR(20),
  salary INT,
  hire_date DATE,
  deptid INT,
  FOREIGN KEY (deptid) REFERENCES department(deptid)
);

-- Insert data
INSERT INTO department (deptid, deptname)
VALUES
  (1, 'HR'),
  (2, 'IT'),
  (3, 'Sales');

INSERT INTO employee (empid, empname, salary, hire_date, deptid)
VALUES
  (101, 'john', 50000, '2018-02-12', 1),
  (102, 'alice', 60000, '2019-07-10', 2),
  (103, 'bob', 55000, '2020-05-05', 1),
  (104, 'carol', 45000, '2017-09-20', 3);

-- Display employees whose name starts with 'A'
SELECT * FROM employee
WHERE empname LIKE 'a%';

-- Find employees whose salary is between 45000 and 60000
SELECT * FROM employee
WHERE salary BETWEEN 45000 AND 60000;

-- Show the department name of each employee
SELECT deptname, empname
FROM employee e
JOIN department d ON e.deptid = d.deptid;

-- Find the number of employees in each department
SELECT deptname, COUNT(empid)
FROM employee e
JOIN department d ON e.deptid = d.deptid
GROUP BY deptname;

-- Display all employees, including those without a department
SELECT empname, deptname
FROM employee e
LEFT JOIN department d ON e.deptid = d.deptid;


