use Exceliq;
----1)     Get all Employee details from the Employee table?
select * from Employee;

----2)     Get EmployeeId, FirstName, LastName from Employee table?
select EmployeeId, FirstName, LastName from Employee;

----3)     Get FirstName from Employee table using alias name “Employee Name”
select FirstName as Employee_Name  from Employee;

----4)     Get FirstName from Employee table in upper case?
select UPPER(FirstName)as NAME from Employee;

----5)     Get FirstName from Employee table in lower case?
select LOWER(FirstName)as name from Employee;

----6)     Get unique Department from Employee table?
select distinct Department from Employee;

----7)     Select first 3 characters of FirstName from Employee table.
select left(FirstName,3) as Name from Employee;

----8)     Get position of 'k' in name 'Vikas' from Employee table
select CHARINDEX ('k', FirstName)as position from Employee where FirstName='Vikas';

----9)     Get FirstName from Employee table after removing white spaces from right side?
select rtrim(FirstName) as FirstName from Employee;

----11) Get length of FirstName from Employee table?
select LEN(FirstName) as length from Employee;

----12) Get FirstName from Employee table after replacing 'V' with 'VV'
select REPLACE(FirstName,'V','VV') from Employee;

----13)  Get FirstName and LastName as single column from Employee table separated by
select FirstName +' '+ LastName as FullName from Employee;

----14)  Get FirstName , Joining year, Joining Month and Joining Date from Employee table ?
select firstname, YEAR(JoiningDate) AS Year , MONTH(JoiningDate) as Month,
DAY(JoiningDate) as Day from Employee;

----15)  Get all employee details from the Employee table order by FirstName Ascending?
select * from Employee order by FirstName asc ;

----16)  Get all employee details from the Employee table order by FirstName descending?
select * from Employee order by FirstName desc;

----17)  Get all employee details from the Employee table order by FirstName Ascending and Salary descending?
select * from Employee order by FirstName asc, Salary desc ;

----18)  Get employee details from Employee table whose employee name is “Vikas”?
select * from EMPLOYEE where FirstName='Vikas';

----19)  Get employee details from Employee table whose employee name are “Vikas” and “Lalit”?
select * from Employee where FirstName in ('Vikas','Lalit');

----20)  Get employee details from Employee table whose employee name are not “Vikas” and “Lalit”?
select * from Employee where FirstName not in ('Vikas','Lalit');

----21)  Get employee details from Employee table whose FirstName starts with 'V'
select * from Employee where FirstName like 'V%';

----22)  Get employee details from Employee table whose FirstName contains 'k'
select * from Employee where FirstName like '%V%';

----23)  Get employee details from Employee table whose FirstName ends with 's'
select * from Employee where FirstName like '%s';

----24)  Get employee details from Employee table whose Salary is greater than 70000?
select Salary from Employee where Salary>70000;

----25)  Get employee details from Employee table whose Salary is less than 70000?
select Salary from Employee where Salary<70000;

----26)  Get employee details from Employee table whose Salary is between 50000 and 70000?
select Salary from Employee where Salary between 50000 and 70000;

----27)  Get employee details from Employee table whose joining year is “2015”?
select * from Employee where YEAR(JoiningDate)=2015;

----28)  Get employee details from Employee table whose joining month is “February”?
select * from Employee where DATENAME(month, JoiningDate)='February';

----29)  Get employee details from Employee table who joined before 20th June, 2015?
select * from EMPLOYEE where JoiningDate > '2015-06-20';

----31)  Get FirstName, JoiningDate and IncentiveDate from Employee and Incentives table?
select FirstName, JoiningDate, Incentivedate from Employee  INNER JOIN incentives  on Employee.EmployeeId = Incentives.EmployeeRefId;

----32)  Get Last Name from Employee table after replacing special character (e.g. % (if any)) with white space?
select Trim(lastname) as LastName from Employee;

----33)  Get department, total salary with respect to a department from Employee table?
select Department,SUM(SALARY) TotalSalary from Employee group by department;

----34)  Get Department, TotalSalary with respect to a department from Employee table order by total salary descending?
select Department, SUM(Salary) as TotalSalary from Employee group by Department order by Salary desc;

----35)  Get department, no of employees in a department, salary with respect to a department from Employee table order by salary descending?
select Department,COUNT(FirstName) as TotalEmployee, SUM(Salary) as Salary from Employee group by DEPARTMENT order by Salary desc;

----36)  Get department wise average salary from employee table order by salary ascending?
select Department,AVG(Salary) as AvgSalary from Employee group by Department order by AvgSalary asc;

----37)  Get department wise maximum salary from Employee table order by salary ascending?
select Department, MAX(Salary) as MaxSalary from Employee group by Department order by MaxSalary asc;

----38)  Get department wise minimum salary from Employee table order by salary ascending?
select Department,MIN(SALARY) as MinSalary from Employee group by Department order by MinSalary asc;

----39)  Select number of employees joined with respect to year and month from Employee table?
select DATEPART (year,JoiningDate) JoiningYear,DATEPART (month,JoiningDate) JoiningMonth,COUNT(*) TotalEmployee from
Employee group by DATEPART(year,JoiningDate), DATEPART(month,JoiningDate);

----40)  Select department,  salary with respect to a department from Employee table where  salary greater than 60000 order by Salary descending
select Department,SUM(SALARY) TotalSalary from Employee group by Department having SUM(SALARY) > 60000 order by TotalSalary desc;

----41) Select FirstName, incentive amount from Employee and incentives table for those employees who have incentives?
select FirstName,IncentiveAmount from Employee  INNER JOIN Incentives  on Employee.EmployeeId = Incentives.EmployeeRefId;

----42)  Select First Name, incentive amount from Employee and incentives table for those employees who have incentives and
--incentive amount greater than 5000
select FirstName,IncentiveAmount from Employee e INNER JOIN Incentives i on E.EmployeeId = I.EmployeeRefId and IncentiveAmount > 5000;

----43)  Select First Name, incentive amount from Employee and Incentives table for all Employees even if they didn't get incentives?
Select FirstName,IncentiveAmount from Employee e LEFT JOIN Incentives i on e.EmployeeId = i.EmployeeRefId;

----44)  Select First Name, incentive amount from Employee and Incentives table for all Employees even if they didn't get
--incentives and set incentive amount as 0 for those employees who didn't get Incentives?
Select FirstName, ISNULL(IncentiveAmount,0) AS IncentiveAmount from Employee e LEFT JOIN Incentives i on e.EmployeeId = i.EmployeeRefId;

----45)  Select First Name, incentive amount from Employee and incentives table for all Employees who got incentives using right join?
Select FirstName, ISNULL(IncentiveAmount,0) AS IncentiveAmount from Employee e RIGHT JOIN Incentives i on e.EMPLOYEEID =i.EmployeeRefId;

----46)  Select max incentive with respect to employee from Employee and incentives table using sub query?
select MAX(Incentives.IncentiveAmount) as max_incentive ,firstname from Employee join Incentives on 
Incentives.EmployeeRefId=Employee.EmployeeId group by firstname;

----47)  Select TOP 2 salary from Employee table?
select top 2 * from Employee;

----48)  Select second, third, fourth or nth highest/maximum salary of employee from Employee table?
with emp as (select *,dense_rank() over(order by salary desc) as m from Employee)
select *from emp where m=5;

----49)  Select FirstName, Last Name from Employee table as separate rows?
select firstname,lastname from employee;

----50)  What is the difference between UNION and UNION ALL?
Union:-  To combine the result of two or more than two select statements as a single unit of values without duplicate values. 
Union All :-  To combine the result of two or more than two select statements as a single unit of values with duplicate values.

----51)  Select Employee details from employee table if data exists in incentive table?
select * from Employee where exists (select * from Incentives);

----52)  Get Employee Id's of those employees who didn't receive incentives without using sub query?
select EmployeeId from Employee
except
select EmployeeRefId from Incentives;

----53)  Select 20 % of salary from Vikas, 10% of Salary for Anil and for other 15 % of salary from employee table?
SELECT FirstName, CASE FirstName when 'Vikas' then Salary * .20 when 'Anil' then Salary * .10 else Salary * .15 end "SalaryAmount" from Employee;

----54)  Select Banking as 'Bank Dept', Insurance as 'Insurance Dept' and Services as 'Services Dept' from employee table?
SELECT department,case Department when 'Banking' then 'Bank Dept'
when 'Insurance' then 'Insurance Dept' when 'Services' then 'Services Dept' END as Department FROM Employee;

----55)  Write a query to rank employees based on their incentives for a month?
select FirstName,IncentiveAmount,month(IncentiveDate)as month,DENSE_RANK() OVER (PARTITION BY IncentiveDate ORDER BY IncentiveAmount DESC) AS Rank
from Employee a,Incentives b where a.EmployeeId = b.EmployeeRefId;

----56)  Update Incentive Amount to 9000 in incentive table where employee First Name is Vishal in Employee table?
update Incentives set IncentiveAmount = '9000' where EmployeeRefId =(select EmployeeId from Employee where FirstName = 'Vishal');

----57)  Write syntax to create Employee table?
create table Employee (EmployeeId int identity primary key,FirstName
varchar(30),LastName varchar(30),Salary money,JoiningDate date,
Department varchar(30))

