-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mns_mobile
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mns_mobile` ;

-- -----------------------------------------------------
-- Schema mns_mobile
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mns_mobile` ;
USE `mns_mobile` ;

-- -----------------------------------------------------
-- Table `mns_mobile`.`user_class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mns_mobile`.`user_class` ;

CREATE TABLE IF NOT EXISTS `mns_mobile`.`user_class` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mns_mobile`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mns_mobile`.`user` ;

CREATE TABLE IF NOT EXISTS `mns_mobile`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_class` INT UNSIGNED NULL,
  `username` VARCHAR(45) NULL,
  `password_hash` CHAR(40) NULL,
  `name` VARCHAR(55) NULL,
  `email` VARCHAR(55) NULL,
  `phone` VARCHAR(16) NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `fk_user_class_idx` (`user_class` ASC) VISIBLE,
  CONSTRAINT `fk_user_class`
    FOREIGN KEY (`user_class`)
    REFERENCES `mns_mobile`.`user_class` (`id`)
    ON DELETE SET NULL
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mns_mobile`.`message`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mns_mobile`.`message` ;

CREATE TABLE IF NOT EXISTS `mns_mobile`.`message` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NULL,
  `description` VARCHAR(255) NULL,
  `config_attributes` JSON NULL,
  `config_destination` JSON NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mns_mobile`.`fav_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mns_mobile`.`fav_category` ;

CREATE TABLE IF NOT EXISTS `mns_mobile`.`fav_category` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(55) NULL,
  `icon` VARCHAR(55) NULL,
  `config_attributes` JSON NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mns_mobile`.`favorite`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mns_mobile`.`favorite` ;

CREATE TABLE IF NOT EXISTS `mns_mobile`.`favorite` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `fav_category_id` INT UNSIGNED NULL,
  `user_id` INT UNSIGNED NULL,
  `message_id` INT UNSIGNED NULL,
  `icon` VARCHAR(55) NULL,
  `config_attributes` JSON NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `message_id_idx` (`message_id` ASC) VISIBLE,
  INDEX `fav_category_id_idx` (`fav_category_id` ASC) VISIBLE,
  CONSTRAINT `user_id`
    FOREIGN KEY (`user_id`)
    REFERENCES `mns_mobile`.`user` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `message_id`
    FOREIGN KEY (`message_id`)
    REFERENCES `mns_mobile`.`message` (`id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fav_category_id`
    FOREIGN KEY (`fav_category_id`)
    REFERENCES `mns_mobile`.`fav_category` (`id`)
    ON DELETE NO ACTION
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mns_mobile`.`endpoint`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mns_mobile`.`endpoint` ;

CREATE TABLE IF NOT EXISTS `mns_mobile`.`endpoint` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NULL,
  `config_attributes` JSON NULL,
  `created_at` DATETIME NULL,
  `updated_at` DATETIME NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mns_mobile`.`user_class`
-- -----------------------------------------------------
START TRANSACTION;
USE `mns_mobile`;
INSERT INTO `mns_mobile`.`user_class` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'Administrator', NOW(), NULL);
INSERT INTO `mns_mobile`.`user_class` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'Staff', NOW(), NULL);
INSERT INTO `mns_mobile`.`user_class` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'User', NOW(), NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mns_mobile`.`user`
-- -----------------------------------------------------
START TRANSACTION;
USE `mns_mobile`;
INSERT INTO `mns_mobile`.`user` (`id`, `user_class`, `username`, `password_hash`, `name`, `email`, `phone`, `created_at`, `updated_at`) VALUES (1, 1, 'admin', SHA1('admin'), 'Default Administrator', NULL, NULL, NOW(), NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mns_mobile`.`message`
-- -----------------------------------------------------
START TRANSACTION;
USE `mns_mobile`;
INSERT INTO `mns_mobile`.`message` (`id`, `name`, `description`, `config_attributes`, `config_destination`, `created_at`, `updated_at`) VALUES (1, 'Default Message', 'The system default for a basic message.', NULL, NULL, NOW(), NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mns_mobile`.`fav_category`
-- -----------------------------------------------------
START TRANSACTION;
USE `mns_mobile`;
INSERT INTO `mns_mobile`.`fav_category` (`id`, `name`, `icon`, `config_attributes`, `created_at`, `updated_at`) VALUES (1, 'System', NULL, NULL, NOW(), NULL);
INSERT INTO `mns_mobile`.`fav_category` (`id`, `name`, `icon`, `config_attributes`, `created_at`, `updated_at`) VALUES (2, 'Uncategorized', NULL, NULL, NOW(), NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mns_mobile`.`favorite`
-- -----------------------------------------------------
START TRANSACTION;
USE `mns_mobile`;
INSERT INTO `mns_mobile`.`favorite` (`id`, `fav_category_id`, `user_id`, `message_id`, `icon`, `config_attributes`, `created_at`, `updated_at`) VALUES (1, 1, 1, 1, NULL, NULL, NOW(), NULL);

COMMIT;

USE `mns_mobile`;

DELIMITER $$

USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`user_class_BEFORE_INSERT` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`user_class_BEFORE_INSERT` BEFORE INSERT ON `user_class` FOR EACH ROW
BEGIN
SET NEW.created_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`user_class_BEFORE_UPDATE` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`user_class_BEFORE_UPDATE` BEFORE UPDATE ON `user_class` FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`user_BEFORE_INSERT` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`user_BEFORE_INSERT` BEFORE INSERT ON `user` FOR EACH ROW
BEGIN
SET NEW.created_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`user_BEFORE_UPDATE` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`user_BEFORE_UPDATE` BEFORE UPDATE ON `user` FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`message_BEFORE_INSERT` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`message_BEFORE_INSERT` BEFORE INSERT ON `message` FOR EACH ROW
BEGIN
SET NEW.created_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`message_BEFORE_UPDATE` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`message_BEFORE_UPDATE` BEFORE UPDATE ON `message` FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`fav_category_BEFORE_INSERT` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`fav_category_BEFORE_INSERT` BEFORE INSERT ON `fav_category` FOR EACH ROW
BEGIN
SET NEW.created_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`fav_category_BEFORE_UPDATE` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`fav_category_BEFORE_UPDATE` BEFORE UPDATE ON `fav_category` FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`favorite_BEFORE_INSERT` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`favorite_BEFORE_INSERT` BEFORE INSERT ON `favorite` FOR EACH ROW
BEGIN
SET NEW.created_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`favorite_BEFORE_UPDATE` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`favorite_BEFORE_UPDATE` BEFORE UPDATE ON `favorite` FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`endpoint_BEFORE_INSERT` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`endpoint_BEFORE_INSERT` BEFORE INSERT ON `endpoint` FOR EACH ROW
BEGIN
SET NEW.created_at = NOW();
END$$


USE `mns_mobile`$$
DROP TRIGGER IF EXISTS `mns_mobile`.`endpoint_BEFORE_UPDATE` $$
USE `mns_mobile`$$
CREATE DEFINER = CURRENT_USER TRIGGER `mns_mobile`.`endpoint_BEFORE_UPDATE` BEFORE UPDATE ON `endpoint` FOR EACH ROW
BEGIN
SET NEW.updated_at = NOW();
END$$


DELIMITER ;
