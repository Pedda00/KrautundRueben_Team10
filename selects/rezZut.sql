-- Rezept raussuchen, die eine/oder mehrere Zutaten enthalten

SELECT rez.NAME AS 'Rezeptname'
FROM REZEPT rez
JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
WHERE zut.NAME IN ('?')
;


-- TODO: lookup how procedures work, not important
-- DELIMITER //

-- CREATE PROCEDURE IF NOT EXISTS procedure_filter_ingredient (IN zutat VARCHAR(1000), OUT rezepte VARCHAR(1000))
-- BEGIN 
-- SELECT rez.NAME AS 'Rezeptname'
-- FROM REZEPT rez
-- JOIN REZEPT_ZUTAT rz ON rez.REZEPTID = rz.REZEPTID
-- JOIN ZUTAT zut ON zut.ZUTATENID = rz.ZUTATENID
-- WHERE zut.NAME IN (zutat)
-- ;
-- END;
-- // DELIMITER;