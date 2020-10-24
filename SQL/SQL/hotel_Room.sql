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
-- Table structure for table `Room`
--

DROP TABLE IF EXISTS `Room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room` (
  `RoomNumber` int NOT NULL AUTO_INCREMENT,
  `Floor` varchar(45) NOT NULL,
  `CleaningStaffID` int NOT NULL,
  `CleaningStatus` varchar(45) DEFAULT NULL,
  `RoomTypeName` varchar(20) NOT NULL,
  `HotelID` int NOT NULL,
  `Available` tinyint DEFAULT NULL,
  PRIMARY KEY (`RoomNumber`,`RoomTypeName`,`HotelID`),
  KEY `fk_Room_CleaningStaff1_idx` (`CleaningStaffID`),
  KEY `fk_Room_Room Type1_idx` (`RoomTypeName`,`HotelID`),
  CONSTRAINT `fk_Room_CleaningStaff1` FOREIGN KEY (`CleaningStaffID`) REFERENCES `CleaningStaff` (`EmployeeID`),
  CONSTRAINT `fk_Room_Room Type1` FOREIGN KEY (`RoomTypeName`, `HotelID`) REFERENCES `Room Type` (`RoomTypeName`, `hotel_HotelID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room`
--

LOCK TABLES `Room` WRITE;
/*!40000 ALTER TABLE `Room` DISABLE KEYS */;
INSERT INTO `Room` VALUES (1,'1',7,'Clean','Single',111,1),(2,'1',10,'Clean','Double',111,1),(3,'1',7,'Clean','Quad',111,1),(4,'1',11,'Clean','Studio',111,1),(5,'1',7,'Clean','Triple',111,1),(6,'1',10,'Clean','Twin',111,1)(1,'1',11,'Clean','Studio',113,1),(2,'2',7,'Clean','Triple',113,1),(3,'3',10,'Clean','Twin',113,1);
/*!40000 ALTER TABLE `Room` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 16:00:46
