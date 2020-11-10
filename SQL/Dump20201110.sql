-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
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
-- Table structure for table `booking`
--

DROP TABLE IF EXISTS `booking`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking` (
  `booking_id` int NOT NULL,
  `booking_date` varchar(45) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `period` int NOT NULL,
  `guest_id` int unsigned NOT NULL,
  `bill` int NOT NULL,
  `room_type_name` varchar(45) NOT NULL,
  `hotel_id` int NOT NULL,
  `room_number` int NOT NULL,
  PRIMARY KEY (`booking_id`,`guest_id`),
  KEY `room_type_name_idx` (`room_type_name`),
  KEY `hotel_id_idx` (`hotel_id`),
  KEY `guest_id_idx` (`guest_id`),
  CONSTRAINT `guest_id` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`),
  CONSTRAINT `hotel_id` FOREIGN KEY (`hotel_id`) REFERENCES `room_type` (`hotel_id`),
  CONSTRAINT `room_type_name` FOREIGN KEY (`room_type_name`) REFERENCES `room_type` (`room_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
INSERT INTO `booking` VALUES (1,'2020-02-20 20:00:00','2020-02-20','0000-00-00',10,10000,18,'Single',111,1),(2,'2020-07-20 20:00:00','2020-07-20','2020-07-26',6,10001,18,'Single',111,1),(3,'2020-03-20 19:00:00','2020-08-20','2020-08-25',5,10002,18,'Single',111,1),(4,'2020-01-20 20:00:00','2020-01-20','2020-02-17',28,10004,30,'Double',111,2),(5,'2020-05-20 20:00:00','2020-05-20','2020-06-14',25,10005,30,'Double',111,2),(6,'2020-05-20 20:00:00','2020-05-20','2020-05-25',5,10006,30,'Double',111,2),(7,'2020-08-20 20:00:00','2020-08-20','2020-08-25',5,10000,60,'Double',112,1),(8,'2020-10-20 20:00:00','2020-10-20','2020-10-23',3,10001,60,'Double',112,1),(9,'2020-10-25 20:00:00','2020-10-25','2020-11-01',7,10000,60,'Double',112,1),(10,'2020-10-25 20:00:00','2020-10-27','2020-11-05',9,10001,100,'Studio',112,8),(11,'2020-10-25 20:00:00','2020-11-01','2020-11-07',7,10002,100,'Studio',112,8);
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
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
  `second_name` varchar(45) NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `employee_type` varchar(45) NOT NULL,
  `from_schedule` time DEFAULT NULL,
  `to_schedule` time DEFAULT NULL,
  `weekday` varchar(45) DEFAULT NULL,
  `salary` int DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_Employee_Employee1_idx` (`manager_id`),
  CONSTRAINT `employee_id` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Zhuldyz','L','zhuldyz@gmail.com','1','87075566453',6,'Administrator','09:00:00','18:00:00','MTWRF',50,NULL),(2,'Amina','K','amina@gmail.com','2','87075566543',9,'Administrator','09:00:00','18:00:00','MTWRF',50,NULL),(3,'Kamilla','N','kamilla@gmail.com','3','87073456275',9,'Administrator','09:00:00','18:00:00','MTWRF',50,NULL),(4,'Justin','M','justin@gmail.com','4','87035622673',9,'Administrator','09:00:00','18:00:00','MTWRF',50,NULL),(5,'Ariana','B','ariana@gmail.com','5','87074276323',6,'Administrator','09:00:00','18:00:00','MTWRF',50,NULL),(6,'Altynay','C','Altynay@gmail.com','6','87073264572',6,'Manager','09:00:00','18:00:00','MTWRF',45,NULL),(7,'Lyubov','D','lybov@gmail.com','7','87072364272',6,'Manager','09:00:00','18:00:00','MTWRF',45,NULL),(8,'Zhurek','E','zhurek@gmail.com','8','87072634562',6,'DeskClerk','08:00:00','17:00:00','MWFS',40,NULL),(9,'Gulnar','R','gulnar@gmail.com','9','87072736472',9,'DeskClerk','08:00:00','17:00:00','MWFS',40,NULL),(10,'Kymbat','T','kymbat@gmail.com','10','87072364527',6,'DeskClerk','08:00:00','17:00:00','MWFS',40,NULL),(11,'Qarashash','U','qarashash@gmail.com','11','87072734682',6,'DeskClerk','18:00:00','02:00:00','TRD',40,NULL),(12,'Gulnaz','I','zhambylova25@gmail.com','12','87075566500',8,'DeskClerk','18:00:00','02:00:00','TRD',40,NULL),(13,'Joanna','O','joanna@gmail.com','12','87075566000',8,'Cleaner','09:00:00','18:00:00','TRD',30,NULL),(14,'Selena','L','selena@gmail.com','13','87075566511',8,'Cleaner','09:00:00','18:00:00','TRD',30,NULL),(15,'Lola','K','lola@gmail.com','14','87074623764',6,'Cleaner','09:00:00','18:00:00','TRD',30,NULL),(16,'Dora','A','dora@gmail.com','15','87077642846',6,'Cleaner','09:00:00','18:00:00','MWF',30,NULL),(17,'Kora','W','kora@gmail.com','16','87077426732',9,'Cleaner','09:00:00','18:00:00','MWF',30,NULL);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guest_id` int unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `phone_number` varchar(45) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `category` varchar(45) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guest_id`),
  UNIQUE KEY `guest_id_UNIQUE` (`guest_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10015 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
INSERT INTO `guest` VALUES (10000,'Donald','Trump','donaldtrump@gmail.com','7073475683','makeamericagreatagain',NULL,NULL),(10001,'Barack ','Obama','barackobama@gmail.com','7077362472','zhulbern','VIP',NULL),(10002,'Lindsey','Lohan','lindseylohan@gmail.com','7072473882','lindsey007','VIP',NULL),(10003,'Margaret','Tatcher','margarettatcher@gmail.com','7027253849','maragarate',NULL,NULL),(10004,'Demi','Lovato','demilovato@gmail.com','2358529297','demiiiii',NULL,NULL),(10005,'Steve','Jobs','stevejobs@gmail.com','2357286732','steveaoki',NULL,NULL),(10006,'Aooki','Steven','aookisteven@gmail.com','2358792823','aookisteve',NULL,NULL),(10007,'Miras','Lohan','miraslohan@gmail.com','7072473882','miraslohan','VIP',NULL),(10008,'Lindsey','Steven','lindseysteven@gmail.com','7072473882','lindseysteven',NULL,NULL),(10009,'Jonas','Joe','jonasjoe@gmail.com','7072473882','jonasjoe',NULL,NULL),(10010,'Kristin','Lero','kristinlero@gmail.com','5748393782','kristenlero',NULL,NULL),(10011,'Heroshi','Dorna','heroshidorna@gmail.com','5843798272','heroshidorna',NULL,NULL),(10012,'Zhuldyz','Namazbayeva','zhuldyznamazbay@gmail.com','7074372676','zhuldyzay',NULL,NULL),(10014,'Gulnaz','Zhambulova','zhambylova25@gmail.com','87054709827','$2a$10$NzoG6FDsUW8Y7Mwh15j9qOEI/t5Mt1KEM3SBud47KoihWigQdEoIe',NULL,'VERIFIED');
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest_has_user_role`
--

DROP TABLE IF EXISTS `guest_has_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest_has_user_role` (
  `guest_guest_id` int unsigned NOT NULL,
  `user_role_role_id` int NOT NULL,
  PRIMARY KEY (`guest_guest_id`,`user_role_role_id`),
  KEY `fk_guest_has_user_role_user_role1_idx` (`user_role_role_id`) /*!80000 INVISIBLE */,
  KEY `fk_guest_has_user_role_user_role2_idx` (`guest_guest_id`),
  CONSTRAINT `fk_guest_has_user_role_user_role1` FOREIGN KEY (`user_role_role_id`) REFERENCES `user_role` (`role_id`),
  CONSTRAINT `fk_guest_has_user_role_user_role2` FOREIGN KEY (`guest_guest_id`) REFERENCES `guest` (`guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest_has_user_role`
--

LOCK TABLES `guest_has_user_role` WRITE;
/*!40000 ALTER TABLE `guest_has_user_role` DISABLE KEYS */;
INSERT INTO `guest_has_user_role` VALUES (10014,1);
/*!40000 ALTER TABLE `guest_has_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
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
  `country_code` char(2) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  `season_name` varchar(45) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  KEY `name_idx` (`season_name`),
  CONSTRAINT `name` FOREIGN KEY (`season_name`) REFERENCES `season` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
INSERT INTO `hotel` VALUES (111,'Zhuldyz','+7','Almaty','Shalyapin, 65','Kazakhstan','Summer'),(112,'Kamilla','+7','Nur-Sultan','Kabanbay, 56','Kazakhstan','Summer'),(113,'Amina','+7','Almaty','Nazarbayev, 56','Kazakhstan','Summer'),(114,'Gulnaz','+7','New York','Dostyq, 46','USA','Summer'),(115,'Altynay','+7','London','Zhurgenev, 34','UK','Winter'),(116,'Borovoe','+7','Borovoe','Abylaihana, 56','Kazakhstan','Summer'),(117,'Tokyo','+9','Tokyo','Hong, 56','Japan','Winter'),(118,'Moscow','+6','Moscow','Blue, 56','Russia','Winter'),(119,'Lux','+5','Prague','Lyubovenko, 67','Czech Republic','Winter'),(120,'Hilton','+4','Rome','Doro, 56','Italy','Fall'),(121,'Fugue','+5','Prague','Dorenko, 536','Czech Republic','Winter');
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
INSERT INTO `hotelfeatures` VALUES ('Skating',111),('SPA',111),('Swimming pool',111),('Communal Spaces',112),('Swimming pool',112),('Breakfast',113),('SPA',113),('In-Room Amenities',114),('Parking',114),('Top Business Centre',114),('Arctic Resort',115),('Concierge Services',115);
/*!40000 ALTER TABLE `hotelfeatures` ENABLE KEYS */;
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
INSERT INTO `phonenumbers` VALUES (111,'2384782847'),(111,'7074657351'),(112,'3827482973'),(112,'7458375322'),(113,'3827462700'),(113,'3827462734'),(114,'0034782792'),(114,'2834782792'),(115,'0034687226'),(115,'2734687226'),(116,'3748927263'),(117,'3824789227'),(118,'2746326836');
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
  `cleaning_status` varchar(45) NOT NULL,
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  `available` tinyint NOT NULL,
  `cleaning_staff_id` int NOT NULL,
  PRIMARY KEY (`room_number`,`room_type_name`,`hotel_id`),
  KEY `fk_Room_Room Type1_idx` (`room_type_name`,`hotel_id`),
  KEY `employee_id_idx` (`cleaning_staff_id`),
  CONSTRAINT `cleaner` FOREIGN KEY (`cleaning_staff_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_Room_Room Type1` FOREIGN KEY (`room_type_name`, `hotel_id`) REFERENCES `room_type` (`room_type_name`, `hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
INSERT INTO `room` VALUES (1,'1','Clean','Single',111,1,13),(2,'1','Clean','Double',111,1,14),(3,'1','Clean','Quad',111,1,13),(4,'1','Clean','Studio',111,1,14),(5,'1','Clean','Triple',111,1,15),(6,'1','Clean','Twin',111,1,13),(7,'1','Clean','Double',112,1,15),(8,'2','Clean','Studio',112,1,15),(9,'1','Clean','Single',112,1,14);
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
  `season_name` varchar(15) NOT NULL,
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
INSERT INTO `room_type` VALUES ('Cabana',50,3,80,'Winter',113),('Deluxe',160,8,200,'Winter',114),('Double',25,2,30,'Winter',111),('Double',50,2,60,'Winter',112),('Double',80,2,120,'Summer',113),('Double',160,2,250,'Summer',114),('Double-double',40,4,60,'Summer',111),('Duplex',200,8,250,'Summer',115),('King',30,2,50,'Fall',111),('Lanai',60,2,120,'Fall',113),('Master Suite',100,8,150,'Fall',112),('Penthouse Suite',250,4,300,'Fall',115),('Presidential Suite',300,6,400,'Spring',114),('Quad',45,4,60,'Spring',111),('Queen',30,2,50,'Spring',111),('Single',15,1,18,'Spring',111),('Single',40,1,50,'Summer',112),('Single',70,1,100,'Summer',113),('Single',80,1,150,'Summer',114),('Single',80,1,150,'Summer',115),('Studio',25,1,40,'Summer',111),('Studio',70,4,100,'Winter',112),('Triple',30,3,45,'Winter',111),('Triple',60,3,70,'Winter',112),('Twin',30,2,50,'Winter',111);
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
  KEY `fk_room_type_idx` (`room_type_name`,`hotel_id`),
  CONSTRAINT `room_type` FOREIGN KEY (`room_type_name`) REFERENCES `room_type` (`room_type_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type_features`
--

LOCK TABLES `room_type_features` WRITE;
/*!40000 ALTER TABLE `room_type_features` DISABLE KEYS */;
INSERT INTO `room_type_features` VALUES ('Cabana',113,'Balcony'),('Cabana',113,'Swimming Pool'),('Deluxe',116,'Antiques'),('Double',111,'Dressing table'),('Double',113,'King-size double bed'),('Double',114,'Swimming Pool'),('Double-double',111,'Double bed for children'),('Lanai',113,'Waterfall'),('Master Suite',112,'Terrace space'),('Presidential Suite',114,'Antique paintings'),('Single',114,'Swimming Pool'),('Single',115,'Swimming Pool');
/*!40000 ALTER TABLE `room_type_features` ENABLE KEYS */;
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
  `day_of_week` date NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
INSERT INTO `season` VALUES ('Fall','2022-09-01','2022-11-30','2022-09-01'),('Spring','2021-03-01','2021-05-30','2021-03-01'),('Summer','2021-06-01','2021-08-30','2021-06-01'),('Winter','2020-12-01','2021-02-28','2020-12-01');
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `role_id` int NOT NULL,
  `role_name` varchar(45) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
INSERT INTO `user_role` VALUES (1,'guest');
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-10 11:47:33
