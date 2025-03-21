-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: yddesbokhandel
-- ------------------------------------------------------
-- Server version	8.0.41

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `beställningar`
--

DROP TABLE IF EXISTS `beställningar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `beställningar` (
  `OrdernummerID` int NOT NULL AUTO_INCREMENT,
  `Datum` datetime DEFAULT CURRENT_TIMESTAMP,
  `KundID` int NOT NULL,
  `Totalbelopp` decimal(8,2) NOT NULL,
  PRIMARY KEY (`OrdernummerID`),
  KEY `KundID` (`KundID`),
  CONSTRAINT `beställningar_ibfk_1` FOREIGN KEY (`KundID`) REFERENCES `kunder` (`KundID`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `beställningar`
--

LOCK TABLES `beställningar` WRITE;
/*!40000 ALTER TABLE `beställningar` DISABLE KEYS */;
INSERT INTO `beställningar` VALUES (1,'2025-03-21 09:38:37',8,259.00),(2,'2025-03-21 09:38:37',1,277.35),(3,'2025-03-21 09:38:37',3,190.00),(4,'2025-03-21 09:38:37',10,999.00),(5,'2025-03-21 09:38:37',6,49.90),(6,'2025-03-21 09:38:37',4,223.09),(7,'2025-03-21 09:38:37',2,400.00),(8,'2025-03-21 09:38:37',5,260.00),(9,'2025-03-21 09:38:37',8,140.00),(10,'2025-03-21 09:38:37',4,111.99),(11,'2025-03-21 09:38:37',7,129.99),(12,'2025-03-21 09:38:37',9,450.00);
/*!40000 ALTER TABLE `beställningar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `böcker`
--

DROP TABLE IF EXISTS `böcker`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `böcker` (
  `BokID` int NOT NULL AUTO_INCREMENT,
  `ISBN` varchar(20) NOT NULL,
  `Titel` varchar(100) NOT NULL,
  `Författare` varchar(50) NOT NULL,
  `Antal i lager` int NOT NULL,
  `Pris per styck i SEK` decimal(8,2) NOT NULL,
  PRIMARY KEY (`BokID`),
  UNIQUE KEY `ISBN` (`ISBN`),
  CONSTRAINT `Check_pris` CHECK ((`Pris per styck i SEK` > 0))
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `böcker`
--

LOCK TABLES `böcker` WRITE;
/*!40000 ALTER TABLE `böcker` DISABLE KEYS */;
INSERT INTO `böcker` VALUES (1,'9789197655460','Den svenska historien om världens snabbaste bilsport','Christina Boden',2,294.00),(2,'9781788842686','Grands Prix','Motorsport Images',1,743.99),(3,'9789180066068','Cirkus Formel 1','Anna Andersson',8,259.00),(4,'9780241712443','Grand Prix','Will Buxton',20,360.00),(5,'9781785949241','How to read F1','Jennie Gow',8,190.00),(6,'9781035418756','Formula 1 2025','Bruce Jones',4,224.00),(7,'9780008196806','How to Build a Car','Adrian Newey',22,277.35),(8,'9781471162381','Total Competition: Lessons in Strategy from Formula One','Ross Brawn',4,102.85),(9,'9781787290433','The Mechanic: The Secret World of The F1 Pitlane','Marc Priestley',19,123.86);
/*!40000 ALTER TABLE `böcker` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunder`
--

DROP TABLE IF EXISTS `kunder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunder` (
  `KundID` int NOT NULL AUTO_INCREMENT,
  `Namn` varchar(50) NOT NULL,
  `Adress` varchar(50) NOT NULL,
  `Telefon` varchar(20) NOT NULL,
  `Epostadress` varchar(50) NOT NULL,
  PRIMARY KEY (`KundID`),
  UNIQUE KEY `Epostadress` (`Epostadress`),
  KEY `index_epostadress` (`Epostadress`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunder`
--

LOCK TABLES `kunder` WRITE;
/*!40000 ALTER TABLE `kunder` DISABLE KEYS */;
INSERT INTO `kunder` VALUES (1,'Anna Andersson','Fogdegatan 11, 268 20 Kågeröd','0487-326 12','anna@globalemail.com'),(2,'Berit Beritsson','Skogsvägen 13C 389 40 Svansta','0981-753 10','beritblatand@unicastemail.com'),(3,'Rut Hjärtrudsson','Altanstigen 1 873 20 Lingonberget','078-819 20 12','rutirutan@gmail.com'),(4,'Boris Knapphatt','Himmelsvägen 47C 921 98 Himmelriket','073-461 23 23','borisknapphatt@live.com'),(5,'Gösta Lagerkrans','Stuprörsstigen 34 478 21 Lustgasriket','021-431 22','lagerkransgosta@emailkonto.se'),(6,'Hjördis Buske','Plommonruinen 98 777 21 Hybrisorten','097-778 78','buskibusk@roligt.nu'),(7,'Billy Plattfot','Jättevägen 172 912 43 Sagolandet','010-666 66','plattfot@spunkmejl.com'),(8,'Sixten Rubensson','Lingongatan 1 872 11 Kolaträsket','012-922 12','nattroll@ruggigt.se'),(9,'Lola Andersson','Kamprads gata 22 866 22 Möbellandet','076-888 22 32','lola@fastcars.pl'),(10,'Göran Rudbäck','Lyckostigen 12 943 31 Kalmarsand','090-774 32','goran@karamelkompott.se');
/*!40000 ALTER TABLE `kunder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `ny_kund` AFTER INSERT ON `kunder` FOR EACH ROW BEGIN
	Insert INTO KundLogg (KundID, Händelse)
    VALUES (NEW.KundID, CONCAT('Kund registrerad: ', NEW.Namn));

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `kundlogg`
--

DROP TABLE IF EXISTS `kundlogg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kundlogg` (
  `LoggID` int NOT NULL AUTO_INCREMENT,
  `KundID` int DEFAULT NULL,
  `Händelse` varchar(100) DEFAULT NULL,
  `Tidpunkt` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`LoggID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kundlogg`
--

LOCK TABLES `kundlogg` WRITE;
/*!40000 ALTER TABLE `kundlogg` DISABLE KEYS */;
/*!40000 ALTER TABLE `kundlogg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orderrader`
--

DROP TABLE IF EXISTS `orderrader`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orderrader` (
  `OrderradID` int NOT NULL AUTO_INCREMENT,
  `OrdernummerID` int NOT NULL,
  `BokID` int NOT NULL,
  `Antal` int NOT NULL,
  `Pris per styck i SEK` decimal(8,2) NOT NULL,
  PRIMARY KEY (`OrderradID`),
  KEY `OrdernummerID` (`OrdernummerID`),
  KEY `BokID` (`BokID`),
  CONSTRAINT `orderrader_ibfk_1` FOREIGN KEY (`OrdernummerID`) REFERENCES `beställningar` (`OrdernummerID`),
  CONSTRAINT `orderrader_ibfk_2` FOREIGN KEY (`BokID`) REFERENCES `böcker` (`BokID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orderrader`
--

LOCK TABLES `orderrader` WRITE;
/*!40000 ALTER TABLE `orderrader` DISABLE KEYS */;
INSERT INTO `orderrader` VALUES (1,3,3,1,259.00),(2,4,4,4,129.50),(3,8,4,2,200.00),(4,2,2,4,65.00),(5,6,9,12,11.00),(6,9,2,1,123.00),(7,11,6,1,129.99),(8,12,4,2,300.00),(9,1,1,3,199.99);
/*!40000 ALTER TABLE `orderrader` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `uppdatera_lagersaldo` AFTER INSERT ON `orderrader` FOR EACH ROW BEGIN
	UPDATE Böcker
    SET `Antal i lager` = `Antal i lager` - NEW.Antal
    WHERE BokID = NEW.BokID;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-21 13:22:43
