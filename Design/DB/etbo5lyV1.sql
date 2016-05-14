CREATE DATABASE  IF NOT EXISTS `etbo5ly` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;
USE `etbo5ly`;
-- MySQL dump 10.13  Distrib 5.5.16, for Win32 (x86)
--
-- Host: localhost    Database: etbo5ly
-- ------------------------------------------------------
-- Server version	5.0.51b-community-nt

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Not dumping tablespaces as no INFORMATION_SCHEMA.FILES table on this server
--

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category` (
  `category_id` int(11) NOT NULL auto_increment,
  `name_en` varchar(45) default NULL,
  `name_ar` varchar(45) default NULL,
  PRIMARY KEY  (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (3,'apitizers','مقبلات'),(4,'chicken','دجاج');
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category_has_menu_items`
--

DROP TABLE IF EXISTS `category_has_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `category_has_menu_items` (
  `category_category_id` int(11) NOT NULL,
  `menu_items_item_id` int(11) NOT NULL,
  PRIMARY KEY  (`category_category_id`,`menu_items_item_id`),
  KEY `fk_category_has_menu_items_menu_items1_idx` (`menu_items_item_id`),
  KEY `fk_category_has_menu_items_category1_idx` (`category_category_id`),
  CONSTRAINT `fk_category_has_menu_items_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_category_has_menu_items_menu_items1` FOREIGN KEY (`menu_items_item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category_has_menu_items`
--

LOCK TABLES `category_has_menu_items` WRITE;
/*!40000 ALTER TABLE `category_has_menu_items` DISABLE KEYS */;
INSERT INTO `category_has_menu_items` VALUES (3,1),(4,2);
/*!40000 ALTER TABLE `category_has_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catering`
--

DROP TABLE IF EXISTS `catering`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catering` (
  `catering_id` int(11) NOT NULL auto_increment,
  `description` varchar(500) NOT NULL,
  `creation_date` datetime NOT NULL,
  `open_time` int(11) NOT NULL,
  `delivery_date` datetime NOT NULL,
  `budget` float NOT NULL,
  PRIMARY KEY  (`catering_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catering`
--

LOCK TABLES `catering` WRITE;
/*!40000 ALTER TABLE `catering` DISABLE KEYS */;
/*!40000 ALTER TABLE `catering` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catering_details`
--

DROP TABLE IF EXISTS `catering_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catering_details` (
  `catering_details_id` int(11) NOT NULL,
  `name` varchar(45) default NULL,
  `description` varchar(150) default NULL,
  `quantity` varchar(45) default NULL,
  `price` float default NULL,
  `order_id` int(11) NOT NULL,
  PRIMARY KEY  (`catering_details_id`),
  KEY `fk_catering_details_order1_idx` (`order_id`),
  CONSTRAINT `fk_catering_details_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catering_details`
--

LOCK TABLES `catering_details` WRITE;
/*!40000 ALTER TABLE `catering_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `catering_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `catering_has_category`
--

DROP TABLE IF EXISTS `catering_has_category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catering_has_category` (
  `catering_catering_id` int(11) NOT NULL,
  `category_category_id` int(11) NOT NULL,
  PRIMARY KEY  (`catering_catering_id`,`category_category_id`),
  KEY `fk_catering_has_category_category1_idx` (`category_category_id`),
  KEY `fk_catering_has_category_catering1_idx` (`catering_catering_id`),
  CONSTRAINT `fk_catering_has_category_category1` FOREIGN KEY (`category_category_id`) REFERENCES `category` (`category_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_catering_has_category_catering1` FOREIGN KEY (`catering_catering_id`) REFERENCES `catering` (`catering_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catering_has_category`
--

LOCK TABLES `catering_has_category` WRITE;
/*!40000 ALTER TABLE `catering_has_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `catering_has_category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cook`
--

DROP TABLE IF EXISTS `cook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cook` (
  `id` int(11) NOT NULL auto_increment,
  `start_working_hours` time default NULL,
  `end_working_hours` time default NULL,
  `cook_status_id` int(11) NOT NULL,
  PRIMARY KEY  (`id`),
  KEY `fk_cook_cook_status1_idx` (`cook_status_id`),
  CONSTRAINT `fk_cook_cook_status1` FOREIGN KEY (`cook_status_id`) REFERENCES `cook_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cook`
--

LOCK TABLES `cook` WRITE;
/*!40000 ALTER TABLE `cook` DISABLE KEYS */;
INSERT INTO `cook` VALUES (1,NULL,NULL,1);
/*!40000 ALTER TABLE `cook` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cook_status`
--

DROP TABLE IF EXISTS `cook_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cook_status` (
  `status_id` int(11) NOT NULL auto_increment,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cook_status`
--

LOCK TABLES `cook_status` WRITE;
/*!40000 ALTER TABLE `cook_status` DISABLE KEYS */;
INSERT INTO `cook_status` VALUES (1,'New'),(2,'Waiting'),(3,'Working');
/*!40000 ALTER TABLE `cook_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL auto_increment,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (2);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document`
--

DROP TABLE IF EXISTS `document`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document` (
  `document_id` int(10) unsigned NOT NULL auto_increment,
  `description` varchar(150) default NULL,
  `verfied` tinyint(4) default NULL,
  `document` longblob,
  `document_type_id` int(11) NOT NULL,
  `cook_id` int(11) NOT NULL,
  PRIMARY KEY  (`document_id`),
  KEY `fk_document_document_type1_idx` (`document_type_id`),
  KEY `fk_document_cook1_idx` (`cook_id`),
  CONSTRAINT `fk_document_cook1` FOREIGN KEY (`cook_id`) REFERENCES `cook` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_document_document_type1` FOREIGN KEY (`document_type_id`) REFERENCES `document_type` (`document_type_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document`
--

LOCK TABLES `document` WRITE;
/*!40000 ALTER TABLE `document` DISABLE KEYS */;
/*!40000 ALTER TABLE `document` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `document_type`
--

DROP TABLE IF EXISTS `document_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `document_type` (
  `document_type_id` int(11) NOT NULL auto_increment,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY  (`document_type_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `document_type`
--

LOCK TABLES `document_type` WRITE;
/*!40000 ALTER TABLE `document_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `document_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_items`
--

DROP TABLE IF EXISTS `menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `menu_items` (
  `item_id` int(11) NOT NULL auto_increment,
  `name_en` varchar(45) NOT NULL,
  `name_ar` varchar(45) NOT NULL,
  `price` float NOT NULL,
  `image` longblob,
  `description_en` varchar(200) NOT NULL,
  `description_ar` varchar(200) NOT NULL,
  `item_rate` smallint(6) default NULL,
  `cook_id` int(11) NOT NULL,
  PRIMARY KEY  (`item_id`),
  KEY `fk_menu_items_cook1_idx` (`cook_id`),
  CONSTRAINT `fk_menu_items_cook1` FOREIGN KEY (`cook_id`) REFERENCES `cook` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_items`
--

LOCK TABLES `menu_items` WRITE;
/*!40000 ALTER TABLE `menu_items` DISABLE KEYS */;
INSERT INTO `menu_items` VALUES (1,'Tuna','تونة',100,NULL,'delicious Tuna','التونة اللذيذة',2,1),(2,'Fried Chicken','دجاج مقلي',200,NULL,'hot souse fried chicken','دجاج مقلي بالصوص الحار',3,1);
/*!40000 ALTER TABLE `menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `order_id` int(11) NOT NULL auto_increment,
  `location` varchar(100) NOT NULL,
  `order_time` datetime NOT NULL,
  `duration` int(11) NOT NULL,
  `customer_rating` smallint(6) default NULL,
  `order_comment` varchar(150) default NULL,
  `cook_rating` smallint(6) default NULL,
  `cook_comment` varchar(150) default NULL,
  `type` varchar(45) default NULL,
  `customer_id` int(11) NOT NULL,
  `cook_id` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`),
  KEY `fk_order_user1_idx` (`customer_id`),
  KEY `fk_order_user2_idx` (`cook_id`),
  CONSTRAINT `fk_order_user1` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_user2` FOREIGN KEY (`cook_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,'Haram','2015-03-21 00:11:44',3,4,'good',3,'good customer',NULL,2,1);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_details` (
  `quantity` int(11) default NULL,
  `price` float default NULL,
  `rating` smallint(6) default NULL,
  `comment` varchar(150) default NULL,
  `order_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  PRIMARY KEY  (`order_id`,`menu_item_id`),
  KEY `fk_order_details_order1_idx` (`order_id`),
  KEY `fk_order_details_menu_items1_idx` (`menu_item_id`),
  CONSTRAINT `fk_order_details_menu_items1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_order_details_order1` FOREIGN KEY (`order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (2,50,4,'good item2',1,1),(3,100,3,'good item',1,2);
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_status`
--

DROP TABLE IF EXISTS `order_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_status` (
  `status_id` int(11) NOT NULL auto_increment,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY  (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_status`
--

LOCK TABLES `order_status` WRITE;
/*!40000 ALTER TABLE `order_status` DISABLE KEYS */;
INSERT INTO `order_status` VALUES (1,'New'),(2,'Pending'),(3,'Delivered');
/*!40000 ALTER TABLE `order_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role` (
  `id` int(11) NOT NULL auto_increment,
  `role` varchar(10) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_has_order`
--

DROP TABLE IF EXISTS `status_has_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `status_has_order` (
  `status_status_id` int(11) NOT NULL,
  `order_order_id` int(11) NOT NULL,
  `time` datetime NOT NULL,
  PRIMARY KEY  (`status_status_id`,`order_order_id`),
  KEY `fk_status_has_order_order1_idx` (`order_order_id`),
  KEY `fk_status_has_order_status1_idx` (`status_status_id`),
  CONSTRAINT `fk_status_has_order_order1` FOREIGN KEY (`order_order_id`) REFERENCES `order` (`order_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_status_has_order_status1` FOREIGN KEY (`status_status_id`) REFERENCES `order_status` (`status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_has_order`
--

LOCK TABLES `status_has_order` WRITE;
/*!40000 ALTER TABLE `status_has_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `status_has_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `tag_id` int(11) NOT NULL auto_increment,
  `tag_en` varchar(45) default NULL,
  `tag_ar` varchar(45) default NULL,
  PRIMARY KEY  (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_has_menu_items`
--

DROP TABLE IF EXISTS `tags_has_menu_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags_has_menu_items` (
  `tags_tag_id` int(11) NOT NULL,
  `menu_item_id` int(11) NOT NULL,
  PRIMARY KEY  (`tags_tag_id`,`menu_item_id`),
  KEY `fk_tags_has_menu_items_menu_items1_idx` (`menu_item_id`),
  KEY `fk_tags_has_menu_items_tags1_idx` (`tags_tag_id`),
  CONSTRAINT `fk_tags_has_menu_items_menu_items1` FOREIGN KEY (`menu_item_id`) REFERENCES `menu_items` (`item_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tags_has_menu_items_tags1` FOREIGN KEY (`tags_tag_id`) REFERENCES `tags` (`tag_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_has_menu_items`
--

LOCK TABLES `tags_has_menu_items` WRITE;
/*!40000 ALTER TABLE `tags_has_menu_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_has_menu_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL auto_increment,
  `name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `enabled` tinyint(1) default NULL,
  `image` longblob,
  `registeration_date` datetime default NULL,
  `phone` varchar(25) NOT NULL,
  `address` varchar(100) NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'jazayeerly','jazayeerly@gmail.com','123456',1,NULL,NULL,'1234567','Giza'),(2,'medhat','medhat@gmail.com','123456',1,NULL,NULL,'1234567','Knatr');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_has_role`
--

DROP TABLE IF EXISTS `user_has_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_has_role` (
  `user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY  (`user_id`,`role_id`),
  KEY `fk_user_has_role_role1_idx` (`role_id`),
  KEY `fk_user_has_role_user1_idx` (`user_id`),
  CONSTRAINT `fk_user_has_role_role1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_has_role_user1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_has_role`
--

LOCK TABLES `user_has_role` WRITE;
/*!40000 ALTER TABLE `user_has_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_has_role` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-05-14 22:10:28
