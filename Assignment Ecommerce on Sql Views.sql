----Views
create table product(id int primary key identity(1,1),PId int,PName nvarchar(30),Quantity int, price numeric(18,0))

select * from product

insert into product values(121,'Cricketbat', 1, 2000)
insert into product values(122,'jeans', 2, 2500)
insert into product values(123,'Cricketball', 2, 3000)
insert into product values(124,'gogles', 1, 500)
insert into product values(125,'headphones', 1, 4000)
insert into product values(126,'mobile', 1, 15000)

alter table product drop column Quantity

create table customer(Custid int primary key identity(200,1),CName nvarchar(30),CAddress nvarchar(30), Mobile numeric,PId int)

alter table customer alter column CAddress nvarchar(30)
select * from customer

insert into customer values('Naresh','HYD',98876433,121)
insert into customer values('suresh','kanpur',123476433,122)
insert into customer values('mohit','pune',5846433,123)
insert into customer values('abishek','mumbai',86876433,124)
insert into customer values('varun','delhi',94376433,125)
insert into customer values('anu','HYD',45776433,126)

create table orders(orderid int,PId int,Quantity int,totalorders int)

select * from orders


insert into orders values(111,121,3,2)
insert into orders values(112,122,5,3)
insert into orders values(113,123,6,6)
insert into orders values(114,124,2,4)
insert into orders values(115,125,2,2)



create table Accounts(paymentid int,orderid int,custid int,amount int,PId int)

select * from Accounts

insert into Accounts values(3322,111,201,2000,121)
insert into Accounts values(3323,112,202,3000,122)
insert into Accounts values(3324,113,203,4000,123)
insert into Accounts values(3325,114,204,5000,124)
insert into Accounts values(3326,115,205,6000,125)


create view Custorder_Details
as
select customer.Custid,customer.CName,product.PId,product.Pname,Accounts.amount
from ((customer inner join product on customer.PId=product.PId)inner join Accounts on product.PId=Accounts.PId);

select * from Custorder_Details

create view Order_Details
as
select id,PName,Quantity,price,orderid,totalorders
from product inner join orders 
on product.PId=orders.PId

select * from Order_Details

create view product_orderDetails
as
select orderid,CName,CAddress,Mobile,Quantity,totalorders
from customer inner join orders
on customer.PId=orders.PId

select * from product_orderDetails

create view Customer_PaymentDetails
as
select paymentid,CName,Mobile,Amount
from customer inner join Accounts
on customer.PId=Accounts.PId

select * from Customer_PaymentDetails





