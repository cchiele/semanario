-- MySQL Workbench Synchronization
-- Generated: 2015-02-07 23:54
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblgaa` 
DROP FOREIGN KEY `fk_tblgaa_tblven1`;

ALTER TABLE `semanario`.`tblgaa` 
CHANGE COLUMN `vencod` `vencod` INT(11) NOT NULL ,
CHANGE COLUMN `gaavlass` `gaavlass` DOUBLE NOT NULL ,
CHANGE COLUMN `gaanromes` `gaanromes` INT(11) NOT NULL ;

ALTER TABLE `semanario`.`tblgaa` 
ADD CONSTRAINT `fk_tblgaa_tblven1`
  FOREIGN KEY (`vencod`)
  REFERENCES `semanario`.`tblven` (`vencod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
