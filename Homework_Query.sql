
--Query Files
--1.)List the following details of each employee: employee number, last name, first name, sex, and salary.
select * from "Employees";

SELECT emp."emp_no", emp."last_name", emp."first_name", emp."sex", sal."salary"
FROM "Employees" AS emp
LEFT JOIN "Salaries" AS sal
ON emp."emp_no" = sal."emp_no";


-- 2.) List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp."first_name", emp."last_name", emp."hire_date" FROM "Employees" AS emp
WHERE "hire_date" BETWEEN '1986-01-01' AND '1986-12-31';

-- 3.)List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.
--tables to use = deptartments, employees, dept_managers
SELECT dep."dept_no", dep."dept_name", man."emp_no", emp."last_name", emp."first_name"
FROM "Dept_manager" AS man
LEFT JOIN "Departments" AS dep
ON man."dept_no" = dep."dept_no"
LEFT JOIN "Employees" AS emp
ON man."emp_no" = emp."emp_no"; 

--4.) List the department of each employee with the following information: employee number, last name, first name, and department name. [inner join]
--Join employees, departments and dept_emp table...but only show the info from the employee and department table while joining from all three.
SELECT emp."last_name", emp."first_name", emp."emp_no", dep."dept_name"
FROM "Employees" AS emp
INNER JOIN "Dept_emp" AS demp
ON demp."emp_no" = emp."emp_no"
INNER JOIN "Departments" AS dep
ON demp."dept_no" = dep."dept_no";

--5.) List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B." [inner join]
SELECT emp."first_name", emp."last_name", emp."sex" FROM "Employees" AS emp
WHERE "first_name" = 'Hercules'
AND "last_name" LIKE 'B%' ;

--6.) List all employees in the Sales department, including their employee number, last name, first name, and department name. [where statementt/conditional]
SELECT emp."emp_no", emp."last_name", emp."first_name", dep."dept_name"
FROM "Employees" AS emp
INNER JOIN "Dept_emp" AS demp
ON demp."emp_no" = emp."emp_no"
INNER JOIN "Departments" AS dep
ON demp."dept_no" = dep."dept_no"
WHERE "dept_name" = 'Sales';

--7.) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name. [where statementt/conditional]
SELECT emp."emp_no", emp."last_name", emp."first_name", dep."dept_name"
FROM "Employees" AS emp
INNER JOIN "Dept_emp" AS demp
ON demp."emp_no" = emp."emp_no"
INNER JOIN "Departments" AS dep
ON demp."dept_no" = dep."dept_no"
WHERE "dept_name" = 'Sales'
OR "dept_name" = 'Development';

--8.) In descending order, list the frequency count of employee last names, i.e., how many employees share each last name. [group by] 
select emp."last_name", COUNT(*)
FROM "Employees" AS emp
Group BY "last_name"
Order By ("count") DESC;
