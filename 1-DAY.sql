


-- 1. Return all columns from the employee_demographics table.

SELECT *
FROM employee_demographics



--2. Return only first_name, last_name, and age from the employee_demographics table.

SELECT first_name, last_name, age
FROM employee_demographics




--3. Return the employees whose age is greater than 40.

SELECT *
FROM employee_demographics
WHERE age > 40



-- 4. Return only the female employees (gender = 'Female').

SELECT *
FROM employee_demographics
WHERE gender = 'Female'




-- 5. Return the employees whose salary is greater than 60,000 from the employee_salary table.

SELECT *
FROM employee_salary
WHERE salary > 60000



-- 6.Sort the employees by salary in descending order.

SELECT *
FROM employee_salary
ORDER BY salary DESC




-- 7. Return the top 3 employees with the highest salary.

SELECT *
FROM employee_salary
ORDER BY salary desc
LIMIT 3 




-- 8. Display all employees from the employee_salary table who don’t have a dept_id (i.e., NULL).

SELECT *
FROM employee_salary
where dept_id IS NULL





-- 9. Display the names and ages of employees from the employee_demographics table whose ages are between 30 and 40.

SELECT first_name , last_name , age 
FROM employee_demographics
WHERE age BETWEEN 30 AND 40





-- 10. Display the names of employees whose last names start with the letter "H".

SELECT first_name , last_name 
FROM employee_demographics
where last_name LIKE 'H%'





-- 11. Return the employees’ names (first_name, last_name) and their salary, 
-- but only for those whose salary is less than 60,000, and order them by salary in ascending order.

SELECT first_name , last_name , salary
FROM employee_salary
WHERE salary < 60000
ORDER BY salary 




-- 12. Return the names and ages of the 5 youngest employees (based on age).

SELECT first_name , last_name , age
FROM employee_demographics
ORDER BY age 
LIMIT 5




-- 13. Return the employees whose birth_date is after the year 1985.

SELECT first_name , last_name , age , birth_date	
FROM employee_demographics
WHERE birth_date > '1985-01-01'




-- 14. Return the employees' first_name and last_name but without duplicates (use DISTINCT).

SELECT DISTINCT first_name, last_name
FROM employee_demographics







