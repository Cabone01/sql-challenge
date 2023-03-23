-- Data Analysis
-- Q1.
SELECT employee.employeeID, employee.lastName, employee.firstName, employee.sex, salaries.salary 
FROM employee
LEFT JOIN salaries
ON employee.employeeID = salaries.empID;

-- Q2.
SELECT firstName, lastName, hireDate
FROM employee
WHERE EXTRACT(YEAR FROM hireDate) = 1986;

-- Q3.
SELECT deptManager.deptID, departments.deptName, deptManager.managerID, employee.lastName, employee.firstName
FROM deptManager
LEFT JOIN departments
ON deptManager.deptID = departments.deptID
LEFT JOIN employee
ON deptManager.managerID = employee.employeeID;

-- Q4.
SELECT deptEmp.deptID, deptEmp.empID, emp.lastName, emp.firstName, dept.deptName
FROM deptEmployees AS deptEMP
LEFT JOIN employee AS emp
ON deptEmp.empID = emp.employeeID
LEFT JOIN departments AS dept
ON deptEMP.deptID = dept.deptID;

-- Q5.
SELECT firstName, lastName, sex
FROM employee
WHERE firstName LIKE 'Hercules' AND lastName LIKE 'B%';

-- Q6.
SELECT employeeID, lastName, firstName
FROM employee
LEFT JOIN deptEmployees
ON employee.employeeID = deptEmployees.empID
WHERE deptID LIKE 'd007';

-- Q7.
SELECT employeeID, lastName, firstName, deptName
FROM employee
LEFT JOIN deptEmployees AS dptEmp
ON employee.employeeID = dptEmp.empID
LEFT JOIN departments as dpt
ON dptEmp.deptID = dpt.deptID
WHERE dptEmp.deptID LIKE 'd007' OR dptEmp.deptID LIKE 'd005';

-- Q8.
SELECT lastName, COUNT(employee.lastName) AS Frequency
FROM employee
GROUP BY lastName
ORDER BY COUNT(lastName) DESC;