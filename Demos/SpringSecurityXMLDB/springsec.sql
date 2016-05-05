SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `springsec` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `springsec` ;

-- -----------------------------------------------------
-- Table `springsec`.`users`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `springsec`.`users` (
  `username` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `enabled` VARCHAR(45) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`username`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `springsec`.`user_roles`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `springsec`.`user_roles` (
  `user_role_id` INT NOT NULL AUTO_INCREMENT ,
  `role` VARCHAR(45) NULL ,
  `username` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`user_role_id`) ,
  INDEX `fk_user_roles_users_idx` (`username` ASC) ,
  CONSTRAINT `fk_user_roles_users`
    FOREIGN KEY (`username` )
    REFERENCES `springsec`.`users` (`username` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `springsec` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
