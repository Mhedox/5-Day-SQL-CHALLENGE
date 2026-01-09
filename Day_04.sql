
-- 1. Return employees whose salary is greater than the overall average salary.


SELECT first_name , last_name , salary
FROM employee_salary
WHERE salary > 
			(SELECT AVG(salary)
			 FROM employee_salary
			)



-- 2. Return employees whose age is greater than the average age.


SELECT first_name, last_name, age
FROM employee_demographics
WHERE age > (
    SELECT AVG(age)
    FROM employee_demographics
)


-- 3. Return the employee(s) with the highest salary.


SELECT first_name, last_name, salary
FROM employee_salary
WHERE salary = (
    SELECT MAX(salary)
    FROM employee_salary
)


-- 4. Return all employees and add an extra column showing the overall average salary.

SELECT first_name, last_name, salary,
       (SELECT AVG(salary) FROM employee_salary) AS avg_salary
FROM employee_salary



-- 5. Return employees whose salary is greater than the average salary in their own department 
--    (dept_id) (Correlated Subquery).


SELECT first_name, last_name, salary, dept_id
FROM employee_salary sal
WHERE salary > (
    SELECT AVG(salary)
    FROM employee_salary
    WHERE dept_id = sal.dept_id
)

-- 6. Use a CTE to calculate the average salary per department, then return the departments
--    where the average salary is greater than 60,000.

WITH avg_salary_per_dept AS
(SELECT dept_id , AVG(salary) AS avg_salary
 FROM employee_salary
 GROUP BY dept_id
)
SELECT dept_id , avg_salary
FROM avg_salary_per_dept
WHERE avg_salary > 60000


-- 7. Use a CTE to find the highest salary in each department, then return the employees who earn
--    that highest salary in their department.



WITH max_salary_per_dept AS (
    SELECT dept_id, MAX(salary) AS max_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT sal.first_name, sal.last_name, sal.salary, sal.dept_id
FROM employee_salary sal
JOIN max_salary_per_dept m
  ON sal.dept_id = m.dept_id AND sal.salary = m.max_salary


-- 8. Return employees who work in departments where the total salary is greater than 200,000.


SELECT first_name , last_name , dept_id , salary
FROM employee_salary
WHERE dept_id IN (
SELECT dept_id
FROM employee_salary
GROUP BY dept_id 
HAVING SUM(salary) > 200000
)

--9. Use a CTE to calculate the average salary for female employees only, then return the female
--   employees whose salary is greater than that average.


WITH female_avg_salary AS (
    SELECT AVG(salary) AS avg_salary
    FROM employee_salary sal
    JOIN employee_demographics dem
      ON sal.employee_id = dem.employee_id
    WHERE dem.gender = 'Female'
)
SELECT sal.first_name, sal.last_name, sal.salary
FROM employee_salary sal
JOIN employee_demographics dem
  ON sal.employee_id = dem.employee_id
WHERE dem.gender = 'Female'
  AND sal.salary > (SELECT avg_salary FROM female_avg_salary)


-- 10. Return employees whose salary is greater than the overall average salary but less than 70,000.

SELECT first_name , last_name , salary
FROM employee_salary
WHERE salary > (SELECT AVG(salary)
				FROM employee_salary
				)
AND salary < 70000

-- 11. Use a CTE to calculate the total salary per department, then return the departments where 
--     the total salary is between 100,000 and 200,000.

WITH total_salary_per_dept AS (
    SELECT dept_id, SUM(salary) AS total_salary
    FROM employee_salary
    GROUP BY dept_id
)
SELECT dept_id, total_salary
FROM total_salary_per_dept
WHERE total_salary BETWEEN 100000 AND 200000;

--12. Use a CTE to calculate the number of employees in each department (only those with a non-NULL dept_id),
--    then return the departments that have more than 2 employees.

WITH dept_employee_count AS (
    SELECT dept_id, COUNT(*) AS employee_count
    FROM employee_salary
    GROUP BY dept_id
)
SELECT dept_id, employee_count
FROM dept_employee_count
WHERE employee_count > 2

--13. Calculate the average salary per gender, then return the employees whose salary is greater than the average
--    salary of their gender.

WITH avg_salary_by_gender AS (
	SELECT AVG(salary) AS avg_salary ,
		   dem.gender
	FROM employee_salary sal
	JOIN employee_demographics dem
	ON dem.employee_id = sal.employee_id
	GROUP BY dem.gender)
SELECT sal.first_name ,sal.last_name , sal.salary, dem.gender
FROM employee_salary sal
JOIN employee_demographics dem
	ON dem.employee_id = sal.employee_id
JOIN avg_salary_by_gender av
    ON dem.gender = av.gender
WHERE sal.salary > av.avg_salary



--14. Return the number of employees in each department, ordered in descending order by employee count.

SELECT COUNT(*) AS employee_count,
	   dept_id
FROM employee_salary
WHERE dept_id IS NOT NULL
GROUP BY dept_id
ORDER BY employee_count DESC






































































SELECT *
FROM employee_salary 	

select *
from parks_departments

SELECT *
FROM  employee_demographics









