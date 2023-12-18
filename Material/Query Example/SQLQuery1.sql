create database testTable

create table Customer
(
CustomerId int identity(1,1) Primary Key,
LastName varchar(50) Not NULL,
FirstName varchar(50) Not NULL,
AreaCode int NULL,
Address varchar(100) NULL,
Phone varchar (11) NULL
)

select * from Customer

insert into Customer values ('Khan', 'Rahim', 1010, 'Dhaka', '01234567890')

insert into Customer (LastName, FirstName, AreaCode, Address, Phone)

create table orderDetails
(
OrderId int identity(1,1) Primary Key,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
OrderDate date NULL,
OrderAmount money NULL
)

select * from orderDetails
select * from Customer

alter table customer
add column CustomerNumber int Not NULL UNIQUE CHECK(CustomerNumber>1000)

