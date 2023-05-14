CREATE DATABASE [Zoo]
GO

USE [Zoo]
GO

--Create the tables

CREATE TABLE [Species](
	SpeciesID int IDENTITY(1,1) PRIMARY KEY,
	SpeciesName varchar(70),
	ZoologicalClass varchar(15))
GO

CREATE TABLE [Gender](
	GenderID int IDENTITY(1,1) PRIMARY KEY,
	GenderName varchar(50))
GO

CREATE TABLE [Animal](
	AnimalID int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50),
	GenderID int FOREIGN KEY REFERENCES Gender(GenderID),
	SpeciesID int FOREIGN KEY REFERENCES Species(SpeciesID))
GO

CREATE TABLE [Zoo](
	ZooID int IDENTITY(1,1) PRIMARY KEY,
	ZooName varchar(150),
	ZooLocation varchar(200))
GO

CREATE TABLE [ZooAnimal](
	ZooAnimalID int IDENTITY(1,1) PRIMARY KEY,
	ZooID int FOREIGN KEY REFERENCES Zoo(ZooID),
	AnimalID int FOREIGN KEY REFERENCES Animal(AnimalID))
GO

--Insert test data

INSERT INTO dbo.Species(
	SpeciesName,
	ZoologicalClass)
	VALUES
	('Leopard','Feline'),
	('Lion','Feline'),
	('Wild Dog','Canine'),
	('Greyback Wolf','Canine'),
	('Killer Whale','Whale'),
	('Dolphin','Dolphin')
GO

INSERT INTO dbo.Gender(
	GenderName)
	VALUES
	('Male'),
	('Female'),
	('Hermaphroditic')
GO

INSERT INTO dbo.Animal(
	Name,
	GenderID,
	SpeciesID)
	VALUES
	('Joey',1,1),
	('Leo',1,2),
	('Nala',2,2),
	('Langa',2,2),
	('Zelo',1,3),
	('Max',1,3),
	('Jax',1,3),
	('Spot',1,5)
GO

INSERT INTO dbo.Zoo(
	ZooName,
	ZooLocation)
VALUES
	('Pretoria Zoological Gardens','Pretoria, South Africa'),
	('Johannesburg Zoo','Johannesburg, South Africa'),
	('Cape Town Peninsula Zoo','Cape Town, South Africa'),
	('Central Park Zoo','New-York, USA'),
	('Moscow Central Zoo','Moscow, Russia'),
	('Australia Emu Victory Memorial','Victoria, Australia')
GO

INSERT INTO dbo.ZooAnimal(
	ZooID,
	AnimalID)
VALUES
	(1,1),
	(1,2),
	(1,3),
	(1,4),
	(1,5),
	(1,6),
	(1,7),
	(1,8)
GO

--Create stored procedures
CREATE PROCEDURE dbo.GetSpecies
	@SpeciesID int
AS
IF (@SpeciesID != 0)
	SELECT * FROM dbo.Species
	WHERE SpeciesID=@SpeciesID
ELSE
	SELECT * FROM dbo.Species
GO

CREATE PROCEDURE dbo.InsertSpecies	
	@SpeciesName varchar(70),
	@ZoologicalClass varchar(15)
AS
	INSERT INTO dbo.Species(
		SpeciesName,
		ZoologicalClass)
	VALUES
		(@SpeciesName,@ZoologicalClass)
GO

CREATE PROCEDURE dbo.UpdateSpecies
	@SpeciesID int,
	@SpeciesName varchar(70),
	@ZoologicalClass varchar(15)
AS
	UPDATE dbo.Species
	SET
		SpeciesName = @SpeciesName,
		ZoologicalClass = @ZoologicalClass
	WHERE SpeciesID=@SpeciesID
GO

CREATE PROCEDURE dbo.DeleteSpecies
	@SpeciesID int
AS
	DELETE FROM Species
	WHERE SpeciesID=@SpeciesID
GO

--Gender Stored Procedures
CREATE PROCEDURE dbo.GetGenders
	@GenderID int
AS
IF (@GenderID != 0)
	SELECT * FROM dbo.Gender
	WHERE GenderID = @GenderID
ELSE
	SELECT * FROM dbo.Gender
GO

CREATE PROCEDURE dbo.InsertGender
	@GenderName varchar(50)
AS
	INSERT INTO dbo.Gender(
		GenderName)
	VALUES
		(@GenderName)
GO

CREATE PROCEDURE dbo.UpdateGender
	@GenderID int,
	@GenderName varchar(50)
AS
	UPDATE dbo.Gender
	SET
		GenderName = @GenderName
	WHERE GenderID = @GenderID
GO

CREATE PROCEDURE dbo.DeleteGender
	@GenderID int
AS 
	DELETE FROM dbo.Gender
	WHERE GenderID = @GenderID
GO

--Animal Stored Procedures

CREATE PROCEDURE dbo.GetAnimals
	@AnimalID int
AS
IF (@AnimalID != 0)
	SELECT * FROM dbo.Animal
	WHERE AnimalID=@AnimalID
ELSE
	SELECT * FROM dbo.Animal
GO

CREATE PROCEDURE dbo.InsertAnimal
	@Name varchar(50),
	@GenderID int,
	@SpeciesID int
AS
	INSERT INTO dbo.Animal(
		Name,
		GenderID,
		SpeciesID)
	VALUES
		(@Name, @GenderID, @SpeciesID)
GO

CREATE PROCEDURE dbo.UpdateAnimal
	@AnimalID int,
	@Name varchar(50),
	@GenderID int,
	@SpeciesID int
AS
	UPDATE dbo.Animal
	SET
		Name=@Name,
		GenderID=@GenderID,
		SpeciesID=@SpeciesID
	WHERE AnimalID=@AnimalID
GO

CREATE PROCEDURE dbo.DeleteAnimal
	@AnimalID int
AS
	DELETE FROM dbo.Animal
	WHERE AnimalID=@AnimalID
GO

--Zoo Stored Procedures

CREATE PROCEDURE dbo.GetZoos
	@ZooID int
AS
IF(@ZooID!=0)
	SELECT * FROM dbo.Zoo
	WHERE ZooID = @ZooID
ELSE
	SELECT * FROM dbo.Zoo
GO

CREATE PROCEDURE dbo.InsertZoo
	@ZooName varchar(150),
	@ZooLocation varchar(200)
AS
	INSERT INTO dbo.Zoo(
		ZooName,
		ZooLocation)
	VALUES
		(@ZooName,@ZooLocation)
GO

CREATE PROCEDURE dbo.UpdateZoo
	@ZooID int,
	@ZooName varchar(150),
	@ZooLocation varchar(200)
AS
	UPDATE dbo.Zoo
	SET
		ZooName=@ZooName,
		ZooLocation = @ZooLocation
	WHERE ZooID=@ZooID
GO

CREATE PROCEDURE dbo.DeleteZoo
	@ZooID int
AS
	DELETE FROM dbo.Zoo
	WHERE ZooID=@ZooID
GO

--ZooAnimal Stored Procedures

CREATE PROCEDURE dbo.GetZooAnimals
	@ZooAnimalID int,
	@ZooID int,
	@AnimalID int
AS
IF (@ZooAnimalID != 0)
	SELECT * FROM dbo.ZooAnimal
	WHERE ZooAnimalID=@ZooAnimalID
ELSE IF (@ZooID != 0)
	SELECT * FROM dbo.ZooAnimal
	WHERE ZooID = @ZooID
ELSE IF (@AnimalID !=0)
	SELECT * FROM dbo.ZooAnimal
	WHERE AnimalID=@AnimalID
ELSE IF(@ZooAnimalID = 0 AND @ZooID = 0 AND @AnimalID =0)
	SELECT * FROM dbo.ZooAnimal
GO

CREATE PROCEDURE dbo.InsertZooAnimal
	@ZooID int,
	@AnimalID int
AS
	INSERT INTO dbo.ZooAnimal(
		ZooID,
		AnimalID)
	VALUES
		(@ZooID,@AnimalID)
GO

CREATE PROCEDURE dbo.UpdateZooAnimal
	@ZooAnimalID int,
	@ZooID int,
	@AnimalID int
AS
	UPDATE dbo.ZooAnimal
	SET
		ZooID=@ZooID,
		AnimalID = @AnimalID
	WHERE ZooAnimalID=@ZooAnimalID
GO

CREATE PROCEDURE dbo.DeleteZooAnimal
	@ZooAnimalID int
AS
	DELETE FROM ZooAnimal
	WHERE ZooAnimalID=@ZooAnimalID
GO






