-- MySQL Workbench Synchronization
-- Generated: 2015-02-16 12:58
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `semanario`.`tblcpa` (
  `asscod` INT(11) NOT NULL,
  `adacod` INT(11) NOT NULL,
  `cpadtvenc` DATE NOT NULL,
  `cpadtemis` DATE NOT NULL,
  `cpavl` DOUBLE NOT NULL,
  PRIMARY KEY (`asscod`, `adacod`, `cpadtvenc`),
  CONSTRAINT `fk_tblcpa_tblada1`
    FOREIGN KEY (`asscod` , `adacod`)
    REFERENCES `semanario`.`tblada` (`asscod` , `adacod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
