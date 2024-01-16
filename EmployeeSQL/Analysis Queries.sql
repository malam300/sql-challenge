-- Confirming Data Query all from each table
Select * from public."Departments";
Select * from public."Titles";
Select * from public."Employees";
Select * from public."Dept_emp";
Select * from public."Dept_manager";
Select * from public."Salaries"

-- Q1) List the employee number, last name, first name, sex, and salary of each employee.
Select emp.emp_no,last_name,first_name,sex,salary 
from public."Employees" as emp
join public."Salaries" as sal
on emp.emp_no = sal.emp_no

-- Q2) List the first name, last name, and hire date for the employees who were hired in 1986.
Select first_name,last_name,hire_date
from public."Employees"
where EXTRACT(YEAR FROM hire_date) = 1986

-- Q3) List the manager of each department along with their department number, department name, employee number, last name, and first name.
Select dept_manager.emp_no,dept_manager.dept_no,departments.dept_name,employees.first_name,employees.last_name,titles.title
from dept_manager
inner join departments
on dept_manager.dept_no = departments.dept_no
inner join employees
on employees.emp_no = dept_manager.emp_no
inner join titles
on titles.title_id = employees.emp_title_id

-- Q4) List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
Select employees.emp_no,
employees.first_name,
employees.last_name,
dept_no.dept_no,
departments.dept_name
FROM public. "Employees"
INNER JOIN dept_no
on dept_no.emp_no = employees.emp_no
INNER Join departments
on departments.dept_no = dept_no.dept_no

-- Q5) List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
Select first_name, last_name, sex
from public."Employees"
where first_name = 'Hercules'
and last_name like 'B%'

-- Q6) List each employee in the Sales department, including their employee number, last name, and first name.
Select Department.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from public."Departments" as dept, public."Department_Employees" as dept_emp, public."Employees" as emp
where dep.dept_no = dept_emp.dept_no
and dep_emp.emp_no = emp.emp_no
and dep.dept_name = 'Sales'

-- Q7) List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
Select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from public."Departments" as dep
join public."Department_Employees" as dep_emp
on dep.dept_no = dept_emp.dept_no
join public."Employees" as emp 
on dept_emp.emp_no = emp.emp_no
where (dept.dept_name = 'Sales' OR dept.dept_name = 'Development')

-- Q8) List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).
Select last_name, count(*) as frequency_counts
from public."Employees"
group by last_name
order by frequency_counts desc

