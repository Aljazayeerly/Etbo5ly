SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

DROP SCHEMA IF EXISTS `etbo5ly` ;
CREATE SCHEMA IF NOT EXISTS `etbo5ly` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin ;
USE `etbo5ly` ;

-- -----------------------------------------------------
-- Table `etbo5ly`.`category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`category` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name_en` VARCHAR(45) NULL DEFAULT NULL ,
  `name_ar` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`cook_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`cook_status` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`cook_status` (
  `status_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`cook`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`cook` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`cook` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `start_working_hours` TIME NULL DEFAULT NULL ,
  `end_working_hours` TIME NULL DEFAULT NULL ,
  `cook_status_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_cook_cook_status1_idx` (`cook_status_id` ASC) ,
  CONSTRAINT `fk_cook_cook_status1`
    FOREIGN KEY (`cook_status_id` )
    REFERENCES `etbo5ly`.`cook_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 38
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`menu_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`menu_items` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`menu_items` (
  `item_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name_en` VARCHAR(45) NOT NULL ,
  `name_ar` VARCHAR(45) NOT NULL ,
  `price` FLOAT NOT NULL ,
  `image` LONGBLOB NULL DEFAULT NULL ,
  `description_en` VARCHAR(200) NOT NULL ,
  `description_ar` VARCHAR(200) NOT NULL ,
  `item_rate` SMALLINT(6) NULL DEFAULT NULL ,
  `cook_id` INT(11) NOT NULL ,
  PRIMARY KEY (`item_id`) ,
  INDEX `fk_menu_items_cook1_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_menu_items_cook1`
    FOREIGN KEY (`cook_id` )
    REFERENCES `etbo5ly`.`cook` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 8
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`category_has_menu_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`category_has_menu_items` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`category_has_menu_items` (
  `category_category_id` INT(11) NOT NULL ,
  `menu_items_item_id` INT(11) NOT NULL ,
  PRIMARY KEY (`category_category_id`, `menu_items_item_id`) ,
  INDEX `fk_category_has_menu_items_menu_items1_idx` (`menu_items_item_id` ASC) ,
  INDEX `fk_category_has_menu_items_category1_idx` (`category_category_id` ASC) ,
  CONSTRAINT `fk_category_has_menu_items_category1`
    FOREIGN KEY (`category_category_id` )
    REFERENCES `etbo5ly`.`category` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_items_item_id` )
    REFERENCES `etbo5ly`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`catering`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`catering` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`catering` (
  `catering_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(500) NOT NULL ,
  `creation_date` DATETIME NOT NULL ,
  `open_time` INT(11) NOT NULL ,
  `delivery_date` DATETIME NOT NULL ,
  `budget` FLOAT NOT NULL ,
  PRIMARY KEY (`catering_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`user`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`user` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`user` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `enabled` TINYINT(1) NULL DEFAULT NULL ,
  `image` LONGBLOB NULL DEFAULT NULL ,
  `registeration_date` DATETIME NULL DEFAULT NULL ,
  `phone` VARCHAR(25) NOT NULL ,
  `address` VARCHAR(100) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`order` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `location` VARCHAR(100) NOT NULL ,
  `order_time` DATETIME NOT NULL ,
  `duration` INT(11) NOT NULL ,
  `customer_rating` SMALLINT(6) NULL DEFAULT NULL ,
  `order_comment` VARCHAR(150) NULL DEFAULT NULL ,
  `cook_rating` SMALLINT(6) NULL DEFAULT NULL ,
  `cook_comment` VARCHAR(150) NULL DEFAULT NULL ,
  `type` VARCHAR(45) NULL DEFAULT NULL ,
  `customer_id` INT(11) NOT NULL ,
  `cook_id` INT(11) NOT NULL ,
  PRIMARY KEY (`order_id`) ,
  INDEX `fk_order_user1_idx` (`customer_id` ASC) ,
  INDEX `fk_order_user2_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_order_user1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `etbo5ly`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_user2`
    FOREIGN KEY (`cook_id` )
    REFERENCES `etbo5ly`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`catering_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`catering_details` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`catering_details` (
  `catering_details_id` INT(11) NOT NULL ,
  `name` VARCHAR(45) NULL DEFAULT NULL ,
  `description` VARCHAR(150) NULL DEFAULT NULL ,
  `quantity` VARCHAR(45) NULL DEFAULT NULL ,
  `price` FLOAT NULL DEFAULT NULL ,
  `order_id` INT(11) NOT NULL ,
  PRIMARY KEY (`catering_details_id`) ,
  INDEX `fk_catering_details_order1_idx` (`order_id` ASC) ,
  CONSTRAINT `fk_catering_details_order1`
    FOREIGN KEY (`order_id` )
    REFERENCES `etbo5ly`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`catering_has_category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`catering_has_category` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`catering_has_category` (
  `catering_catering_id` INT(11) NOT NULL ,
  `category_category_id` INT(11) NOT NULL ,
  PRIMARY KEY (`catering_catering_id`, `category_category_id`) ,
  INDEX `fk_catering_has_category_category1_idx` (`category_category_id` ASC) ,
  INDEX `fk_catering_has_category_catering1_idx` (`catering_catering_id` ASC) ,
  CONSTRAINT `fk_catering_has_category_category1`
    FOREIGN KEY (`category_category_id` )
    REFERENCES `etbo5ly`.`category` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catering_has_category_catering1`
    FOREIGN KEY (`catering_catering_id` )
    REFERENCES `etbo5ly`.`catering` (`catering_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`customer` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`customer` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 40
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`document_type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`document_type` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`document_type` (
  `document_type_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`document_type_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`document`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`document` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`document` (
  `document_id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `description` VARCHAR(150) NULL DEFAULT NULL ,
  `verfied` TINYINT(4) NULL DEFAULT NULL ,
  `document` LONGBLOB NULL DEFAULT NULL ,
  `document_type_id` INT(11) NOT NULL ,
  `cook_id` INT(11) NOT NULL ,
  PRIMARY KEY (`document_id`) ,
  INDEX `fk_document_document_type1_idx` (`document_type_id` ASC) ,
  INDEX `fk_document_cook1_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_document_cook1`
    FOREIGN KEY (`cook_id` )
    REFERENCES `etbo5ly`.`cook` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_document_document_type1`
    FOREIGN KEY (`document_type_id` )
    REFERENCES `etbo5ly`.`document_type` (`document_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 5
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`order_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`order_details` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`order_details` (
  `quantity` INT(11) NULL DEFAULT NULL ,
  `price` FLOAT NULL DEFAULT NULL ,
  `rating` SMALLINT(6) NULL DEFAULT NULL ,
  `comment` VARCHAR(150) NULL DEFAULT NULL ,
  `order_id` INT(11) NOT NULL ,
  `menu_item_id` INT(11) NOT NULL ,
  PRIMARY KEY (`order_id`, `menu_item_id`) ,
  INDEX `fk_order_details_order1_idx` (`order_id` ASC) ,
  INDEX `fk_order_details_menu_items1_idx` (`menu_item_id` ASC) ,
  CONSTRAINT `fk_order_details_menu_items1`
    FOREIGN KEY (`menu_item_id` )
    REFERENCES `etbo5ly`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_order1`
    FOREIGN KEY (`order_id` )
    REFERENCES `etbo5ly`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`order_status`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`order_status` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`order_status` (
  `status_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`role` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`role` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `role` VARCHAR(10) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`status_has_order`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`status_has_order` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`status_has_order` (
  `status_status_id` INT(11) NOT NULL ,
  `order_order_id` INT(11) NOT NULL ,
  `time` DATETIME NOT NULL ,
  PRIMARY KEY (`status_status_id`, `order_order_id`) ,
  INDEX `fk_status_has_order_order1_idx` (`order_order_id` ASC) ,
  INDEX `fk_status_has_order_status1_idx` (`status_status_id` ASC) ,
  CONSTRAINT `fk_status_has_order_order1`
    FOREIGN KEY (`order_order_id` )
    REFERENCES `etbo5ly`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_has_order_status1`
    FOREIGN KEY (`status_status_id` )
    REFERENCES `etbo5ly`.`order_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`tags` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`tags` (
  `tag_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tag_en` VARCHAR(45) NULL DEFAULT NULL ,
  `tag_ar` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tag_id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`tags_has_menu_items`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`tags_has_menu_items` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`tags_has_menu_items` (
  `tags_tag_id` INT(11) NOT NULL ,
  `menu_item_id` INT(11) NOT NULL ,
  PRIMARY KEY (`tags_tag_id`, `menu_item_id`) ,
  INDEX `fk_tags_has_menu_items_menu_items1_idx` (`menu_item_id` ASC) ,
  INDEX `fk_tags_has_menu_items_tags1_idx` (`tags_tag_id` ASC) ,
  CONSTRAINT `fk_tags_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_item_id` )
    REFERENCES `etbo5ly`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_menu_items_tags1`
    FOREIGN KEY (`tags_tag_id` )
    REFERENCES `etbo5ly`.`tags` (`tag_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `etbo5ly`.`user_has_role`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `etbo5ly`.`user_has_role` ;

CREATE  TABLE IF NOT EXISTS `etbo5ly`.`user_has_role` (
  `user_id` INT(11) NOT NULL ,
  `role_id` INT(11) NOT NULL ,
  PRIMARY KEY (`user_id`, `role_id`) ,
  INDEX `fk_user_has_role_role1_idx` (`role_id` ASC) ,
  INDEX `fk_user_has_role_user1_idx` (`user_id` ASC) ,
  CONSTRAINT `fk_user_has_role_role1`
    FOREIGN KEY (`role_id` )
    REFERENCES `etbo5ly`.`role` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_role_user1`
    FOREIGN KEY (`user_id` )
    REFERENCES `etbo5ly`.`user` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `etbo5ly` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
