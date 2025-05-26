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
-- Schema new_schema1
-- -----------------------------------------------------
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Mieten`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mieten` (
  `M_ID` INT NOT NULL AUTO_INCREMENT,
  `Mietdatum` DATETIME NOT NULL,
  `Rückgabedatum` DATETIME NOT NULL,
  PRIMARY KEY (`M_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Kunde`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Kunde` (
  `K_ID` INT NOT NULL AUTO_INCREMENT,
  `Nachname` VARCHAR(45) NOT NULL,
  `Vorname` VARCHAR(45) NOT NULL,
  `Geschlecht` VARCHAR(45) NOT NULL,
  `Gbrtsjahr` INT NOT NULL COMMENT '\nNur ganzzahliges Jahr, z. B. 1990',
  `E-Mail` VARCHAR(100) NOT NULL COMMENT 'Platz für längere E-Mail Adressen',
  `Auto_A_ID` INT NOT NULL,
  PRIMARY KEY (`K_ID`),
  INDEX `fk_Kunde_Mieten1_idx` (`Auto_A_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Kunde_Mieten1`
    FOREIGN KEY (`Auto_A_ID`)
    REFERENCES `mydb`.`Mieten` (`M_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Werkstatt`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Werkstatt` (
  `W_ID` INT NOT NULL AUTO_INCREMENT,
  `Art` VARCHAR(45) NULL,
  `Kosten` INT NULL,
  PRIMARY KEY (`W_ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Auto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Auto` (
  `A_ID` INT NOT NULL AUTO_INCREMENT,
  `Marke` VARCHAR(45) NOT NULL,
  `Erscheinungsjahr` INT NOT NULL,
  `Nummer` INT NOT NULL,
  `Preis` DECIMAL(10,2) NOT NULL,
  `Mieten_M_ID` INT NOT NULL,
  `Werkstatt_W_ID` INT NULL,
  PRIMARY KEY (`A_ID`),
  INDEX `fk_Auto_Mieten1_idx` (`Mieten_M_ID` ASC) VISIBLE,
  INDEX `fk_Auto_Werkstatt1_idx` (`Werkstatt_W_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Auto_Mieten1`
    FOREIGN KEY (`Mieten_M_ID`)
    REFERENCES `mydb`.`Mieten` (`M_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Auto_Werkstatt1`
    FOREIGN KEY (`Werkstatt_W_ID`)
    REFERENCES `mydb`.`Werkstatt` (`W_ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Mieten`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (1, '2025-04-20', '2025-04-27');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (2, '2025-04-28', '2025-05-20');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (3, '2025-04-02', '2025-04-06');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (4, '2025-03-06', '2025-03-23');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (5, '2025-02-05', '2025-02-21');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (6, '2025-04-06', '2025-04-09');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (7, '2025-05-09', '2025-05-22');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (8, '2025-04-27', '2025-04-29');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (9, '2025-07-05', '2025-07-26');
INSERT INTO `mydb`.`Mieten` (`M_ID`, `Mietdatum`, `Rückgabedatum`) VALUES (10, '2025-04-01', '2025-04-04');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Kunde`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (1, 'Aho', 'Fima', 'w', 2007, 'aho.fima@gmail.com', 1);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (2, 'Schmidt', 'Lukas', 'm', 1999, 'slukas@gmail.com', 2);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (3, 'Fischer ', 'Laura', 'w', 1994, 'flaura@gmail.com', 4);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (4, 'Weber', 'Lukas', 'm', 1985, 'lweber@gmail.co', 10);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (5, 'El-Sayed', 'Yasmin', 'w', 1996, 'yasmin.sayed@gmail.com', 9);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (6, 'Yilmaz', 'Ayse', 'w', 1994, 'yayse@gmail.com', 8);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (7, 'Demir', 'Mehmet', 'm', 1992, 'mehmetdem23@gmail.com', 6);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (8, 'Kara', 'Zeynep', 'w', 1986, 'k.zeynep@gmail.com', 3);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (9, 'Polat', 'Emre', 'm', 1998, 'polatemre@gmail.com', 8);
INSERT INTO `mydb`.`Kunde` (`K_ID`, `Nachname`, `Vorname`, `Geschlecht`, `Gbrtsjahr`, `E-Mail`, `Auto_A_ID`) VALUES (10, 'Celik', 'Ahmet', 'm', 1978, 'cahmet@gmail.com', 5);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Werkstatt`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Werkstatt` (`W_ID`, `Art`, `Kosten`) VALUES (1, 'Inspektion', 150);
INSERT INTO `mydb`.`Werkstatt` (`W_ID`, `Art`, `Kosten`) VALUES (2, 'Reparatur', 450);
INSERT INTO `mydb`.`Werkstatt` (`W_ID`, `Art`, `Kosten`) VALUES (3, 'TUEV', 90);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Auto`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (1, 'BMW 3er', 2022, 12345, 85, 1, 1);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (2, 'Audi A4', 2021, 5678, 80, 2, 1);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (3, 'VW Golf', 2020, 1111, 65, 2, 2);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (4, 'Mercedes C200', 2023, 2222, 95, 3, NULL);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (5, 'Skoda Octavia', 2020, 8888, 60, 4, NULL);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (6, 'Opel Astra', 2022, 3333, 70, 5, NULL);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (7, 'Ford Focus', 2021, 4444, 65, 6, 2);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (8, 'Mazda 3', 2023, 3456, 60, 7, NULL);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (9, 'Toyota Yaris', 2023, 9090, 62, 8, NULL);
INSERT INTO `mydb`.`Auto` (`A_ID`, `Marke`, `Erscheinungsjahr`, `Nummer`, `Preis`, `Mieten_M_ID`, `Werkstatt_W_ID`) VALUES (10, 'Kia Ceed', 2022, 6767, 63, 9, 3);

COMMIT;

