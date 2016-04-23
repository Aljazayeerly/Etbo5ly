SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `cooking`.`cook_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`cook_status` (
  `status_id` INT NOT NULL ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`cook`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`cook` (
  `cook_id` INT NOT NULL AUTO_INCREMENT ,
  `email` VARCHAR(45) NOT NULL ,
  `name` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `phone_number` VARCHAR(45) NOT NULL ,
  `image` LONGBLOB NULL ,
  `enabled` TINYINT NULL ,
  `start_working_hours` TIME NULL ,
  `end_working_hours` TIME NULL ,
  `cook_status_id` INT NOT NULL ,
  `registeration_date` DATETIME NULL ,
  PRIMARY KEY (`cook_id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) ,
  INDEX `fk_cook_cook_status1_idx` (`cook_status_id` ASC) ,
  CONSTRAINT `fk_cook_cook_status1`
    FOREIGN KEY (`cook_status_id` )
    REFERENCES `cooking`.`cook_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`customer` (
  `customer_id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(45) NOT NULL ,
  `password` VARCHAR(45) NOT NULL ,
  `address` VARCHAR(45) NULL ,
  `phone_number` VARCHAR(45) NOT NULL ,
  `image` LONGBLOB NULL ,
  `enabled` TINYINT NULL ,
  `registeration_date` DATETIME NULL ,
  PRIMARY KEY (`customer_id`) ,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`order` (
  `order_id` INT NOT NULL AUTO_INCREMENT ,
  `location` VARCHAR(100) NOT NULL ,
  `order_time` DATETIME NOT NULL ,
  `duration` INT NOT NULL ,
  `customer_rating` SMALLINT NULL ,
  `order_comment` VARCHAR(150) NULL ,
  `cook_rating` SMALLINT NULL ,
  `cook_comment` VARCHAR(150) NULL ,
  `cook_id` INT NOT NULL ,
  `customer_id` INT NOT NULL ,
  `type` VARCHAR(45) NULL ,
  PRIMARY KEY (`order_id`) ,
  INDEX `fk_order_cook_idx` (`cook_id` ASC) ,
  INDEX `fk_order_customer1_idx` (`customer_id` ASC) ,
  CONSTRAINT `fk_order_cook`
    FOREIGN KEY (`cook_id` )
    REFERENCES `cooking`.`cook` (`cook_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customer_id` )
    REFERENCES `cooking`.`customer` (`customer_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`menu_items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`menu_items` (
  `item_id` INT NOT NULL ,
  `name_en` VARCHAR(45) NOT NULL ,
  `name_ar` VARCHAR(45) NOT NULL ,
  `price` FLOAT NOT NULL ,
  `image` LONGBLOB NOT NULL ,
  `description_en` VARCHAR(200) NOT NULL ,
  `description_ar` VARCHAR(200) NOT NULL ,
  `item_rate` SMALLINT NULL ,
  `cook_id` INT NOT NULL ,
  PRIMARY KEY (`item_id`) ,
  INDEX `fk_menu_items_cook1_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_menu_items_cook1`
    FOREIGN KEY (`cook_id` )
    REFERENCES `cooking`.`cook` (`cook_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`order_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`order_details` (
  `quantity` INT NULL ,
  `price` FLOAT NULL ,
  `rating` SMALLINT NULL ,
  `comment` VARCHAR(150) NULL ,
  `order_id` INT NOT NULL ,
  `menu_item_id` INT NOT NULL ,
  INDEX `fk_order_details_order1_idx` (`order_id` ASC) ,
  INDEX `fk_order_details_menu_items1_idx` (`menu_item_id` ASC) ,
  PRIMARY KEY (`order_id`, `menu_item_id`) ,
  CONSTRAINT `fk_order_details_order1`
    FOREIGN KEY (`order_id` )
    REFERENCES `cooking`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_menu_items1`
    FOREIGN KEY (`menu_item_id` )
    REFERENCES `cooking`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`category` (
  `category_id` INT NOT NULL ,
  `name_en` VARCHAR(45) NULL ,
  `name_ar` VARCHAR(45) NULL ,
  PRIMARY KEY (`category_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`tags`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`tags` (
  `tag_id` INT NOT NULL ,
  `tag_en` VARCHAR(45) NULL ,
  `tag_ar` VARCHAR(45) NULL ,
  PRIMARY KEY (`tag_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`category_has_menu_items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`category_has_menu_items` (
  `category_category_id` INT NOT NULL ,
  `menu_items_item_id` INT NOT NULL ,
  PRIMARY KEY (`category_category_id`, `menu_items_item_id`) ,
  INDEX `fk_category_has_menu_items_menu_items1_idx` (`menu_items_item_id` ASC) ,
  INDEX `fk_category_has_menu_items_category1_idx` (`category_category_id` ASC) ,
  CONSTRAINT `fk_category_has_menu_items_category1`
    FOREIGN KEY (`category_category_id` )
    REFERENCES `cooking`.`category` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_items_item_id` )
    REFERENCES `cooking`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`order_status`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`order_status` (
  `status_id` INT NOT NULL ,
  `status` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`status_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`status_has_order`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`status_has_order` (
  `status_status_id` INT NOT NULL ,
  `order_order_id` INT NOT NULL ,
  `time` DATETIME NOT NULL ,
  PRIMARY KEY (`status_status_id`, `order_order_id`) ,
  INDEX `fk_status_has_order_order1_idx` (`order_order_id` ASC) ,
  INDEX `fk_status_has_order_status1_idx` (`status_status_id` ASC) ,
  CONSTRAINT `fk_status_has_order_status1`
    FOREIGN KEY (`status_status_id` )
    REFERENCES `cooking`.`order_status` (`status_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_has_order_order1`
    FOREIGN KEY (`order_order_id` )
    REFERENCES `cooking`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`tags_has_menu_items`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`tags_has_menu_items` (
  `tags_tag_id` INT NOT NULL ,
  `menu_item_id` INT NOT NULL ,
  PRIMARY KEY (`tags_tag_id`, `menu_item_id`) ,
  INDEX `fk_tags_has_menu_items_menu_items1_idx` (`menu_item_id` ASC) ,
  INDEX `fk_tags_has_menu_items_tags1_idx` (`tags_tag_id` ASC) ,
  CONSTRAINT `fk_tags_has_menu_items_tags1`
    FOREIGN KEY (`tags_tag_id` )
    REFERENCES `cooking`.`tags` (`tag_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_menu_items_menu_items1`
    FOREIGN KEY (`menu_item_id` )
    REFERENCES `cooking`.`menu_items` (`item_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`document_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`document_type` (
  `document_type_id` INT NOT NULL ,
  `type` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`document_type_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`document`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`document` (
  `document_id` INT UNSIGNED NOT NULL ,
  `description` VARCHAR(150) NULL ,
  `verfied` TINYINT NULL ,
  `document` LONGBLOB NULL ,
  `document_type_id` INT NOT NULL ,
  `cook_id` INT NOT NULL ,
  PRIMARY KEY (`document_id`) ,
  INDEX `fk_document_document_type1_idx` (`document_type_id` ASC) ,
  INDEX `fk_document_cook1_idx` (`cook_id` ASC) ,
  CONSTRAINT `fk_document_document_type1`
    FOREIGN KEY (`document_type_id` )
    REFERENCES `cooking`.`document_type` (`document_type_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_document_cook1`
    FOREIGN KEY (`cook_id` )
    REFERENCES `cooking`.`cook` (`cook_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`catering_details`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`catering_details` (
  `catering_details_id` INT NOT NULL ,
  `name` VARCHAR(45) NULL ,
  `description` VARCHAR(150) NULL ,
  `quantity` VARCHAR(45) NULL ,
  `price` FLOAT NULL ,
  `order_id` INT NOT NULL ,
  PRIMARY KEY (`catering_details_id`) ,
  INDEX `fk_catering_details_order1_idx` (`order_id` ASC) ,
  CONSTRAINT `fk_catering_details_order1`
    FOREIGN KEY (`order_id` )
    REFERENCES `cooking`.`order` (`order_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`catering`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`catering` (
  `catering_id` INT NOT NULL ,
  `description` VARCHAR(500) NOT NULL ,
  `creation_date` DATETIME NOT NULL ,
  `open_time` INT NOT NULL ,
  `delivery_date` DATETIME NOT NULL ,
  `budget` FLOAT NOT NULL ,
  PRIMARY KEY (`catering_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cooking`.`catering_has_category`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `cooking`.`catering_has_category` (
  `catering_catering_id` INT NOT NULL ,
  `category_category_id` INT NOT NULL ,
  PRIMARY KEY (`catering_catering_id`, `category_category_id`) ,
  INDEX `fk_catering_has_category_category1_idx` (`category_category_id` ASC) ,
  INDEX `fk_catering_has_category_catering1_idx` (`catering_catering_id` ASC) ,
  CONSTRAINT `fk_catering_has_category_catering1`
    FOREIGN KEY (`catering_catering_id` )
    REFERENCES `cooking`.`catering` (`catering_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_catering_has_category_category1`
    FOREIGN KEY (`category_category_id` )
    REFERENCES `cooking`.`category` (`category_id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
