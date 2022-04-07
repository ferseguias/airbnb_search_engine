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
-- Table `airbnb`.`neighborhoods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`neighborhoods` (
  `idneighborhoods` INT NOT NULL,
  `neighborhood` VARCHAR(145) NOT NULL,
  `municipality` VARCHAR(145) NOT NULL,
  `geometry_area` TEXT(1000000) NOT NULL,
  PRIMARY KEY (`idneighborhoods`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`host`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`host` (
  `idhost` INT NOT NULL,
  `host_since` DATETIME NULL,
  `host_is_superhost` TINYINT NULL,
  PRIMARY KEY (`idhost`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`listings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`listings` (
  `idlistings` INT NOT NULL,
  `host_idhost` INT NOT NULL,
  `name` VARCHAR(145) NULL,
  `description` VARCHAR(1500) NULL,
  `room_type` VARCHAR(45) NOT NULL,
  `guests` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `availability_365` INT NOT NULL,
  `number_of_reviews` INT NOT NULL,
  `review_scores` FLOAT NULL,
  `geopoint` POINT NOT NULL,
  `neighborhoods_idneighborhoods` INT NOT NULL,
  `picture_url` VARCHAR(145) NULL,
  `listing_url` VARCHAR(145) NULL,
  PRIMARY KEY (`idlistings`),
  INDEX `fk_listings_neighborhoods_idx` (`neighborhoods_idneighborhoods` ASC) VISIBLE,
  INDEX `fk_listings_host1_idx` (`host_idhost` ASC) VISIBLE,
  CONSTRAINT `fk_listings_neighborhoods`
    FOREIGN KEY (`neighborhoods_idneighborhoods`)
    REFERENCES `airbnb`.`neighborhoods` (`idneighborhoods`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listings_host1`
    FOREIGN KEY (`host_idhost`)
    REFERENCES `airbnb`.`host` (`idhost`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`reviews` (
  `idreviews` INT NOT NULL,
  `listings_idlistings` INT NOT NULL,
  `idreviewer` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `reviewer_name` VARCHAR(145) NULL,
  `comments` VARCHAR(1000) NOT NULL,
  PRIMARY KEY (`idreviews`),
  INDEX `fk_reviews_listings1_idx` (`listings_idlistings` ASC) VISIBLE,
  CONSTRAINT `fk_reviews_listings1`
    FOREIGN KEY (`listings_idlistings`)
    REFERENCES `airbnb`.`listings` (`idlistings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`calendar`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`calendar` (
  `idcalendar` INT NOT NULL,
  `listings_idlistings` INT NOT NULL,
  `date` DATETIME NOT NULL,
  `availability` INT NOT NULL,
  `price` FLOAT NULL,
  `minimum_nights` INT NULL,
  `maximum_nights` INT NULL,
  PRIMARY KEY (`idcalendar`),
  INDEX `fk_calendar_listings1_idx` (`listings_idlistings` ASC) VISIBLE,
  CONSTRAINT `fk_calendar_listings1`
    FOREIGN KEY (`listings_idlistings`)
    REFERENCES `airbnb`.`listings` (`idlistings`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
