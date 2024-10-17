select * from employe;


select * from dept;



select employe.nom, prenom, dept.nom
from employe
join dept on employe.nodep=dept.nodept;




select salarie.prenom, patron.prenom
from employe as patron
join employe as salarie on patron.noemp=salarie.nosup;




--37.
SELECT nom,titre 
FROM employe
WHERE titre = (
    SELECT titre
    FROM employe
    WHERE nom= 'Amartakaldire');



--38.
SELECT nom, salaire, nodep 
FROM `employe` 
WHERE salaire > ANY (SELECT salaire FROM `employe` 
WHERE nodep = '31') ORDER BY nodep, salaire ASC;




--39.
SELECT nom, salaire, nodep 
FROM `employe` WHERE salaire > ALL (SELECT salaire FROM `employe` 
WHERE nodep = '31') 
ORDER BY nodep, salaire ASC;





--40.
SELECT nom, titre 
FROM `employe` 
WHERE titre IN (SELECT titre FROM `employe` WHERE nodep = '32') AND nodep = '31';



--41.
SELECT nom, titre 
FROM `employe` WHERE titre NOT IN (SELECT titre FROM `employe` 
WHERE nodep = '32') AND nodep = '31';




--42.
SELECT nom, titre, salaire 
FROM `employe` 
WHERE titre IN (SELECT titre FROM `employe` WHERE nom = 'Fairent') AND salaire IN (SELECT salaire FROM `employe` WHERE nom = 'Fairent');




--43.
SELECT employe.nodep, dept.nom, employe.nom 
FROM employe LEFT JOIN dept ON employe.nodep = dept.nodept 
ORDER BY employe.nodep;




--44.
SELECT titre, COUNT(*) AS nb_employes 
FROM employe 
GROUP BY titre;



--45.
SELECT AVG(salaire) AS 'moy_salaire', SUM(salaire) AS 'som_salaire', nodep 
FROM `employe` 
GROUP BY nodep;




--46.
SELECT nodep 
FROM employe 
GROUP BY nodep HAVING COUNT(*) >= 3;



--47.
SELECT LEFT(nom, 1) AS initiale, COUNT(*) AS nombre_employes 
FROM employe
GROUP BY LEFT(nom, 1) HAVING COUNT(*) >= 3;




--48.
SELECT MAX(salaire) AS salaire_max, MIN(salaire) AS salaire_min, MAX(salaire) - MIN(salaire) 
AS ecart 
FROM employe;




--49.
SELECT COUNT(DISTINCT titre) AS nombre_de_titres 
FROM employe;



--50.
SELECT titre, COUNT(*) as nb_employees 
FROM employe 
GROUP BY titre;



--51.
SELECT COUNT(employe.nom), dept.nom 
FROM employe JOIN dept ON employe.nodep = dept.nodept 
GROUP BY dept.nom;



--52.
SELECT titre, AVG(salaire) AS moyenne_salaires 
FROM employe 
GROUP BY titre 
HAVING moyenne_salaires > (SELECT AVG(salaire) FROM employe WHERE titre = 'Representant'); 



--53.
SELECT COUNT(salaire) AS nombre_salaires, 
COUNT(tauxcom) AS nombre_de_taux_com
FROM employe;