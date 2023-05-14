CREATE DATABASE [Books]
GO

USE [Books]
GO

CREATE TABLE BookType(
BookTypeID int primary key identity(1,1),
BookType_Name varchar(50))
GO

CREATE TABLE BookPrice(
BookPriceID int primary key identity(1,1),
BookTypeID int foreign key references BookType(BookTypeID),
Price money)

CREATE TABLE Author(
AuthorID varchar(13) primary key,
AuthorName varchar(50),
AuthorSurname varchar(50),
AuthorAlias varchar(50),
DateOfBirth date)
GO

CREATE TABLE Book(
ISBN varchar(15) primary key,
Title varchar(100),
AuthorID varchar(13) foreign key references Author(AuthorID),
Publisher varchar(100),
Edition varchar(50))
GO

CREATE TABLE PricingInfo(
PricingID int primary key identity(1,1),
ISBN varchar(15) foreign key references Book(ISBN),
StartDate date default GETDATE(),
EndDate date null)
GO