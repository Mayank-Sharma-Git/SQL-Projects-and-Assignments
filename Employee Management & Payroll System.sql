# Employee Management & Payroll System

CREATE DATABASE  Employee_Management_And_Payroll_System; 

USE Employee_Management_And_Payroll_System;


# 1. Write a query to create the employees table with proper constraints. 

CREATE TABLE departments(
dept_id VARCHAR(100) PRIMARY KEY NOT NULL,
dept_name VARCHAR(100) NOT NULL,
location VARCHAR(100) NOT NULL
);

INSERT INTO departments (dept_id,dept_name,location) VALUES 
('D01','HR','DELHI'),
('D02','FT','DELHI'),
('D03','MG','NOIDA'),
('D04','IT','NOIDA');

CREATE TABLE employees(
emp_id INT PRIMARY KEY UNIQUE AUTO_INCREMENT,
emp_name VARCHAR(100) NOT NULL,
email VARCHAR(100) NOT NULL,
phone VARCHAR(100) NOT NULL,
hire_date DATE NOT NULL,
status VARCHAR(100) NOT NULL,
dept_id VARCHAR(100),
FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
); 

INSERT INTO employees (emp_id, emp_name, email, phone, hire_date, status, dept_id) VALUES
('101', 'Rahul Sharma', 'rahul.sharma@email.com', '9876543210', '2022-03-15', 'Active',   'D01'),
('102', 'Priya Singh',  'priya.singh@email.com',  '9812345678', '2021-07-01', 'Active',   'D02'),
('103', 'Amit Verma',   'amit.verma@email.com',   '9845612345', '2020-11-20', 'Active',   'D01'),
('104', 'Sneha Gupta',  'sneha.gupta@email.com',  '9798765432', '2023-01-10', 'Inactive', 'D04'),
('105', 'Rohit Mehta',  'rohit.mehta@email.com',  '9765432109', '2024-06-25', 'Active',   'D02'),
('106', 'Neha Kapoor',  'neha.kapoor@email.com',  '9712345678', '2023-05-15', 'Active',   'D03'),
('107', 'Vikas Yadav',  'vikas.yadav@email.com',  '9798123456', '2022-08-20', 'Active',   'D04'),
('108', 'Pooja Tiwari', 'pooja.tiwari@email.com', '9756781234', '2021-03-10', 'Active',   'D03'),
('109', 'Arjun Nair',   'arjun.nair@email.com',   '9734567890', '2023-11-01', 'Active',   NULL),
('110', 'Simran Kaur',  'simran.kaur@email.com',  '9778901234', '2024-02-14', 'Active',   NULL);



CREATE TABLE attendence(
att_id VARCHAR(100) PRIMARY KEY NOT NULL,
att_date DATE NOT NULL,
status VARCHAR(100) NOT NULL,
emp_id INT NOT NULL,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id) 
);

INSERT INTO attendence (att_id, att_date, status, emp_id) VALUES
('A01', '2024-01-10', 'Present', 101),
('A02', '2024-01-10', 'Absent',  102),
('A03', '2024-01-11', 'Present', 103),
('A04', '2024-01-11', 'Present', 101),
('A05', '2024-01-12', 'Absent',  103),
('A06', '2024-01-12', 'Present', 105),
('A07', '2024-02-01', 'Present', 106),
('A08', '2024-02-01', 'Absent',  107),
('A09', '2024-02-02', 'Present', 108),
('A10', '2024-02-02', 'Absent',  101),
('A11', '2024-02-03', 'Absent',  102),
('A12', '2024-02-03', 'Present', 103),
('A13', '2024-03-01', 'Absent',  101),
('A14', '2024-03-01', 'Present', 105),
('A15', '2024-03-02', 'Absent',  106),
('A16', '2024-03-02', 'Present', 107),
('A17', '2024-03-03', 'Absent',  101),
('A18', '2024-03-03', 'Present', 108),
('A19', '2024-03-04', 'Absent',  101),
('A20', '2024-03-04', 'Present', 102);

CREATE TABLE salary(
sal_id INT PRIMARY KEY UNIQUE NOT NULL AUTO_INCREMENT,
basic VARCHAR(100) NOT NULL,
hra VARCHAR(100) NOT NULL,
bonus VARCHAR(100) NOT NULL, 
emp_id INT NOT NULL UNIQUE,
FOREIGN KEY (emp_id) REFERENCES employees(emp_id)
);

INSERT INTO salary (basic, hra, bonus, emp_id) VALUES
(30000, 5000,  2000, 101),
(45000, 8000,  3000, 102),
(25000, 4000,  1500, 103),
(60000, 12000, 6000, 105),
(35000, 6000,  2500, 106),
(40000, 7000,  3000, 107),
(28000, 4500,  2000, 108);

CREATE TABLE users(
user_id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
username VARCHAR(100) NOT NULL,
password VARCHAR(100) NOT NULL
);

INSERT INTO users (username, password) VALUES
('hr_admin',     'hr@1234'),
('finance_user', 'fin@1234'),
('it_admin',     'it@1234'),
('manager',      'mgr@1234'),
('viewer',       'view@1234');



CREATE TABLE roles(
role_id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,
role_name VARCHAR(100) NOT NULL
);

INSERT INTO roles (role_name) VALUES
('HR'),
('Finance'),
('Admin'),
('Manager'),
('Viewer');



CREATE TABLE USER_ROLES(
role_id INT NOT NULL,
user_id INT NOT NULL,
FOREIGN KEY (role_id) REFERENCES roles(role_id),
FOREIGN KEY (user_id) REFERENCES users(user_id) 
);

INSERT INTO USER_ROLES (role_id, user_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(1, 3);

# 2. Insert 5 employee records into the employees table.
INSERT INTO employees (emp_id,emp_name, email, phone, hire_date, status, dept_id) VALUES
('111','Rahul Sharma',   'rahul.sharma@email.com',  '98765432101', '2022-03-15', 'Active','D01'),
('112','Priya Singh',    'priya.singh@email.com',   '98123456781', '2021-07-01', 'Active','D01'),
('113','Amit Verma',     'amit.verma@email.com',    '98456123451', '2020-11-20', 'Active','D01'),
('114','Sneha Gupta',    'sneha.gupta@email.com',   '97987654321', '2023-01-10', 'Inactive','D04'),
('115','Rohit Mehta',    'rohit.mehta@email.com',   '97654321091', '2024-06-25', 'Active','D01');

# 3. Display all employees. 

SELECT * FROM employees;

# 4. Display only employee names and email IDs. 

 SELECT emp_name,email FROM employees;
 
 # 5. Find employees whose status is Active. 
 
 SELECT * FROM employees WHERE status = 'Active';

 # 6. Display employees who joined after 2024-01-01.  

 SELECT * FROM employees WHERE hire_date > '2024-01-01';
 
 # 7. Rename the column phone to mobile_no. 
 
 ALTER TABLE employees RENAME COLUMN phone TO mobile_no;

 # 8. Delete employees whose status is Inactive.
 
 SET sql_safe_updates = 0;
 DELETE FROM employees WHERE status = 'Inactive';
 SET sql_safe_updates = 1;
 
 # 9. Display employee name along with department name. 
 
 SELECT emp_name,dept_name FROM employees e
 JOIN departments d
 ON d.dept_id = e.dept_id; 
 
 # 10. Find the number of employees in each department. 
 
 SELECT dept_name, count(emp_id) FROM employees e
 JOIN departments d
 ON d.dept_id = e.dept_id
 GROUP BY dept_name;
 
 # 11. Display departments having more than 2 employees. 
 
 SELECT dept_name, COUNT(emp_id) AS Total_Number_Of_Employees FROM employees e
 JOIN departments d
 ON d.dept_id = e.dept_id
 GROUP BY dept_name 
 having COUNT(emp_id) > 2 ;
 
 # 12. Find employees who do not belong to any department. 
 
SELECT emp_name FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id
Where d.dept_id IS NUll;

# 13. Display employees who do not have salary records. 

SELECT emp_name FROM employees e
LEFT JOIN salary s
ON s.emp_id = e.emp_id
WHERE s.basic IS NULL;

# 14. Calculate total salary (basic + hra + bonus) for each employee. 

SELECT emp_name, s.basic + s.hra + s.bonus AS Total_Salary FROM employees e
JOIN salary s
ON s.emp_id = e.emp_id;

# 15. Find the highest paid employee. 

SELECT emp_name, s.basic + s.hra + s.bonus AS Total_Salary FROM employees e
 JOIN salary s
 ON s.emp_id = e.emp_id
 ORDER BY Total_Salary DESC
 LIMIT 1;
 

# 16. Display employees who were absent at least once.

 SELECT DISTINCT emp_name FROM employees e
 JOIN attendence a
 ON e.emp_id = a.emp_id
 WHERE a.status ='Absent';
 
 # 17. Find employees earning more than the average salary. 
 
 
 SELECT emp_name, s.basic + s.hra + s.bonus AS _Salary_ FROM employees e
 JOIN salary s
 ON e.emp_id = s.emp_id
 WHERE s.basic + s.hra + s.bonus >
	(SELECT AVG(basic + hra + bonus) FROM Salary);
    
# 18. Display employees who earn the maximum salary. 

SELECT emp_name, s.basic + s.hra + s.bonus AS _Salary_ FROM employees e
 JOIN salary s
 ON e.emp_id = s.emp_id
 WHERE s.basic + s.hra + s.bonus =
	(SELECT MAX(basic + hra + bonus) FROM salary);
    
# 19. Find departments where the average salary is greater than 40,000. 

SELECT dept_name, AVG(s.basic + s.hra + s.bonus) AS AVG_Salary FROM departments d
JOIN employees e ON e.dept_id = d.dept_id
JOIN salary s ON e.emp_id = s.emp_id
GROUP BY dept_name Having AVG(s.basic + s.hra + s.bonus) >
	(SELECT 40000);
    
# 20. Display employees who have never taken leave. 

SELECT emp_name FROM employees
WHERE emp_id NOT IN (
	SELECT emp_id FROM attendence
	WHERE status ='Absent'
    );
    
# 21. Find employees who joined before the oldest attendance record.
    
    SELECT emp_name FROM employees e
    WHERE hire_date > (
		SELECT att_date FROM attendence
        ORDER BY att_date ASC
        LIMIT 1
	);
        
# 22. Write a stored procedure to fetch employees by department ID. 

DELIMITER $$
CREATE PROCEDURE Fetch_emp()
BEGIN 
	SELECT emp_name,emp_id,dept_name, d.dept_id FROM employees e 
	LEFT Join departments d
	ON e.dept_id = d.dept_id;
END $$
DELIMITER ;

# 23. Write a stored procedure to insert a new employee.

DELIMITER $$
CREATE PROCEDURE insert_emp(
	IN p_emp_id INT,
	IN p_emp_name VARCHAR(100),
	IN p_email VARCHAR(100),
	IN p_phone VARCHAR(100),
	IN p_hire_date DATE,
	IN p_status VARCHAR(100),
	IN p_dept_id VARCHAR(100))
    
BEGIN
 INSERT INTO employees values (p_emp_id,p_emp_name,p_email,p_phone,p_hire_date,p_status,p_dept_id);
END $$
DELIMITER ;

# 24. Create a function to calculate total salary.

DELIMITER $$
CREATE FUNCTION tot_sal(
	p_basic DECIMAL(10,2),
    p_hra DECIMAL(10,2),
    p_bonus DECIMAL(10,2))
RETURNS DECIMAL(10,2)
DETERMINISTIC  
BEGIN
	RETURN p_basic + p_hra + p_bonus;
END $$
DELIMITER ;

# 25. Call the function inside a SELECT query.

DELIMITER $$
CREATE FUNCTION emp_sal(
	p_basic DECIMAL(10,2),
    p_hra DECIMAL(10,2),
    p_bonus DECIMAL(10,2))
    
RETURNS DECIMAL(10,2)
DETERMINISTIC 
BEGIN
	RETURN (p_basic + p_hra + p_bonus);
END $$
DELIMITER ;

SELECT emp_name, emp_sal(s.basic,s.hra,s.bonus) AS total_sal FROM employees e 
JOIN salary s 
ON e.emp_id = s.emp_id;

# 26. Write a procedure to update employee status. 

DELIMITER $$
CREATE PROCEDURE stat_up(
		IN p_emp_id INT,
        IN p_status VARCHAR(100))
BEGIN
	UPDATE employees SET status = p_status 
    WHERE emp_id = p_emp_id;
END $$
DELIMITER ;

# 27. Create a trigger to prevent salary insertion below 10,000.

DELIMITER $$
CREATE TRIGGER MINSAL
BEFORE INSERT
ON salary
FOR EACH ROW
BEGIN
	IF NEW.basic < 10000 THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = ' INSERTED SALARY IS TOO LOW';
	END IF;
END $$
DELIMITER ;	

# 28. Create a trigger to log deleted employee records. 


CREATE TABLE emp_log(
emp_log_ID INT PRIMARY KEY AUTO_INCREMENT,
emp_id INT NOT NULL,
emp_name VARCHAR(100) NOT NULL,
deleted_at DATETIME,
action VARCHAR(100));

DELIMITER $$
CREATE TRIGGER DELEMP
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
	INSERT INTO emp_log(emp_id,emp_name,deleted_at,action)
    VALUES(OLD.emp_id, OLD.emp_name,NOW(),'DELETED');
END $$
DELIMITER ;

# 29. Create a trigger to auto-update status when employee is deleted.

DELIMITER $$
CREATE TRIGGER AUTO_UPD
BEFORE DELETE ON employees
FOR EACH ROW
BEGIN
	INSERT employees(emp_id,emp_name,email,mobile_no,hire_date,action,dept_id)
    VALUES(OLD.emp_id,OLD.emp_name,OLD.email,OLD.mobile_no,OLD.hire_date,'DELETED',OLD.dept_id);
END $$
DELIMITER ;

# 30. Create a trigger to prevent duplicate email insertion. 

DELIMITER $$
CREATE TRIGGER DUPEMAIL
BEFORE INSERT ON employees
FOR EACH ROW 
BEGIN
	IF EXISTS (SELECT 1 FROM employees WHERE NEW.email = email) THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT ='EMAIL ALREADY EXISTS';
	END IF;
END $$
DELIMITER ;

# 31. Write a transaction to insert employee and salary together.

START TRANSACTION;

INSERT INTO employees values('116','Rahul Goal',  'rahul.goal@email.com',  '98765433201', '2022-03-6','Active','D01');
INSERT INTO salary values(116,30000, 5000, 2000, 116);
COMMIT;

# 32. Rollback the transaction if salary insert fails. 

START TRANSACTION;
INSERT INTO employees values('118','Rahul Goals',  'rahul.goals@email.com',  '98765422201', '2022-03-11','Active','D01');
INSERT INTO salary values(118,50000, 5000, 2000, 118);
ROLLBACK;
COMMIT;

# 33. Demonstrate SAVEPOINT usage.

START TRANSACTION;
INSERT INTO employees values('119','Rahuls Goals',  'rahuls.goals@email.com',  '98765222201', '2022-03-10','Active','D01'); 
SAVEPOINT emp_save;
INSERT INTO salary values(119,50000, 5000, 2000, 119);
ROLLBACK TO emp_save;

---------------------------------------------------------------------------------------------------------------------------------------------
# 34. Explain what happens if COMMIT is not executed.

/*
 START TRANSACTION;
 INSERT INTO employees values('120','Rahul Goals',  'rahul.goals@mail.com',  '98762422201', '2022-03-11','Active','D01');
 INSERT INTO salary values(120,40000, 5000, 2000, 120);

 So as i didn't COMMIT yet, The Inserted values are temprarily stored in employees and salary tables. Values cannot be permanently inserted until we execute COMMIT querry.

 If COMMIT is not executed in a transaction:

 1. TEMPORARY DATA — all changes exist only in current session, other users cannot see them.
 2. AUTO ROLLBACK — if connection closes, session ends, or MySQL crashes, all changes are automatically undone.
 3. DATABASE UNCHANGED — database returns to exact state before START TRANSACTION was called.
 4. NO PERMANENT EFFECT — INSERT, UPDATE, DELETE inside transaction have zero effect without COMMIT.
*/

---------------------------------------------------------------------------------------------------------------------------------------------

# 35. Create a view for HR showing employee & department details.

CREATE VIEW hr_view AS
SELECT emp_id,emp_name,email,mobile_no,hire_date,status,dept_name,location FROM employees e
JOIN departments d
ON e.dept_id = d.dept_id;
SELECT * FROM hr_view;

# 36. Create a view to show monthly payroll report.

CREATE VIEW payroll_view AS
SELECT e.emp_id,e.emp_name,e.email,e.mobile_no,d.dept_id,d.dept_name,s.basic,s.hra,s.bonus, s.basic + s.hra + s.basic AS Total_Salary FROM employees e
JOIN departments d 
ON d.dept_id = e.dept_id
JOIN salary s
ON s.emp_id = s.emp_id;

SELECT * FROM payroll_view;

# 37. Create an index on employee name.

CREATE INDEX ind_empname ON employees(emp_name);

---------------------------------------------------------------------------------------------------------------------------------------------
# 38. Identify which columns should be indexed and why. 
/*
In the Employee Management & Payroll System, the following 
columns should be indexed:

 1. employees.emp_name
   Employees are frequently searched by name in HR queries. Adding an index speeds up WHERE and ORDER BY operations on this column significantly.

 2. employees.dept_id (Foreign Key)
   This column is used in every JOIN between employees and departments table. Indexing foreign keys is a best practice as it            dramatically speeds up JOIN operations.

 3. employees.status
    HR frequently filters employees by status (Active/Inactive). Indexing this column improves performance of such filters.

 4. salary.emp_id (Foreign Key)
    Every payroll report joins salary with employees using this column. Indexing it ensures payroll queries run efficiently even with thousands of records.

 5. attendence.emp_id (Foreign Key)
    Attendance reports frequently filter by employee. Indexing this foreign key speeds up attendance tracking queries.
*/
   ---------------------------------------------------------------------------------------------------------------------------------------------

# 39. Drop an index and explain the impact. 

DROP INDEX ind_empname ON employees;
/*
 After dropping ind_empname index:
 - Queries searching by emp_name now do full table scan
 - Performance degrades with larger data
 - No structural damage, just slower queries
*/
# 40. Find employees who joined in the last 12 months. 

SELECT emp_name, hire_date FROM employees
WHERE hire_date > DATE_SUB(CURDATE(), INTERVAL 12 MONTH);

# 41. Calculate employee experience in years. 

SELECT emp_name, Hire_date,
 TIMESTAMPDIFF(YEAR,Hire_date, CURDATE()) AS exp
 FROM employees e;

# 42. Display attendance count per month. 

SELECT YEAR(att_date), MONTH(att_date), COUNT(*) AS att_count FROM attendence
GROUP BY YEAR(att_date), MONTH(att_date); 

# 43. Find employees absent more than 3 days in a month. 

SELECT e.emp_name, MONTH(att_date) AS MONTH, COUNT(*) AS ABS_days FROM attendence a
JOIN employees e
ON a.emp_id = e.emp_id
WHERE a.status = 'Absent'
GROUP BY e.emp_name , MONTH(att_date), YEAR(att_date)
HAVING COUNT(*) > 3;

# 44. Use EXPLAIN to analyze a join query.

EXPLAIN SELECT emp_name,dept_name FROM employees e
JOIN departments d
ON d.dept_id = e.dept_id;

# 45. Rewrite a slow query using indexes. 


EXPLAIN SELECT * FROM employees WHERE emp_name = 'Rahul Sharma';
CREATE INDEX empname ON employees(emp_name);
EXPLAIN SELECT * FROM employees WHERE emp_name = 'Rahul Sharma';
DROP INDEX empname On employees;

---------------------------------------------------------------------------------------------------------------------------------------------
# 46. Difference between clustered and non-clustered indexes (MySQL context).
/*
 CLUSTERED INDEX:
 - Physically sorts and stores table data based on the index
 - Only ONE clustered index per table
 - In MySQL, PRIMARY KEY is always the clustered index
 - Data rows are stored in the same order as the index
 - Faster for range queries and primary key lookups

 NON-CLUSTERED INDEX:
 - Separate structure that points to actual data
 - Multiple non-clustered indexes allowed per table
 - Contains index key + pointer to actual row
 - Slightly slower than clustered (two lookups needed)
 - Like a book index pointing to page numbers
*/
---------------------------------------------------------------------------------------------------------------------------------------------

---------------------------------------------------------------------------------------------------------------------------------------------

# 47. When should you avoid indexes? 
/*
 Avoid indexes when:
  1. small tables
    → scanning 10 rows is already instant
    → index would actually be slower!

 2. columns you update constantly
    → like status, attendance
    → every update = index update = double work

3. columns with few unique values
   → like status = 'Active'/'Inactive' only 2 options
   → index on this is useless, still scans half the table

4. tables with lots of INSERT/DELETE
   → like attendance table getting daily entries
   → index maintenance slows down inserts

5. columns never used in WHERE/JOIN
   → index nobody uses = wasted storage
*/

# 48. Create a user for HR with read-only access. 

CREATE USER 'HR'@'LOCALHOST' IDENTIFIED BY 'HR_readOnly';
GRANT SELECT ON employee_management_and_payroll_system.* TO 'HR'@'LOCALHOST';

# 49. Grant INSERT permission only on attendance table. 

GRANT INSERT ON employee_management_and_payroll_system.attendence TO 'HR'@'LOCALHOST';

# 50. Revoke DELETE permission from a user. 

CREATE USER 'IThead'@'LOCALHOST' IDENTIFIED BY 'IT_HEAD';
GRANT DELETE ON employee_management_and_payroll_system.* TO 'IThead'@'LOCALHOST';
REVOKE DELETE ON employee_management_and_payroll_system.* FROM 'IThead'@'LOCALHOST';

# 51. What happens if department is deleted but employees exist? 

/*
MySQL throws Error 1451 and blocks the deletion because
employees.dept_id references departments.dept_id via foreign key.
To fix, reassign employees to another department first,
then delete the department.
*/

# 52. How will you ensure salary consistency during payroll run? 

/*
Use TRANSACTIONS to ensure all salary updates either
complete fully or rollback entirely if anything fails.
This prevents partial updates where some employees
get paid and others don't.
*/

# 53. How will you handle partial failure in payroll processing? 

/*
Use SAVEPOINTS inside a transaction so if one salary
update fails, we rollback only to the last savepoint
instead of losing all progress.
*/

# 54. Explain ACID properties using this project. 

/*
A - ATOMICITY
    Either all operations complete or none do.
    Example: inserting employee + salary together in Question 31,
    if salary insert fails, employee insert also rolls back.

C - CONSISTENCY
    Database stays valid before and after transaction.
    Example: emp_id in salary must always exist in employees,
    foreign key constraints enforce this automatically.

I - ISOLATION
    Concurrent transactions don't interfere with each other.
    Example: two HR users processing payroll simultaneously
    won't overwrite each other's salary updates.

D - DURABILITY
    Once committed, data is permanently saved even if
    MySQL crashes or server restarts.
    Example: after COMMIT in payroll transaction, all
    salary updates are permanently saved to disk.
    */
    
    # 55. How will you design audit logging for salary changes? 
    
    /*
    Create a salary_log table to track every change made
to salary records, including old and new values,
who changed it and when. Use an AFTER UPDATE trigger
to automatically log every salary change.


step 1: create log table
CREATE TABLE salary_log(
    log_id INT PRIMARY KEY AUTO_INCREMENT,
    emp_id INT,
    old_basic DECIMAL(10,2),
    new_basic DECIMAL(10,2),
    changed_at DATETIME,
    action VARCHAR(100));

step 2: create trigger to auto log changes
DELIMITER $$
CREATE TRIGGER log_salary_change
AFTER UPDATE ON salary
FOR EACH ROW
BEGIN
    INSERT INTO salary_log(emp_id, old_basic, new_basic, changed_at, action)
    VALUES(OLD.emp_id, OLD.basic, NEW.basic, NOW(), 'SALARY UPDATED');
END$$
DELIMITER ;

step 3: test it
UPDATE salary SET basic = 99000 WHERE emp_id = 101;

step 4: check log
SELECT * FROM salary_log;
*/

/* 56. Write a single query to display: 
• Employee Name 
• Department 
• Total Salary 
• Attendance Count 
*/

SELECT e.emp_name, d.dept_name, s.basic + s.hra +s.bonus AS Total_salary, COUNT(a.att_id) AS att_count FROM attendence a
JOIN employees e
ON e.emp_id = a.emp_id
JOIN departments d
ON d.dept_id = e.dept_id
JOIN salary s
ON s.emp_id = e.emp_id
GROUP BY e.emp_name, d.dept_name, s.basic + s.hra + s.bonus;

# 57. Write a query to rank employees based on salary (without window functions). 

SELECT e.emp_name, s.basic + s.hra + s.bonus AS Total_salary,
	( SELECT COUNT(*) FROM salary s2 
    WHERE (s2.basic + s2.hra + s2.bonus) > (s.basic + s.hra + s.bonus)) + 1 AS sal_rank 
FROM employees e
JOIN salary s
ON s.emp_id = e.emp_id
ORDER BY sal_rank;

# 58. Find the top 2 highest paid employees in each department.

SELECT * FROM(
	SELECT  e.emp_name,  d.dept_name, (s.basic + s.hra + s.bonus) AS Total_Salary ,
		( SELECT COUNT(*) 
		FROM salary s2
		JOIN employees e2 ON e2.emp_id =  s2.emp_id
		WHERE (s2.basic + s2.hra + s2.bonus) > (s.basic + s.hra + s.bonus) 
		AND e2.dept_id = e.dept_id)
		+ 1 AS sal_rank
	FROM employees e 
	JOIN salary s
	ON e.emp_id = s.emp_id
	JOIN departments d
	ON d.dept_id = e.dept_id) AS ranked
WHERE sal_rank <=2 
ORDER BY dept_name, sal_rank;













