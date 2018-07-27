-- MySQL Workbench Synchronization
-- Generated: 2015-08-29 16:53
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE TABLE IF NOT EXISTS `semanario`.`tblhma` (
  `asscod` INT(11) NOT NULL,
  `hmadthr` DATETIME NOT NULL,
  `hmaseq` INT(11) NOT NULL,
  `usucod` INT(11) NOT NULL,
  `hmadescr` TEXT(10000) NOT NULL,
  PRIMARY KEY (`asscod`, `hmadthr`, `hmaseq`),
  INDEX `fk_tblhma_tblusu1_idx` (`usucod` ASC),
  CONSTRAINT `fk_tblhma_tblass`
    FOREIGN KEY (`asscod`)
    REFERENCES `semanario`.`tblass` (`asscod`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tblhma_tblusu`
    FOREIGN KEY (`usucod`)
    REFERENCES `semanario`.`tblusu` (`usucod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
COMMENT = 'Historico de Mudanca do Assinante';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
