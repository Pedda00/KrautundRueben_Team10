INSERT INTO ADRESSE (STADT, PLZ, STRASSE, HAUSNR) VALUES
('Hamburg', '22085', 'Hamburger Straße', 123),
('Berlin', '10115', 'Unter den Linden', 17),
('München', '80333', 'Marienplatz', 1),
('Köln', '50667', 'Hohe Straße', 41),
('Frankfurt', '60311', 'Zeil', 90),
('Stuttgart', '70173', 'Königstraße', 28),
('Düsseldorf', '40213', 'Königsallee', 1),
('Dortmund', '44137', 'Westenhellweg', 85),
('Essen', '45127', 'Limbecker Platz', 1),
('Leipzig', '04109', 'Grimmaische Straße', 1),
('Bremen', '28195', 'Sögestraße', 18),
('Dresden', '01067', 'Prager Straße', 22);

INSERT INTO RECHNUNG (RECHNUNGSNR, GESAMTPREIS, RECHNUNGSDATUM, RECHNUNGSFRIST, BEZAHLT) VALUES
(1, 120.50, '2023-01-15', '2023-02-15', TRUE),
(2, 85.00, '2023-02-20', '2023-03-20', FALSE),
(3, 250.75, '2023-03-10', '2023-04-10', TRUE),
(4, 45.20, '2023-04-05', '2023-05-05', TRUE),
(5, 99.99, '2023-05-01', '2023-06-01', FALSE),
(6, 1500.00, '2023-06-12', '2023-07-12', TRUE),
(7, 30.00, '2023-07-18', '2023-08-18', FALSE),
(8, 75.50, '2023-08-24', '2023-09-24', TRUE),
(9, 110.25, '2023-09-02', '2023-10-02', FALSE),
(10, 55.80, '2023-10-10', '2023-11-10', TRUE),
(11, 160.00, '2023-11-05', '2023-12-05', TRUE),
(12, 25.00, '2023-12-01', '2024-01-01', FALSE);

INSERT INTO VERSANDINF (VERSANDNR, VERSANDDIENST, VERSANDDATUM, UEBERGABEDATUM) VALUES
(100, 'DHL', '2023-01-16', '2023-01-18'),
(101, 'Hermes', '2023-02-21', '2023-02-23'),
(102, 'UPS', '2023-03-11', '2023-03-13'),
(103, 'DPD', '2023-04-06', '2023-04-08'),
(104, 'GLS', '2023-05-02', '2023-05-04'),
(105, 'DHL Express', '2023-06-13', '2023-06-14'),
(106, 'FedEx', '2023-07-19', '2023-07-21'),
(107, 'TNT', '2023-08-25', '2023-08-27'),
(108, 'Deutsche Post', '2023-09-03', '2023-09-05'),
(109, 'Amazon Logistics', '2023-10-11', '2023-10-13'),
(110, 'UPS', '2023-11-06', '2023-11-08'),
(111, 'Hermes', '2023-12-02', '2023-12-04');

INSERT INTO ALLERGEN (NAME) VALUES
('Gluten'),
('Laktose'),
('Nüsse'),
('Erdnüsse'),
('Soja'),
('Eier'),
('Fisch'),
('Krebstiere'),
('Sellerie'),
('Senf'),
('Sesam'),
('Sulfite');


INSERT INTO ERNAEHRUNGSKATEGORIE (NAME) VALUES
('Vegetarisch'),
('Vegan'),
('Glutenfrei'),
('Laktosefrei'),
('Zuckerfrei'),
('Low Carb'),
('Paleo'),
('Ketogen'),
('Bio'),
('Halal'),
('Koscher'),
('Vollwertig');

INSERT INTO KONTO (KONTOID, KUNDENID, EMAIL, PASSWORT, AKTIV, LETZTE_ANMELDUNG, ERSTELLUNGS_DATUM) VALUES
(1, 101, 'user1@example.com', 'hashed_password_1', TRUE, '2023-11-15 10:00:00', '2023-01-01 12:00:00'),
(2, 102, 'user2@example.com', 'hashed_password_2', FALSE, NULL, '2023-02-10 14:30:00'),
(3, 103, 'user3@example.com', 'hashed_password_3', TRUE, '2023-11-14 18:45:00', '2023-03-22 08:15:00'),
(4, 104, 'user4@example.com', 'hashed_password_4', TRUE, '2023-11-15 09:20:00', '2023-04-05 16:00:00'),
(5, 105, 'user5@example.com', 'hashed_password_5', FALSE, NULL, '2023-05-18 11:50:00'),
(6, 106, 'user6@example.com', 'hashed_password_6', TRUE, '2023-11-13 20:10:00', '2023-06-30 09:00:00'),
(7, 107, 'user7@example.com', 'hashed_password_7', FALSE, NULL, '2023-07-12 13:40:00'),
(8, 108, 'user8@example.com', 'hashed_password_8', TRUE, '2023-11-14 15:25:00', '2023-08-25 07:30:00'),
(9, 109, 'user9@example.com', 'hashed_password_9', TRUE, '2023-11-15 11:05:00', '2023-09-08 19:00:00'),
(10, 110, 'user10@example.com', 'hashed_password_10', FALSE, NULL, '2023-10-01 10:45:00'),
(11, 111, 'user11@example.com', 'hashed_password_11', TRUE, '2023-11-12 16:30:00', '2023-11-03 14:00:00'),
(12, 112, 'user12@example.com', 'hashed_password_12', TRUE, '2023-11-15 12:15:00', '2023-12-01 11:00:00');

INSERT INTO LIEFERANT (NAME, ADRESSENID) VALUES
('BioMarkt GmbH', 1),
('FrischeParadies AG', 2),
('Naturkost West GmbH', 3),
('Ökoring Handels GmbH', 4),
('bodengut GmbH', 5),
('Terra Naturkosthandel', 6),
('Weiling GmbH', 7),
('dennree GmbH', 8),
('basic AG', 9),
('SuperBioMarkt AG', 10),
('Vitalia GmbH', 11),
('Arche Naturprodukte GmbH', 12);

INSERT INTO PERSOENLINF (VORNAME, NACHNAME) VALUES
('Max', 'Mustermann'),
('Anna', 'Schmidt'),
('Peter', 'Wagner'),
('Julia', 'Becker'),
('Michael', 'Fischer'),
('Lisa', 'Weber'),
('Thomas', 'Meyer'),
('Sandra', 'Schulz'),
('Daniel', 'Hoffmann'),
('Laura', 'Klein'),
('Christian', 'Wolf'),
('Sabine', 'Richter');

INSERT INTO ZUTAT (NAME, KATEGORIE, GROESSE, LAGERMENGE, EINHEIT, PREIS_EINHEIT) VALUES
('Weizenmehl', 'Getreide', 1000, 5000, 'g', 2),
('Zucker', 'Sonstiges', 1000, 3000, 'g', 1),
('Milch', 'Milchprod.', 50, 5, 'ml', 3),
('Eier', 'Sonstiges', 1, 240, 'Anzahl', 4),
('Butter', 'Milchprod.', 50, 1000, 'g', 5),
('Salz', 'Sonstiges', 10, 2000, 'g', 1),
('Hefe', 'Sonstiges', 5, 100, 'g', 2),
('Tomaten', 'Gemüse', 1, 10, 'Anzahl', 3),
('Olivenöl', 'Öl', 250, 2000, 'ml', 6),
('Basilikum', 'Kräuter', 20, 100, 'g', 4),
('Knoblauch', 'Gemüse', 1, 15, 'Anzahl', 2),
('Zwiebeln', 'Gemüse', 1, 20, 'Anzahl', 1);

INSERT INTO ROLLE (NAME) VALUES
('Admin'),
('IT'),
('Einkauf'),
('Kunde'),
('HR'),
('Buchhaltung'),
('Chef'),
('Marketing'),
('Lager');

INSERT INTO ZUTAT_ALLERGEN (ZUTATENID, ALLERGENID) VALUES
(1, 1),  
(3, 2),  
(4, 6),  
(9, 3),
(5, 2);  

INSERT INTO ZUTAT_NAEHRWERT (ZUTATENID, KALORIEN_KCAL, PROTEIN_G, KOHLENHYDRATE_G, ZUCKER_G, FETT_G, GESAETTIGTE_FETTSAUREN_G, BALLASTSTOFFE_G, NATRIUM_G) VALUES
(1, 364.00, 10.700, 76.300, 0.300, 1.500, 0.200, 2.700, 0.002),  -- Weizenmehl (pro 100g)
(2, 400.00, 0.000, 100.000, 99.900, 0.000, 0.000, 0.000, 0.000),  -- Zucker (pro 100g)
(3, 42.00, 3.400, 4.800, 4.800, 1.000, 0.600, 0.000, 0.050),  -- Milch (pro 100ml)
(4, 155.00, 12.600, 1.100, 1.100, 10.600, 3.300, 0.000, 0.140),  -- Eier (pro 100g, ca. 2 Eier)
(5, 717.00, 0.900, 0.100, 0.100, 81.100, 51.400, 0.000, 0.011),  -- Butter (pro 100g)
(6, 0.00, 0.000, 0.000, 0.000, 0.000, 0.000, 0.000, 38.758),  -- Salz (pro 100g)
(7, 321.00, 46.000, 32.000, 0.000, 1.500, 0.300, 0.000, 0.070),  -- Hefe (pro 100g)
(8, 18.00, 0.900, 3.900, 2.600, 0.200, 0.000, 1.200, 0.005),  -- Tomaten (pro 100g)
(9, 884.00, 0.000, 0.000, 0.000, 100.000, 14.000, 0.000, 0.000),  -- Olivenöl (pro 100g)
(10, 23.00, 3.100, 0.500, 0.300, 0.500, 0.100, 1.600, 0.001),  -- Basilikum (pro 100g)
(11, 149.00, 6.400, 33.000, 2.400, 0.500, 0.100, 2.100, 0.017),  -- Knoblauch (pro 100g)
(12, 40.00, 1.100, 9.000, 4.200, 0.100, 0.000, 1.700, 0.004);  -- Zwiebeln (pro 100g)

INSERT INTO REZEPT (NAME, URHEBER, ANLEITUNG, PORTIONEN, ZUBEREITUNGSZEIT) VALUES
('Tomatensoße', 'Anna Schmidt', '1. Zwiebel und Knoblauch hacken und in Olivenöl andünsten. 2. Tomaten hinzufügen und köcheln lassen. 3. Mit Salz, Pfeffer und Basilikum abschmecken.', 4, 30),
('Einfaches Brot', 'Max Mustermann', '1. Hefe in warmem Wasser auflösen. 2. Mehl, Salz und Hefe-Wasser mischen und kneten. 3. Teig gehen lassen. 4. Brot backen.', 10, 60),
('Rührei', 'Lisa Weber', '1. Eier mit Milch und Salz verquirlen. 2. Butter in einer Pfanne schmelzen. 3. Eier in die Pfanne geben und stocken lassen.', 2, 15);

INSERT INTO REZEPT_ZUTAT (REZEPTID, ZUTATENID, REZEPT_ZUTATENMENGE) VALUES
(1, 12, 1),   -- Tomatensoße - Zwiebeln (1)
(1, 11, 2),   -- Tomatensoße - Knoblauch (2)
(1, 8, 5),    -- Tomatensoße - Tomaten (5)
(1, 9, 50),   -- Tomatensoße - Olivenöl (50 ml)
(1, 10, 10),  -- Tomatensoße - Basilikum (10 g)
(1, 6, 5),    -- Tomatensoße - Salz (5 g)
(2, 1, 500),  -- Einfaches Brot - Weizenmehl (500 g)
(2, 6, 10),  -- Einfaches Brot - Salz (10 g)
(2, 7, 10),  -- Einfaches Brot - Hefe (10 g)
(2, 3, 200),  -- Einfaches Brot - Milch (200 ml)
(3, 4, 3),    -- Rührei - Eier (3)
(3, 3, 50),   -- Rührei - Milch (50 ml)
(3, 5, 10),   -- Rührei - Butter (10 g)
(3, 6, 2);    -- Rührei - Salz (2 g)

INSERT INTO REZEPT_ERNAEHRUNGSKATEGORIE (REZEPTID, ERNAEHRUNGSKATEGORIEID) VALUES
(1, 4),  -- Tomatensoße - Vegan (Laktosefrei)
(1, 1),  -- Tomatensoße - Vegetarisch
(2, 1),  -- Einfaches Brot - Vegetarisch
(3, 1);  -- Rührei - Vegetarisch

INSERT INTO LIEFERANT_ZUTAT (ZUTATENID, LIEFERANTENID) VALUES
(1, 1), 
(2, 2),  
(3, 3),   
(4, 4),   
(5, 1),  
(6, 2),  
(7, 3), 
(8, 4),
(9, 5), 
(10, 6), 
(11, 7),  
(12, 8),
(1, 2),   
(3, 4);   

INSERT INTO KUNDE (PERSOENLINFID, ADRESSENID, KONTOID) VALUES
(1, 1, 1),   -- Max Mustermann - Hamburger Straße - user1@example.com
(2, 2, 2),   -- Anna Schmidt - Unter den Linden - user2@example.com
(3, 3, 3),   -- Peter Wagner - Marienplatz - user3@example.com
(4, 4, 4),   -- Julia Becker - Hohe Straße - user4@example.com
(5, 5, 5),   -- Michael Fischer - Zeil - user5@example.com
(6, 6, 6),   -- Lisa Weber - Königstraße - user6@example.com
(7, 7, 7),   -- Thomas Meyer - Königsallee - user7@example.com
(8, 8, 8),   -- Sandra Schulz - Westenhellweg - user8@example.com
(9, 9, 9),   -- Daniel Hoffmann - Limbecker Platz - user9@example.com
(10, 10, 10), -- Laura Klein - Grimmaische Straße - user10@example.com
(11, 11, 11), -- Christian Wolf - Sögestraße - user11@example.com
(12, 12, 12); -- Sabine Richter - Prager Straße - user12@example.com

INSERT INTO KUNDE_ALLERGEN (KUNDENID, ALLERGENID) VALUES
(1, 1),   -- Max Mustermann - Gluten
(1, 2),   -- Max Mustermann - Laktose
(2, 3),   -- Anna Schmidt - Nüsse
(3, 4),   -- Peter Wagner - Erdnüsse
(4, 1),   -- Julia Becker - Gluten
(5, 5),   -- Michael Fischer - Soja
(6, 2),   -- Lisa Weber - Laktose
(7, 6),   -- Thomas Meyer - Eier
(8, 7),   -- Sandra Schulz - Fisch
(9, 8),   -- Daniel Hoffmann - Krebstiere
(10, 9),  -- Laura Klein - Sellerie
(11, 10), -- Christian Wolf - Senf
(12, 11),
(2, 4),   -- Anna Schmidt - Erdnüsse (zusätzlich zu Nüssen)
(5, 6);   -- Michael Fischer - Eier (zusätzlich zu Soja)

INSERT INTO BESTELLUNG (BESTELLNR, KUNDENID, STORNIERT, VERSANDNR, RECHNUNGSNR) VALUES
(1001, 1, FALSE, 100, 1),(1002, 2, FALSE, 101, 2),(1003, 3, TRUE, NULL, 3),(1004, 4, FALSE, 102, 4),(1005, 5, FALSE, 103, 5),(1006, 6, TRUE, NULL, 6),(1007, 7, FALSE, 104, 7),(1008, 8, FALSE, 105, 8),(1009, 9, FALSE, 106, 9),(1010, 10, TRUE, NULL, 10);

INSERT INTO BESTELLUNG_ZUTAT (BESTELLNR, ZUTATENID, BESTELLUNG_ZUTATENMENGE) VALUES
(1001, 1, 1000),(1001, 2, 500),(1002, 3, 2000),(1003, 4, 12),(1004, 5, 250),(1005, 6, 1000),(1006, 7, 50),(1007, 8, 3),(1008, 9, 500),(1009, 10, 20),(1010, 11, 1),(1001, 12, 2),(1002, 1, 500);

INSERT INTO BESTELLUNG_REZEPT (BESTELLNR, REZEPTID, REZEPTMENGE) VALUES
(1001, 1, 2),(1002, 2, 1),(1003, 3, 4),(1004, 1, 1),(1005, 2, 2),(1006, 3, 2),(1007, 1, 3),(1008, 2, 1),(1009, 3, 1),(1010, 1, 1),(1001, 2, 1);

INSERT INTO MITARBEITER (PERSOENLINFID, ADRESSENID, KONTOID) VALUES
(1, 1, 1),(2, 2, 2),(3, 3, 3),(4, 4, 4),(5, 5, 5),(6, 6, 6),(7, 7, 7),(8, 8, 8),(9, 9, 9),(10, 10, 10);

INSERT INTO MITARBEITER_ROLLE (MITARBEITERID, ROLLEID) VALUES
(1, 1),(2, 2),(3, 3),(4, 4),(5, 5),(6, 6),(7, 7),(8, 8),(9, 9),(10, 3),(1, 2),(7, 6);

INSERT INTO LOG (MITARBEITERID, AKTION, ZIELTABELLE, ZIELID) VALUES
(1, 'CREATE', 'ZUTAT', '13'),(2, 'UPDATE', 'REZEPT', '4'),(3, 'DELETE', 'KUNDE', '11'),(4, 'INSERT', 'BESTELLUNG', '1011'),(5, 'UPDATE', 'MITARBEITER', '2'),(6, 'SELECT', 'KUNDE', '*'),(7, 'UPDATE', 'REZEPT', '1'),(8, 'INSERT', 'ZUTAT', '14'),(9, 'DELETE', 'LIEFERANT', '5'),(10, 'UPDATE', 'BESTELLUNG', '1002');
