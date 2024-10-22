-- Active: 1729172264062@@127.0.0.1@3306@hotel

--1
CREATE VIEW hotels_stations
AS
SELECT hot_nom, sta_nom FROM hotel, station
WHERE hot_sta_id = sta_id;

SELECT * FROM hotels_stations

--2
CREATE VIEW chambres_hotels
AS
SELECT cha_numero , cha_capacite , hot_nom FROM hotel , chambre
WHERE cha_hot_id = hot_id;

SELECT * FROM chambres_hotels

--3
CREATE View reservations_clients
AS
SELECT res_id , res_date , res_date_debut , res_date_fin ,res_prix , res_arrhes , cli_nom , cli_prenom FROM reservation , client
WHERE res_cli_id = cli_id;

SELECT * FROM reservations_clients

--4
CREATE VIEW chambres_hotels_stations
AS
SELECT cha_numero , cha_capacite , hot_nom , sta_nom FROM hotel , chambre ,station
WHERE cha_hot_id = hot_id AND hot_sta_id = sta_id;

SELECT * FROM chambres_hotels_stations

--5
CREATE View reservations_clients_hotels
AS
SELECT res_id , res_date , res_date_debut , res_date_fin ,res_prix , res_arrhes , cli_nom , cli_prenom , hot_nom FROM reservation , client , hotel, chambre
WHERE res_cli_id = cli_id AND cha_hot_id = hot_id;

SELECT * FROM reservations_clients_hotels
