-- MySQL Workbench Synchronization
-- Generated: 2015-02-22 00:50
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblcpa` 
DROP FOREIGN KEY `fk_tblcpa_tblada1`;

ALTER TABLE `semanario`.`tblcpa` 
ADD CONSTRAINT `fk_tblcpa_tblada1`
  FOREIGN KEY (`asscod` , `adacod`)
  REFERENCES `semanario`.`tblada` (`asscod` , `adacod`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;
  
ALTER TABLE `semanario`.`tblhas` 
DROP FOREIGN KEY `fk_tblhas_tblass1`;

ALTER TABLE `semanario`.`tblhas` 
ADD CONSTRAINT `fk_tblhas_tblass1`
  FOREIGN KEY (`asscod`)
  REFERENCES `semanario`.`tblass` (`asscod`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
