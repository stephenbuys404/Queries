CREATE DATABASE [TEST]
GO

USE [TEST]
GO

CREATE TABLE [Student](
StudentNumber varchar(15) primary key not null,
Name varchar(50) not null,
Surname varchar(50) not null,
DateOfBirth datetime not null,
Gender char(1) not null)
GO

CREATE TABLE [Program](
ProgramCode varchar(6) primary key not null,
Name varchar(75),
NQFLevel char(2))
GO

CREATE TABLE [StudentProgram](
StudentProgramid int primary key identity(1,1) not null,
StudentNumber varchar(15) foreign key references Student(StudentNumber),
ProgramCode varchar(6) foreign key references Program(ProgramCode),
YearRegistered datetime)
GO