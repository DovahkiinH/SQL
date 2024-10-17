-- Active: 1729172264062@@127.0.0.1@3306@papyrus

--1.
SELECT *
FROM entcom
WHERE numfou = '9120';

--2.
SELECT fournis.numfou
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou; 

--3
SELECT COUNT(DISTINCT e.numcom) AS nombre_commandes, COUNT(DISTINCT e.numfou) AS nombre_fournisseurs 
FROM entcom e;

--4

--5

--6

--7

--8

--9

--10

--11

--12

--13

--14

--15

--16

--17

--18

--19

--20