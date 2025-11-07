-- Anzahl Rezepte nach Ernährungskategorie
-- GROUP BY, AGG

SELECT
ERNAEHRUNGSKATEGORIE,
COUNT(*) AS 'Anzahl Rezepte/Kategorie'
FROM REZEPT
GROUP BY ERNAEHRUNGSKATEGORIE
;