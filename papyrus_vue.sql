-- Active: 1729172264062@@127.0.0.1@3306@papyrus

--1
CREATE VIEW v_GlobalCde
AS
SELECT codart ,
SUM (qtecde) AS QteTot ,
SUM (priuni * qtecde) AS PrixTot
FROM ligcom
GROUP BY codart;

SELECT * FROM `v_GlobalCde`

--2 
CREATE VIEW v_VentesI100
AS
SELECT *
FROM vente
WHERE codart = 'I100';

SELECT * FROM `v_VentesI100`

--3 
CREATE VIEW v_VentesI100Grobrigan
AS
SELECT *
FROM vente
WHERE codart = 'I100' AND numfou = '00120';

SELECT * FROM `v_VentesI100Grobrigan`