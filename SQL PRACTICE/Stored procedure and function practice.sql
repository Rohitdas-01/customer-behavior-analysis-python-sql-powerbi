-- Practice Scalar Functions

-- Q1) Create a scalar function that returns Total Compensation
select * from employees

create function fn_Total_Compensation(@Empid int)
returns int
as 
begin
	Declare @Total int
	Select @Total = Salary + Bonus
	from employees
	where employeeid = @Empid
	return @Total
End

SELECT dbo.fn_Total_Compensation(4) AS TotalCompensation;

exec sp_helptext 'dbo.fn_Total_Compensation'

-- Q2) Create a stored procedure that returns all active employees from a given department.

create procedure sp_getactiveemployeesbydept
@department varchar(50)
as 
begin
select firstname, lastname, salary
from employees
where department = @department
and isactive = 1
End

Execute sp_getactiveemployeesbydept Marketing;

-- Q3. Create a stored procedure that calculates Years of Experience for each employee.

alter procedure sp_EmployeeExperience
@Empid int
as 
begin
select employeeid, firstname, datediff(year,hiredate, getdate()) as Experience
from employees
where employeeid = @Empid
end

Execute sp_EmployeeExperience 5;

-- Q4) Create a function that returns high-performing employees

alter function fn_High_Performers()
Returns Table
as 
return 
(
	Select employeeid, firstname, department, performancescore
	from employees
	where performancescore >= 4
);

select * from fn_High_Performers()

-- Q5.) Create a stored procedure that returns the number of active employees in a city.

create procedure sp_ActiveemployeeCount_bycity
@city Varchar(50),
@Total int Output
As
begin
	Select @Total = Count(*)
	from employees
	where city = @city
	and isactive = 1
end

declare @result int

Execute sp_ActiveemployeeCount_bycity @city = 'Dallas', @Total = @result output

select @result as ActiveEmployees

-- Q6) Create a scalar function that returns an employee’s full name in this format:

Create Function fn_Getemployees_byFullname
(
 @Empid int
)
Returns Varchar(50)
as 
begin
     Declare @Fullname Varchar(50)
	 Select @Fullname = Firstname + ' ' + Lastname
	 from employees
	 where employeeid = @Empid

Return @Fullname
End

Select dbo.fn_Getemployees_byFullname(5) as full_name


--Q7.)Create a table-valued function that returns employees whose salary is greater than a given amount.

alter Function fn_Employeewith_HighSalary
(
 @Minsalary int
)
Returns Table
as 
Return 
(
	Select employeeid, firstname, salary, department
	from employees
	where salary > @Minsalary
)

Select * From [dbo].[fn_Employeewith_HighSalary](80000) as High_salary_Employees

--Q8)Create a stored procedure that updates employee salary by a given percentage for a specific department.

select * from employees

create procedure fn_EmployeeSalaryincrease_Dept
@department varchar(20),
@increasepercent decimal(5,2)
as
begin
Update employees
set salary = salary + (salary * @increasepercent / 100)
where department = @department
end

Exec fn_EmployeeSalaryincrease_Dept @department = 'IT', @increasepercent = 10

--Q9)Create a stored procedure that returns: Total employees, Average salary for a given department.

Create procedure sp_Employee_Summary
(
@department varchar(20)
)
As 
Begin
select Count(*) as Total_employees, 
	   AVG(salary) as average_salary
from employees
where department = @department
End

Exec sp_Employee_Summary @department = 'IT';

-- Q10)Department-wise Experienced Employees/ Create a multi-statement table-valued function that:

create function fn_experiencedEmployees_by_department
(
 @department varchar(50),
 @minexperience int
)
returns @result table
(
 Emp_id int,
 Fullname varchar(50),
 department varchar(50),
 yearsof_experience varchar(50)
)
as 
begin
insert into @result
	Select employeeid, firstname + ' ' + lastname as Fullname,
	department, datediff(year, hiredate, getdate()) as yearsof_experience 
	from employees
where Department = @department and DATEDIFF(year, hiredate, getdate()) >= @minexperience

return 
End

select * from [dbo].[fn_experiencedEmployees_by_department]('Sales', 5)

-- Q11 High Compensation Active Employees

create function fn_highcompensation_employees
(
 @Mincompensation int
)
returns @high_earners table
(
 Employeeid int,
 full_name varchar(50),
 department varchar(50),
 total_compensation int,
 performancescore int
)
as 
begin
insert into @high_earners
	select employeeid, firstname + ' ' + lastname as fullname, 
	department, salary+bonus as total_compensation, performancescore 
from employees
where isactive = 1 and (salary+bonus) >= @Mincompensation
Return
end


select * from fn_highcompensation_employees(100000)

--Q12) HR wants a function that works in two modes:

--If @Mode = 'HIGH_PERFORMER'
--→ Return employees with PerformanceScore >= 4

--If @Mode = 'HIGH_SALARY'
--→ Return employees with Salary > 90000

--If anything else
--→ Return all active employees

select * from employees

create function fn_getemployees_bymode
(
	@Mode Varchar(20)
)
Returns @Result Table
(
   Employeeid int, Fullname Varchar(20), 
   Department Varchar(20), Salary int, 
   PerformaceScore int
)

AS
BEGIN
		
	  IF @Mode = 'HIGH_PERFORMER' 
	  BEGIN
		   Insert into @Result
		   Select Employeeid, Firstname + ' ' + Lastname as Fullname,
				  Department, Salary, Performancescore
		   From employees
		   where Performancescore >= 4
	 END

	 ELSE IF @Mode = 'HIGH_SALARY'
	 BEGIN
		   Insert into @Result
		   Select Employeeid, Firstname + ' ' + Lastname as Fullname,
				  Department, Salary, Performancescore
		   From employees
		   where salary > 90000
	 END

	 ELSE
	 BEGIN
		   Insert into @Result
		   Select Employeeid, Firstname + ' ' + Lastname as Fullname,
				  Department, Salary, Performancescore
		   From employees
		   where isactive = 1
	END
	Return
END

SELECT * 
FROM dbo.fn_getemployees_bymode('HIGH_PERFORMER');

SELECT * 
FROM dbo.fn_getemployees_bymode('HIGH_SALARY');


-- Q13) Management wants:

--A function that returns the Top N Highest Paid Employees.

--But you must:

--Sort by Salary descending

--Insert rows one by one using a WHILE loop

Create Function fn_TopNHighestPaidEmployees
(
	@TopN int
)
Returns @Result Table
(
  Employeeid int, Fullname Varchar(20), 
  Salary int, Department varchar(20) 
)
AS
Begin

	  Declare @Counter int = 1

	  Declare @temp Table
	  (
	    Rownum int identity(1,1),
		Employeeid int,
		Fullname varchar(20),
		Salary int,
		Department varchar(20)
	  )

	  Insert into @temp (Employeeid,Fullname,Salary,Department)
	  Select Employeeid, FirstName + ' ' + LastName as fullname, Salary, Department
	  from employees
	  order by Salary desc

	  while @Counter <= @TopN
	  Begin
	  insert into @Result
	  Select Employeeid, Fullname, Salary, Department
	  from @temp
	  where Rownum = @Counter

	  Set @Counter = @Counter + 1
	  End
	  Return

END
	      
SELECT *
FROM dbo.fn_TopNHighestPaidEmployees(5);




