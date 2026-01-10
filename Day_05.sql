
--1. Return all employees along with the overall average salary.

SELECT first_name, last_name, salary,
       AVG(salary) OVER () AS avg_salary
FROM employee_salary



--2. Return employees along with the average salary of their department.

SELECT first_name , last_name , salary, dept_id ,
	AVG(salary) OVER(PARTITION BY dept_id) AS avg_salary
FROM employee_salary



--3. Assign a row number to employees ordered by salary from highest to lowest.

SELECT first_name , last_name, salary,
	ROW_NUMBER() OVER(ORDER BY salary DESC) AS RN
FROM employee_salary



--4. Rank employees by salary using RANK().

SELECT first_name, last_name, salary,
       RANK() OVER (ORDER BY salary DESC) AS rank_salary
FROM employee_salary



--5. Rank employees by salary using DENSE_RANK().

SELECT first_name, last_name, salary,
       DENSE_RANK() OVER (ORDER BY salary DESC) AS dense_rank_salary
FROM employee_salary



--6. Rank employees within each department based on salary.

SELECT first_name , last_name , salary, dept_id ,
	ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS RN
FROM employee_salary


--7. Return the highest salary in each department using a window function.

SELECT *
FROM (SELECT first_name , last_name , salary, dept_id ,
	  ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY salary DESC) AS RN
      FROM employee_salary)
WHERE RN = 1



--8. Return employees whose salary is greater than the average salary of their department.

SELECT *
FROM (SELECT first_name, last_name, salary, dept_id,
      AVG(salary) OVER (PARTITION BY dept_id) AS avg_dept_salary
      FROM employee_salary) 
WHERE salary > avg_dept_salary



--9. Return the total salary for each department (while keeping all employees visible).

SELECT first_name , last_name , salary ,dept_id , 
       SUM(salary) OVER(PARTITION BY dept_id) AS total_dept_salary
FROM employee_salary



--10. Return the number of employees in each department.

SELECT first_name , last_name , dept_id,
	  COUNT(*) OVER(PARTITION BY dept_id) AS dept_employee_count 
FROM employee_salary



--11. Rank employees by birth date (youngest first).

SELECT first_name, last_name, birth_date,
       ROW_NUMBER() OVER (ORDER BY birth_date DESC) AS rn
FROM employee_demographics 



--12. Return the youngest employee in each department.

SELECT *
FROM (SELECT dem.first_name , dem.last_name , dem.birth_date, dem.age, sal.dept_id,
	  ROW_NUMBER() OVER(PARTITION BY dept_id ORDER BY birth_date DESC) AS rn
	  FROM employee_salary sal
	  JOIN employee_demographics dem
	  ON sal.employee_id = dem.employee_id)
WHERE rn = 1



--13. Compare each employee’s salary with the highest salary in their department.

SELECT first_name, last_name, salary, dept_id,
       MAX(salary) OVER (PARTITION BY dept_id) AS max_dept_salary
FROM employee_salary



--14. Return the top 2 salaries in each department.

SELECT *
FROM (
    SELECT first_name, last_name, salary, dept_id,
           DENSE_RANK() OVER (PARTITION BY dept_id ORDER BY salary DESC) AS rnk
    FROM employee_salary
) 
WHERE rnk <= 2






































































