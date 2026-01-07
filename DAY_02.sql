
--                                                    -         Aggregate Functions , COUNT, SUM, AVG, MIN, MAX, GROUP BY + HAVING         -




-- 1. How many employees are there in the employee_demographics table?

SELECT  COUNT(first_name) AS total_employees
FROM employee_demographics



-- 2. How many employees are there in the employee_salary table?

SELECT  COUNT(first_name) AS total_employees
FROM employee_salary



-- 3. What is the total salary of all employees?

SELECT SUM(SALARY) AS total_salary
FROM employee_salary



-- 4 Return the average salary (AVG) of all employees.

SELECT AVG(salary) AS average_salary
FROM employee_salary


-- 5.What is the minimum and maximum salary?

SELECT  MAX(salary) AS MAX_SALARIE,
		MIN (salary) AS MIN_SALARY
FROM employee_salary



-- 6. What is the minimum and maximum age?

SELECT MAX(AGE) AS oldest,
	   MIN(AGE) AS youngest
FROM employee_demographics



-- 7. How many employees are older than 40 years?
 
SELECT COUNT(*) AS employees_over_40
FROM employee_demographics
WHERE age > 40



--8. How many female employees are there in the employee_demographics table?

SELECT COUNT(*) AS total_females
FROM employee_demographics
WHERE gender = 'Female'



-- 9. What is the average age of male employees only?

SELECT AVG(age) AS avg_male_age
FROM employee_demographics
WHERE gender = 'Male'




-- 10. What is the total salary of employees who work in department 1 (dept_id = 1)?

SELECT SUM(SALARY) AS total_salary_dept1
FROM employee_salary
WHERE dept_id = 1





-- 11. What is the highest salary among female employees?

SELECT MAX(SALARY) AS max_female_salary
FROM employee_salary sal
  JOIN employee_demographics dem
  ON sal.employee_id = dem.employee_id
WHERE dem.gender = 'Female'




-- 12. How many employees were born after 1980?

SELECT COUNT(*) AS employees_after_1980
FROM employee_demographics
where birth_date > '1980-01-01'



-- 13. What is the average salary of employees whose salary is greater than 50,000?

SELECT AVG(salary)  AS avg_high_salary
FROM employee_salary
WHERE salary > 50000



-- 14. What is the minimum age of employees whose salary is less than 30,000?

SELECT MIN(age) AS youngest_low_salary
FROM employee_demographics dem
JOIN employee_salary sal
ON dem.employee_id = sal.employee_id
WHERE salary < 30000











----------------------------




select*
from employee_salary

SELECT *
FROM employee_demographics















































