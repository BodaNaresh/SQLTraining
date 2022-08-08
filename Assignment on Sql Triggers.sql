create table celebrity(id int primary key identity(1,1),Name nvarchar(30),City nvarchar(30))

create table celebrity_log(LogId int identity(50,1),cid int,operation nvarchar(30),Updateddate datetime)

create table brands(brandid int primary key identity(100,1),Name nvarchar(30),Price numeric,id int foreign key references celebrity(id))

create table brands_log(LogId int identity(400,1),bid int,operation nvarchar(30),Updateddate datetime)

create table b_endorsement(eid int primary key identity(200,1),brandid int,id int foreign key references celebrity(id))

create table b_endorsement_log(LogId int identity(400,1),e_id int,operation nvarchar(30),Updateddate datetime)

select * from celebrity
select * from celebrity_log

insert into celebrity values('Prabhas','Hyd')
insert into celebrity values('Arjun','Mumbai')
insert into celebrity values('sharukh','mumbai')
insert into celebrity values('vijay','chennai')
insert into celebrity values('deepika','bangalore')
insert into celebrity values('deepu','kolkata')
insert into celebrity values('deepu','kolkata')

select * from brands
select * from brands_log

insert into brands values('Levis',2000,1)
insert into brands values('Denim',3000,2)
insert into brands values('American',2000,2)
insert into brands values('puma',2500,3)
insert into brands values('Levis',5000,1)
insert into brands values('Levis',6000,2)
insert into brands values('Levi',6000,2)

select * from b_endorsement 
select * from b_endorsement_log

insert into b_endorsement values(100,1)
insert into b_endorsement values(101,3)
insert into b_endorsement values(102,4)
insert into b_endorsement values(104,3)
insert into b_endorsement values(103,2)
insert into b_endorsement values(103,2)


---Triggers for celebrity Table

create trigger celebrityInsertTrigger
on celebrity
for insert
as
insert into celebrity_log(cid,operation,Updateddate)
select id,'Data inserted',GETDATE() from inserted


create trigger celebrityUpdateTrigger
on celebrity
for Update
as
insert into celebrity_log(cid,operation,Updateddate)
select id,'Data Updated',GETDATE() from inserted

update celebrity set Name='Anudep' where id=6

create trigger celebrityDeleteTrigger
on celebrity
for Delete
as
insert into celebrity_log(cid,operation,Updateddate)
select id,'Data Deleted',GETDATE() from deleted

drop trigger celebrityDeleteTrigger

delete from celebrity where id=8

---Triggers for Brands Table

create trigger brandsInsertTrigger
on brands
for insert
as
insert into brands_log(bid,operation,Updateddate)
select brandid,'Data inserted',GETDATE() from inserted


create trigger brandsUpdateTrigger
on brands
for Update
as
insert into brands_log(bid,operation,Updateddate)
select brandid,'Data updated',GETDATE() from inserted

update brands set Name='Leviss' where brandid=111


create trigger brandsDeleteTrigger
on brands
for Delete
as
insert into brands_log(bid,operation,Updateddate)
select brandid,'Data deleted',GETDATE() from deleted

delete from brands where brandid=111

--Triggers for Endorsement table
create trigger EndorsementInsertTrigger
on b_endorsement
for insert
as
insert into b_endorsement_log(e_id,operation,Updateddate)
select eid,'Data Inserted',GETDATE() from inserted

drop trigger EndorsementInsertTrigger

create trigger EndorsemenUpdateTrigger
on b_endorsement
for Update
as
insert into b_endorsement_log(e_id,operation,Updateddate)
select eid,'Data updated',GETDATE() from inserted

update b_endorsement set brandid=333 where eid=206

create trigger EndorsementDeleteTrigger
on b_endorsement
for Delete
as
insert into b_endorsement_log(e_id,operation,Updateddate)
select eid,'Data deleted',GETDATE() from deleted

delete from b_endorsement where eid=207



