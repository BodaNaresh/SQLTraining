create table Customer_Details(custId int primary key identity(1,1),Name nvarchar(30),Address nvarchar(30),mobile numeric,pincode int)

insert into Customer_Details values('Naresh','Hyd',112344567,505326)
insert into Customer_Details values('Anu','mumbai',324424567,506326)
insert into Customer_Details values('James','us',443564567,506626)
insert into Customer_Details values('suresh','Hyd',987664567,599326)
insert into Customer_Details values('Naresh','chennai',765464567,504309)
insert into Customer_Details values('john','mumbai',45664567,502346)
insert into Customer_Details values('hari','chennai',12364567,409876)
insert into Customer_Details values('john','kolkata',92364567,304320)
insert into Customer_Details values('mohit','kanpur',4323464567,886644)

select * from Customer_Details

create table Product_Details(PId int primary key identity(10,1),Name nvarchar(30),Price int,
custId int foreign key references Customer_Details(custId))

insert into Product_Details values('head phones',3000,1)
insert into Product_Details values('mobile',3000,2)
insert into Product_Details values('t-shit',700,3)
insert into Product_Details values('jeans',9000,4)
insert into Product_Details values('bag',3000,5)
insert into Product_Details values('bat',2000,6)
insert into Product_Details values('laptop',3000,7)
insert into Product_Details values('watch',10000,8)
insert into Product_Details values('watch',6000,8)


select * from Product_Details

create table Orders_Detail(orderId int primary key identity(100,1),totalorders int,ordershipment nvarchar(30),
custId int foreign key references Customer_Details(custId))

insert into Orders_Detail values(3,'bangalore',4)
insert into Orders_Detail values(2,'hyd',3)
insert into Orders_Detail values(6,'mumbai',5)
insert into Orders_Detail values(8,'chennai',2)
insert into Orders_Detail values(10,'kolkata',6)
insert into Orders_Detail values(15,'bangalore',1)
insert into Orders_Detail values(1,'delhi',7)
insert into Orders_Detail values(4,'hyd',8)

select * from Orders_Detail

---clauses--

select * from Customer_Details order by name desc

select name, SUM(Price) as 'Price' FROM Product_Details GROUP BY NAME;

select Name, COUNT(*) as 'No of Employees' 
from Customer_Details
group by Name;

select ordershipment, count(*) as Totalcount from Orders_Detail group by ordershipment

select Address, count(*) as 'count' from Customer_Details group by Address

select Name, SUM(Price) from Product_Details group by Name having SUM(Price)>2000; 

Select distinct * from Customer_Details where Address='Hyd'

Select * from Product_Details order by Price desc OFFSET 2 Rows Fetch next 4 Rows only

select Price, count(Orders_Detail.orderId) AS TotalCount
from (Product_Details
inner join Orders_Detail ON Product_Details.custId = Orders_Detail.custId)
group by Price
having count(Orders_Detail.orderId)>2
