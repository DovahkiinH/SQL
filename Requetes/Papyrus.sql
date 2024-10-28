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
SELECT p.codart, p.libart, p.stkphy AS stock, p.stkale AS stock_alerte, p.qteann AS quantite_annuelle FROM produit p WHERE p.stkphy <= p.stkale AND p.qteann < 1000;

--5
SELECT SUBSTRING(f.posfou, 1, 2) AS departement, f.nomfou AS nom_fournisseur FROM fournis f WHERE SUBSTRING(f.posfou, 1, 2) IN ('75', '78', '92', '77') ORDER BY departement DESC, nom_fournisseur ASC;

--6
SELECT  * FROM entcom WHERE MONTH(datcom) IN (3, 4);

--7
SELECT numcom, datcom FROM entcom WHERE DATE(datcom) = CURDATE() AND obscom IS NOT NULL;

--8
SELECT l.numcom, SUM(l.priuni * l.qtecde) AS total_commande FROM ligcom l GROUP BY l.numcom ORDER BY total_commande DESC;

--9
SELECT l.numcom, SUM(l.priuni * l.qtecde) AS total_commande FROM ligcom l WHERE l.qtecde < 1000 GROUP BY l.numcom HAVING total_commande > 10000 ORDER BY total_commande DESC;

--10
SELECT f.nomfou, e.numcom, e.datcom FROM entcom e JOIN fournis f ON e.numfou = f.numfou ORDER BY f.nomfou ASC;

--11
SELECT e.numcom, f.nomfou, p.libart, (l.qtecde * l.priuni) AS sous_total FROM entcom e JOIN fournis f ON e.numfou = f.numfou JOIN ligcom l ON e.numcom = l.numcom JOIN produit p ON l.codart = p.codart WHERE e.obscom LIKE '%urgent%' ORDER BY e.numcom;

--12
SELECT DISTINCT f.nomfou FROM fournis f JOIN entcom e ON f.numfou = e.numfou JOIN ligcom l ON e.numcom = l.numcom;

SELECT f.nomfou FROM fournis f WHERE f.numfou IN (SELECT DISTINCT e.numfou FROM entcom e JOIN ligcom l ON e.numcom = l.numcom);

--13
SELECT e.numcom, e.datcom FROM entcom e JOIN fournis f ON e.numfou = f.numfou WHERE f.numfou = (SELECT e2.numfou FROM entcom e2 WHERE e2.numcom = "70210");

SELECT e.numcom, e.datcom FROM entcom e WHERE e.numfou = (SELECT e2.numfou FROM entcom e2 WHERE e2.numcom = '70210');


--14
SELECT p.libart, v.prix1 FROM produit p JOIN vente v ON p.codart = v.codart WHERE v.prix1 < (SELECT MIN(v2.prix1) FROM produit p2 JOIN vente v2 ON p2.codart = v2.codart WHERE p2.libart LIKE 'R%') AND p.libart NOT LIKE 'R%';

--15
SELECT p.libart, f.nomfou FROM produit p JOIN ligcom l ON p.codart = l.codart JOIN entcom e ON l.numcom = e.numcom JOIN fournis f ON e.numfou = f.numfou WHERE p.stkphy <= (1.5 * p.stkale) ORDER BY p.libart, f.nomfou;

--16
SELECT f.nomfou, p.libart FROM produit p JOIN ligcom l ON p.codart = l.codart JOIN entcom e ON l.numcom = e.numcom JOIN fournis f ON e.numfou = f.numfou JOIN vente v ON l.codart = v.codart WHERE p.stkphy <= (1.5 * p.stkale) AND v.delliv <= 30 ORDER BY f.nomfou, p.codart;

--17


--18

--19

--20