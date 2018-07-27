-- MySQL Workbench Synchronization
-- Generated: 2015-02-22 00:49
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblada` 
DROP FOREIGN KEY `fk_tblada_tblass`;

ALTER TABLE `semanario`.`tblbda` 
DROP FOREIGN KEY `fk_tblbda_tblass`;

ALTER TABLE `semanario`.`tblada` 
ADD CONSTRAINT `fk_tblada_tblass`
  FOREIGN KEY (`asscod`)
  REFERENCES `semanario`.`tblass` (`asscod`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;

ALTER TABLE `semanario`.`tblbda` 
ADD CONSTRAINT `fk_tblbda_tblass`
  FOREIGN KEY (`asscod` , `adacod`)
  REFERENCES `semanario`.`tblada` (`asscod` , `adacod`)
  ON DELETE CASCADE
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
