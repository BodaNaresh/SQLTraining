
create table Emp_Hyd(id int primary key identity(1,1),Name nvarchar(30),City nvarchar(30), Salary numeric(18,0),Mobile numeric)

select * from Emp_Hyd

insert into Emp_Hyd values('Naresh', 'Hyd', 20000,5245454)
insert into Emp_Hyd values('varun', 'mumbai', 25000,765432)
insert into Emp_Hyd values('anu', 'chennai', 30000,756432)
insert into Emp_Hyd values('john', 'Hyd', 35000,75643213)
insert into Emp_Hyd values('hari', 'Hyd', 20000,75643)
insert into Emp_Hyd values('harish', 'lucknow', 26000,75643)

select * from Emp_Hyd

create table Emp_Noida(id int primary key identity(200,1),Name nvarchar(30),City nvarchar(30), salary numeric(18,0),Mobile numeric)


insert into Emp_Noida values('kohli','HYD',25000,98876433)
insert into Emp_Noida values('suresh','kanpur',35000,12347643)
insert into Emp_Noida values('mohit','pune',40000,5846433)
insert into Emp_Noida values('abishek','mumbai',50000,86876433)
insert into Emp_Noida values('rohit','delhi',24000,94376433)
insert into Emp_Noida values('anudeep','HYD',26000,45776433)
insert into Emp_Noida values('hari','kolkata',26000,45776433)

 select * from Emp_Noida

---queries on operators

select Name,salary from Emp_Hyd where city='Hyd'
union
select Name,salary from Emp_Noida

select Name FROM Emp_Hyd 
intersect
select Name from Emp_Noida 

select City FROM Emp_Hyd
intersect
select City from Emp_Noida 

select * from Emp_Hyd where Name like('a%')

select * from Emp_Noida where Name like('%h')

select * from Emp_Hyd where Name like('%a%')

select* from Emp_Hyd  where city in('Hyd','Mumbai','chennai')

select* from Emp_Hyd  where city not in('Hyd','Mumbai')


select * from Emp_Noida where salary between 20000 and 40000

select * from Emp_Noida where salary not between 25000 and 35000

select * from Emp_Hyd where exists(select salary from Emp_Noida where Emp_Hyd.Salary=Emp_Noida.salary)

select * from Emp_Hyd where not exists(select salary from Emp_Noida where Emp_Hyd.Salary=Emp_Noida.salary)

select city from Emp_Hyd where exists(select city from Emp_Noida where Emp_Hyd.city=Emp_Noida.city)

select * from Emp_Noida where city like('[HCM]%')



