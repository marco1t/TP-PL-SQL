-- Selections simples (SELECT / FROM / WHERE)

-- 1. Afficher tous les voyageurs
SELECT * FROM Voyageur;

-- 2. Afficher le nom et la region de tous les voyageurs vivant en Corse
SELECT nom, region FROM Voyageur WHERE region = 'Corse';

-- 3. Afficher les logements situes dans les Alpes
SELECT * FROM Logement WHERE lieu = 'Alpes';

-- 4. Afficher le nom et le type des logements ayant une capacite superieure a 30
SELECT nom, type FROM Logement WHERE capacite > 30;

-- 5. Afficher les logements dont le type est Hotel ou Gite
SELECT * FROM Logement WHERE type = 'Hôtel' OR type = 'Gîte';

-- 6. Afficher les voyageurs dont la region n'est pas Bretagne
SELECT * FROM Voyageur WHERE region != 'Bretagne';

-- 7. Afficher les sejours commencant avant le jour 20
SELECT * FROM Sejour WHERE debut < 20;

-- 8. Afficher les activites dont la description contient le mot deriveur
SELECT * FROM Activite WHERE description LIKE '%dériveur%';

-- Tri et limitation (ORDER BY / LIMIT)

-- 9. Afficher les voyageurs tries par nom alphabetique
SELECT * FROM Voyageur ORDER BY nom;

-- 10. Afficher les logements tries par capacite decroissante
SELECT * FROM Logement ORDER BY capacite DESC;

-- 11. Afficher les 2 logements ayant la plus grande capacite
SELECT * FROM Logement ORDER BY capacite DESC LIMIT 2;

-- Conjonction, disjonction et negation (AND / OR / NOT)

-- 12. Afficher les voyageurs habitant Corse ou Bretagne
SELECT * FROM Voyageur WHERE region = 'Corse' OR region = 'Bretagne';

-- 13. Afficher les logements situes en Corse et de type Gite
SELECT * FROM Logement WHERE lieu = 'Corse' AND type = 'Gîte';

-- 14. Afficher les logements non situes en Alpes
SELECT * FROM Logement WHERE NOT lieu = 'Alpes';

-- 15. Afficher les sejours ayant un debut > 15 et une fin < 23
SELECT * FROM Sejour WHERE debut > 15 AND fin < 23;

-- Jointures entre tables

-- 16. Afficher le nom des voyageurs et le nom du logement de chacun de leurs sejours
SELECT V.nom, L.nom 
FROM Voyageur V
JOIN Sejour S ON V.idVoyageur = S.idVoyageur
JOIN Logement L ON S.codeLogement = L.code;

-- 17. Afficher les voyageurs ayant sejourne en Corse
SELECT DISTINCT V.* 
FROM Voyageur V
JOIN Sejour S ON V.idVoyageur = S.idVoyageur
JOIN Logement L ON S.codeLogement = L.code
WHERE L.lieu = 'Corse';

-- 18. Afficher les voyageurs ayant sejourne dans les Alpes
SELECT DISTINCT V.* 
FROM Voyageur V
JOIN Sejour S ON V.idVoyageur = S.idVoyageur
JOIN Logement L ON S.codeLogement = L.code
WHERE L.lieu = 'Alpes';

-- 19. Afficher le type et le lieu des logements visites par Nicolas Bouvier
SELECT L.type, L.lieu 
FROM Logement L
JOIN Sejour S ON L.code = S.codeLogement
JOIN Voyageur V ON S.idVoyageur = V.idVoyageur
WHERE V.prenom = 'Nicolas' AND V.nom = 'Bouvier';

-- 20. Afficher les activites proposees dans les logements ou Phileas Fogg a sejourne
SELECT A.* 
FROM Activite A
JOIN Sejour S ON A.codeLogement = S.codeLogement
JOIN Voyageur V ON S.idVoyageur = V.idVoyageur
WHERE V.prenom = 'Phileas' AND V.nom = 'Fogg';

-- 21. Afficher les sejours avec le nom du voyageur et le lieu du logement associe
SELECT S.idSejour, V.nom, L.lieu
FROM Sejour S
JOIN Voyageur V ON S.idVoyageur = V.idVoyageur
JOIN Logement L ON S.codeLogement = L.code;

-- 22. Afficher le nom des voyageurs ayant effectue au moins un sejour, ainsi que l'identifiant du sejour
SELECT V.nom, S.idSejour
FROM Voyageur V
JOIN Sejour S ON V.idVoyageur = S.idVoyageur;

-- 23. Afficher le nom des voyageurs et le nom des logements uniquement pour les sejours existants
SELECT V.nom, L.nom
FROM Voyageur V
JOIN Sejour S ON V.idVoyageur = S.idVoyageur
JOIN Logement L ON S.codeLogement = L.code;

-- 24. Afficher tous les voyageurs, ainsi que leurs sejours s'ils existent
SELECT V.*, S.idSejour
FROM Voyageur V
LEFT JOIN Sejour S ON V.idVoyageur = S.idVoyageur;

-- 25. Afficher les voyageurs n'ayant effectue aucun sejour
SELECT V.*
FROM Voyageur V
LEFT JOIN Sejour S ON V.idVoyageur = S.idVoyageur
WHERE S.idSejour IS NULL;

-- 26. Afficher tous les logements, ainsi que les activites proposees (si elles existent)
SELECT L.*, A.codeActivite, A.description
FROM Logement L
LEFT JOIN Activite A ON L.code = A.codeLogement;

-- 27. Afficher tous les sejours, meme si le logement associe n'existe pas
SELECT S.*, L.nom
FROM Sejour S
LEFT JOIN Logement L ON S.codeLogement = L.code;

-- 28. Afficher tous les voyageurs et tous les sejours, y compris ceux sans correspondance
SELECT V.*, S.*
FROM Voyageur V
LEFT JOIN Sejour S ON V.idVoyageur = S.idVoyageur
UNION
SELECT V.*, S.*
FROM Voyageur V
RIGHT JOIN Sejour S ON V.idVoyageur = S.idVoyageur;

-- 29. Afficher les logements qui ne proposent aucune activite
SELECT L.*
FROM Logement L
LEFT JOIN Activite A ON L.code = A.codeLogement
WHERE A.codeActivite IS NULL;

-- 30. Afficher les voyageurs qui n'ont jamais sejourne dans aucun logement
SELECT V.*
FROM Voyageur V
LEFT JOIN Sejour S ON V.idVoyageur = S.idVoyageur
WHERE S.idSejour IS NULL;

-- 31. Afficher le nom du logement et le code activite (NULL si pas d'activite)
SELECT L.nom AS logement, A.codeActivite
FROM Logement L
LEFT JOIN Activite A ON L.code = A.codeLogement;
