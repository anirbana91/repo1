create table Employee(EmployeeId int,FirstName varchar(20),LastName varchar(20),Salary money,JoiningDate date,Department varchar(20))	
insert into Employee values(1,'Vikas','Verma',40000,'2016-05-21','IT'),
						   (2,'Anil','Kumar',800000,'2015-10-31','Insurance'),
						   (3,'Vishal','Sonkar',700000,'2015-12-09','Banking'),
			               (4,'Abhishek','Singh',44000,'2015-02-19','Insurance'),
                           (5,'Durgesh','Tiwari',33000,'2015-12-07','Insurance'),
						   (6,'Ravi','Kumar',55000,'2016-03-31','Services'),
                           (7,'Lalit','Raghuvanshi',88000,'2016-09-26','Services'),
                           (8,'Sandeep','Kumar',70000,'2015-02-01','Insurance')
select * from Employee


create table Incentives	(EmployeeRefId int,	IncentiveDate date,	IncentiveAmount money)	
insert into Incentives values(1,'2015-09-21',10000),
                             (2,'2014-12-25',8000),
                             (3,'2015-05-30',6000),
							 (1,'2016-09-12',3000),
                             (2,'2016-02-25',11000)
select * from  Incentives

---1)Get all Employee details from the Employee table
 
 select * from Employee

---2)Get  EmployeeId, FirstName, LastName from Employee table?
 
 select  EmployeeId, FirstName, LastName from Employee

---3)Get FirstName from Employee table using alias name “Employee Name”

select FirstName as Employee_Name from Employee

---4) Get FirstName from Employee table in upper case?

select upper(FirstName) from Employee

---5)Get FirstName from Employee table in lower case?

select lower(FirstName) from Employee

---6)Get unique Department from Employee table?

select distinct(Department) from Employee

---7)Select first 3 characters of FirstName from Employee table.

select substring(FirstName,1,3) from Employee

---8)Get position of 'k' in name 'Vikas' from Employee table

select FirstName,charindex('k',FirstName)as position  from Employee where FirstName='Vikas'

---9)Get FirstName from Employee table after removing white spaces from right side?

select Rtrim(FirstName) from Employee

---10) Get FirstName from Employee table after removing white spaces from left side?

select Ltrim(FirstName) from Employee

---11) Get length of FirstName from Employee table?

select len(FirstName) from Employee

---12) Get FirstName from Employee table after replacing 'V' with 'VV'

select replace((FirstName),'v','vv') from Employee

---13) Get FirstName and LastName as single column from Employee table separated by

select concat(FirstName,' ',LastName) as full_name from Employee

---14) Get FirstName , Joining year, Joining Month and Joining Date from Employee table ?

select FirstName,year(JoiningDate)as years,month(JoiningDate) as moths,day(JoiningDate) as dates from Employee

---15)Get all employee details from the Employee table order by FirstName Ascending?

select * from Employee order by FirstName

---16) Get all employee details from the Employee table order by FirstName descending?

select * from Employee order by FirstName desc

---17)Get all employee details from the Employee table order by FirstName Ascending and Salary descending?

select * from Employee  order by FirstName, salary desc

---18) Get employee details from Employee table whose employee name is “Vikas”?

select * from Employee where firstname='Vikas'

---19) Get employee details from Employee table whose employee name are “Vikas” and “Lalit”?

select * from Employee where firstname in ('Vikas' , 'Lalit')

---20)  Get employee details from Employee table whose employee name are not “Vikas” and “Lalit”?

select * from Employee where firstname not in ('Vikas' , 'Lalit')

---21)Get employee details from Employee table whose FirstName starts with 'V'

select * from Employee where FirstName like 'V%'

---22)Get employee details from Employee table whose FirstName contains 'k'

select * from Employee where FirstName like '%k%'

----23)Get employee details from Employee table whose FirstName ends with 's'

select * from Employee where FirstName like  '%s'

---24)Get employee details from Employee table whose Salary is greater than 70000?

select * from Employee  where Salary>70000

---25) Get employee details from Employee table whose Salary is less than 70000?

select * from Employee where  Salary<70000

---26) Get employee details from Employee table whose Salary is between 50000 and 70000?

select * from  Employee where   Salary  between 50000 and 70000

---27) Get employee details from Employee table whose joining year is “2015”?

select * from  Employee where  year(JoiningDate)='2015'

---28) Get employee details from Employee table whose joining month is “February”?

select * from Employee where  month(JoiningDate)=2

---29) Get employee details from Employee table who joined before 20th June, 2015?***

select * from Employee  where  JoiningDate>'2015-06-20'

---30)  Get employee details from Employee table who joined after 20th June, 2015?***

select * from Employee  where  JoiningDate<'2015-06-20'

---31)Get FirstName, JoiningDate and IncentiveDate from Employee and Incentives table?

select a.FirstName , a.JoiningDate ,b.IncentiveDate from Employee a inner join Incentives b on a.EmployeeId=b.EmployeeRefId

---32)Get Last Name from Employee table after replacing special character (e.g. % (if any)) with white space?

select replace(LastName,'','%') from Employee

select replace('abc def',' ','%')  

--33)  Get department, total salary with respect to a department from Employee table?

select department,sum(salary) as total_salary from Employee group by department

---34) Get Department, TotalSalary with respect to a department from Employee table order by total salary descending?

select department,sum(salary) as total_salary  from Employee group by department order by sum(salary) desc

---35)Get department, no of employees in a department, salary with respect to a department from Employee table order by salary descending?

select count(EmployeeId) ,Department,sum(salary) as new from Employee group by Department order by sum(salary) desc

---36)Get department wise average salary from employee table order by salary ascending?

select Department,avg(salary) as avg_salary from Employee group by Department  order by avg(salary)asc

---37)Get department wise maximum salary from Employee table order by salary ascending?

select Department,max(salary) as max_salary from Employee group by Department  order by max(salary) asc

---38)Get department wise minimum salary from Employee table order by salary ascending?

select Department,min(salary) as max_salary from Employee group by Department  order by min(salary) asc

---39)  Select number of employees joined with respect to year and month from Employee table?

select year(JoiningDate) as JoiningYear,month(JoiningDate) JoiningMonth,COUNT(*) No_Employee from

Employee group by year(JoiningDate), month(JoiningDate)

---40)Select department,salary with respect to a department from Employee table where  salary greater than 60000 order by Salary descending

Select Department,sum(Salary) from Employee where  salary > 60000 group by Department  order by sum(Salary) desc

---41) Select FirstName, incentive amount from Employee and incentives table for those employees who have incentives?

Select a.FirstName , b.IncentiveAmount from Employee a inner join incentives b on  a.EmployeeId=b.EmployeeRefId

---42)Select First Name, incentive amount from Employee and incentives table for those employees who have incentives 

--and incentive amount greater than 5000

select a.FirstName, b.IncentiveAmount from Employee a inner join incentives b on  a.EmployeeId=b.EmployeeRefId and IncentiveAmount>5000

---43)Select First Name, incentive amount from Employee and Incentives table for all Employees even if they didn't get incentives?

select a.FirstName, b.IncentiveAmount  from Employee a left join incentives b on  a.EmployeeId=b.EmployeeRefId

---44)Select First Name, incentive amount from Employee and Incentives table for all

--Employees even if they didn't get incentives and set incentive amount as 0 for those employees who didn't get Incentives?

select FirstName,isnull(IncentiveAmount,0) AS IncentiveAmount from Employee EMP LEFT JOIN Incentives INC on EMP.EmployeeId = INC.EmployeeRefId

---45)Select First Name, incentive amount from Employee and incentives table for all Employees who got incentives using right join?

select a.FirstName, b.IncentiveAmount  from Employee a right join incentives b on  a.EmployeeId=b.EmployeeRefId

----46) Select max incentive with respect to employee from Employee and incentives table using sub query?

select department, (select max(IncentiveAmount) from incentives where EmployeeId=EmployeeRefId ) from Employee

----47)  Select TOP 2 salary from Employee table?

select TOP 2 salary  from Employee

----48) Select second, third, fourth or nth highest/maximum salary of employee from Employee table?




---49)  Select FirstName, LastName from Employee table as separate rows?

Select FirstName from Employee
union
Select LastName from Employee

----50)  What is the difference between UNION and UNION ALL?
UNION                                  UNION ALL
1. It removes duplicate rows         1. It does not remove duplicate rows
2. Union perform distinct sort to    2 . It It does not remove duplicate 
 remove duplicate                        and also not perform any sort
3. Slower than Union all              3. Faster than Union

---51)  Select Employee details from employee table if data exists in incentive table?

select * from Employee where exists(select * from incentives)

--52)  Get Employee Id's of those employees who didn't receive incentives without using sub query?
select EmployeeId from Employee
except
select EmployeeRefId from incentives

---53)  Select 20 % of salary from Vikas, 10% of Salary for Anil and for other 15 % of salary from employee table?
select firstname, 
case
when firstname ='vikas' then salary*20
when firstname ='Anil'  then salary*10
else salary*15
end 'amount'
from Employee

---54)Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table?
Select department,
case
when department= 'Banking' then'Bank Dept'
when department='Insurance' then 'Insurance Dept' 
when department= 'Services' then 'Services Dept' 
end 'Dpt'
from employee

---55)  Write a query to rank employees based on their incentives for a month?
select FirstName,IncentiveAmount,month(IncentiveDate)as month,DENSE_RANK() OVER (PARTITION BY IncentiveDate ORDER BY IncentiveAmount DESC) AS Rank
from Employee a,Incentives b where a.EmployeeId = b.EmployeeRefId

---56) Update Incentive Amount to 9000 in incentive table where employee First Name is Vishal in Employee table?

Update incentives set IncentiveAmount=9000  where EmployeeRefId =(select EmployeeId from Employee where FirstName = 'Vishal')

---57)  Write syntax to create Employee table?
create table Employee(EmployeeId int,FirstName varchar(20),LastName varchar(20),Salary money,JoiningDate date,Department varchar(20))

---58)  Write syntax to set EmployeeId as primary key in Employee table?
create table Employee (EmployeeId int identity primary key,FirstName
varchar(30),LastName varchar(30),Salary money,JoiningDate date,
Department varchar(30))

--59)  Write SQL syntax to set 2 fields(EmployeeId ,FirstName) as primary key in Employee table
create table Employee  add  Employee_pk primary key(EmployeeId, FirstName)

--60)  Write syntax to drop primary key on Employee table?
alter table Employee  drop constraint  Employee_pk

---61)  Write SQL syntax to create EmployeeRefId in Incentives table as foreign key with respect to EmployeeId in employee table
create table Incentives add constraint Incentives_fk foreign key (EmployeeRefId) references Employee(EmployeeId)

---62)Write SQL syntax to drop foreign key on employee table?
alter table Employee  drop constraint  Incentives_fk

---63) Write syntax to delete employee table
delete from employee
