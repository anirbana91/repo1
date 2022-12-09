create database SQL_Project_Assignment

use SQL_Project_Assignment

create table Employee(Emp_ID int,First_name varchar (30),Last_name varchar (30),Salary money,Joining_Date date,Department varchar (30))

insert into Employee values(1,'Vikas','Verma',40000,'2016-05-21','IT'),
						   (2,'Anil','Kumar',800000,'2015-10-31','Insurance'),
						   (3,'Vishal','Sonkar',700000,'2015-12-09','Banking'),
						   (4,'Abhishek','Singh',44000,'2015-02-19','Insurance'),
						   (5,'Durgesh','Tiwari',33000,'2015-12-07','Insurance'),
						   (6,'Ravi','Kumar',55000,'2016-03-31','Services'),
						   (7,'Lalit','Raghuvanshi',88000,'2016-09-26','Services'),
						   (8,'Sandeep','Kumar',70000,'2015-02-01','Insurance')

create table Incentives(Emp_Ref_ID int, Incentive_Date date, Incentive_Amt money)

insert into Incentives values(1,'2015-09-21',10000),
							 (2,'2014-12-25',8000),
							 (3,'2015-05-30',6000),
							 (1,'2016-09-12',3000),
							 (2,'2016-02-25',11000)

select * from Employee
select * from Incentives

-- Queries

-- 1)   Get all Employee details from the Employee table?

select * from Employee

-- 2)   Get EmployeeId, FirstName, LastName from Employee table?

select Emp_ID,First_name,Last_name from Employee

-- 3)   Get FirstName from Employee table using alias name “Employee Name”

select (First_name) as Employee_name from Employee

-- 4)   Get FirstName from Employee table in upper case?

select upper(First_name) from Employee

-- 5)   Get FirstName from Employee table in lower case?

select lower(First_name) from Employee

-- 6)   Get unique Department from Employee table?

select distinct Department from Employee

-- 7)   Select first 3 characters of FirstName from Employee table.

select left(First_name,3) from Employee

-- 8)   Get position of 'k' in name 'Vikas' from Employee table

select charindex('K','Vikas') from Employee where First_name='Vikas'

-- 9)   Get FirstName from Employee table after removing white spaces from right side?

select rtrim(First_name) from Employee

-- 10)  Get FirstName from Employee table after removing white spaces from left side?

select ltrim(First_name) from Employee

-- 11)  Get length of FirstName from Employee table?

select len(First_name) from Employee

-- 12)  Get FirstName from Employee table after replacing 'V' with 'VV'

select replace(First_name,'V','W') from Employee

-- 13)  Get FirstName and LastName as single column from Employee table separated by

select concat(First_name,' ', Last_name)as Employee_name from Employee

-- 14)  Get FirstName , Joining year, Joining Month and Joining Date from Employee table ?

select First_name,year(Joining_date)as Joining_year,month(Joining_date)as Joining_month,day(Joining_date)as Joining_day from Employee

-- 15)  Get all employee details from the Employee table order by FirstName Ascending?

select * from Employee order by First_name

-- 16)  Get all employee details from the Employee table order by FirstName descending?

select * from Employee order by First_name desc

-- 17)  Get all employee details from the Employee table order by FirstName Ascending and Salary descending?

select * from Employee order by First_name, Salary desc

-- 18)  Get employee details from Employee table whose employee name is “Vikas”?

select * from Employee where First_name='Vikas'

-- 19)  Get employee details from Employee table whose employee name are “Vikas” and “Lalit”?

select * from Employee where First_name in('Vikas','Lalit')

-- 20)  Get employee details from Employee table whose employee name are not “Vikas” and “Lalit”?

select * from Employee where First_name not in ('Vikas','Lalit')

-- 21)  Get employee details from Employee table whose FirstName starts with 'V'

select * from Employee where First_name like 'V%'

-- 22)  Get employee details from Employee table whose FirstName contains 'k'

select * from Employee where First_name like '%K%'

-- 23)  Get employee details from Employee table whose FirstName ends with 's'

select * from Employee where First_name like '%s'

-- 24)  Get employee details from Employee table whose Salary is greater than 70000?

select * from Employee where salary>70000

-- 25)  Get employee details from Employee table whose Salary is less than 70000?

select * from Employee where salary<70000

-- 26)  Get employee details from Employee table whose Salary is between 50000 and 70000?

select * from Employee where salary between 50000 and 70000

-- 27)  Get employee details from Employee table whose joining year is “2015”?

select * from Employee where year(Joining_date)='2015'

-- 28)  Get employee details from Employee table whose joining month is “February”?

select * from Employee where month(Joining_date)='February'

-- 29)  Get employee details from Employee table who joined before 20th June, 2015?

select * from Employee where Joining_date<'2015-06-20'

-- 30)  Get employee details from Employee table who joined after 20th June, 2015?

select * from Employee where Joining_date>'2015-06-20'

-- 31)  Get FirstName, JoiningDate and IncentiveDate from Employee and Incentives table?

select First_name,Joining_date,Incentive_date from Employee inner join Incentives on Employee.Emp_ID=Incentives.Emp_Ref_ID

-- 32)  Get Last Name from Employee table after replacing special character (e.g. % (if any)) with white space?

select Last_name,replace(Last_name,'$',' ')from Employee

-- 33)  Get department, total salary with respect to a department from Employee table?

select Department,sum(Salary)as Total_salary from Employee group by Department 

-- 34)  Get Department, TotalSalary with respect to a department from Employee table order by total salary descending?

select Department,sum(salary)as Total_salary from Employee group by Department order by sum(salary) desc

-- 35)  Get department, no of employees in a department, salary with respect to a department from Employee table order by salary descending?

select Department,count(Emp_ID)as No_of_,sum(salary) from Employee group by Department order by sum(salary) desc

-- 36)  Get department wise average salary from employee table order by salary ascending?

select avg(salary)as avg_salary from Employee group by Department order by avg(salary)

-- 37)  Get department wise maximum salary from Employee table order by salary ascending?

select max(salary) as maximum_salary from Employee group by Department order by max(salary)

-- 38)  Get department wise minimum salary from Employee table order by salary ascending?

select min(salary) as minimum_salary from Employee group by Department order by min(salary)

-- 39)  Select number of employees joined with respect to year and month from Employee table?

select count(Emp_ID) as No_Of_Employees,Year(Joining_date) as Joining_year,month(Joining_date) as Joining_month from Employee
group by year(Joining_date),month(Joining_date)


-- 40)  Select department,  salary with respect to a department from Employee table where  salary greater than 60000 order by Salary descending

select Department,sum(salary) as Total_Salary from Employee group by Department having Sum(salary)>60000 order by Sum(salary) desc

-- 41)  Select FirstName, incentive amount from Employee and incentives table for those employees who have incentives?

select First_name,Incentive_Amt from Employee inner join Incentives on Employee.Emp_ID=Incentives.Emp_Ref_id

-- 42)  Select First Name, incentive amount from Employee and incentives table for those employees who have incentives and incentive amount greater than 5000

select First_name,Incentive_Amt from Employee join Incentives on Employee.Emp_ID=Incentives.Emp_Ref_id where Incentive_Amt>5000

-- 43)  Select First Name, incentive amount from Employee and Incentives table for all Employees even if they didn't get incentives?

select e.First_name, i.Incentive_Amt from Employee e left join Incentives i on e.Emp_ID=i.Emp_Ref_ID

-- 44)  Select First Name, incentive amount from Employee and Incentives table for all Employees even if they didn't get incentives and 
--      set incentive amount as 0 for those employees who didn't get Incentives?

select e.First_name, isnull (i.Incentive_Amt,0) from Employee e left join Incentives i on e.Emp_ID=i.Emp_Ref_ID


-- 45)  Select First Name, incentive amount from Employee and incentives table for all Employees who got incentives using right join?

select e.First_name, i.Incentive_Amt from Employee e right join Incentives i on e.Emp_ID=i.Emp_Ref_ID


-- 46)  Select max incentive with respect to employee from Employee and incentives table using sub query?

select Department,(select isnull(max(Incentive_Amt),0) as Incentive from Incentives where Emp_Ref_ID=Emp_ID) Max_Incentives from Employee

-- 47)  Select TOP 2 salary from Employee table?

select TOP 2* from Employee

** -- 48)  Select second, third, fourth or nth highest/maximum salary of employee from Employee table?

select max(salary) from Employee where salary <(Select max(salary) from Employee)

select max(salary) from Employee where salary not in(Select distinct top 4 (max(salary)) from Employee)

-- 49)  Select FirstName, Last Name from Employee table as separate rows?

select First_name from Employee
union
select Last_name from Employee

-- 50)  What is the difference between UNION and UNION ALL?

			Union										Union all
 1. It removes dulpicate rows					1. It does not remove duplicate rows 
 2. Union perform distinct sort					2. It does not remove duplicate & also
	to remove duplicate							   not perform any sort
 3. Slower than Union all						3. Faster than Union

-- 51)  Select Employee details from employee table if data exists in incentive table?

select * from Employee where exists (select * from Incentives)

-- 52)  Get Employee Id's of those employees who didn't receive incentives without using sub query?

select Emp_ID from Employee
EXCEPT
select Emp_Ref_ID from Incentives

-- 53)  Select 20 % of salary from Vikas, 10% of Salary for Anil and for other 15 % of salary from employee table?

select First_name,
case
	when First_name='Vikas' then ((salary*20)/100)
	when First_name='Anil' then ((salary*10)/100)
	else ((salary*15)/100)
end 'Salary_Amount'
from Employee

-- 54)  Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table?

select
case
	when Department='Banking' then 'Bank Dept'
	when Department='Insurance' then 'Insurance Dept'
	when Department='Services' then 'Services Dept'
end 'Dept'
from Employee


-- 55)  Write a query to rank employees based on their incentives for a month?

select First_name,Incentive_Amt,dense_rank() over (partition by Incentive_Date order by Incentive_Amt) as Ranks
from Employee e join Incentives i on e.Emp_ID=i.Emp_Ref_ID

-- 56)  Update Incentive Amount to 9000 in incentive table where employee First Name is Vishal in Employee table?

update Incentives set Incentive_Amt=9000 where Emp_Ref_ID=(select Emp_ID from Employee where First_name='Vishal')

-- 57)  Write syntax to create Employee table?

create table Employee(Emp_ID int,First_name varchar (30),Last_name varchar (30),Salary money,Joining_Date date,Department varchar (30))


-- 58)  Write syntax to set EmployeeId as primary key in Employee table?

Alter table Employee ADD CONSTRAINT Employee_PK primary key (Emp_ID)

-- 59)  Write SQL syntax to set 2 fields(EmployeeId ,FirstName) as primary key in Employee table

Alter Table Employee ADD CONSTRAINT Employee_PK primary key(Emp_ID,First_name)

-- 60)  Write syntax to drop primary key on Employee table?

Alter Table Employee DROP CONSTRAINT Employee_PK

-- 61)  Write SQL syntax to create EmployeeRefId in Incentives table as foreign key with respect to EmployeeId in employee table?

Alter Table Incentives ADD CONSTRAINT Incentives_FK Foreign Key (Emp_Ref_ID) References Employee (Emp_ID)

-- 62)  Write SQL syntax to drop foreign key on employee table?

Alter Table Incentives DROP CONSTRAINT Incentives_FK

-- 63)  Write syntax to delete employee table?

DROP Table Employee