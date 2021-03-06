-- MySQL Script generated by MySQL Workbench
-- Fri Apr 27 11:20:36 2018
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`login` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `uname` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `uname_UNIQUE` (`uname` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`personalInfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`personalInfo` (
  `fname` VARCHAR(30) NOT NULL,
  `lname` VARCHAR(45) NOT NULL,
  `dob` DATETIME NOT NULL,
  `phoneno1` VARCHAR(13) NOT NULL,
  `phoneno2` VARCHAR(13) NULL DEFAULT 'Not on file',
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(30) NULL COMMENT '	',
  `state` VARCHAR(45) NULL,
  `zip` INT NULL,
  `pid` INT NOT NULL,
  `login_id` INT NOT NULL,
  PRIMARY KEY (`pid`, `login_id`),
  INDEX `fk_personalInfo_login_idx` (`login_id` ASC),
  CONSTRAINT `fk_personalInfo_login`
    FOREIGN KEY (`login_id`)
    REFERENCES `mydb`.`login` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`doctorsinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`doctorsinfo` (
  `iddoctors` INT NOT NULL,
  `docname` VARCHAR(45) NOT NULL,
  `personalInfo_pid` INT NOT NULL,
  `personalInfo_login_id` INT NOT NULL,
  PRIMARY KEY (`iddoctors`, `personalInfo_pid`, `personalInfo_login_id`),
  INDEX `fk_doctorsinfo_personalInfo1_idx` (`personalInfo_pid` ASC, `personalInfo_login_id` ASC),
  CONSTRAINT `fk_doctorsinfo_personalInfo1`
    FOREIGN KEY (`personalInfo_pid` , `personalInfo_login_id`)
    REFERENCES `mydb`.`personalInfo` (`pid` , `login_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`currentmedication`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`currentmedication` (
  `medid` INT NOT NULL,
  `med1` VARCHAR(45) NULL DEFAULT 'Not on file',
  `med2` VARCHAR(45) NULL DEFAULT 'Not on file',
  `med3` VARCHAR(45) NULL DEFAULT 'Not on file',
  `med4` VARCHAR(45) NULL DEFAULT 'Not on file',
  `med5` VARCHAR(45) NULL DEFAULT 'Not on file',
  `personalInfo_pid` INT NOT NULL,
  `personalInfo_login_id` INT NOT NULL,
  PRIMARY KEY (`medid`, `personalInfo_pid`, `personalInfo_login_id`),
  INDEX `fk_currentmedication_personalInfo1_idx` (`personalInfo_pid` ASC, `personalInfo_login_id` ASC),
  CONSTRAINT `fk_currentmedication_personalInfo1`
    FOREIGN KEY (`personalInfo_pid` , `personalInfo_login_id`)
    REFERENCES `mydb`.`personalInfo` (`pid` , `login_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`apptinfo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`apptinfo` (
  `idapptinfo` INT NOT NULL,
  `apptdate` DATETIME NULL,
  `appttime` DATETIME NULL,
  `docname` VARCHAR(45) NULL,
  `location` VARCHAR(45) NULL,
  `personalInfo_pid` INT NOT NULL,
  `personalInfo_login_id` INT NOT NULL,
  PRIMARY KEY (`idapptinfo`, `personalInfo_pid`, `personalInfo_login_id`),
  INDEX `fk_apptinfo_personalInfo1_idx` (`personalInfo_pid` ASC, `personalInfo_login_id` ASC),
  CONSTRAINT `fk_apptinfo_personalInfo1`
    FOREIGN KEY (`personalInfo_pid` , `personalInfo_login_id`)
    REFERENCES `mydb`.`personalInfo` (`pid` , `login_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
