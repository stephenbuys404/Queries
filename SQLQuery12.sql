CREATE DATABASE [MusicHouse]
GO

USE [MusicHouse]
GO

CREATE TABLE dbo.Ranking(
	RankID int identity(1,1) primary key,
	Description varchar(100))
GO

CREATE TABLE dbo.Artist(
	ArtistID varchar(10) primary key,
	ArtistName varchar(50) not null,
	ArtistSurname varchar(50) not null,
	ArtistStageName varchar(50) null,
	DateOfBirth datetime,
	Ranking int foreign key references Ranking(RankID))
GO

CREATE TABLE dbo.MusicTrack(
	MusicTrackID int identity(1,1) primary key,
	TrackName varchar(50) not null,
	TrackLength int not null)
GO

CREATE TABLE dbo.Album(
	AlbumID int identity(1,1) primary key,
	Artist varchar(10) foreign key references Artist(ArtistID),
	MusicTrack int foreign key references MusicTrack(MusicTrackID),
	Price money,
	Stock int)
GO