-- Select um den Gesamtumsatz pro Rezept zu bekommen.
-- JOIN, AGG, GROUP BY, WHERE, CTE

-- CTE, die den Preis pro Rezept angibt
WITH cte_preisRezept AS (
    SELECT r.REZEPTID
    , SUM(rz.REZEPTZUTATENMENGE * z.PREIS_EINHEIT) AS 'Preis'
    FROM REZEPT r
    JOIN REZEPT_ZUTAT rz ON r.REZEPTID = rz.REZEPTID
    JOIN ZUTAT z ON z.ZUTATENID = rz.ZUTATENID
    GROUP BY r.REZEPTID
) 

-- CTE, die den Namen und die entsprechende Bestellmenge für Bestellungen, 
-- die bezahlt und nicht storniert worden sind, rausgibt. 
WITH cte_RezeptBestellung AS (
    SELECT r.NAME
    , r.REZEPTID
    , br.BESTELLMENGE
    FROM BESTELLUNG b
    JOIN BESTELLUNG_REZEPT br ON b.BESTELLNR = br.BESTELLNR
    JOIN REZEPT r ON r.REZEPTID = br.REZEPTID
    JOIN RECHNUNG rg ON rg.RECHNUNGSNR = b.RECHNUNGSNR
    WHERE rg.BEZAHLT IS NOT NULL AND b.BESTELLUNG IS NULL
)

-- vereint beide CTEs um den Gesamtumsatz pro Rezept als View auszugeben
CREATE OR REPLACE VIEW view_show_general_sales AS 
SELECT rzb.NAME AS 'Rezeptname'
    , SUM(rzb.BESTELLMENGE * prz.Preis) AS 'Umsatz'
FROM cte_RezeptBestellung rzb 
JOIN cte_preisRezept prz ON rzb.REZEPTID = prz.REZEPTID
GROUP BY Rezeptname
;