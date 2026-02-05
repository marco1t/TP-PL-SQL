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
