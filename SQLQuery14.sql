CREATE DATABASE [GAMEPLAY_DB]
GO

USE [GAMEPLAY_DB]
GO

CREATE TABLE GAME_REGISTRY(ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,NAME varchar(50) NULL,DESCRIPTION varchar(200) NULL,RELEASEDATE DATE NULL,TYPE_ID int foreign key references GAME_TYPE(ID) NOT NULL,ACTIVE bit NOT NULL)
GO

CREATE TABLE GAME_TYPE(ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,CODE varchar(10) NULL,DESCRIPTION varchar(50) NULL)
GO

CREATE TABLE DOWNLOAD_SOURCE(ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,SOURCE varchar(50) NULL,SOURCE_ADDRESS varchar(200) NULL)
GO

CREATE TABLE MONTHLY_DOWNLOADS(ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,GAME_ID int foreign key references GAME_REGISTRY(ID) NOT NULL,SOURCE_ID int foreign key references DOWNLOAD_SOURCE(ID) NOT NULL,YEAR varchar(20) NULL,MONTH varchar(20) NULL,NO_OF_DOWNLOADS int NULL,LOAD_DATE Datetime NULL,LOADED_BY varchar(100) NULL)
GO

CREATE TABLE GAME_VERSIONS(ID int PRIMARY KEY IDENTITY(1,1) NOT NULL,GAME_ID int foreign key references GAME_REGISTRY(ID) NOT NULL,VERSION_NO varchar(10) NULL,VERSION_DESC varchar(200) NULL,CURRENTS bit NULL,RELEASE_DATE Datetime NULL)
GO

CREATE VIEW SQL_VIEW 
SELECT        dbo.MONTHLY_DOWNLOADS.GAME_ID, dbo.MONTHLY_DOWNLOADS.SOURCE_ID, dbo.MONTHLY_DOWNLOADS.YEAR, dbo.MONTHLY_DOWNLOADS.MONTH
FROM            dbo.DOWNLOAD_SOURCE INNER JOIN
                         dbo.GAME_REGISTRY ON dbo.DOWNLOAD_SOURCE.ID = dbo.GAME_REGISTRY.ID INNER JOIN
                         dbo.GAME_TYPE ON dbo.GAME_REGISTRY.TYPE_ID = dbo.GAME_TYPE.ID INNER JOIN
                         dbo.MONTHLY_DOWNLOADS ON dbo.DOWNLOAD_SOURCE.ID = dbo.MONTHLY_DOWNLOADS.SOURCE_ID AND dbo.GAME_REGISTRY.ID = dbo.MONTHLY_DOWNLOADS.GAME_ID


