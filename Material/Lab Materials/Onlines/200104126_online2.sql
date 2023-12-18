create table Doctor_addressTB
(
	doctorId int identity(15,5) primary key,
	Address varchar(200) null,
	city varchar(50),
	postcode int not null
)

insert into Doctor_addressTB(Address,city,postcode)
values ('Mohammodpur','Dhaka',1204),
	('AtiBazar','Dhaka',1302),
	('Dhanmondi','Dhaka',1402),
	('Hair street','Dhaka',1303)

create table Clinic_addressTB
(
	clinicID int primary key,
	Services varchar(50) not null,
	Rooms int not null,
	EntryFee int not null,
	Address varchar(200) not null,
	doctorId int foreign key references Doctor_addressTB(doctorId),
	
)

insert into Clinic_addressTB(clinicID,Services,Rooms,EntryFee,Address,doctorId)
values(20,'Impatient',4,1500,'Gulshan',20),
	(22,'Outpatient',4,1500,'Gulshan',20),
	(26,'Hospice',4,1500,'Gulshan',20),
	(27,'Outpatient',4,1500,'Gulshan',20),
	(31,'Impatient',4,1500,'Gulshan',20),
	(35,'Hospice',4,1500,'Gulshan',20)

select * from Clinic_addressTB
select * from Clinic_addressTB where clinicID like '1%' --1

select Address from Doctor_addressTB where Address like '_o%' and len(Address)>7 --2

select * from Clinic_addressTB where doctorId in(15,28,22,30,45,20) --3

select services,max(rooms) as 'Max_Room',Min(doctorId) as'Min_docId',avg(entryFee) from Clinic_addressTB group by Services --4

select * from Clinic_addressTB where services !='Impatient' or EntryFee<=1500 --5

select top 5 * from Clinic_addressTB order by Rooms desc --6




