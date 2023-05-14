CREATE DATABASE [Artistry]
GO

USE [Artistry]
GO

CREATE TABLE Gender(
	GenderID int identity(1,1) primary key,
	GenderName varchar(15) not null)
GO

INSERT INTO Gender(
GenderName)
VALUES
('Male'),
('Female')
GO

CREATE TABLE Artists(
	ArtistID varchar(10) primary key,
	FirstName varchar(50) not null,
	SecondName varchar(50) null,
	Surname varchar(50) not null,
	BirthDate datetime not null,
	GenderID int foreign key references dbo.Gender(GenderID),
	ResidentCountry varchar(50))
GO

INSERT INTO Artists(
ArtistID,
	FirstName,
	SecondName,
	Surname,
	BirthDate,
	GenderID,
	ResidentCountry)
VALUES
('7845523125','Vincent','','Van Gogh',1975-24-05,1,'Holland'),
('7845123656','Leonardo','','De Vinci',1954-08-11,1,'Italy'),
('1256632541','Jane','','Sanguine',1985-06-12,2,'Greece')
GO

CREATE TABLE Address(
	AddressID int identity(1,1) primary key,
	AddressLine1 varchar(100) not null,
	AddressLine2 varchar(100) null,
	City varchar(75) not null,
	PostalCode varchar(15) not null)
GO

CREATE TABLE Gallery(
	GalleryID int identity(1,1) primary key,
	GalleryName varchar(50) not null,
	GalleryAddressID int foreign key references dbo.Address(AddressID))
GO

CREATE TABLE ArtistGallery(
	ArtistGalleryID int identity(1,1) primary key,
	ArtistID varchar(10) foreign key references dbo.Artists(ArtistID),
	GalleryID int foreign key references dbo.Gallery(GalleryID),
	DateOfShowing datetime)
GO

CREATE PROCEDURE sp_Gender_Select
	@GenderID int
AS
IF (@GenderID != 0)
	SELECT dbo.Gender.GenderID,
				 dbo.Gender.GenderName
	FROM dbo.Gender
	WHERE dbo.Gender.GenderID = @GenderID
ELSE
	SELECT dbo.Gender.GenderID,
				 dbo.Gender.GenderName
	FROM dbo.Gender
GO

CREATE PROCEDURE sp_Gender_Insert
	@GenderName varchar(15)
AS
INSERT INTO dbo.Gender(
	GenderName)
VALUES
	(@GenderName)
GO

CREATE PROCEDURE sp_Gender_Update
	@GenderID int,
	@GenderName varchar(15)
AS
UPDATE dbo.Gender
SET
	GenderName = @GenderName
WHERE
	GenderID = @GenderID
GO

CREATE PROCEDURE sp_Gender_Delete
	@GenderID int
AS
	DELETE FROM dbo.Gender
	WHERE dbo.Gender.GenderID = @GenderID
GO

CREATE PROCEDURE sp_Artists_Select
	@AritstID varchar(10)
AS
IF(@AritstID != '')
SELECT dbo.Artists.ArtistID,
					 dbo.Artists.FirstName,
					 dbo.Artists.SecondName,
					 dbo.Artists.Surname,
					 dbo.Artists.BirthDate,
					 dbo.Artists.GenderID,
					 dbo.Artists.ResidentCountry
		FROM dbo.Artists
		WHERE dbo.Artists.ArtistID = @AritstID
ELSE
SELECT dbo.Artists.ArtistID,
					 dbo.Artists.FirstName,
					 dbo.Artists.SecondName,
					 dbo.Artists.Surname,
					 dbo.Artists.BirthDate,
					 dbo.Artists.GenderID,
					 dbo.Artists.ResidentCountry
		FROM dbo.Artists
GO

CREATE PROCEDURE sp_Artists_Insert
	@ArtistID varchar(10),
	@FirstName varchar(50),
	@SecondName varchar(50),
	@Surname varchar(50),
	@BirthDate datetime,
	@GenderID int,
	@ResidentCountry varchar(50)
AS
	INSERT INTO dbo.Artists(
		ArtistID,
		FirstName,
		SecondName,
		Surname,
		BirthDate,
		GenderID,
		ResidentCountry)
	VALUES
		(@ArtistID,
		@FirstName,
		@SecondName,
		@Surname,
		@BirthDate,
		@GenderID,
		@ResidentCountry)
GO

CREATE PROCEDURE sp_Artists_Update
	@ArtistID varchar(10),
	@FirstName varchar(50),
	@SecondName varchar(50),
	@Surname varchar(50),
	@BirthDate datetime,
	@GenderID int,
	@ResidentCountry varchar(50)
AS
UPDATE dbo.Artists
SET
	FirstName = @FirstName,
	SecondName = @SecondName,
	Surname = @Surname,
	BirthDate = @BirthDate,
	GenderID = @GenderID,
	ResidentCountry = @ResidentCountry
WHERE ArtistID = @ArtistID
GO

CREATE PROCEDURE sp_Artists_Delete
	@AritstID varchar(10)
AS
	DELETE FROM dbo.Artists 
	WHERE ArtistID = @AritstID
GO

CREATE PROCEDURE sp_Address_Select
	@AddressID int
AS
IF(@AddressID != 0)
	SELECT 
		dbo.Address.AddressID,
		dbo.Address.AddressLine1,
		dbo.Address.AddressLine2,
		dbo.Address.City,
		dbo.Address.PostalCode
	FROM dbo.Address
	WHERE dbo.Address.AddressID = @AddressID
ELSE
	SELECT 
		dbo.Address.AddressID,
		dbo.Address.AddressLine1,
		dbo.Address.AddressLine2,
		dbo.Address.City,
		dbo.Address.PostalCode
	FROM dbo.Address
GO

CREATE PROCEDURE sp_Address_Insert
	@AddressLine1 varchar(100),
	@AddressLine2 varchar(100),
	@City varchar(75),
	@PostalCode varchar(15)
AS
INSERT INTO dbo.Address(
	AddressLine1,
	AddressLine2,
	City,
	PostalCode)
VALUES(
	@AddressLine1,
	@AddressLine2,
	@City,
	@PostalCode)
GO

CREATE PROCEDURE sp_Address_Update
	@AddressID int,
	@AddressLine1 varchar(100),
	@AddressLine2 varchar(100),
	@City varchar(75),
	@PostalCode varchar(15)
AS
UPDATE dbo.Address
SET
	AddressLine1 = @AddressLine1,
	AddressLine2 = @AddressLine2,
	City = @City,
	PostalCode = @PostalCode
WHERE dbo.Address.AddressID = @AddressID
GO

CREATE PROCEDURE sp_Address_Delete
	@AddressID int
AS
	DELETE FROM dbo.Address
	WHERE dbo.Address.AddressID = @AddressID
GO

CREATE PROCEDURE sp_Gallery_Select
	@GalleryID int
AS
IF(@GalleryID != 0)
	SELECT
		dbo.Gallery.GalleryID,
		dbo.Gallery.GalleryName,
		dbo.Gallery.GalleryAddressID
	FROM dbo.Gallery
	WHERE dbo.Gallery.GalleryID = @GalleryID
ELSE
	SELECT
		dbo.Gallery.GalleryID,
		dbo.Gallery.GalleryName,
		dbo.Gallery.GalleryAddressID
	FROM dbo.Gallery
GO

CREATE PROCEDURE sp_Gallery_Insert
	@GalleryName varchar(50),
	@GalleryAddressID int
AS
	INSERT INTO dbo.Gallery(
		GalleryName,
		GalleryAddressID)
	VALUES(
		@GalleryName,
		@GalleryAddressID)
GO

CREATE PROCEDURE sp_Gallery_Update
	@GalleryID int,
	@GalleryName varchar(50),
	@GalleryAddressID int
AS
	UPDATE dbo.Gallery
	SET
		GalleryName = @GalleryName,
		GalleryAddressID = @GalleryAddressID
	WHERE dbo.Gallery.GalleryID = @GalleryID
GO

CREATE PROCEDURE sp_Gallery_Delete
	@GalleryID int
AS
	DELETE FROM dbo.Gallery
	WHERE dbo.Gallery.GalleryID = @GalleryID
GO

CREATE PROCEDURE sp_ArtistGallery_Select
	@ArtistID varchar(10),
	@GalleryID int
AS
IF(@ArtistID = '')
	IF(@GalleryID !=0)
		SELECT 
		dbo.ArtistGallery.ArtistGalleryID,
		dbo.ArtistGallery.ArtistID,
		dbo.ArtistGallery.GalleryID,
		dbo.ArtistGallery.DateOfShowing
		FROM dbo.ArtistGallery
		WHERE dbo.ArtistGallery.GalleryID = @GalleryID
	ELSE
		SELECT 
		dbo.ArtistGallery.ArtistGalleryID,
		dbo.ArtistGallery.ArtistID,
		dbo.ArtistGallery.GalleryID,
		dbo.ArtistGallery.DateOfShowing
		FROM dbo.ArtistGallery

ELSE
	IF(@GalleryID = 0)
		SELECT 
		dbo.ArtistGallery.ArtistGalleryID,
		dbo.ArtistGallery.ArtistID,
		dbo.ArtistGallery.GalleryID,
		dbo.ArtistGallery.DateOfShowing
		FROM dbo.ArtistGallery
		WHERE dbo.ArtistGallery.ArtistID = @ArtistID
	ELSE
		SELECT 
		dbo.ArtistGallery.ArtistGalleryID,
		dbo.ArtistGallery.ArtistID,
		dbo.ArtistGallery.GalleryID,
		dbo.ArtistGallery.DateOfShowing
		FROM dbo.ArtistGallery
GO

CREATE PROCEDURE sp_ArtistGallery_Insert
	@ArtistID varchar(10),
	@GalleryID int,
	@DateOfShowing datetime
AS
INSERT INTO dbo.ArtistGallery(
	ArtistID,
	GalleryID,
	DateOfShowing)
	VALUES
	(@ArtistID,@GalleryID,@DateOfShowing)
GO

CREATE PROCEDURE sp_ArtistGallery_Update
	@ArtistGallery int,
	@ArtistID varchar(10),
	@GalleryID int,
	@DateOfShowing datetime
AS
	UPDATE dbo.ArtistGallery
	SET
		ArtistID = @ArtistID,
		GalleryID = @GalleryID,
		DateOfShowing = @DateOfShowing
	WHERE ArtistGalleryID = @ArtistGallery
GO

CREATE PROCEDURE sp_ArtistGallery_Delete
	@ArtistGallery int
AS
	DELETE FROM dbo.ArtistGallery
	WHERE ArtistGallery.ArtistGalleryID = @ArtistGallery
GO


