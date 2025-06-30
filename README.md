SQL Joins – Inner, Left, Right, and Full Join
Objective:
To understand and demonstrate how to merge data from multiple related tables using various SQL JOIN operations.

 Tools Used:
MySQL Workbench 

MySQL Database: employee_management_system

 Tables Used:
employees – Stores employee details

salary – Stores salary data

department – Stores department information

 JOIN Types :
1. INNER JOIN
Purpose: Fetches only the records that have matching values in both tables.

Query:

sql
Copy
Edit
SELECT e.emp_name, s.salary_amnt
FROM employees e
INNER JOIN salary s
ON e.emp_id = s.emp_id;
Explanation: Returns a list of employees who have a corresponding entry in the salary table.

2. LEFT JOIN
Purpose: Fetches all records from the left table (employees) and the matching records from the right table (department).

Query:

sql
Copy
Edit
SELECT e.emp_name, d.dept_name
FROM employees e
LEFT JOIN department d
ON e.emp_department_id = d.dept_id;
Explanation: Returns all employees, including those who don’t belong to any department (with NULL department).

3. RIGHT JOIN
Purpose: Fetches all records from the right table (department) and the matching records from the left table (employees).

Query:

sql
Copy
Edit
SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN department d
ON e.emp_department_id = d.dept_id;
Explanation: Returns all departments, including those without any employees assigned.

4. FULL OUTER JOIN 
Note:
 MySQL does not support FULL OUTER JOIN directly.

So, I used a combination of LEFT JOIN and RIGHT JOIN using UNION to simulate it.

Query:

sql
Copy
Edit
-- LEFT JOIN: All employees (even without department)
SELECT 
    e.emp_id,
    e.emp_name,
    e.emp_department_id,
    d.dept_name,
    d.location
FROM employees e
LEFT JOIN department d ON e.emp_department_id = d.dept_id

UNION

-- RIGHT JOIN: All departments (even without employees)
SELECT 
    e.emp_id,
    e.emp_name,
    e.emp_department_id,
    d.dept_name,
    d.location
FROM employees e
RIGHT JOIN department d ON e.emp_department_id = d.dept_id;
Explanation: This UNION gives the effect of a FULL OUTER JOIN by combining unmatched records from both tables.
