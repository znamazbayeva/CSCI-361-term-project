-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `hotel` ;

-- -----------------------------------------------------
-- Schema hotel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hotel` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Hotel` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Hotel` (
  `Name` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Name`))
ENGINE = InnoDB;

USE `hotel` ;

-- -----------------------------------------------------
-- Table `hotel`.`guest`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`guest` ;

CREATE TABLE IF NOT EXISTS `hotel`.`guest` (
  `guest_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `phone_number` VARCHAR(45) NULL,
  `password` VARCHAR(200) NOT NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`guest_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`season`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`season` ;

CREATE TABLE IF NOT EXISTS `hotel`.`season` (
  `name` VARCHAR(45) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `day_of_week` DATE NOT NULL,
  PRIMARY KEY (`name`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`hotel`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`hotel` ;

CREATE TABLE IF NOT EXISTS `hotel`.`hotel` (
  `hotel_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `country_code` CHAR(2) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `street` VARCHAR(45) NOT NULL,
  `country_name` VARCHAR(45) NOT NULL,
  `season_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hotel_id`),
  INDEX `fk_hotel_season1_idx` (`season_name` ASC) VISIBLE,
  CONSTRAINT `fk_hotel_season1`
    FOREIGN KEY (`season_name`)
    REFERENCES `hotel`.`season` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 116
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`room_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`room_type` ;

CREATE TABLE IF NOT EXISTS `hotel`.`room_type` (
  `room_type_name` VARCHAR(20) NOT NULL,
  `size` INT NOT NULL,
  `capacity` INT NOT NULL,
  `price` INT NOT NULL,
  `season_name` VARCHAR(15) NOT NULL,
  `hotel_id` INT NOT NULL,
  PRIMARY KEY (`room_type_name`, `hotel_id`),
  INDEX `fk_Room Type_Season1_idx` (`season_name` ASC) VISIBLE,
  INDEX `fk_Room Type_hotel1_idx` (`hotel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room Type_Season1`
    FOREIGN KEY (`season_name`)
    REFERENCES `hotel`.`season` (`name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Room Type_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`booking`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`booking` ;

CREATE TABLE IF NOT EXISTS `hotel`.`booking` (
  `booking_id` INT NOT NULL,
  `booking_date` VARCHAR(45) NOT NULL,
  `check_in` DATE NOT NULL,
  `check_out` DATE NOT NULL,
  `period` INT NOT NULL,
  `guest_id` INT NOT NULL,
  `bill` VARCHAR(45) NOT NULL,
  `room_type_name` VARCHAR(20) NOT NULL,
  `hotel_id` INT NOT NULL,
  `room_number` INT NOT NULL,
  PRIMARY KEY (`booking_id`, `guest_id`),
  INDEX `fk_Booking_guest1_idx` (`guest_id` ASC) VISIBLE,
  INDEX `fk_booking_room_type1_idx` (`room_type_name` ASC, `hotel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Booking_guest1`
    FOREIGN KEY (`guest_id`)
    REFERENCES `hotel`.`guest` (`guest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_booking_room_type1`
    FOREIGN KEY (`room_type_name` , `hotel_id`)
    REFERENCES `hotel`.`room_type` (`room_type_name` , `hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`employee`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`employee` ;

CREATE TABLE IF NOT EXISTS `hotel`.`employee` (
  `employee_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `second_name` VARCHAR(45) NOT NULL,
  `e-mail` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `manager_id` INT NULL,
  `employee_type` VARCHAR(45) NOT NULL,
  `erole_id` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_Employee_Employee1_idx` (`manager_id` ASC) VISIBLE,
  UNIQUE INDEX `manager_id_UNIQUE` (`manager_id` ASC) VISIBLE,
  CONSTRAINT `fk_Employee_Employee1`
    FOREIGN KEY (`manager_id`)
    REFERENCES `hotel`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`room`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`room` ;

CREATE TABLE IF NOT EXISTS `hotel`.`room` (
  `room_number` INT NOT NULL AUTO_INCREMENT,
  `floor` VARCHAR(45) NOT NULL,
  `cleaning_status` VARCHAR(45) NOT NULL,
  `room_type_name` VARCHAR(20) NOT NULL,
  `hotel_id` INT NOT NULL,
  `available` TINYINT NOT NULL,
  `cleaning_staff_id` INT NOT NULL,
  PRIMARY KEY (`room_number`, `room_type_name`, `hotel_id`),
  INDEX `fk_Room_Room Type1_idx` (`room_type_name` ASC, `hotel_id` ASC) VISIBLE,
  INDEX `fk_room_employee1_idx` (`cleaning_staff_id` ASC) VISIBLE,
  CONSTRAINT `fk_Room_Room Type1`
    FOREIGN KEY (`room_type_name` , `hotel_id`)
    REFERENCES `hotel`.`room_type` (`room_type_name` , `hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_room_employee1`
    FOREIGN KEY (`cleaning_staff_id`)
    REFERENCES `hotel`.`employee` (`employee_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `hotel`.`hotelfeatures`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`hotelfeatures` ;

CREATE TABLE IF NOT EXISTS `hotel`.`hotelfeatures` (
  `feature` VARCHAR(45) NOT NULL,
  `hotel_id` INT NOT NULL,
  PRIMARY KEY (`hotel_id`, `feature`),
  INDEX `fk_Features_hotel1_idx` (`hotel_id` ASC) VISIBLE,
  CONSTRAINT `fk_Features_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`phonenumbers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`phonenumbers` ;

CREATE TABLE IF NOT EXISTS `hotel`.`phonenumbers` (
  `hotel_id` INT NOT NULL,
  `phonenumbers` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`hotel_id`, `phonenumbers`),
  CONSTRAINT `fk_PhoneNumbers_hotel1`
    FOREIGN KEY (`hotel_id`)
    REFERENCES `hotel`.`hotel` (`hotel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`room_type_features`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`room_type_features` ;

CREATE TABLE IF NOT EXISTS `hotel`.`room_type_features` (
  `room_type_name` VARCHAR(20) NOT NULL,
  `hotel_id` INT NOT NULL,
  `feature` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`room_type_name`, `hotel_id`, `feature`),
  CONSTRAINT `fk_Features_Room Type1`
    FOREIGN KEY (`room_type_name`)
    REFERENCES `hotel`.`room_type` (`room_type_name`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`user_role` ;

CREATE TABLE IF NOT EXISTS `hotel`.`user_role` (
  `role_id` INT NOT NULL,
  `role_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`role_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hotel`.`guest_has_user_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `hotel`.`guest_has_user_role` ;

CREATE TABLE IF NOT EXISTS `hotel`.`guest_has_user_role` (
  `guest_guest_id` INT NOT NULL,
  `user_role_role_id` INT NOT NULL,
  PRIMARY KEY (`guest_guest_id`, `user_role_role_id`),
  INDEX `fk_guest_has_user_role_user_role1_idx` (`user_role_role_id` ASC) VISIBLE,
  INDEX `fk_guest_has_user_role_guest1_idx` (`guest_guest_id` ASC) VISIBLE,
  CONSTRAINT `fk_guest_has_user_role_guest1`
    FOREIGN KEY (`guest_guest_id`)
    REFERENCES `hotel`.`guest` (`guest_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_guest_has_user_role_user_role1`
    FOREIGN KEY (`user_role_role_id`)
    REFERENCES `hotel`.`user_role` (`role_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
