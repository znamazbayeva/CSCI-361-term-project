-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: hotel_new
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
  `booking_id` int NOT NULL AUTO_INCREMENT,
  `booking_date` varchar(45) NOT NULL,
  `check_in` date NOT NULL,
  `check_out` date NOT NULL,
  `period` int NOT NULL,
  `guest_id` int NOT NULL,
  `bill` int NOT NULL,
  `room_number` int NOT NULL,
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`booking_id`,`guest_id`),
  KEY `fk_Booking_guest1_idx` (`guest_id`),
  KEY `fk_booking_room1_idx` (`room_number`,`room_type_name`,`hotel_id`),
  CONSTRAINT `fk_Booking_guest1` FOREIGN KEY (`guest_id`) REFERENCES `guest` (`guest_id`),
  CONSTRAINT `fk_booking_room1` FOREIGN KEY (`room_number`, `room_type_name`, `hotel_id`) REFERENCES `room` (`room_number`, `room_type_name`, `hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking`
--

LOCK TABLES `booking` WRITE;
/*!40000 ALTER TABLE `booking` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `booking_has_services`
--

DROP TABLE IF EXISTS `booking_has_services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booking_has_services` (
  `booking_id` int NOT NULL,
  `guest_id` int NOT NULL,
  `service_name` varchar(45) NOT NULL,
  PRIMARY KEY (`booking_id`,`guest_id`,`service_name`),
  KEY `fk_booking_has_services_services1_idx` (`service_name`),
  KEY `fk_booking_has_services_booking1_idx` (`booking_id`,`guest_id`),
  CONSTRAINT `fk_booking_has_services_booking1` FOREIGN KEY (`booking_id`, `guest_id`) REFERENCES `booking` (`booking_id`, `guest_id`),
  CONSTRAINT `fk_booking_has_services_services1` FOREIGN KEY (`service_name`) REFERENCES `services` (`service_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `booking_has_services`
--

LOCK TABLES `booking_has_services` WRITE;
/*!40000 ALTER TABLE `booking_has_services` DISABLE KEYS */;
/*!40000 ALTER TABLE `booking_has_services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `category` varchar(45) NOT NULL,
  `discount` double NOT NULL,
  PRIMARY KEY (`category`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dayoff`
--

DROP TABLE IF EXISTS `dayoff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dayoff` (
  `day` date NOT NULL,
  `employee_id` int NOT NULL,
  PRIMARY KEY (`day`,`employee_id`),
  KEY `fk_dayoff_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_dayoff_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dayoff`
--

LOCK TABLES `dayoff` WRITE;
/*!40000 ALTER TABLE `dayoff` DISABLE KEYS */;
/*!40000 ALTER TABLE `dayoff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employee_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `second_name` varchar(45) NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `phone` varchar(45) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `employee_type` varchar(45) NOT NULL,
  `hotel_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`employee_id`),
  UNIQUE KEY `employee_id_UNIQUE` (`employee_id`),
  KEY `fk_Employee_Employee1_idx` (`manager_id`),
  KEY `fk_employee_hotel1_idx` (`hotel_id`),
  KEY `fk_employee_user_role1_idx` (`role_id`),
  CONSTRAINT `fk_Employee_Employee1` FOREIGN KEY (`manager_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_employee_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  CONSTRAINT `fk_employee_user_role1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guest`
--

DROP TABLE IF EXISTS `guest`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guest` (
  `guest_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `e-mail` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `password` varchar(45) DEFAULT NULL,
  `id_type` varchar(45) NOT NULL,
  `id_number` varchar(45) NOT NULL,
  `address` varchar(150) NOT NULL,
  `mobile_number` varchar(45) NOT NULL,
  `category` varchar(45) NOT NULL,
  `role_id` int NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`guest_id`),
  UNIQUE KEY `guest_id_UNIQUE` (`guest_id`),
  KEY `fk_guest_category1_idx` (`category`),
  KEY `fk_guest_user_role1_idx` (`role_id`),
  CONSTRAINT `fk_guest_category1` FOREIGN KEY (`category`) REFERENCES `category` (`category`),
  CONSTRAINT `fk_guest_user_role1` FOREIGN KEY (`role_id`) REFERENCES `user_role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guest`
--

LOCK TABLES `guest` WRITE;
/*!40000 ALTER TABLE `guest` DISABLE KEYS */;
/*!40000 ALTER TABLE `guest` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel`
--

DROP TABLE IF EXISTS `hotel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel` (
  `hotel_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `country_code` char(2) NOT NULL,
  `city` varchar(45) NOT NULL,
  `street` varchar(45) NOT NULL,
  `country_name` varchar(45) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  UNIQUE KEY `hotel_id_UNIQUE` (`hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel`
--

LOCK TABLES `hotel` WRITE;
/*!40000 ALTER TABLE `hotel` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_has_season`
--

DROP TABLE IF EXISTS `hotel_has_season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_has_season` (
  `hotel_id` int NOT NULL,
  `season_name` varchar(45) NOT NULL,
  PRIMARY KEY (`hotel_id`,`season_name`),
  KEY `fk_hotel_has_season_season1_idx` (`season_name`),
  KEY `fk_hotel_has_season_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_season_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_season_season1` FOREIGN KEY (`season_name`) REFERENCES `season` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_has_season`
--

LOCK TABLES `hotel_has_season` WRITE;
/*!40000 ALTER TABLE `hotel_has_season` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_has_season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotel_has_weekday`
--

DROP TABLE IF EXISTS `hotel_has_weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotel_has_weekday` (
  `hotel_id` int NOT NULL,
  `weekday` varchar(10) NOT NULL,
  PRIMARY KEY (`hotel_id`,`weekday`),
  KEY `fk_hotel_has_weekday_weekday1_idx` (`weekday`),
  KEY `fk_hotel_has_weekday_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_weekday_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`),
  CONSTRAINT `fk_hotel_has_weekday_weekday1` FOREIGN KEY (`weekday`) REFERENCES `weekday` (`weekday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotel_has_weekday`
--

LOCK TABLES `hotel_has_weekday` WRITE;
/*!40000 ALTER TABLE `hotel_has_weekday` DISABLE KEYS */;
/*!40000 ALTER TABLE `hotel_has_weekday` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotelfeatures`
--

DROP TABLE IF EXISTS `hotelfeatures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hotelfeatures` (
  `feature` varchar(100) NOT NULL,
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
/*!40000 ALTER TABLE `hotelfeatures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupant`
--

DROP TABLE IF EXISTS `occupant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `occupant` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `phone_number` varchar(45) NOT NULL,
  `mobile_number` varchar(45) NOT NULL,
  `address` varchar(45) NOT NULL,
  `booking_id` int NOT NULL,
  `guest_id` int NOT NULL,
  PRIMARY KEY (`id`,`booking_id`,`guest_id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_occupant_booking1_idx` (`booking_id`,`guest_id`),
  CONSTRAINT `fk_occupant_booking1` FOREIGN KEY (`booking_id`, `guest_id`) REFERENCES `booking` (`booking_id`, `guest_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupant`
--

LOCK TABLES `occupant` WRITE;
/*!40000 ALTER TABLE `occupant` DISABLE KEYS */;
/*!40000 ALTER TABLE `occupant` ENABLE KEYS */;
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
  `floor` int NOT NULL,
  `cleaning_status` tinyint NOT NULL,
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  `cleaning_staff_id` int NOT NULL,
  `available` tinyint NOT NULL,
  PRIMARY KEY (`room_number`,`room_type_name`,`hotel_id`),
  KEY `fk_Room_Room Type1_idx` (`room_type_name`,`hotel_id`),
  KEY `fk_room_employee1_idx` (`cleaning_staff_id`),
  CONSTRAINT `fk_room_employee1` FOREIGN KEY (`cleaning_staff_id`) REFERENCES `employee` (`employee_id`),
  CONSTRAINT `fk_Room_Room Type1` FOREIGN KEY (`room_type_name`, `hotel_id`) REFERENCES `room_type` (`room_type_name`, `hotel_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room`
--

LOCK TABLES `room` WRITE;
/*!40000 ALTER TABLE `room` DISABLE KEYS */;
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
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`room_type_name`,`hotel_id`),
  KEY `fk_Room Type_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_Room Type_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type`
--

LOCK TABLES `room_type` WRITE;
/*!40000 ALTER TABLE `room_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `room_type_features`
--

DROP TABLE IF EXISTS `room_type_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `room_type_features` (
  `features` varchar(100) NOT NULL,
  `room_type_name` varchar(20) NOT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`features`,`room_type_name`,`hotel_id`),
  KEY `fk_room_type_features_room_type1_idx` (`room_type_name`,`hotel_id`),
  CONSTRAINT `fk_room_type_features_room_type1` FOREIGN KEY (`room_type_name`, `hotel_id`) REFERENCES `room_type` (`room_type_name`, `hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `room_type_features`
--

LOCK TABLES `room_type_features` WRITE;
/*!40000 ALTER TABLE `room_type_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `room_type_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `from` time NOT NULL,
  `to` time NOT NULL,
  `salary_per_hour` int NOT NULL,
  `employee_id` int NOT NULL,
  `salary_per_month` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_schedule_employee1_idx` (`employee_id`),
  CONSTRAINT `fk_schedule_employee1` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `season`
--

DROP TABLE IF EXISTS `season`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `season` (
  `name` varchar(45) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `season`
--

LOCK TABLES `season` WRITE;
/*!40000 ALTER TABLE `season` DISABLE KEYS */;
/*!40000 ALTER TABLE `season` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services` (
  `service_name` varchar(45) NOT NULL,
  `price` int NOT NULL,
  `hotel_id` int NOT NULL,
  PRIMARY KEY (`service_name`,`hotel_id`),
  KEY `fk_services_hotel1_idx` (`hotel_id`),
  CONSTRAINT `fk_services_hotel1` FOREIGN KEY (`hotel_id`) REFERENCES `hotel` (`hotel_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
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
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weekday`
--

DROP TABLE IF EXISTS `weekday`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weekday` (
  `weekday` varchar(10) NOT NULL,
  `rate` double NOT NULL,
  PRIMARY KEY (`weekday`),
  UNIQUE KEY `weekday_UNIQUE` (`weekday`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weekday`
--

LOCK TABLES `weekday` WRITE;
/*!40000 ALTER TABLE `weekday` DISABLE KEYS */;
/*!40000 ALTER TABLE `weekday` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-11 16:30:42
