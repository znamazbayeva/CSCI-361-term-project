CREATE DATABASE  IF NOT EXISTS `hotel` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `hotel`;
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
-- Table structure for table `administrative_staff`
--

DROP TABLE IF EXISTS `administrative_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `administrative_staff` (
  `employee_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_Manager_Employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `administrative_staff`
--

LOCK TABLES `administrative_staff` WRITE;
/*!40000 ALTER TABLE `administrative_staff` DISABLE KEYS */;
INSERT INTO `administrative_staff` VALUES (1),(2),(3),(4),(5),(8);
/*!40000 ALTER TABLE `administrative_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bills`
--

DROP TABLE IF EXISTS `bills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bills` (
  `price` int NOT NULL,
  `guest_id` int unsigned NOT NULL,
  PRIMARY KEY (`price`,`guest_id`),
  KEY `fk_bills_guest1_idx` (`guest_id`),
  CONSTRAINT `fk_bills_guest1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bills`
--

LOCK TABLES `bills` WRITE;
/*!40000 ALTER TABLE `bills` DISABLE KEYS */;
/*!40000 ALTER TABLE `bills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL,
  `booking_date` varchar(45) NOT NULL,
  `check_in` datetime NOT NULL,
  `check_out` datetime NOT NULL,
  `period` int NOT NULL,
  `guest_id` int unsigned NOT NULL,
  PRIMARY KEY (`booking_id`,`guest_id`),
  KEY `fk_Booking_guest1_idx` (`guest_id`),
  CONSTRAINT `fk_Booking_guest1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2012-02-20 20:00:00','2012-02-20 20:00:00','2012-12-20 20:00:00',12,10000),(2,'2020-07-20 20:00:00','2020-07-20 20:00:00','2020-07-26 20:00:00',6,10001),(3,'2020-03-20 19:00:00','2020-03-20 19:00:00','2020-08-20 19:00:00',5,10002),(4,'2020-01-20 20:00:00','2020-01-20 20:00:00','2020-02-17 20:00:00',28,10004),(5,'2020-05-20 20:00:00','2020-05-20 20:00:00','2020-06-14 20:00:00',25,10005),(6,'2020-05-20 20:00:00','2020-05-20 20:00:00','2020-05-25 20:00:00',5,10006),(7,'2020-08-20 20:00:00','2020-08-20 20:00:00','2020-08-25 20:00:00',5,10000),(8,'2020-10-20 20:00:00','2020-10-20 20:00:00','2018-10-20 20:00:00',3,10001);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cleaning_staff`
--

DROP TABLE IF EXISTS `cleaning_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cleaning_staff` (
  `employee_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_CleaningStaff_Employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cleaning_staff`
--

LOCK TABLES `cleaning_staff` WRITE;
/*!40000 ALTER TABLE `cleaning_staff` DISABLE KEYS */;
INSERT INTO `cleaning_staff` VALUES (7),(10),(11);
/*!40000 ALTER TABLE `cleaning_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `manager_id` int NOT NULL,
  PRIMARY KEY (`employee_id`,`manager_id`),
  KEY `fk_Employee_Employee1_idx` (`manager_id`),
  CONSTRAINT `fk_Employee_Employee1` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Zhuldyz','zhuldyz@gmail.com','87075566453',6),(2,'Amina','amina@gmail.com','87075566543',9),(3,'Kamilla','kamilla@gmail.com','87073456275',9),(4,'Justin','justin@gmail.com','87035622673',9),(5,'Ariana','ariana@gmail.com','87074276323',6),(6,'Altynay','Altynay@gmail.com','87073264572',6),(7,'Lyubov','lybov@gmail.com','87072364272',6),(8,'Zhurek','zhurek@gmail.com','87072634562',6),(9,'Gulnaz','gulnaz@gmail.com','87072736472',9),(10,'Kymbat','kymbat@gmail.com','87072364527',6),(11,'Qarashash','qarashash@gmail.com','87072734682',6);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guest_id` int unsigned NOT NULL,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `e-mail` varchar(45) DEFAULT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `password` varchar(45) NOT NULL,
  `visited` tinyint(1) DEFAULT NULL,
  `category` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (10000,'Donald','Trump','donaldtrump@gmail.com','7073475683','makeamericagreatagain',NULL,NULL),(10001,'Barack ','Obama','barackobama@gmail.com','7077362472','zhulbern',NULL,'VIP'),(10002,'Lindsey','Lohan','lindseylohan@gmail.com','7072473882','lindsey007',NULL,'VIP'),(10003,'Margaret','Tatcher','margarettatcher@gmail.com','7027253849','maragarate',NULL,NULL),(10004,'Demi','Lovato','demilovato@gmail.com','2358529297','demiiiii',NULL,NULL),(10005,'Steve','Jobs','stevejobs@gmail.com','2357286732','steveaoki',NULL,NULL),(10006,'Aooki','Steven','aookisteven@gmail.com','2358792823','aookisteve',NULL,NULL);
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_id` int NOT NULL,
  `name` varchar(45) NOT NULL,
  `country_code` char(2) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `street` varchar(45) DEFAULT NULL,
  `country_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (111,'Zhuldyz','+7','Almaty','Shalyapin, 65','Kazakhstan'),(112,'Kamilla','+7','Nur-Sultan','Kabanbay, 56','Kazakhstan'),(113,'Amina','+7','Almaty','Nazarbayev, 56','Kazakhstan'),(114,'Gulnaz','+7','New York','Dostyq, 46','USA'),(115,'Altynay','+7','London','Zhurgenev, 34','UK');
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelfeatures`
--

DROP TABLE IF EXISTS `hotelfeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelfeatures` (
  `feature` varchar(45) NOT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`hotel_id`,`feature`),
  KEY `fk_Features_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_Features_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotelfeatures`
--

LOCK TABLES `hotelfeatures` WRITE;
/*!40000 ALTER TABLE `hotelfeatures` DISABLE KEYS */;
INSERT INTO `hotelfeatures` VALUES ('Communal Spaces',112),('Swimming pool',112),('SPA',113),('Top Business Centre',114),('Arctic Resort',115),('Concierge Services',115);
/*!40000 ALTER TABLE `hotelfeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `employee_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `fk_Manager_Employee2` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `phonenumbers`
--

DROP TABLE IF EXISTS `phonenumbers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `phonenumbers` (
  `hotel_id` int NOT NULL,
  `phonenumbers` varchar(45) NOT NULL,
  PRIMARY KEY (`hotel_id`,`phonenumbers`),
  CONSTRAINT `fk_PhoneNumbers_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `phonenumbers`
--

LOCK TABLES `phonenumbers` WRITE;
/*!40000 ALTER TABLE `phonenumbers` DISABLE KEYS */;
INSERT INTO `phonenumbers` VALUES (111,'2384782847'),(111,'7074657351'),(112,'3827482973'),(112,'7458375322'),(113,'3827462734'),(114,'2834782792'),(115,'2734687226');
/*!40000 ALTER TABLE `phonenumbers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room`
--

DROP TABLE IF EXISTS `room`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room` (
  `room_number` int NOT NULL AUTO_INCREMENT,
  `floor` varchar(45) NOT NULL,
  `cleaning_staff_id` int NOT NULL,
  `cleaning_status` varchar(45) DEFAULT NULL,
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  `available` tinyint DEFAULT NULL,
  PRIMARY KEY (`room_number`,`room_type_name`,`hotel_id`),
  KEY `fk_Room_CleaningStaff1_idx` (`cleaning_staff_id`),
  KEY `fk_Room_Room Type1_idx` (`room_type_name`,`hotel_id`),
  CONSTRAINT `fk_Room_CleaningStaff1` FOREIGN KEY (`cleaning_staff_id`) REFERENCES `cleaning_staff` (`employee_id`),
  CONSTRAINT `fk_Room_Room Type1` FOREIGN KEY (`room_type_name`, `hotel_id`) REFERENCES `room_type` (`room_type_name`, `hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'1',7,'Clean','Single',111,1),(2,'1',10,'Clean','Double',111,1),(3,'1',7,'Clean','Quad',111,1),(4,'1',11,'Clean','Studio',111,1),(5,'1',7,'Clean','Triple',111,1),(6,'1',10,'Clean','Twin',111,1);
/*!40000 ALTER TABLE `room` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type`
--

DROP TABLE IF EXISTS `room_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type` (
  `room_type_name` varchar(20) NOT NULL,
  `size` int NOT NULL,
  `capacity` int NOT NULL,
  `price` int NOT NULL,
  `season_name` varchar(15) DEFAULT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`room_type_name`,`hotel_id`),
  KEY `fk_Room Type_Season1_idx` (`season_name`),
  KEY `fk_Room Type_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_Room Type_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  CONSTRAINT `fk_Room Type_Season1` FOREIGN KEY (`season_name`) REFERENCES `season` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
INSERT INTO `room_type` VALUES ('Cabana',50,3,80,NULL,113),('Deluxe',160,8,200,NULL,114),('Double',25,2,30,NULL,111),('Double',50,2,60,NULL,112),('Double',80,2,120,NULL,113),('Double-double',40,4,60,NULL,111),('Duplex',200,8,250,NULL,115),('King',30,2,50,NULL,111),('Lanai',60,2,120,NULL,113),('Master Suite',100,8,150,NULL,112),('Penthouse Suite',250,4,300,NULL,115),('Presidential Suite',300,6,400,NULL,114),('Quad',45,4,60,NULL,111),('Queen',30,2,50,NULL,111),('Single',15,1,18,NULL,111),('Single',40,1,50,NULL,112),('Single',70,1,100,NULL,113),('Studio',25,1,40,NULL,111),('Studio',70,4,100,NULL,112),('Triple',30,3,45,NULL,111),('Triple',60,3,70,NULL,112),('Twin',30,2,50,NULL,111);
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type_features`
--

DROP TABLE IF EXISTS `room_type_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type_features` (
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  `feature` varchar(45) NOT NULL,
  PRIMARY KEY (`room_type_name`,`hotel_id`,`feature`),
  CONSTRAINT `fk_Features_Room Type1` FOREIGN KEY (`room_type_name`) REFERENCES `room_type` (`room_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type_features`
--

LOCK TABLES `room_type_features` WRITE;
/*!40000 ALTER TABLE `room_type_features` DISABLE KEYS */;
INSERT INTO `room_type_features` VALUES ('Cabana',113,'Balcony'),('Cabana',113,'Swimming Pool'),('Deluxe',116,'Antiques'),('Double',111,'Dressing table'),('Double',113,'King-size double bed'),('Double-double',111,'Double bed for children'),('Lanai',113,'Waterfall'),('Master Suite',112,'Terrace space'),('Presidential Suite',114,'Antique paintings');
/*!40000 ALTER TABLE `room_type_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type_has_booking`
--

DROP TABLE IF EXISTS `room_type_has_booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type_has_booking` (
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  `booking_id` int NOT NULL,
  `guest_id` int NOT NULL,
  PRIMARY KEY (`room_type_name`,`hotel_id`,`booking_id`,`guest_id`),
  KEY `fk_Room Type_has_Booking_Booking1_idx` (`booking_id`,`guest_id`),
  KEY `fk_Room Type_has_Booking_Room Type1_idx` (`room_type_name`,`hotel_id`),
  CONSTRAINT `fk_Room Type_has_Booking_Booking1` FOREIGN KEY (`booking_id`) REFERENCES `booking` (`booking_id`),
  CONSTRAINT `fk_Room Type_has_Booking_Room Type1` FOREIGN KEY (`room_type_name`, `hotel_id`) REFERENCES `room_type` (`room_type_name`, `hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type_has_booking`
--

LOCK TABLES `room_type_has_booking` WRITE;
/*!40000 ALTER TABLE `room_type_has_booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_type_has_booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `name` varchar(15) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `day_of_week` date DEFAULT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`name`,`hotel_id`),
  KEY `fk_Season_Hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_Season_Hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES ('Fall','2022-09-01','2022-11-30',NULL,111),('Summer','2021-06-01','2021-08-30',NULL,111),('Winter','2020-12-01','2021-02-28',NULL,111);
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-21 18:15:14
