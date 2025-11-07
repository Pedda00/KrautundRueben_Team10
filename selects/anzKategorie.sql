-- Anzahl Rezepte nach Ernährungskategorie
SELECT
ERNAEHRUNGSKATEGORIE,
COUNT(*) AS 'Anzahl Rezepte/Kategorie'
FROM REZEPT
GROUP BY ERNAEHRUNGSKATEGORIE
;