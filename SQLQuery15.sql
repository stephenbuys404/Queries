CREATE DATABASE TOG
GO

USE TOG
GO

CREATE TABLE CustomerType(
CustomerTypeID int identity(1,1) primary key,
Description varchar(100))
GO

CREATE TABLE Customers(
CustomerID int identity(1,1) primary key not null,
FirstName varchar(50) not null,
Surname varchar(50) not null,
DateOfBirth DateTime not null,
Subscribed bit not null,
DateOfRegistration Date not null,
CustomerTypeID int foreign key references CustomerType(CustomerTypeID))
GO

CREATE TABLE Country(
CountryID integer identity(1,1) primary key,
CountryName varchar(150))

CREATE TABLE Address(
AddressID int identity(1,1) primary key,
AddressLine1 varchar(100),
AddressLine2 varchar(100),
City varchar(50),
PostalCode varchar(10),
CountryID int foreign key references Country(CountryID))

CREATE TABLE CustomerAddress(
CustomerAddressID int identity(1,1) primary key,
CustomerID int foreign key references Customers(CustomerID),
AddressID int foreign key references Address(AddressID))

CREATE TABLE CustomerPaymentInfo(
PaymentInfoID int identity(1,1) primary key,
CardNumber varchar(25),
CCV varchar(4),
CustomerID int foreign key references Customers(CustomerID),
CustomerAddressID int foreign key references CustomerAddress(CustomerAddressID))
GO

CREATE TABLE Tasks(
TaskID int identity(1,1) primary key,
Description varchar(500),
NumberOfPeople int,
Disqualifiable bit)

CREATE TABLE AssignedTasks(
AssignedTask int identity(1,1) primary key,
CustomerID int foreign key references Customers(CustomerID),
TaskID int foreign key references Tasks(TaskID),
Location varchar(100))


CREATE PROCEDURE CreateAssignedTasks
@AssignedTask int,@CustomerID int,@TaskID int,@Location varchar(100)
INSERT INTO AssignedTasks(AssignedTask,CustomerID,TaskID,Location)
VALUES(@AssignedTask,@CustomerID,@TaskID,@Location))

CREATE PROCEDURE GETAssignedTasks
SELECT * FROM AssignedTasks;

CREATE PROCEDURE DeleteAssignedTasks
@AssignedTask int,@CustomerID int,@TaskID int,@Location varchar(100)
DELETE FROM AssignedTasks(AssignedTask,CustomerID,TaskID,Location)
WHERE AssignedTask=@AssignedTask;

CREATE PROCEDURE UpdateAssignedTasks
@AssignedTask int,@CustomerID int,@TaskID int,@Location varchar(100)
Update AssignedTasks SET(AssignedTask,CustomerID,TaskID,Location)
WHERE AssignedTask=@AssignedTask;

CREATE PROCEDURE CreateTasks(
@TaskID int,@Description varchar(500),@NumberOfPeople int,Disqualifiable bit
INSERT INTO Tasks(TaskID,Description,NumberOfPeople,Disqualifiable)
VALUES(@TaskID,@Description,@NumberOfPeople,@Disqualifiable))

CREATE PROCEDURE GETTasks
SELECT * FROM Tasks;

CREATE PROCEDURE DELETETasks(
@TaskID int,@Description varchar(500),@NumberOfPeople int,Disqualifiable bit
DELETE FROM Tasks(TaskID,Description,NumberOfPeople,Disqualifiable)
WHERE TaskID=@TaskID

CREATE PROCEDURE UpdateTasks(
@TaskID int,@Description varchar(500),@NumberOfPeople int,Disqualifiable bit
UPDATE Tasks SET(TaskID,Description,NumberOfPeople,Disqualifiable)
WHERE TaskID=@TaskID

CREATE PROCEDURE CreateCustomerPaymentInfo(
@PaymentInfoID int,@CardNumber varchar(25),@CCV varchar(4),@CustomerID int,CustomerAddressID int
INSERT INTO CustomerPaymentInfo(PaymentInfoID,CardNumber,CCV,CustomerID,CustomerAddressID)
VALUES(@PaymentInfoID,@CardNumber,@CCV,@CustomerID,CustomerAddressID))

CREATE PROCEDURE GETCustomerPaymentInfo
SELECT * FROM CustomerPaymentInfo;

CREATE PROCEDURE DELETECustomerPaymentInfo(
@PaymentInfoID int,@CardNumber varchar(25),@CCV varchar(4),@CustomerID int,CustomerAddressID int
DELETE FROM CustomerPaymentInfo(PaymentInfoID,CardNumber,CCV,CustomerID,CustomerAddressID)
WHERE PaymentInfoID=@PaymentInfoID;

CREATE PROCEDURE UPDATECustomerPaymentInfo(
@PaymentInfoID int,@CardNumber varchar(25),@CCV varchar(4),@CustomerID int,CustomerAddressID int
UPDATE CustomerPaymentInfo SET(PaymentInfoID,CardNumber,CCV,CustomerID,CustomerAddressID)
WHERE PaymentInfoID=@PaymentInfoID;

CREATE PROCEDURE CreateCustomerAddress(
@CustomerAddressID int,@CustomerID int,@AddressID int
INSERT INTO CustomerAddress(CustomerAddressID,CustomerID,AddressID)
VALUES
(@CustomerAddressID,@CustomerID,@AddressID)

CREATE PROCEDURE GETCustomerAddress
SELECT * FROM CustomerAddress;

CREATE PROCEDURE DeleteCustomerAddress(
@CustomerAddressID int,@CustomerID int,@AddressID int
DELETE FROM CustomerAddress(CustomerAddressID,CustomerID,AddressID)
WHERE
CustomerAddressID=@CustomerAddressID;

CREATE PROCEDURE UPDATECustomerAddress(
@CustomerAddressID int,@CustomerID int,@AddressID int
UPDATE CustomerAddress SET(CustomerAddressID,CustomerID,AddressID)
WHERE
CustomerAddressID=@CustomerAddressID;

CREATE PROCEDURE CreateAddress(
@AddressID int,
@AddressLine1 varchar(100),
@AddressLine2 varchar(100),
@City varchar(50),
@PostalCode varchar(10),
@CountryID int
INSERT INTO Address
VALUES(@AddressID,@AddressLine1,@AddressLine2,@City,@PostalCode,@CountryID))

CREATE PROCEDURE GETAddress
SELECT * FROM Address;

CREATE PROCEDURE DeleteAddress(
@AddressID int,
@AddressLine1 varchar(100),
@AddressLine2 varchar(100),
@City varchar(50),
@PostalCode varchar(10),
@CountryID int
DELETE FROM Address
WHERE AddressID=@AddressID

CREATE PROCEDURE UPDATEAddress(
@AddressID int,
@AddressLine1 varchar(100),
@AddressLine2 varchar(100),
@City varchar(50),
@PostalCode varchar(10),
@CountryID int
UPDATE Address SET
WHERE AddressID=@AddressID

CREATE PROCEDURE CreateCountry(
@CountryID integer,
@CountryName varchar(150)
INSERT INTO Country
VALUE(@CountryID,@CountryName)

CREATE PROCEDURE GETCountry
SELECT * FROM Country;

CREATE PROCEDURE DeleteCountry(
@CountryID integer,
@CountryName varchar(150)
DELETE FROM Country
WHERE CountryID=@CountryID;

CREATE PROCEDURE UPDATECountry(
@CountryID integer,
@CountryName varchar(150)
UPDATE Country SET
WHERE CountryID=@CountryID;

CREATE PROCEDURE CreateCustomer(
@CustomerID int,
@FirstName varchar(50),
@Surname varchar(50),
@DateOfBirth DateTime,
@Subscribed bit,
@DateOfRegistration Date,
@CustomerTypeID int
INSERT INTO Customers
VALUES
(@CustomerID,@FirstName,@Surname,@DateOfBirth,@Subscribed,@DateOfRegistration,@CustomerTypeID))

CREATE PROCEDURE GETCustomer
SELECT * FROM Customer;

CREATE PROCEDURE DeleteCustomer(
@CustomerID int,
@FirstName varchar(50),
@Surname varchar(50),
@DateOfBirth DateTime,
@Subscribed bit,
@DateOfRegistration Date,
@CustomerTypeID int
DELETE FROM Customers
WHERE CustomerID=@CustomerID;

CREATE PROCEDURE UPDATECustomer(
@CustomerID int,
@FirstName varchar(50),
@Surname varchar(50),
@DateOfBirth DateTime,
@Subscribed bit,
@DateOfRegistration Date,
@CustomerTypeID int
UPDATE Customers SET
WHERE CustomerID=@CustomerID;

CREATE PROCEDURE CreateCustomerType(
@CustomerTypeID int,
@Description varchar(100)
INSERT INTO CustomerType
VALUES
(@CustomerTypeID,@Description)
)

CREATE PROCEDURE GETCustomerType
SELECT * FROM CustomerType;

CREATE PROCEDURE DeleteCustomerType(
@CustomerTypeID int,
@Description varchar(100)
DELETE FROM CustomerType
WHERE CustomerTypeID =@CustomerTypeID;

CREATE PROCEDURE UPDATECustomerType(
@CustomerTypeID int,
@Description varchar(100)
UPDATE CustomerType SET
WHERE CustomerTypeID =@CustomerTypeID;