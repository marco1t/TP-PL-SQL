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
