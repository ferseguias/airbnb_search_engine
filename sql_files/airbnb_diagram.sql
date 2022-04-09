-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema airbnb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema airbnb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `airbnb` DEFAULT CHARACTER SET utf8 ;
USE `airbnb` ;

-- -----------------------------------------------------
-- Table `airbnb`.`hosts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`hosts` (
  `idhosts` INT NOT NULL,
  `host_since` TINYTEXT NULL DEFAULT NULL,
  `host_is_superhost` TINYTEXT NULL DEFAULT NULL,
  `host_name` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`idhosts`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airbnb`.`neighborhoods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`neighborhoods` (
  `idneighborhoods` VARCHAR(145) NOT NULL,
  `municipality` VARCHAR(145) NOT NULL,
  `geometry_area` MEDIUMTEXT NOT NULL,
  PRIMARY KEY (`idneighborhoods`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airbnb`.`listings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`listings` (
  `idlistings` INT NOT NULL,
  `name` VARCHAR(15000) NULL DEFAULT NULL,
  `description` VARCHAR(15000) NULL DEFAULT NULL,
  `room_type` VARCHAR(45) NOT NULL,
  `guests` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `availability_365` INT NOT NULL,
  `number_of_reviews` INT NOT NULL,
  `review_scores` FLOAT NULL DEFAULT NULL,
  `picture_url` VARCHAR(145) NULL DEFAULT NULL,
  `listing_url` VARCHAR(145) NULL DEFAULT NULL,
  `neighborhoods_idneighborhoods` VARCHAR(145) NOT NULL,
  `hosts_idhosts` INT NOT NULL,
  PRIMARY KEY (`idlistings`),
  INDEX `fk_listings_neighborhoods_idx` (`neighborhoods_idneighborhoods` ASC) VISIBLE,
  INDEX `fk_listings_hosts_idx` (`hosts_idhosts` ASC) VISIBLE,
  CONSTRAINT `fk_listings_hosts`
    FOREIGN KEY (`hosts_idhosts`)
    REFERENCES `airbnb`.`hosts` (`idhosts`)
    ON UPDATE CASCADE,
  CONSTRAINT `fk_listings_neighborhoods`
    FOREIGN KEY (`neighborhoods_idneighborhoods`)
    REFERENCES `airbnb`.`neighborhoods` (`idneighborhoods`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airbnb`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`calendar` (
  `idcalendar` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `availability` INT NOT NULL,
  `price` FLOAT NULL DEFAULT NULL,
  `minimum_nights` INT NULL DEFAULT NULL,
  `maximum_nights` INT NULL DEFAULT NULL,
  `listings_idlistings` INT NOT NULL,
  PRIMARY KEY (`idcalendar`),
  INDEX `fk_calendar_listings1_idx` (`listings_idlistings` ASC) VISIBLE,
  CONSTRAINT `fk_calendar_listings1`
    FOREIGN KEY (`listings_idlistings`)
    REFERENCES `airbnb`.`listings` (`idlistings`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `airbnb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`reviews` (
  `idreviews` INT NOT NULL,
  `idreviewer` INT NOT NULL,
  `date` TINYTEXT NOT NULL,
  `reviewer_name` VARCHAR(145) NULL DEFAULT NULL,
  `comments` MEDIUMTEXT NOT NULL,
  `listings_idlistings` INT NOT NULL,
  PRIMARY KEY (`idreviews`),
  INDEX `fk_reviews_listings1_idx` (`listings_idlistings` ASC) VISIBLE,
  CONSTRAINT `fk_reviews_listings1`
    FOREIGN KEY (`listings_idlistings`)
    REFERENCES `airbnb`.`listings` (`idlistings`)
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
