--joins
create table candidate(id int primary key identity(1,1),fullname nvarchar(30))
create table employee(id int primary key identity(1,1),fullname nvarchar(30))

insert into candidate(fullname) values('Naresh'),('varun'),('john'),('anu')
insert into employee(fullname) values('john'),('akash'),('mohit'),('Naresh')

select c.id,c.fullname,e.id,e.fullname from candidate as c inner join  employee as e on c.fullname=e.fullname 


--joins using stored procedures

create table celebrity(id int primary key identity(1,1),Name nvarchar(30),City nvarchar(30))

create table brands(brandid int primary key identity(100,1),Name nvarchar(30),Price numeric,id int foreign key references celebrity(id))

create table b_endorsement(eid int primary key identity(200,1),brandid int,id int foreign key references celebrity(id))

select * from celebrity

insert into celebrity values('Prabhas','Hyd')
insert into celebrity values('Arjun','Mumbai')
insert into celebrity values('sharukh','mumbai')
insert into celebrity values('vijay','chennai')
insert into celebrity values('deepika','bangalore')

select * from brands
insert into brands values('Levis',2000,1)
insert into brands values('Denim',3000,2)
insert into brands values('American',2000,2)
insert into brands values('puma',2500,3)
insert into brands values('Levis',5000,1)
insert into brands values('Levis',6000,2)

select * from b_endorsement 

insert into b_endorsement values(100,1)
insert into b_endorsement values(101,3)
insert into b_endorsement values(102,4)
insert into b_endorsement values(104,3)
insert into b_endorsement values(103,2)


--inner join
create procedure sp_celebritybrand
as
begin
select c.id,c.Name,b.id,b.brandid,b.Name,b.price from celebrity as c inner join  brands as b on c.id=b.id
end

exec sp_celebritybrand

create procedure sp_celebritybrandendorsement
as
begin
select c.id,c.Name,c.city,b.brandid,b.Name from celebrity as c inner join  brands as b on c.id=b.id inner join b_endorsement as e on b.id=e.id
end

exec sp_celebritybrandendorsement


--left join

create procedure sp_celebritynotbrandendorsement
as
begin
select c.id,c.Name,c.city,b.brandid from celebrity as c left join  b_endorsement as b on c.id=b.id where b.id is null
end

exec sp_celebritynotbrandendorsement

--right join

create procedure sp_celebrityrightbrands
as
begin
select c.id,c.Name,c.city,b.Name from celebrity as c right join  brands as b on c.id=b.id 
end

exec sp_celebrityrightbrands

--full join

create procedure sp_celebrityFullendorsement
as
begin
select c.id,c.Name,c.city,b.Name from celebrity as c full join  brands as b on c.id=b.id where b.id is null
end

exec sp_celebrityFullendorsement

