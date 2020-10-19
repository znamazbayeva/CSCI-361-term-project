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
-- Table structure for table `Room Type_has_Booking`
--

DROP TABLE IF EXISTS `Room Type_has_Booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room Type_has_Booking` (
  `RoomTypeName` varchar(20) NOT NULL,
  `HotelID` int NOT NULL,
  `BookingID` int NOT NULL,
  `GuestID` int NOT NULL,
  PRIMARY KEY (`RoomTypeName`,`HotelID`,`BookingID`,`GuestID`),
  KEY `fk_Room Type_has_Booking_Booking1_idx` (`BookingID`,`GuestID`),
  KEY `fk_Room Type_has_Booking_Room Type1_idx` (`RoomTypeName`,`HotelID`),
  CONSTRAINT `fk_Room Type_has_Booking_Booking1` FOREIGN KEY (`BookingID`) REFERENCES `Booking` (`BookingID`),
  CONSTRAINT `fk_Room Type_has_Booking_Room Type1` FOREIGN KEY (`RoomTypeName`, `HotelID`) REFERENCES `Room Type` (`RoomTypeName`, `hotel_HotelID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room Type_has_Booking`
--

LOCK TABLES `Room Type_has_Booking` WRITE;
/*!40000 ALTER TABLE `Room Type_has_Booking` DISABLE KEYS */;
INSERT INTO `Room Type_has_Booking` VALUES ('Cabana',113,1,10000),('Deluxe',114,2,10001),('Duplex',115,3,10002),('Single',111,4,10003),('Double',111,5,10004),('Double-double',111,6,10005),('Studio',112,7,10006);
/*!40000 ALTER TABLE `Room Type_has_Booking` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 14:20:14
