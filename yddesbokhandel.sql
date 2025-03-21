/* INLÄMNING 2 - Pontus Ydström, YH 2024 */
CREATE DATABASE YddesBokhandel;
USE YddesBokhandel;

-- Skapar tabellen Böcker
CREATE TABLE Böcker (
    BokID INT AUTO_INCREMENT PRIMARY KEY,
    ISBN VARCHAR(20) UNIQUE NOT NULL,
    Titel VARCHAR(100) NOT NULL,
    Författare VARCHAR(50) NOT NULL,
	`Antal i lager` INT NOT NULL,
    `Pris per styck i SEK` DECIMAL(8,2) NOT NULL
);

-- Skapar tabellen Kunder
CREATE TABLE Kunder (
	KundID INT AUTO_INCREMENT PRIMARY KEY,
    Namn VARCHAR(50) NOT NULL,
    Adress VARCHAR(50) NOT NULL,
    Telefon VARCHAR(20) NOT NULL,
    Epostadress VARCHAR(50) NOT NULL UNIQUE
    );
    
-- Skapar tabellen Beställningar
CREATE TABLE Beställningar (
	OrdernummerID INT AUTO_INCREMENT PRIMARY KEY,
    Datum DATETIME DEFAULT CURRENT_TIMESTAMP,
    KundID INT NOT NULL,
    Totalbelopp DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
    );
    
-- Skapar tabellen Orderrader
    CREATE TABLE Orderrader (
    OrderradID INT AUTO_INCREMENT PRIMARY KEY,
    OrdernummerID INT NOT NULL,
    BokID INT NOT NULL,
    Antal INT NOT NULL,
    `Pris per styck i SEK` DECIMAL(8,2) NOT NULL,
    FOREIGN KEY (OrdernummerID) REFERENCES Beställningar(OrdernummerID),
    FOREIGN KEY (BokID) REFERENCES Böcker(BokID)
);

    -- Infogar data i tabellen Böcker
    INSERT INTO Böcker (ISBN, Titel, Författare, `Antal i lager`, `Pris per styck i SEK`) VALUES
    ("9789197655460", "Den svenska historien om världens snabbaste bilsport", "Christina Boden", 5, 294.00),
	("9781788842686", "Grands Prix", "Motorsport Images", 1, 743.99),
    ("9789180066068", "Cirkus Formel 1", "Anna Andersson", 8, 259.00),
    ("9780241712443", "Grand Prix", "Will Buxton", 20, 360.00),
    ("9781785949241", "How to read F1", "Jennie Gow", 8, 190.00),
    ("9781035418756", "Formula 1 2025", "Bruce Jones", 4, 224.00),
    ("9780008196806", "How to Build a Car", "Adrian Newey", 22, 277.35),
    ("9781471162381", "Total Competition: Lessons in Strategy from Formula One", "Ross Brawn", 4, 102.85),
    ("9781787290433", "The Mechanic: The Secret World of The F1 Pitlane", "Marc Priestley", 19, 123.86);
    
    -- Infogar data i tabellen Kunder
INSERT INTO Kunder (Namn, Adress, Telefon, Epostadress) VALUES
	("Anna Andersson", "Fogdegatan 11, 268 20 Kågeröd", "0487-326 12", "anna@globalemail.com"),
    ("Berit Beritsson", "Skogsvägen 13C 389 40 Svansta", "0981-753 10", "beritblatand@unicastemail.com"),
    ("Rut Hjärtrudsson", "Altanstigen 1 873 20 Lingonberget", "078-819 20 12", "rutirutan@gmail.com"),
    ("Boris Knapphatt", "Himmelsvägen 47C 921 98 Himmelriket", "073-461 23 23", "borisknapphatt@live.com"),
    ("Gösta Lagerkrans", "Stuprörsstigen 34 478 21 Lustgasriket", "021-431 22", "lagerkransgosta@emailkonto.se"),
    ("Hjördis Buske", "Plommonruinen 98 777 21 Hybrisorten", "097-778 78", "buskibusk@roligt.nu"),
    ("Billy Plattfot", "Jättevägen 172 912 43 Sagolandet", "010-666 66", "plattfot@spunkmejl.com"),
    ("Sixten Rubensson", "Lingongatan 1 872 11 Kolaträsket", "012-922 12", "nattroll@ruggigt.se"),
    ("Lola Andersson", "Kamprads gata 22 866 22 Möbellandet", "076-888 22 32", "lola@fastcars.pl"),
    ("Göran Rudbäck", "Lyckostigen 12 943 31 Kalmarsand", "090-774 32", "goran@karamelkompott.se");
    
    -- Infogar data i tabellen beställningar
INSERT INTO Beställningar (KundID, Totalbelopp) VALUES
	(8, 259.00),
    (1, 277.35),
    (3, 190.00),
    (10, 999.00),
    (6, 49.90),
    (4, 223.09),
    (2, 400.00),
    (5, 260.00),
    (8, 140.00),
    (4, 111.99),
    (7, 129.99),
    (9, 450.00);

    -- Infogar data i tabellen Orderrader
INSERT INTO Orderrader (OrdernummerID, BokID, Antal, `Pris per styck i SEK`) VALUES
	(3, 3, 1, 259.00),
    (4, 4, 4, 129.50),
    (8, 4, 2, 200.00),
    (2, 2, 4, 65.00),
    (6, 9, 12, 11.00),
    (9, 2, 1, 123.00),
    (11, 6, 1, 129.99),
    (12, 4, 2, 300.00);
    
    
-- En SELECT-fråga som vid körning visar all data i alla tabeller, en för en.
SELECT * FROM kunder;
SELECT * FROM böcker;
SELECT * FROM beställningar;
SELECT * FROM orderrader;

-- Filtrera kunder baserat på namn och e-post med WHERE
SELECT kunder.Namn FROM kunder WHERE kunder.Epostadress LIKE 'b%';

-- Sortera produkter efter pris, både stigande och sjunkande
SELECT * FROM böcker ORDER BY `Pris per styck i SEK` ASC ;
SELECT * FROM böcker ORDER BY `Pris per styck i SEK` DESC;

-- En transaktion som uppdaterar en kund epostadress
START TRANSACTION;  
UPDATE kunder 
SET Epostadress = 'buskibusknew@busknew.com'
WHERE KundID = 6;
-- Ångrar transaktionen
ROLLBACK;
-- Committar transaktioen
COMMIT;
-- Select-fråga för att se så att ändringen gått igenom
SELECT * FROM Kunder;

-- En transaktion som tar bort en specifik kund
START TRANSACTION;
DELETE FROM Kunder
WHERE KundID = 7;
-- Ångrar transaktionen
ROLLBACK;
-- Committar transaktionen
COMMIT;

-- SELECT-fråga som kontrollerar att transaktionen gått igenom
SELECT * FROM Kunder;

-- Använder INNER JOIN för att visa vilka kunder som har lagt beställningar
SELECT Kunder.Namn, Beställningar.KundID
FROM Kunder
INNER JOIN Beställningar ON Kunder.KundID = Beställningar.KundID;

-- Använder LEFT JOIN för att visa alla kunder, även de utan beställningar
SELECT Kunder.Namn, Beställningar.OrdernummerID
FROM Kunder
LEFT JOIN Beställningar ON Kunder.KundID = Beställningar.KundID;

-- Använder GROUP BY för att räkna ut och plocka fram antal beställningar per kund
SELECT KundID, COUNT(OrdernummerID) AS BeställningarPerKund
FROM Beställningar
GROUP BY KundID;

-- Använder HAVING för att endast visa kunder som gjort fler beställningar än 2
SELECT Kunder.Namn, COUNT(OrdernummerID) AS ÖverTvåBeställningarPerKund
FROM Beställningar
INNER JOIN Kunder ON beställningar.KundID = Kunder.KundID
GROUP BY Kunder.Namn
HAVING COUNT(OrdernummerID) > 2;


-- Skapa stored procedure som visa all data från Orderrader-tabellen
DELIMITER $$

CREATE PROCEDURE ShowOrderRader()
BEGIN
	SELECT * FROM Orderrader;
END $$

DELIMITER ;

-- Callar på den stored procedure som jag precis skapat
CALL ShowOrderRader;

-- Skapar ett index på emailadresser i tabellen Kunder
CREATE INDEX index_epostadress ON Kunder(Epostadress);

-- Skapar en constraint som säkerställer att priset på produkter alltid är mer än 0.
ALTER TABLE böcker
ADD CONSTRAINT Check_pris CHECK(`Pris per styck i SEK` > 0);

-- Testar och ser om min constraint fungerar, genom att försöka lägga in en bok i böcker-tabellen som har -10 i pris.
INSERT INTO böcker (ISBN, Titel, Författare, `Antal i lager`, `Pris per styck i SEK`) 
VALUES ("9789178873753", "Känslofällan: Ta makten över dina tankar, känslor och ditt beteende", "Siri Helle", 40, -10.00);

-- Skapar en trigger som minskar lagersaldo efter en order
DELIMITER $$

CREATE TRIGGER uppdatera_lagersaldo
AFTER INSERT ON Orderrader
FOR EACH ROW
BEGIN
	UPDATE Böcker
    SET `Antal i lager` = `Antal i lager` - NEW.Antal
    WHERE BokID = NEW.BokID;
END $$
DELIMITER ;

-- Testar triggern
INSERT INTO Orderrader (OrdernummerID, BokID, Antal, `Pris per styck i SEK`)
VALUES (1, 1, 3, 199.99);

-- Skapa en ny trigger som loggar när en ny kund registreras

-- Börjar med att skapa en logg som kunder registreras i - just because i can!
CREATE TABLE KundLogg (
	LoggID INT AUTO_INCREMENT PRIMARY KEY,
    KundID INT NOT NULL,
    Händelse VARCHAR(100) NOT NULL,
    Tidpunkt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (KundID) REFERENCES Kunder(KundID)
    );
    
-- Skapa en trigger för när en ny kund registreras
DELIMITER $$

CREATE TRIGGER ny_kund
AFTER INSERT ON Kunder
FOR EACH ROW
BEGIN
	Insert INTO KundLogg (KundID, Händelse)
    VALUES (NEW.KundID, CONCAT('Kund registrerad: ', NEW.Namn));

END $$
DELIMITER ;

