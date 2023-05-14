CREATE DATABASE [VAT]
GO

USE [VAT]
GO

CREATE TABLE VATRates(
VATid int identity(1,1) primary key not null,
VATRate nchar(10) not null,
StartDate date not null,
EndDate date,
Active bit not null)

-----------------------------------------------------------

SELECT [VATid],
[VATRate],
[StartDate],
[EndDate],
[Active]
FROM [VAT].[dbo].[VATRates]
WHERE Active=1


-----------------------------------------------------------

USE [VAT]
GO

INSERT INTO [dbo].[VATRates]
([VATRate],[StartDate],[EndDate],[Active])
VALUES
('14','2001-01-01','2017-05-14',0),
('15','2001-01-01','2012-03-22',1)
GO