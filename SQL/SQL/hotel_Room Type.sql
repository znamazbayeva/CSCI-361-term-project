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
-- Table structure for table `Room Type`
--

DROP TABLE IF EXISTS `Room Type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `Room Type` (
  `RoomTypeName` varchar(20) NOT NULL,
  `RoomTypeSize` varchar(10) NOT NULL,
  `RoomTypeCapacity` varchar(45) NOT NULL,
  `Price` int NOT NULL,
  `Season_Name` varchar(15) DEFAULT NULL,
  `hotel_HotelID` int NOT NULL,
  PRIMARY KEY (`RoomTypeName`,`hotel_HotelID`),
  KEY `fk_Room Type_Season1_idx` (`Season_Name`),
  KEY `fk_Room Type_hotel1_idx` (`hotel_HotelID`),
  CONSTRAINT `fk_Room Type_hotel1` FOREIGN KEY (`hotel_HotelID`) REFERENCES `Hotel` (`HotelID`),
  CONSTRAINT `fk_Room Type_Season1` FOREIGN KEY (`Season_Name`) REFERENCES `Season` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Room Type`
--

LOCK TABLES `Room Type` WRITE;
/*!40000 ALTER TABLE `Room Type` DISABLE KEYS */;
INSERT INTO `Room Type` VALUES ('Cabana','50','3',80,NULL,113),('Deluxe','160','8',200,NULL,114),('Double','25','2',30,NULL,111),('Double','50','2',60,NULL,112),('Double','80','2',120,NULL,113),('Double-double','40','4',60,NULL,111),('Duplex','200','8',250,NULL,115),('King','30','2',50,NULL,111),('Lanai','60','2',120,NULL,113),('Master Suite','100','8',150,NULL,112),('Penthouse Suite','250','4',300,NULL,115),('Presidential Suite','300','6',400,NULL,114),('Quad','45','4',60,NULL,111),('Queen','30','2',50,NULL,111),('Single','15','1',18,NULL,111),('Single','40','1',50,NULL,112),('Single','70','1',100,NULL,113),('Studio','25','1',40,NULL,111),('Studio','70','4',100,NULL,112),('Triple','30','3',45,NULL,111),('Triple','60','3',70,NULL,112),('Twin','30','2',50,NULL,111);
/*!40000 ALTER TABLE `Room Type` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-19 16:00:48
