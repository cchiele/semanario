-- MySQL Workbench Synchronization
-- Generated: 2015-02-09 23:20
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `semanario`.`tblhas` (
  `asscod` INT(11) NOT NULL,
  `hasseg` INT(11) NOT NULL,
  `hasdt` DATE NOT NULL,
  `hasdescr` TEXT(1000) NOT NULL,
  PRIMARY KEY (`asscod`, `hasseg`),
  CONSTRAINT `fk_tblhas_tblass1`
    FOREIGN KEY (`asscod`)
    REFERENCES `semanario`.`tblass` (`asscod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
