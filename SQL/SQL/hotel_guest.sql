-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: hotel
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `GuestID` int unsigned NOT NULL AUTO_INCREMENT,
  `GuestName` varchar(45) NOT NULL,
  `GuestSurname` varchar(45) NOT NULL,
  `GuestMail` varchar(45) NOT NULL,
  `GuestPhoneNumber` varchar(45) DEFAULT NULL,
  `GuestPassword` varchar(45) NOT NULL,
  `GuestVisited` int DEFAULT NULL,
  `CountryCode` char(2) DEFAULT NULL,
  PRIMARY KEY (`GuestID`)
) ENGINE=InnoDB AUTO_INCREMENT=10007 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (10000,'Donald','Trump','donaldtrump@gmail.com','7073475683','makeamericagreatagain',NULL,'+7'),(10001,'Barack ','Obama','barackobama@gmail.com','7077362472','zhulbern',NULL,'+2'),(10002,'Lindsey','Lohan','lindseylohan@gmail.com','7072473882','lindsey007',NULL,'+6'),(10003,'Margaret','Tatcher','margarettatcher@gmail.com','7027253849','maragarate',NULL,'+7'),(10004,'Demi','Lovato','demilovato@gmail.com','2358529297','demiiiii',NULL,'+7'),(10005,'Steve','Jobs','stevejobs@gmail.com','2357286732','steveaoki',NULL,'+7'),(10006,'Aooki','Steven','aookisteven@gmail.com','2358792823','aookisteve',NULL,'+4');
(10007,'Ariana','Grande','arriii@gmail.com','2350092823','arriii',NULL,'+4');
(10008,'Shawn','Mendes','shawnmendes@gmail.com','2358791111','shawnmm',NULL,'+3');
(10009,'Bruno','Mars','brunomars@gmail.com','0123792823','brunomars',NULL,'+1');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 14:20:08
