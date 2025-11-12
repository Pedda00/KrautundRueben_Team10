-- Rezepte mit wenigen Zutaten finden: 
-- Wählt alle Rezepte aus, die weniger als fünf Zutaten enthalten.
-- INNER JOIN, GROUP BY, AGG

SELECT r.NAME ,
COUNT(DISTINCT rz.ZUTATENID) AS 'Anzahl Zutaten'
FROM REZEPT r
JOIN REZEPT_ZUTAT rz ON r.REZEPTID = rz.REZEPTID
GROUP BY r.NAME
HAVING 'Anzahl Zutaten' < 6;