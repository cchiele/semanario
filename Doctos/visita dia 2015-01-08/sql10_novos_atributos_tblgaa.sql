-- MySQL Workbench Synchronization
-- Generated: 2015-02-08 00:28
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblada` 
ADD COLUMN `gaacod` INT(11) NULL AFTER `gaaanomes`,
ADD INDEX `fk_tblada_tblgaa2_idx` (`gaacod` ASC);

ALTER TABLE `semanario`.`tblgaa` 
CHANGE COLUMN `gaacod` `gaacod` INT(11) NOT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`gaacod`),
ADD UNIQUE INDEX `gaaanomes_UNIQUE` (`gaaanomes` ASC);

ALTER TABLE `semanario`.`tblada` 
ADD CONSTRAINT `fk_tblada_tblgaa2`
  FOREIGN KEY (`gaacod`)
  REFERENCES `semanario`.`tblgaa` (`gaacod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
