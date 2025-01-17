-- Active: 1729172264062@@127.0.0.1@3306@hotel
--1.
SELECT hot_nom,hot_ville
FROM hotel

--2.
SELECT cli_nom,cli_prenom,cli_adresse,cli_ville
FROM client
WHERE cli_nom = 'white'

--3.
SELECT sta_nom,sta_altitude
FROM station
WHERE sta_altitude < 1000

--4.
SELECT cha_numero,cha_capacite
FROM chambre
WHERE cha_capacite > 1

--5.
SELECT cli_nom,cli_ville
FROM client
WHERE cli_ville != 'Londre'

--6.
SELECT hot_nom,hot_ville,hot_categorie
FROM hotel
WHERE hot_ville = 'Bretou' AND hot_categorie >3

--7.
SELECT hot_nom,hot_ville,hot_categorie,sta_nom
FROM hotel, station

--8.
SELECT hot_nom,hot_ville,hot_categorie,cha_numero
FROM hotel, chambre

--9.
SELECT hot_nom,hot_ville,hot_categorie,cha_numero,cha_capacite
FROM hotel, chambre
WHERE hot_ville = 'bretou' and cha_capacite >1

--10.
SELECT cli_nom,hot_nom,res_date
FROM hotel, client,reservation

--11.
SELECT sta_nom,hot_nom,cha_numero,cha_capacite
FROM station,hotel,chambre

--12.
SELECT cli_nom,hot_nom,res_date_debut,res_date_fin, DATEDIFF(res_date_fin, res_date_debut) AS res_duree
FROM hotel, client,reservation;

--13.
SELECT station.sta_id,
COUNT(hotel.hot_id) AS 'hot_nombre'
FROM hotel
JOIN station ON hotel.hot_sta_id = station.sta_id
GROUP BY station.sta_id

--14.
SELECT station.sta_id,
COUNT(chambre.cha_id) AS 'cha_nombre'
FROM chambre
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id
GROUP BY station.sta_id

--15.
SELECT station.sta_id,
COUNT(chambre.cha_id) AS 'cha_nombre'
FROM chambre 
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id
WHERE cha_capacite >1
GROUP BY station.sta_id

--16.
SELECT hotel.hot_nom AS 'Nom de l’Hôtel', hotel.hot_categorie AS 'Catégorie', hotel.hot_ville AS 'Ville'
FROM reservation
JOIN chambre ON reservation.res_cha_id = chambre.cha_id
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN client ON reservation.res_cli_id = client.cli_id
WHERE client.cli_nom = 'Squire';

--17.
SELECT station.sta_nom AS 'Nom de la Station', AVG(DATEDIFF(reservation.res_date_fin, reservation.res_date_debut)) AS 'Durée Moyenne des Réservations (jours)'
FROM reservation
JOIN chambre ON reservation.res_cha_id = chambre.cha_id
JOIN hotel ON chambre.cha_hot_id = hotel.hot_id
JOIN station ON hotel.hot_sta_id = station.sta_id
GROUP BY station.sta_nom;
