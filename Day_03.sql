
--                                                                     JOINS (Inner, Left, Right...)


-- 1 Inner Join (all columns).

SELECT * 
FROM employee_demographics dem
INNER JOIN employee_salary sal
	  ON dem.employee_id = sal.employee_id


-- 2 Return employees' names + salaries.

SELECT dem.first_name, dem.last_name, sal.salary
FROM employee_demographics dem
INNER JOIN employee_salary sal
 	 ON dem.employee_id = sal.employee_id



-- 3 Left Join (all employees + salaries if available).

SELECT dem.first_name, dem.last_name, sal.salary
FROM employee_demographics dem
LEFT JOIN employee_salary sal
  	ON dem.employee_id = sal.employee_id



-- 4 Right Join (all salaries + employees if available).

SELECT dem.first_name, dem.last_name, sal.salary
FROM employee_demographics dem
RIGHT JOIN employee_salary sal
 	 ON dem.employee_id = sal.employee_id


-- 5 Return employees + department name.

SELECT sal.first_name , sal.last_name , dep.department_name
FROM employee_salary sal
JOIN parks_departments dep
	ON sal.dept_id = dep.department_id


select *
from parks_departments


-- 6 Return employees (dem) + salary + department name.

SELECT dem.first_name , dem.last_name , sal.salary , dep.department_name
FROM employee_demographics dem
JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
JOIN parks_departments dep
		ON sal.employee_id = dep.department_id



-- 7 Return employees’ names + salary + department name, but order them by salary in descending order.



SELECT dem.first_name , dem.last_name , sal.salary , dep.department_name
FROM employee_demographics dem
JOIN employee_salary sal
		ON dem.employee_id = sal.employee_id
JOIN parks_departments dep
		ON sal.employee_id = dep.department_id
	ORDER BY salary DESC



-- 8 Return employees (first_name, last_name) who don’t have a department (dept_id IS NULL).

SELECT*
FROM employee_salary
WHERE dept_id IS NULL



-- 9 Return employees (first_name, last_name) + their department name, including those without a department (use LEFT JOIN).

SELECT  sal.first_name, sal.last_name, dep.department_name
FROM employee_salary sal
LEFT JOIN parks_departments dep
  ON sal.dept_id = dep.department_id



-- 10 Return the highest salary (MAX(salary)) in each department (department_name) (use GROUP BY + JOIN).

SELECT dep.department_name ,
	   MAX(salary) AS max_salary
FROM employee_salary sal
JOIN parks_departments dep
		ON sal.employee_id = dep.department_id
	GROUP BY dep.department_name



-- 11 Return employees’ names (first_name, last_name) + department name, but only for employees who work in the "Finance" department.

SELECT sal.first_name , sal.last_name , dep.department_name
FROM employee_salary sal 
JOIN parks_departments dep
ON sal.employee_id = dep.department_id
WHERE dep.department_name = 'Finance'



-- (subqueries)
-- 12 Return employees (first_name, last_name) who work in the same department as "Leslie Knope" (dept_id).

SELECT first_name , last_name
FROM employee_salary
WHERE dept_id = 
			   ( SELECT dept_id
			   FROM employee_salary
			   WHERE FIRST_NAME = 'Leslie'
			   AND LAST_NAME = 'Knope')


-- 13 Return all employees (first_name, last_name) + salary + department name, but only for those with a salary less than
-- 50,000 OR whose department is "Healthcare".

SELECT sal.first_name, sal.last_name , sal.salary, dep.department_name
FROM employee_salary sal
JOIN parks_departments dep
		ON sal.dept_id = dep.department_id
WHERE salary < 50000 
OR department_name = 'Healthcare'


--14 Return all departments (department_name from parks_departments) and the number of employees (COUNT(employee_id))
-- working in them, including departments with zero employees (use LEFT JOIN).

SELECT dep.department_name ,
	   COUNT(employee_id)
FROM parks_departments dep
LEFT JOIN  employee_salary sal
		ON dep.department_id = sal.dept_id
  GROUP BY dep.department_name























SELECT*
FROM employee_demographics



SELECT*
FROM employee_salary




SELECT*
FROM parks_departments




























































