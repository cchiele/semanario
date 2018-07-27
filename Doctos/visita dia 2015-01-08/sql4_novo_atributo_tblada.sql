-- MySQL Workbench Synchronization
-- Generated: 2015-02-02 23:09
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblada` 
ADD COLUMN `gaaanomes` DATE NULL DEFAULT NULL AFTER `adadtgerauto`,
ADD INDEX `fk_tblada_tblgaa1_idx` (`gaaanomes` ASC);

ALTER TABLE `semanario`.`tblada` 
ADD CONSTRAINT `fk_tblada_tblgaa1`
  FOREIGN KEY (`gaaanomes`)
  REFERENCES `semanario`.`tblgaa` (`gaaanomes`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
