CREATE DATABASE [Zinto]
GO

USE [Zinto]
GO

CREATE TABLE [EmployeeType]
(EmployeeTypeID int identity(1,1) primary key not null,
Description varchar(50),
Overtime bit,
Active bit)

CREATE TABLE [Employee]
(EmployeeID INT identity(1000,1) primary key not null,
FirstName varchar(50),
Surname varchar(50),
Initials varchar(10),
TitleID INT,
GenderID INT,
EmployeeTypeID INT foreign key references EmployeeType(EmployeeTypeID),
HourlyRate DECIMAL,
MaxHours INT,
SupervisorID INT,
Active bit)

CREATE TABLE [Title]
(TitleID INT IDENTITY(1,1),
Description varchar(50),
Active bit)

CREATE TABLE [Gender]
(GenderID int identity(1,1) not null,
Description varchar(50),
Active bit)

CREATE TABLE [Store]
(
StoreID int identity(1,1) primary key not null,
AddressLine1 varchar(200),
AddressLine2 varchar(200),
City varchar(75),
PostalCode varchar(10),
Province varchar(50),
Active bit)

CREATE TABLE [EmployeeAssignment]
(
AssignmentID INT IDENTITY(1,1),
StoreID INT FOREIGN KEY REFERENCES Store(StoreID),
EmployeeID INT FOREIGN KEY REFERENCES Employee(EmployeeID),
Active bit)

