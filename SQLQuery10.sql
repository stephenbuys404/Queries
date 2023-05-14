CREATE PROCEDURE GetPublishers
@PublisherName varchar(50)
AS
IF @PublisherName != NULL
SELECT * FROM dbo.Publishers
WHERE PublisherName=@PublisherName
ELSE
SELECT * FROM dbo.Publishers

CREATE PROCEDURE InsertPublisher
@PublisherName varchar(50),
@CountryID varchar(50)
AS
INSERT INTO dbo.Publishers(
PublisherName,
CountryID)
VALUES
(@PublisherName,@CountryID)
GO

CREATE PROCEDURE UpdatePublisher
@PublisherID int,
@PublisherName varchar(50),
@CountryID varchar(50)
AS
UPDATE dbo.Publishers
SET
PublisherName=@PublisherName,
CountryID=@CountryID
WHERE PublisherID=@PublisherID
GO

CREATE PROCEDURE DeletePublisher
@PublisherID int
AS
DELETE FROM dbo.Publishers
WHERE PublisherID=@PublisherID
GO