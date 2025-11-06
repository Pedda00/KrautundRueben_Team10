-- Unverknüpfte Zutaten identifizieren: Findet alle Zutaten, die bisher keinem Rezept zugeordnet sind.

SELECT zut.NAME AS 'Zutat'
FROM REZEPT rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
LEFT JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
WHERE rez.NAME IS NULL
;