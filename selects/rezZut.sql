-- Rezept raussuchen, die eine/oder mehrere Zutaten enthalten

SELECT rez.NAME AS 'Rezeptname'
FROM REZEPT rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
WHERE zut.NAME IN ('')
;