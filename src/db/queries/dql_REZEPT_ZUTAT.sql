-- Rezepte mit bestimmter Zutat finden: Zeigt alle Rezepte an, die eine ausgewählte Zutat enthalten
SELECT rez.NAME
FROM REZEPT rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
WHERE zut.NAME IN ('');

-- Anzahl Rezepte nach Ernährungskategorie: Entwickelt eine Abfrage, die anzeigt wie viele Rezepte pro Ernährungskategorie (z. B. vegan, vegetarisch) vorhanden sind.
SELECT
ERNAEHRUNGSKATEGORIE,
COUNT(*) AS 'Anzahl Rezepte/Kategorie'
FROM REZEPT
WHERE ERNAEHRUNGSKATEGORIE IN ('Vegan', 'Vegetarisch')
GROUP BY ERNAEHRUNGSKATEGORIE;

-- Rezepte mit wenigen Zutaten finden: Wählt alle Rezepte aus, die weniger als fünf Zutaten enthalten.
SELECT rez.NAME ,
COUNT(DISTINCT rezut.ZUTATID) AS anzZut
FROM REZEPT rez
JOIN REZEPT_ZUTAT rezut ON rez.REZEPTID = rezut.REZEPTID
GROUP BY rez.NAME
HAVING anzZut < 6;

-- Unverknüpfte Zutaten identifizieren: Findet alle Zutaten, die bisher keinem Rezept zugeordnet sind.
SELECT zut.NAME AS 'Zutat'
FROM REZEPT rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
LEFT JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
WHERE rez.NAME IS NULL;

-- Rezepte nach Kalorienmenge filtern: Stellt alle Rezepte zusammen, die eine bestimmte maximale Kalorienmenge nicht überschreiten.
SELECT r.NAME As Rezeptname, SUM(zn.KALORIEN_KCAL * rz.ZUTATENMENGE) As "Kalorienmenge (in kcal)" FROM REZEPT AS r JOIN REZEPT_ZUTAT AS rz ON r.REZEPTID = rz.REZEPTID JOIN ZUTAT AS z on rz.ZUTATENID = z.ZUTATENID JOIN ZUTAT_NAEHRWERT AS zn ON z.ZUTATENID = zn.ZUTATENID GROUP BY r.NAME HAVING SUM(zn.KALORIEN_KCAL * rz.ZUTATENMENGE) <= ? ORDER BY r.NAME;

-- Kombinierte Filter: Zeigt Rezepte an, die sowohl weniger als fünf Zutaten enthalten als auch eine bestimmte Ernährungskategorie erfüllen.
