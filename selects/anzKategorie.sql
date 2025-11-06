-- Anzahl Rezepte nach Ernährungskategorie
SELECT
ERNAEHRUNGSKATEGORIE,
COUNT(*) AS 'Anzahl Rezepte/Kategorie'
FROM REZEPT
WHERE ERNAEHRUNGSKATEGORIE IN ('Vegan', 'Vegetarisch')
GROUP BY ERNAEHRUNGSKATEGORIE
;