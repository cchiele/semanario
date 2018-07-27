-- MySQL Workbench Synchronization
-- Generated: 2015-01-31 10:22
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblass` 
ADD INDEX `ix_tblass_assdtalt` (`assdtalt` ASC);

ALTER TABLE `semanario`.`tblada` 
ADD INDEX `ix_tblada_adadtalt` (`adadtalt` ASC);


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
