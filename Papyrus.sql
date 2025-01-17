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
SELECT e.numcom, f.nomfou, p.libart, (l.qtecde * l.priuni) AS sous_total
FROM
entcom e
JOIN fournis f ON e.numfou = f.numfou
JOIN ligcom l ON e.numcom = l.numcom
JOIN produit p ON l.codart = p.codart
WHERE
e.obscom LIKE '%urgent%'
ORDER BY e.numcom;

--12

--13

--14

--15

--16

--17

--18

--19
SELECT
f.nomfou,
SUM(v.prix1 * l.qtecde) AS chiffre_affaires_ht,
SUM(v.prix1 * l.qtecde) * 1.2 AS chiffre_affaire_ttc
FROM
fournis f
JOIN entcom e ON f.numfou = e.numfou
JOIN ligcom l ON e.numcom = l.numcom
JOIN vente v ON l.codart = v.codart
WHERE
e.datcom >= '1993-01-01'
AND e.datcom < '1994-01-01'
GROUP BY
f.nomfou
ORDER BY chiffre_affaires_ht DESC;

--20