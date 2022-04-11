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
CREATE SCHEMA IF NOT EXISTS `airbnb` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_bin ;
USE `airbnb` ;

-- -----------------------------------------------------
-- Table `airbnb`.`neighborhoods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`neighborhoods` (
  `idneighborhoods` VARCHAR(150) NOT NULL,
  `municipality` LONGTEXT NOT NULL,
  `geometry_area` LONGTEXT NOT NULL,
  PRIMARY KEY (`idneighborhoods`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`hosts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`hosts` (
  `idhosts` INT NOT NULL,
  `host_since` TINYTEXT NULL,
  `host_is_superhost` TINYTEXT NULL,
  `host_name` LONGTEXT NULL,
  PRIMARY KEY (`idhosts`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`listings`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`listings` (
  `idlistings` INT NOT NULL,
  `listing_name` LONGTEXT NULL,
  `listing_description` LONGTEXT NULL,
  `room_type` MEDIUMTEXT NOT NULL,
  `guests` INT NOT NULL,
  `price` FLOAT NOT NULL,
  `availability_365` INT NOT NULL,
  `latitude` VARCHAR(45) NULL,
  `longitude` VARCHAR(45) NULL,
  `number_of_reviews` INT NOT NULL,
  `review_scores` FLOAT NULL,
  `listing_url` LONGTEXT NULL,
  `picture_url` LONGTEXT NULL,
  `neighborhoods_idneighborhoods` VARCHAR(150) NOT NULL,
  `hosts_idhosts` INT NOT NULL,
  PRIMARY KEY (`idlistings`),
  INDEX `fk_listings_neighborhoods_idx` (`neighborhoods_idneighborhoods` ASC) VISIBLE,
  INDEX `fk_listings_hosts1_idx` (`hosts_idhosts` ASC) VISIBLE,
  CONSTRAINT `fk_listings_neighborhoods`
    FOREIGN KEY (`neighborhoods_idneighborhoods`)
    REFERENCES `airbnb`.`neighborhoods` (`idneighborhoods`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_listings_hosts1`
    FOREIGN KEY (`hosts_idhosts`)
    REFERENCES `airbnb`.`hosts` (`idhosts`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `airbnb`.`reviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `airbnb`.`reviews` (
  `idreviews` VARCHAR(25) NOT NULL,
  `idreviewer` VARCHAR(25) NOT NULL,
  `reviewer_name` VARCHAR(150) NULL,
  `date_posted` MEDIUMTEXT NOT NULL,
  `guest_comments` MEDIUMTEXT NOT NULL,
  `listings_idlistings` INT NOT NULL,
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
  `calendar_date` VARCHAR(45) NOT NULL,
  `availability` VARCHAR(45) NOT NULL,
  `price` FLOAT NOT NULL,
  `adjusted_price` FLOAT NOT NULL,
  `minimum_nights` INT NOT NULL,
  `maximum_nights` INT NOT NULL,
  `listings_idlistings` INT NOT NULL,
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
