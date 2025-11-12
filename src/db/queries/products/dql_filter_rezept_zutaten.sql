-- Rezepte mit bestimmter Zutat finden: Zeigt alle Rezepte an, die eine ausgewählte Zutat enthalten
SELECT rez.NAME
FROM REZEPT rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
WHERE zut.NAME IN ('');

/*
Zusammenfassen aller Zeilen, die zum gleichen Rezeptnamen gehören
GROUP BY rez.NAME
*/
