USE [Books]
GO

CREATE PROCEDURE GetAuthors
@AuthorName varchar(50)
AS
IF @AuthorName != NULL
SELECT * FROM dbo.Author
WHERE AuthorName=@AuthorName
ELSE
SELECT * FROM dbo.Author


CREATE PROCEDURE InsertAuthor
@AuthorAlias varchar(50),
@AuthorName varchar(50),
@AuthorSurname varchar(50),
@BirthDate datetime
AS
INSERT INTO dbo.Author(
AuthorAlias,AuthorName,AuthorSurname,DateOfBirth)
VALUES
(@AuthorAlias,@AuthorName,@AuthorSurname,@BirthDate)
GO


CREATE PROCEDURE UpdateAuthor
@AuthorID int,
@AuthorAlias varchar(50),
@AuthorName varchar(50),
@AuthorSurname varchar(50),
@BirthDate datetime
AS
UPDATE dbo.Author
SET AuthorAlias=@AuthorAlias,
AuthorName=@AuthorName,
AuthorSurname=@AuthorSurname,
DateOfBirth=@BirthDate
WHERE AuthorID=@AuthorID
GO


CREATE PROCEDURE DeleteAuthor
@AuthorID int
AS
DELETE FROM dbo.Author
WHERE AuthorID=@AuthorID
GO