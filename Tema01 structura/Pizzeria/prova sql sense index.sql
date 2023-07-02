-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Pizzeria
-- -----------------------------------------------------
-- T’han contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.
DROP SCHEMA IF EXISTS `Pizzeria` ;

-- -----------------------------------------------------
-- Schema Pizzeria
--
-- T’han contractat per a dissenyar una web que permeti fer comandes de menjar a domicili per Internet.
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Pizzeria` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `Pizzeria` ;

-- -----------------------------------------------------
-- Table `Pizzeria`.`address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`address` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`address` (
  `id` INT NOT NULL,
  `Address` VARCHAR(45) NULL,
  `Postal` INT(5) NULL,
  `City` VARCHAR(45) NULL,
  `Provínce` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`clients`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`clients` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`clients` (
  `id_clients` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `id_address` INT NULL,
  `Phone` INT(10) NULL,
  PRIMARY KEY (`id_clients`),
  CONSTRAINT `fk_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `Pizzeria`.`address` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`shop`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`shop` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`shop` (
  `id_shop` INT NOT NULL,
  `id_address` INT NOT NULL,
  PRIMARY KEY (`id_shop`, `id_address`),
  CONSTRAINT `fk_address`
    FOREIGN KEY (`id_address`)
    REFERENCES `Pizzeria`.`address` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`employees`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`employees` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`employees` (
  `id_employee` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(8) NULL,
  `Phone` INT(8) NULL,
  `job` ENUM('Cuiner', 'Repartidor') NULL,
  `id_shop` INT NULL,
  CONSTRAINT `fk_emple`
    FOREIGN KEY (`id_shop`)
    REFERENCES `Pizzeria`.`shop` (`id_shop`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`delivery`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`delivery` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`delivery` (
  `id_delivery` INT NOT NULL,
  `delivery_name` VARCHAR(45) NOT NULL,
  `Date` DATETIME NULL,
  PRIMARY KEY (`id_delivery`),
  CONSTRAINT `fk_empl_deliver`
    FOREIGN KEY (`id_delivery`)
    REFERENCES `Pizzeria`.`employees` (`id_employee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`orders`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`orders` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`orders` (
  `id_order` INT NOT NULL,
  `Date` DATETIME NOT NULL,
  `Distribution` ENUM('Domicili', 'Botiga') NOT NULL,
  `Number` TINYINT(3) NULL,
  `Cost` SMALLINT(4) NULL,
  `id_delivery` INT NOT NULL,
  `id_client` INT NOT NULL,
  PRIMARY KEY (`id_order`),
  CONSTRAINT `fk_orders`
    FOREIGN KEY (`id_client`)
    REFERENCES `Pizzeria`.`clients` (`id_clients`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_shop`
    FOREIGN KEY (`id_order`)
    REFERENCES `Pizzeria`.`shop` (`id_shop`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_deliv`
    FOREIGN KEY (`id_delivery`)
    REFERENCES `Pizzeria`.`delivery` (`id_delivery`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`products`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`products` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`products` (
  `id_product` INT NOT NULL,
  `Product` ENUM('Pizza', 'Hamburguesa', 'Beguda') NULL,
  `Name` VARCHAR(45) NULL,
  `Description` VARCHAR(245) NULL,
  `Image` BLOB NULL,
  `Prize` DECIMAL(3,2) NULL,
  PRIMARY KEY (`id_product`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`category` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`category` (
  `id_category` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  PRIMARY KEY (`id_category`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`burguer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`burguer` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`burguer` (
  `id` INT NOT NULL,
  `id_product` INT NULL,
  `id_order` INT NULL,
  `quantity` TINYINT(3) NULL,
  CONSTRAINT `fk_burguer`
    FOREIGN KEY (`id_order`)
    REFERENCES `Pizzeria`.`orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bur_pro`
    FOREIGN KEY (`id_product`)
    REFERENCES `Pizzeria`.`products` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;



-- -----------------------------------------------------
-- Table `Pizzeria`.`drink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`drink` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`drink` (
  `id` INT NOT NULL,
  `id_product` INT NULL,
  `id_order` INT NULL,
  `quantity` TINYINT(3) NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `fk_drink`
    FOREIGN KEY (`id_order`)
    REFERENCES `Pizzeria`.`orders` (`id_order`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_drink_produ`
    FOREIGN KEY (`id_product`)
    REFERENCES `Pizzeria`.`products` (`id_product`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Pizzeria`.`pizza`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Pizzeria`.`pizza` ;

CREATE TABLE IF NOT EXISTS `Pizzeria`.`pizza` (
  `id` INT NOT NULL,
  `id_product` INT NULL,
  `id_order` INT NULL,
  `quantity` TINYINT(3) NULL,
  CONSTRAINT `fk_pizza`
    FOREIGN KEY (`id`)
    REFERENCES `Pizzeria`.`category` (`id_category`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_order_piz`
    FOREIGN KEY (`id_order`)
    REFERENCES `Pizzeria`.`orders` (`id_order`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pizz_prod`
    FOREIGN KEY (`id_product`)
    REFERENCES `Pizzeria`.`products` (`id_product`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `Pizzeria`.`address`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`address` (`id`, `Address`, `Postal`, `City`, `Provínce`) VALUES (001, 'Entença, 30, At, 1', 08015, 'BCN', 'Catalunya');
INSERT INTO `Pizzeria`.`address` (`id`, `Address`, `Postal`, `City`, `Provínce`) VALUES (002, 'AV Madrid 155, 5º 2ª', 08001, 'BCN', 'Catalunya');
INSERT INTO `Pizzeria`.`address` (`id`, `Address`, `Postal`, `City`, `Provínce`) VALUES (003, 'Carrer Lleida 34, 3º 4ª', 08014, 'BCN', 'Catalunya');
INSERT INTO `Pizzeria`.`address` (`id`, `Address`, `Postal`, `City`, `Provínce`) VALUES (004, 'Plaça Urquinaona, 45, 2º 2ª', 48005, 'Sant Cugat', 'Catalunya');
INSERT INTO `Pizzeria`.`address` (`id`, `Address`, `Postal`, `City`, `Provínce`) VALUES (081, 'Plaça Catalunya, 5', 08001, 'BCN', 'Catalunya');
INSERT INTO `Pizzeria`.`address` (`id`, `Address`, `Postal`, `City`, `Provínce`) VALUES (095, 'Avenida América 356', 28001, 'Madrid', 'Madrid');

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`clients`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`clients` (`id_clients`, `Name`, `Surname`, `id_address`, `Phone`) VALUES (001, 'Joan', 'Perez', 001, 622010010);
INSERT INTO `Pizzeria`.`clients` (`id_clients`, `Name`, `Surname`, `id_address`, `Phone`) VALUES (002, 'Anna', 'Martín', 002, 933252581);
INSERT INTO `Pizzeria`.`clients` (`id_clients`, `Name`, `Surname`, `id_address`, `Phone`) VALUES (003, 'Pedro', 'Sanchez', 003, 644433355);
INSERT INTO `Pizzeria`.`clients` (`id_clients`, `Name`, `Surname`, `id_address`, `Phone`) VALUES (004, 'Martina', 'Folch', 004, 645235842);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`shop`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`shop` (`id_shop`, `id_address`) VALUES (081, 081);
INSERT INTO `Pizzeria`.`shop` (`id_shop`, `id_address`) VALUES (095, 095);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`employees`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`employees` (`id_employee`, `Name`, `Surname`, `NIF`, `Phone`, `job`, `id_shop`) VALUES (1001, 'Antonio', 'Perez', '35222256H', 654212258, 'Repartidor', 001);
INSERT INTO `Pizzeria`.`employees` (`id_employee`, `Name`, `Surname`, `NIF`, `Phone`, `job`, `id_shop`) VALUES (1002, 'Mariona', 'Planells', '356258741L', 658587412, 'Cuiner', 001);
INSERT INTO `Pizzeria`.`employees` (`id_employee`, `Name`, `Surname`, `NIF`, `Phone`, `job`, `id_shop`) VALUES (1003, 'Marc', 'Torné', '568789254Ñ', 687412569, 'Repartidor', 002);
INSERT INTO `Pizzeria`.`employees` (`id_employee`, `Name`, `Surname`, `NIF`, `Phone`, `job`, `id_shop`) VALUES (1004, 'Maria', 'Tarres', '368789654L', 658963125, 'Cuiner', 002);

COMMIT;


-- -----------------------------------------------------
-- Data for table `Pizzeria`.`delivery`
-- -----------------------------------------------------
START TRANSACTION;
USE `Pizzeria`;
INSERT INTO `Pizzeria`.`delivery` (`id_delivery`, `delivery_name`, `Date`) VALUES (1001, '101', '2023-05-12 03:22:00');
INSERT INTO `Pizzeria`.`delivery` (`id_delivery`, `delivery_name`, `Date`) VALUES (1002, '102', '2023-02-05 15:30:00');

COMMIT;

