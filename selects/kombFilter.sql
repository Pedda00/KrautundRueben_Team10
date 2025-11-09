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
SELECT r.NAME Rezept
-- optional ANzahl Zutaten
-- , COUNT(DISTINCT rz.ZUTATENID) AS 'Anzahl Zutaten'
FROM (
    SELECT r.NAME, 
    r.REZEPTID 
    FROM REZEPT r
    JOIN REZEPT_ERNAEHRUNGSKATEGORIE re ON r.REZEPTID = re.REZEPTID
    JOIN ERNAEHRUNGSKATEGORIE e ON re.ERNAEHRUNGSKATEGORIEID = e.ERNAEHRUNGSKATEGORIEID    
    WHERE e.NAME IN ('Vegan')
    ) rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
GROUP BY rez.NAME
HAVING COUNT(DISTINCT rz.ZUTATENID) < 6
;


-- Version mit CTE
WITH cte_spezielle_kategorie
AS (
    SELECT *
    FROM REZEPT r 
    JOIN REZEPT_ERNAEHRUNGSKATEGORIE re ON r.REZEPTID = re.REZEPTID
    JOIN ERNAEHRUNGSKATEGORIE e ON re.ERNAEHRUNGSKATEGORIEID = e.ERNAEHRUNGSKATEGORIEID
    WHERE e.NAME IN ('Vegan')
)
-- noch ein Problem damit, dass Ernährungskategorie und Rezepte beide den Spaltennamen 'NAME' haben

SELECT cte.NAME FROM cte_spezielle_kategorie cte
JOIN REZEPT_ZUTAT rz ON cte.REZEPTID = rz.REZEPTID
GROUP BY cte.NAME
HAVING COUNT(DISTINCT rz.ZUTATENID) < 6
;
