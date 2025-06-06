CREATE DATABASE Airport

use Airport


go
CREATE TABLE Flights(
	id int identity(1,1) PRIMARY KEY not null,
	time_of_sending smalldatetime,
	time_of_arrival smalldatetime,
	place_of_sending nvarchar(max) not null,
	place_of_arrival nvarchar(max) not null,
	plane_model nvarchar(max) not null,

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
	[name] nvarchar(max) not null,
	surname nvarchar(max) not null,
	bilet_id int,

);

go
CREATE TABLE Planes(
	id int identity(1,1) PRIMARY KEY not null,
	count_of_econom_sites int,
	count_of_business_sites int,
	model nvarchar(max) not null,
);
go


INSERT INTO Flights (time_of_sending, time_of_arrival, place_of_sending, place_of_arrival, plane_model)
VALUES ('2025-06-01 23:00:00', '2025-06-02 07:00:00', 'London', 'New York', 'Airbus'),
('2025-06-03 23:00:00', '2025-06-04 07:00:00', 'London', 'New York', 'Airbus'),
('2025-06-05 23:00:00', '2025-06-06 07:00:00', 'London', 'New York', 'Airbus'),
('2025-06-02 23:00:00', '2025-06-03 07:00:00', 'London', 'Rome', 'Airbus'),
('2025-06-04 23:00:00', '2025-06-05 07:00:00', 'London', 'Rome', 'Airbus'),
('2025-06-06 23:00:00', '2025-06-07 07:00:00', 'London', 'Rome', 'Airbus');

INSERT INTO Bilets (flight_id, bilet_type, plane_id, site_num)
VALUES (1, 'Econom', 1, 225),
(2, 'Econom', 1, 157),
(3, 'Bisness', 1, 89),
(4, 'Econom', 2, 112),
(5, 'Bisness', 2, 303),
(6, 'Bisness', 2, 196);

SELECT count_of_econom_sites AS Econom_Sits, count_of_business_sites AS Bisness_Sits, model FROM Planes

INSERT INTO Passangers ([name], surname, bilet_id)
VALUES ('Peter', 'Parker', 1),
('Nikola', 'Tesla', 2),
('Jesus', 'God', 3),
('Solid', 'Snake', 4),
('Dante', 'Sparda', 5),
('Hains', 'Fufelshmerths', 6);

INSERT INTO Planes(count_of_econom_sites, count_of_business_sites, model)
VALUES (250, 100, 'Airbus'),
(250, 100, 'Airbus');




/*CREATE VIEW Timetable
AS (
SELECT time_of_sending, time_of_arrival, place_of_sending, place_of_arrival FROM Flights WHERE Flights.place_of_arrival = 'New York'
)*/

INSERT INTO Flights (time_of_sending, time_of_arrival, place_of_sending, place_of_arrival, plane_model)
VALUES ('2025-07-01 23:00:00', '2025-07-02 07:00:00', 'Moscow', 'New York', 'Airbus');

SELECT * FROM Timetable

/*CREATE VIEW LondonsFlights
AS (
SELECT time_of_sending, time_of_arrival, place_of_sending, place_of_arrival FROM Flights WHERE Flights.place_of_sending = 'London'
)*/

SELECT * FROM LondonsFlights

INSERT INTO Flights (time_of_sending, time_of_arrival, place_of_sending, place_of_arrival, plane_model)
VALUES ('2025-07-01 23:00:00', '2025-07-02 07:00:00', 'London', 'Moscow', 'Airbus');

/*CREATE VIEW BiletsAndPlaneId 
AS (
SELECT Planes.id, Bilets.id AS bilet_id, Bilets.flight_id, Bilets.bilet_type, Bilets.site_num AS planes_id FROM Planes JOIN Bilets
ON Planes.id = Bilets.plane_id

)*/

--SELECT * FROM Flights
--SELECT * FROM BiletsAndPlaneId

CREATE FULLTEXT INDEX ON Passangers([name], surname) KEY INDEX FIO;