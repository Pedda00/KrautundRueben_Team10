-- Kombinierte Filter: Zeigt Rezepte an, die sowohl weniger als fünf Zutaten enthalten als auch eine bestimmte Ernährungskategorie erfüllen.
-- SUBSELECT, INNER JOIN, GROUP BY, AGG 

-- Anpassung des Select Statements mit wenigen Zutaten
-- SELECT r.NAME ,
--  COUNT(DISTINCT rz.ZUTATENID) AS 'Anzahl Zutaten'
-- FROM REZEPT r
-- JOIN REZEPT_ZUTAT rz ON r.REZEPTID = rz.REZEPTID
-- WHERE r.ERNAEHRUNGSKATEGORIE IN ('Vegan')
-- GROUP BY r.NAME
-- HAVING 'Anzahl Zutaten' < 6;

-- Version mit Subselect
SELECT r.NAME ,
 COUNT(DISTINCT rz.ZUTATENID) AS 'Anzahl Zutaten'
FROM (SELECT NAME, REZEPTID FROM REZEPT WHERE ERNAEHRUNGSKATEGORIE IN ('Vegan')) r
JOIN REZEPT_ZUTAT rz ON r.REZEPTID = rz.REZEPTID
GROUP BY r.NAME
HAVING 'Anzahl Zutaten' < 6;