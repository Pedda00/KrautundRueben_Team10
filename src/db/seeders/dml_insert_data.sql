INSERT INTO ADRESSE (STADT, PLZ, STRASSE, HAUSNR) VALUES
('Berlin', '10115', 'Hauptstrasse', 12),
('Hamburg', '20095', 'Reeperbahn', 3),
('München', '80331', 'Marienplatz', 1),
('Köln', '50667', 'Domstrasse', 9),
('Frankfurt', '60311', 'Zeil', 88);

INSERT INTO PERSOENLINF (VORNAME, NACHNAME) VALUES
('Anna', 'Schmidt'),
('Ben', 'Müller'),
('Carla', 'Fischer'),
('David', 'Weber'),
('Eva', 'Keller');

INSERT INTO KONTO (KONTOID, KUNDENID, EMAIL, PASSWORT, AKTIV, ERSTELLUNGS_DATUM)
VALUES
(1, 1, 'anna@example.com', 'pass123', TRUE, CURRENT_TIMESTAMP),
(2, 2, 'ben@example.com', 'pass456', TRUE, CURRENT_TIMESTAMP),
(3, 3, 'carla@example.com', 'pass789', TRUE, CURRENT_TIMESTAMP),
(4, 4, 'david@example.com', 'pass111', TRUE, CURRENT_TIMESTAMP),
(5, 5, 'eva@example.com', 'pass222', TRUE, CURRENT_TIMESTAMP);

-- 4. Kunden
INSERT INTO KUNDE (KUNDENID, PERSOENLINFID, ADRESSENID, KONTOID) VALUES
(1, 1, 1, 1),
(2, 2, 2, 2),
(3, 3, 3, 3),
(4, 4, 4, 4),
(5, 5, 5, 5);

-- 5. Lieferanten
INSERT INTO LIEFERANT (NAME, ADRESSENID) VALUES
('FrischGemüse GmbH', 1),
('BioBauer AG', 2),
('Süß & Herzhaft KG', 3),
('Feinkost Meyer', 4),
('Nordsee Fischhandel', 5);

-- 6. Ernährungskategorien
INSERT INTO ERNAEHRUNGSKATEGORIE (NAME) VALUES
('Vegan'),
('Vegetarisch'),
('Glutenfrei'),
('Low-Carb'),
('High-Protein');

-- 7. Rezepte
INSERT INTO REZEPT (NAME, URHEBER, ANLEITUNG, PORTIONEN, ZUBEREITUNGSZEIT, ERNAEHRUNGSKATEGORIE)
VALUES
('Gemüsesuppe', 'Anna Schmidt', 'Alles kleinschneiden und köcheln lassen.', 4, 30, 'Vegan'),
('Hähnchensalat', 'Ben Müller', 'Hähnchen braten, mit Salat mischen.', 2, 25, 'Low-Carb'),
('Pasta al Pomodoro', 'Carla Fischer', 'Nudeln kochen, Sauce anrühren.', 3, 20, 'Vegetarisch'),
('Smoothie Bowl', 'Eva Keller', 'Alles mixen und garnieren.', 1, 10, 'High-Protein'),
('Kartoffelauflauf', 'David Weber', 'Schichten, würzen, backen.', 5, 45, 'Vegetarisch');

-- 8. Zutaten
INSERT INTO ZUTAT (NAME, KATEGORIE, GROESSE, LAGERMENGE, EINHEIT, PREIS_EINHEIT)
VALUES
('Karotten', 'Gemüse', 500, 10000, 'g', 2),
('Hähnchenbrust', 'Fleisch', 1000, 5000, 'g', 8),
('Nudeln', 'Kohlen', 1000, 15000, 'g', 3),
('Milch', 'Flüssig', 1000, 10000, 'ml', 1),
('Bananen', 'Obst', 1000, 7000, 'g', 2);

-- 9. Nährwerte
INSERT INTO ZUTAT_NAEHRWERT (ZUTATENID, KALORIEN_KCAL, PROTEIN_G, KOHLENHYDRATE_G, ZUCKER_G, FETT_G)
VALUES
(1, 41.0, 0.9, 9.6, 4.7, 0.2),
(2, 165.0, 31.0, 0.0, 0.0, 3.6),
(3, 350.0, 12.0, 70.0, 3.0, 1.5),
(4, 42.0, 3.4, 5.0, 5.0, 1.0),
(5, 89.0, 1.1, 23.0, 12.0, 0.3);

-- 10. Allergene
INSERT INTO ALLERGEN (NAME) VALUES
('Gluten'),
('Laktose'),
('Nüsse'),
('Soja'),
('Fisch');

-- 11. Zutat-Allergen (n:m)
INSERT INTO ZUTAT_ALLERGEN (ZUTATENID, ALLERGENID) VALUES
(3, 1), -- Nudeln enthalten Gluten
(4, 2); -- Milch enthält Laktose

-- 12. Rezept-Zutat (n:m)
INSERT INTO REZEPT_ZUTAT (REZEPTID, ZUTATENID, ZUTATENMENGE) VALUES
(1, 1, 300),
(2, 2, 200),
(3, 3, 250),
(4, 5, 150),
(5, 4, 200);

-- 13. Rezept-Ernährungskategorie (n:m)
INSERT INTO REZEPT_ERNAEHRUNGSKATEGORIE (REZEPTID, ERNAEHRUNGSKATEGORIEID) VALUES
(1, 1),
(2, 4),
(3, 2),
(4, 5),
(5, 2);

-- 14. Rollen
INSERT INTO ROLLE (NAME) VALUES
('Admin'),
('Koch'),
('Lagerist'),
('Vertrieb'),
('Support');

-- 15. Mitarbeiter
INSERT INTO MITARBEITER (PERSOENLINFID, ADRESSENID, KONTOID) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

-- 16. Mitarbeiter-Rolle (n:m)
INSERT INTO MITARBEITER_ROLLE (MITARBEITERID, ROLLEID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO KUNDE_ALLERGEN (KUNDENID, ALLERGENID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);


INSERT INTO VERSANDINF (VERSANDNR, VERSANDDIENST, VERSANDDATUM, UEBERGABEDATUM) VALUES
(1, 'DHL', '2025-10-01', '2025-10-03'),
(2, 'Hermes', '2025-10-02', '2025-10-04'),
(3, 'UPS', '2025-10-05', '2025-10-06'),
(4, 'DPD', '2025-10-06', '2025-10-07'),
(5, 'GLS', '2025-10-07', '2025-10-09');


INSERT INTO RECHNUNG (RECHNUNGSNR, GESAMTPREIS, RECHNUNGSDATUM, RECHNUNGSFRIST, BEZAHLT) VALUES
(1, 49.99, '2025-10-01', '2025-10-15', TRUE),
(2, 29.99, '2025-10-02', '2025-10-16', TRUE),
(3, 79.99, '2025-10-03', '2025-10-17', FALSE),
(4, 19.99, '2025-10-04', '2025-10-18', TRUE),
