/*JOINS :
Inner Join -(Query used to retrieve employee details with salary)*/

SELECT e.emp_name, s.salary_amnt
FROM employees e
INNER JOIN salary s
ON e.emp_id = s.emp_id;

/*Left Join-(Query used to retrieve employees with department name)*/

SELECT e.emp_name,d.dept_name
FROM employees e
LEFT JOIN department d
ON e.emp_id = d.dept_id;

/*Right Join-(Query used to retrieve employees with department name)*/

SELECT e.emp_name, d.dept_name
FROM employees e
RIGHT JOIN department d
ON e.emp_id = d.dept_id;

-- LEFT JOIN: all employees, even if no matching department
SELECT 
    e.emp_id,
    e.emp_name,
    e.emp_department_id,
    d.dept_name,
    d.location
FROM 
    employees e
LEFT JOIN 
    department d ON e.emp_department_id = d.dept_id

UNION

-- RIGHT JOIN: all departments, even if no employee belongs to them
SELECT 
    e.emp_id,
    e.emp_name,
    e.emp_department_id,
    d.dept_name,
    d.location
FROM 
    employees e
RIGHT JOIN 
    department d ON e.emp_department_id = d.dept_id;
