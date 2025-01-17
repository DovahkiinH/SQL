-- Active: 1729172264062@@127.0.0.1@3306@exemple
--1
select * 
from employe;


--2
select * from dept;

--3. Afficher le nom, la date d'embauche, le numéro du supérieur, le
-- numéro de département et le salaire de tous les employés.
select nom, dateemb, nosup, nodep, salaire from employe;


SELECT nom as Employe FROM employe;



-- 4. Afficher le titre de tous les employés.
select titre from employe;


-- 5. Afficher les différentes valeurs des titres des employés
select DISTINCT titre from employe;


--6. Afficher le nom, le numéro d'employé et le numéro du
--département des employés dont le titre est « Secrétaire ».
select nom, noemp, nodep, titre
from employe
where titre='secretaire';

-- 7. Afficher le nom et le numéro de département dont le numéro de
-- département est supérieur à 40
select nom, nodept from dept where nodept>40;

-- 8. Afficher le nom et le prénom des employés dont le nom est
-- alphabétiquement antérieur au prénom.
select nom, prenom from employe where nom<prenom;


-- 9. Afficher le nom, le salaire et le numéro du département des employés
-- dont le titre est « Représentant », le numéro de département est 35 
--et le salaire est supérieur à 20000.
select nom, salaire, nodep, titre
from employe
where titre='representant' AND nodep=35 AND salaire>20000;



-- 10. Afficher le nom, le titre et le salaire des employés dont le titre est
-- « Représentant » ou dont le titre est « Président ».
select nom, titre, salaire 
from employe 
where titre='representant' OR titre='president';






-- 11. Afficher le nom, le titre, le numéro de département, le salaire des
-- employés du département 34, dont le titre est « Représentant » ou
-- « Secrétaire ».
select nom, titre, nodep, salaire 
from employe
where nodep=34 AND (titre='representant' OR titre='secretaire');



-- 12. Afficher le nom, le titre, le numéro de département, le salaire des
-- employés dont le titre est Représentant, ou dont le titre est Secrétaire
-- dans le département numéro 34.
select nom, titre, nodep, salaire 
from employe
where titre='representant' OR (nodep=34 AND titre='secretaire');



-- 13. Afficher le nom, et le salaire des employés dont le salaire est compris
-- entre 20000 et 30000.
select nom, salaire
from employe
where salaire>=20000 AND salaire<=30000;

select nom, salaire
from employe
where salaire BETWEEN 20000 AND 30000;


-- 15. Afficher le nom des employés commençant par la lettre « H ».
select nom 
from employe
where nom LIKE 'h%';


-- 16. Afficher le nom des employés se terminant par la lettre « n ».
select nom 
from employe
where nom LIKE '%n';



-- 17. Afficher le nom des employés contenant la lettre « u » en 3ème
-- position.
select nom 
from employe
where nom LIKE '__u%';






-- 18. Afficher le salaire et le nom des employés du service 41 classés par
-- salaire croissant.
select salaire, nom
from employe
where nodep=41
ORDER BY salaire ASC;

select salaire, nom
from employe
where nodep=41
ORDER BY 1 ASC;



-- 19. Afficher le salaire et le nom des employés du service 41 classés par
-- salaire décroissant.
select salaire, nom
from employe
where nodep=41
ORDER BY 1 DESC;






-- 20. Afficher le titre, le salaire et le nom des employés classés par titre
-- croissant et par salaire décroissant.
select titre, salaire, nom
from employe
where nodep=41
ORDER BY titre ASC, salaire DESC;







-- 21. Afficher le taux de commission, le salaire et le nom des employés
-- classés par taux de commission croissante.
select tauxcom, salaire, nom 
from employe
order by tauxcom ASC;



-- 22. Afficher le nom, le salaire, le taux de commission et le titre des
-- employés dont le taux de commission n'est pas renseigné.
select tauxcom, salaire, nom, titre
from employe
where tauxcom IS NULL;






-- 23. Afficher le nom, le salaire, le taux de commission et le titre des
-- employés dont le taux de commission est renseigné.
select tauxcom, salaire, nom, titre
from employe
where tauxcom IS NOT NULL;




-- 24. Afficher le nom, le salaire, le taux de commission, le titre des
-- employés dont le taux de commission est inférieur à 15.
select tauxcom, salaire, nom, titre
from employe
where tauxcom < 15;


-- 25. Afficher le nom, le salaire, le taux de commission, le titre des
-- employés dont le taux de commission est supérieur à 15.

select tauxcom, salaire, nom, titre
from employe
where tauxcom > 15;





-- 26. Afficher le nom, le salaire, le taux de commission et la commission
-- des employés dont le taux de commission n'est pas nul. (la
-- commission est calculée en multipliant le salaire par le taux de
-- commission)
select nom, salaire, tauxcom, salaire*(tauxcom/100)
from employe
where tauxcom is Not NULL;



-- 27. Afficher le nom, le salaire, le taux de commission, la commission des
-- employés dont le taux de commission n'est pas nul, classé par taux de
-- commission croissant.
select nom, salaire, tauxcom, salaire*(tauxcom/100)
from employe
where tauxcom is Not NULL
order by 4 ASC;



-- 28. Afficher le nom et le prénom (concaténés) des employés. Renommer
-- les colonnes
select CONCAT(prenom, nom) as 'Nom complet' 
from employe;



-- 29. Afficher les 5 premières lettres du nom des employés.
select nom, SUBSTRING(nom, 1, 5), LEFT(nom, 5)
from employe;



-- 30. Afficher le nom et le rang de la lettre « r » dans le nom des
-- employés.
select nom, LOCATE('r', nom)
from employe;





-- 31. Afficher le nom, le nom en majuscule et le nom en minuscule de
-- l'employé dont le nom est Vrante
select nom, UPPER(nom), LOWER(nom)
from employe
where nom='vrante';


select nom, CONCAT(UPPER(LEFT(nom, 1)), LOWER(SUBSTRING(nom, 2)))
from employe
where nom='vrante';




-- 32. Afficher le nom et le nombre de caractères du nom des employés
select nom, LENGTH(nom)
from employe;