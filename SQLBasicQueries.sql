create Database BhavnaCorp

use BhavnaCorp

Create table EmployeeDetails(EmpId int primary key identity(1,1) ,EName varchar(50),Mobile bigint,Address varchar(50),Pincode int)

Create table OfcDetails(EmpId int,CmpName varchar(50),CmpAddress varchar(50),Pincode int)

Create table SalaryDetails(EmpId int,Salary bigint,PF bigint,HRA bigint,IT bigint)

insert into EmployeeDetails values('Anu',876547654,'Banglore',765345)

insert into SalaryDetails values(3,432123,12343,23432,3432)

select * from EmployeeDetails

Update EmployeeDetails set Pincode=356789 where EmpId=1

select * from OfcDetails

select * from SalaryDetails

select MAX(salary) as 'maximum salary' from SalaryDetails

select min(salary) as 'minimum salary' from SalaryDetails

select Avg(salary) as 'Average salary' from SalaryDetails where Salary<500000 and Salary>300000 


delete from OfcDetails where EmpId=3456

