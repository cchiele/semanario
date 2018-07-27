-- MySQL Workbench Synchronization
-- Generated: 2015-01-24 18:29
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: Cristiano

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `semanario`.`tblass` 
ADD COLUMN `assdtalt` DATE AFTER `assobs`,
ADD COLUMN `usucodalt` INT(11) AFTER `assdtalt`,
ADD INDEX `fk_tblass_tblusu1_idx` (`usucodalt` ASC);

update `semanario`.`tblass` set `assdtalt` = '1901-01-01', `usucodalt` = 1
where 1=1;

ALTER TABLE `semanario`.`tblass` 
CHANGE COLUMN `assdtalt` `assdtalt` DATE NOT NULL,
CHANGE COLUMN `usucodalt` `usucodalt` INT(11) NOT NULL;

ALTER TABLE `semanario`.`tblada` 
ADD COLUMN `adadtalt` DATE AFTER `adadtgerauto`,
ADD COLUMN `usucodalt` INT(11) AFTER `adadtalt`,
ADD INDEX `fk_tblada_tblusu1_idx` (`usucodalt` ASC);

update `semanario`.`tblada` set `adadtalt` = '1901-01-01', `usucodalt` = 1
where 1=1;

ALTER TABLE `semanario`.`tblada` 
CHANGE COLUMN `adadtalt` `adadtalt` DATE NOT NULL,
CHANGE COLUMN `usucodalt` `usucodalt` INT(11) NOT NULL;

ALTER TABLE `semanario`.`tblass` 
ADD CONSTRAINT `fk_tblass_tblusu1`
  FOREIGN KEY (`usucodalt`)
  REFERENCES `semanario`.`tblusu` (`usucod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `semanario`.`tblada` 
ADD CONSTRAINT `fk_tblada_tblusu1`
  FOREIGN KEY (`usucodalt`)
  REFERENCES `semanario`.`tblusu` (`usucod`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
