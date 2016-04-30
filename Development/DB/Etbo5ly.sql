SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
CREATE SCHEMA IF NOT EXISTS `inheritance4` DEFAULT CHARACTER SET latin1 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`category` (
  `category_id` INT(11) NOT NULL ,
  `name_en` VARCHAR(45) NULL DEFAULT NULL ,
  `name_ar` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`cook_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`cook_status` (
  `status_id` INT(11) NOT NULL ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`cook`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`cook` (
  `cook_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `phone_number` VARCHAR(45) NOT NULL ,
  `image` LONGBLOB NULL DEFAULT NULL ,
  `enabled` TINYINT(4) NULL DEFAULT NULL ,
  `start_working_hours` TIME NULL DEFAULT NULL ,
  `end_working_hours` TIME NULL DEFAULT NULL ,
  `cook_status_id` INT(11) NOT NULL ,
  `registeration_date` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`cook_id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `fk_cook_cook_status1_idx` (`cook_status_id` ASC) ,
  CONSTRAINT `fk_cook_cook_status1`
    FOREIGN KEY (`cook_status_id` )
    REFERENCES `mydb`.`cook_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`menu_items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`menu_items` (
  `item_id` INT(11) NOT NULL ,
  `name_en` VARCHAR(45) NOT NULL ,
  `name_ar` VARCHAR(45) NOT NULL ,
  `price` FLOAT NOT NULL ,
  `image` LONGBLOB NOT NULL ,
  `description_en` VARCHAR(200) NOT NULL ,
  `description_ar` VARCHAR(200) NOT NULL ,
  `item_rate` SMALLINT(6) NULL DEFAULT NULL ,
  `cook_id` INT(11) NOT NULL ,
  PRIMARY KEY (`item_id`) ,
  INDEX `fk_menu_items_cook1_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_menu_items_cook1`
    FOREIGN KEY (`cook_id` )
    REFERENCES `mydb`.`cook` (`cook_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`category_has_menu_items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`category_has_menu_items` (
  `category_category_id` INT(11) NOT NULL ,
  `menu_items_item_id` INT(11) NOT NULL ,
  PRIMARY KEY (`category_category_id`, `menu_items_item_id`) ,
  INDEX `fk_category_has_menu_items_menu_items1_idx` (`menu_items_item_id` ASC) ,
  INDEX `fk_category_has_menu_items_category1_idx` (`category_category_id` ASC) ,
  CONSTRAINT `fk_category_has_menu_items_category1`
    FOREIGN KEY (`category_category_id` )
    REFERENCES `mydb`.`category` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_items_item_id` )
    REFERENCES `mydb`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`catering`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`catering` (
  `catering_id` INT(11) NOT NULL ,
  `description` VARCHAR(500) NOT NULL ,
  `creation_date` DATETIME NOT NULL ,
  `open_time` INT(11) NOT NULL ,
  `delivery_date` DATETIME NOT NULL ,
  `budget` FLOAT NOT NULL ,
  PRIMARY KEY (`catering_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`customer` (
  `customer_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NULL DEFAULT NULL ,
  `phone_number` VARCHAR(45) NOT NULL ,
  `image` LONGBLOB NULL DEFAULT NULL ,
  `enabled` TINYINT(4) NULL DEFAULT NULL ,
  `registeration_date` DATETIME NULL DEFAULT NULL ,
  PRIMARY KEY (`customer_id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`order` (
  `order_id` INT(11) NOT NULL AUTO_INCREMENT ,
  `location` VARCHAR(100) NOT NULL ,
  `order_time` DATETIME NOT NULL ,
  `duration` INT(11) NOT NULL ,
  `customer_rating` SMALLINT(6) NULL DEFAULT NULL ,
  `order_comment` VARCHAR(150) NULL DEFAULT NULL ,
  `cook_rating` SMALLINT(6) NULL DEFAULT NULL ,
  `cook_comment` VARCHAR(150) NULL DEFAULT NULL ,
  `cook_id` INT(11) NOT NULL ,
  `customer_id` INT(11) NOT NULL ,
  `type` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`order_id`) ,
  INDEX `fk_order_cook_idx` (`cook_id` ASC) ,
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) ,
  CONSTRAINT `fk_order_cook`
    FOREIGN KEY (`cook_id` )
    REFERENCES `mydb`.`cook` (`cook_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `mydb`.`customer` (`customer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`catering_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`catering_details` (
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
    REFERENCES `mydb`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`catering_has_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`catering_has_category` (
  `catering_catering_id` INT(11) NOT NULL ,
  `category_category_id` INT(11) NOT NULL ,
  PRIMARY KEY (`catering_catering_id`, `category_category_id`) ,
  INDEX `fk_catering_has_category_category1_idx` (`category_category_id` ASC) ,
  INDEX `fk_catering_has_category_catering1_idx` (`catering_catering_id` ASC) ,
  CONSTRAINT `fk_catering_has_category_category1`
    FOREIGN KEY (`category_category_id` )
    REFERENCES `mydb`.`category` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catering_has_category_catering1`
    FOREIGN KEY (`catering_catering_id` )
    REFERENCES `mydb`.`catering` (`catering_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`document_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`document_type` (
  `document_type_id` INT(11) NOT NULL ,
  `type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`document_type_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`document`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`document` (
  `document_id` INT(10) UNSIGNED NOT NULL ,
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
    REFERENCES `mydb`.`cook` (`cook_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_document_document_type1`
    FOREIGN KEY (`document_type_id` )
    REFERENCES `mydb`.`document_type` (`document_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`order_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`order_details` (
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
    REFERENCES `mydb`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_order1`
    FOREIGN KEY (`order_id` )
    REFERENCES `mydb`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`order_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`order_status` (
  `status_id` INT(11) NOT NULL ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`status_has_order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`status_has_order` (
  `status_status_id` INT(11) NOT NULL ,
  `order_order_id` INT(11) NOT NULL ,
  `time` DATETIME NOT NULL ,
  PRIMARY KEY (`status_status_id`, `order_order_id`) ,
  INDEX `fk_status_has_order_order1_idx` (`order_order_id` ASC) ,
  INDEX `fk_status_has_order_status1_idx` (`status_status_id` ASC) ,
  CONSTRAINT `fk_status_has_order_order1`
    FOREIGN KEY (`order_order_id` )
    REFERENCES `mydb`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_has_order_status1`
    FOREIGN KEY (`status_status_id` )
    REFERENCES `mydb`.`order_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tags` (
  `tag_id` INT(11) NOT NULL ,
  `tag_en` VARCHAR(45) NULL DEFAULT NULL ,
  `tag_ar` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`tag_id`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `mydb`.`tags_has_menu_items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`tags_has_menu_items` (
  `tags_tag_id` INT(11) NOT NULL ,
  `menu_item_id` INT(11) NOT NULL ,
  PRIMARY KEY (`tags_tag_id`, `menu_item_id`) ,
  INDEX `fk_tags_has_menu_items_menu_items1_idx` (`menu_item_id` ASC) ,
  INDEX `fk_tags_has_menu_items_tags1_idx` (`tags_tag_id` ASC) ,
  CONSTRAINT `fk_tags_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_item_id` )
    REFERENCES `mydb`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_menu_items_tags1`
    FOREIGN KEY (`tags_tag_id` )
    REFERENCES `mydb`.`tags` (`tag_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

USE `inheritance4` ;

-- -----------------------------------------------------
-- Table `inheritance4`.`person`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `inheritance4`.`person` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `first_name` VARCHAR(50) NOT NULL DEFAULT '0' ,
  `last_name` VARCHAR(50) NOT NULL DEFAULT '0' ,
  `person_type` VARCHAR(45) NULL DEFAULT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inheritance4`.`student`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `inheritance4`.`student` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `department` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `inheritance4`.`teacher`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `inheritance4`.`teacher` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `hire_date` DATE NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = latin1;

USE `mydb` ;
USE `inheritance4` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
