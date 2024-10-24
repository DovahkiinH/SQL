--1
CREATE PROCEDURE Lst_fournis()
BEGIN
SELECT fournis.numfou
FROM fournis
JOIN entcom ON fournis.numfou = entcom.numfou; 
END

CALL `Lst_fournis`

SHOW CREATE PROCEDURE Lst_fournis;

--2
CREATE PROCEDURE Lst_Commandes()
BEGIN
SELECT e.numcom, f.nomfou, p.libart, (l.qtecde * l.priuni) AS sous_total
FROM
entcom e
JOIN fournis f ON e.numfou = f.numfou
JOIN ligcom l ON e.numcom = l.numcom
JOIN produit p ON l.codart = p.codart
WHERE
e.obscom LIKE '%urgent%'
ORDER BY e.numcom;
END
CALL `Lst_Commandes`

--3
CREATE PROCEDURE CA_Fournisseur()
BEGIN
IF EXISTS()
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
END