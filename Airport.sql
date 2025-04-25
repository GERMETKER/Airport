--CREATE DATABASE Airport

use Airport
go
CREATE TABLE Flights(
	id int identity(1,1) PRIMARY KEY not null,
	time_of_sending smalldatetime,
	time_of_arrival smalldatetime,
	place_of_sending nvarchar(max),
	place_of_arrival nvarchar(max),
	plane_model nvarchar(max),

);

go
CREATE TABLE Bilets(
	id int identity(1,1) PRIMARY KEY not null,
	flight_id int,
	bilet_type nvarchar(100),
	plane_id int,
	site_num int,

);

go
CREATE TABLE Passangers(
	id int identity(1,1) PRIMARY KEY not null,
	[name] nvarchar(max),
	surname nvarchar(max),
	fathername nvarchar(max),

);

go
CREATE TABLE Planes(
	id int identity(1,1) PRIMARY KEY not null,
	count_of_econom_sites int,
	count_of_business_sites int,
	model nvarchar(max),
);
go