CREATE DATABASE  IF NOT EXISTS `cns3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cns3`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: cns3
-- ------------------------------------------------------
-- Server version	5.6.16

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
-- Table structure for table `damagelog`
--

DROP TABLE IF EXISTS `damagelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `damagelog` (
  `damage_id` int(11) NOT NULL AUTO_INCREMENT,
  `damage_userid` int(11) DEFAULT NULL,
  `damage_packagedid` int(11) DEFAULT NULL,
  `damage_quantity` int(11) NOT NULL,
  `damage_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`damage_id`),
  KEY `damage_userid_idx` (`damage_userid`),
  KEY `damage_packagedid_idx` (`damage_packagedid`),
  CONSTRAINT `damage_packagedid` FOREIGN KEY (`damage_packagedid`) REFERENCES `packaged` (`packaged_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `damage_userid` FOREIGN KEY (`damage_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damagelog`
--

LOCK TABLES `damagelog` WRITE;
/*!40000 ALTER TABLE `damagelog` DISABLE KEYS */;
INSERT INTO `damagelog` VALUES (1,3,2,2,'2014-08-28 00:17:04'),(2,1,6,1,'2014-08-28 03:36:06'),(3,2,2,5,'2014-08-28 13:35:05');
/*!40000 ALTER TABLE `damagelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish` (
  `dish_id` int(11) NOT NULL AUTO_INCREMENT,
  `dish_name` varchar(45) NOT NULL DEFAULT 'null',
  `dish_cost` decimal(10,0) DEFAULT '0',
  `dish_price` decimal(10,0) NOT NULL DEFAULT '0',
  `dish_highCost` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Sweet and Sour Pork',170,210,0),(7,'Beef Broccoli',157,180,0),(8,'Pancit Bihon',76,100,0),(9,'Buttered Shrimp',198,190,1);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishsalelog`
--

DROP TABLE IF EXISTS `dishsalelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishsalelog` (
  `d_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `sale_userid` int(11) DEFAULT NULL,
  `sale_dishid` int(11) DEFAULT NULL,
  `sale_cost` double NOT NULL DEFAULT '0',
  `sale_price` double DEFAULT '0',
  `sale_datetime` datetime DEFAULT NULL,
  `sale_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_sale_id`),
  KEY `sale_user_idx` (`sale_userid`),
  KEY `sale_dishid_idx` (`sale_dishid`),
  CONSTRAINT `sale_dishid` FOREIGN KEY (`sale_dishid`) REFERENCES `dish` (`dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sale_userid` FOREIGN KEY (`sale_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishsalelog`
--

LOCK TABLES `dishsalelog` WRITE;
/*!40000 ALTER TABLE `dishsalelog` DISABLE KEYS */;
INSERT INTO `dishsalelog` VALUES (9,3,1,170,210,'2014-09-01 11:15:39',NULL),(10,3,7,157,180,'2014-09-01 11:24:01',NULL),(11,3,8,76,100,'2014-09-01 11:25:52',NULL),(12,3,8,76,100,'2014-09-01 11:26:47',NULL),(13,3,9,198,190,'2014-09-01 11:48:11',NULL),(14,3,7,157,180,'2014-09-01 11:57:01',NULL),(15,3,9,198,190,'2014-09-01 12:03:29',NULL),(16,3,8,76,100,'2014-09-01 12:16:35',NULL),(17,3,9,198,190,'2014-09-01 12:22:20',NULL),(18,3,9,198,190,'2014-09-01 12:25:26',NULL),(19,3,9,198,190,'2014-09-01 12:28:56',NULL);
/*!40000 ALTER TABLE `dishsalelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredient`
--

DROP TABLE IF EXISTS `ingredient`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredient` (
  `ingredient_id` int(11) NOT NULL AUTO_INCREMENT,
  `ingredient_name` varchar(45) NOT NULL,
  `ingredient_weight` decimal(10,0) NOT NULL DEFAULT '0',
  `ingredient_cost` decimal(10,0) DEFAULT '0',
  `ingredient_threshold` int(5) NOT NULL DEFAULT '0',
  `ingredient_needSupply` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Bihon',4,500,3,0),(2,'Shrimp',3,350,2,1),(3,'Kikiam',3,65,2,0),(4,'Squid Ball',4,97,2,0),(5,'Pork Liver',10,200,5,0),(6,'Pork Kasim',10,250,10,1),(7,'Carrot Sliced',8,65,3,0),(8,'Cabbage Sliced',8,375,5,0),(9,'Bell Pepper',3,200,3,1),(10,'Red Onion',4,70,3,0),(11,'Leek',3,45,2,0),(12,'Long Pepper',4,44,4,1),(13,'Pineapple Chunk',3,110,4,1),(14,'Carrot Design',2,45,1,0),(15,'Pork Sliced',15,100,5,0),(16,'White Onion',5,45,3,0),(17,'Ginger',5,10,3,0),(18,'Scallop',200,100,20,0),(19,'Potato',10,80,5,0),(20,'Lobster',5,2000,2,0),(21,'Beef',6,1000,5,0),(22,'Tomato',3,45,2,0),(26,'Garlic',4,80,2,0),(28,'Eggplant',3,300,3,1),(29,'Calamansi',4,50,2,0),(30,'Broccoli',4,800,2,0),(31,'Butter',4,500,2,0);
/*!40000 ALTER TABLE `ingredient` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientrestocklog`
--

DROP TABLE IF EXISTS `ingredientrestocklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientrestocklog` (
  `i_restock_id` int(11) NOT NULL AUTO_INCREMENT,
  `restock_userid` int(11) DEFAULT NULL,
  `restock_ingredientid` int(11) DEFAULT NULL,
  `restock_weight` decimal(10,0) NOT NULL DEFAULT '0',
  `restock_cost` decimal(10,0) NOT NULL DEFAULT '0',
  `restock_datetime` datetime DEFAULT NULL,
  `restock_source` varchar(45) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`i_restock_id`),
  KEY `restock_ingredient_idx` (`restock_ingredientid`),
  KEY `restock_userid_idx` (`restock_userid`),
  CONSTRAINT `restock_ingredientid` FOREIGN KEY (`restock_ingredientid`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `restock_userid` FOREIGN KEY (`restock_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientrestocklog`
--

LOCK TABLES `ingredientrestocklog` WRITE;
/*!40000 ALTER TABLE `ingredientrestocklog` DISABLE KEYS */;
INSERT INTO `ingredientrestocklog` VALUES (1,3,1,2,30,'2014-08-27 23:10:25','Hypermarket'),(2,3,9,3,80,'2014-08-27 23:23:20','MiniStore'),(3,1,12,2,40,'2014-08-28 03:32:47','Super8'),(4,1,21,10,60,'2014-08-28 09:55:24','S&R'),(5,1,13,2,100,'2014-08-28 12:58:40','Store'),(6,2,1,20,50,'2014-08-28 13:28:00','Malabon'),(7,3,11,1,30,'2014-08-30 23:27:22','Market'),(8,3,17,1,10,'2014-08-31 00:23:31','rfc'),(9,3,10,1,30,'2014-08-31 15:22:01','rfc'),(10,3,12,1,50,'2014-08-31 15:23:56','ABCstore'),(11,3,14,1,25,'2014-08-31 15:33:28','168mart'),(12,3,9,1,20,'2014-08-31 15:35:15','rfc'),(13,3,1,1,50,'2014-08-31 15:38:27','rfc'),(14,3,22,1,30,'2014-08-31 16:54:59','rfc'),(15,3,3,1,60,'2014-08-31 20:24:52','Johnny Store'),(16,3,3,1,60,'2014-08-31 20:37:04','Johnny Store'),(17,3,3,1,60,'2014-08-31 20:37:04','Johnny Store'),(18,3,3,1,0,'2014-08-31 20:42:00','Johnny Store'),(19,3,3,1,30,'2014-08-31 20:45:03','RFC'),(20,3,3,1,30,'2014-08-31 20:48:34','RFC'),(21,2,2,2,40,'2014-07-20 10:15:34','Aling Nena Store');
/*!40000 ALTER TABLE `ingredientrestocklog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packaged`
--

DROP TABLE IF EXISTS `packaged`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packaged` (
  `packaged_id` int(11) NOT NULL AUTO_INCREMENT,
  `packaged_name` varchar(45) NOT NULL DEFAULT 'null',
  `packaged_quantity` int(11) NOT NULL DEFAULT '0',
  `packaged_cost` decimal(10,0) DEFAULT '0',
  `packaged_price` decimal(10,0) NOT NULL DEFAULT '0',
  `packaged_threshold` int(5) NOT NULL DEFAULT '0',
  `packaged_needSupply` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`packaged_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packaged`
--

LOCK TABLES `packaged` WRITE;
/*!40000 ALTER TABLE `packaged` DISABLE KEYS */;
INSERT INTO `packaged` VALUES (1,'C2 Apple 500ML',11,28,40,10,1),(2,'C2 Apple 1L',30,49,70,10,0),(3,'C2 Apple 1.5L',20,70,90,10,0),(4,'Coke Can',36,20,30,10,0),(5,'Coke 500ML',8,33,40,10,1),(6,'Coke 1.5L',20,68,80,15,0),(7,'Absolute 350ML',11,20,15,10,1),(8,'Absolute 500ML',15,10,20,10,0),(9,'Absolute 1L',13,34,43,10,0),(10,'Absolute 1,5L',16,38,52,10,0),(11,'Siomai',18,50,70,20,1),(12,'siopao',30,70,100,25,0),(13,'dumpling',25,50,80,20,0),(14,'Sprite',15,20,30,10,0),(15,'Royal Can',10,25,35,10,1);
/*!40000 ALTER TABLE `packaged` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagedrestocklog`
--

DROP TABLE IF EXISTS `packagedrestocklog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagedrestocklog` (
  `p_restock_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_restock_userid` int(11) DEFAULT NULL,
  `p_restock_packagedid` int(11) DEFAULT NULL,
  `restock_quantity` int(11) NOT NULL DEFAULT '0',
  `restock_cost` decimal(10,0) NOT NULL DEFAULT '0',
  `restock_datetime` datetime DEFAULT NULL,
  `restock_source` varchar(45) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`p_restock_id`),
  KEY `restock_packagedid_idx` (`p_restock_packagedid`),
  KEY `restock_userid_idx` (`p_restock_userid`),
  CONSTRAINT `p_restock_packagedid` FOREIGN KEY (`p_restock_packagedid`) REFERENCES `packaged` (`packaged_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `p_restock_userid` FOREIGN KEY (`p_restock_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagedrestocklog`
--

LOCK TABLES `packagedrestocklog` WRITE;
/*!40000 ALTER TABLE `packagedrestocklog` DISABLE KEYS */;
INSERT INTO `packagedrestocklog` VALUES (1,3,2,3,55,'2014-08-28 00:06:50','Marty Market'),(2,2,1,5,30,'2014-08-28 13:07:25','RFC'),(3,2,2,20,45,'2014-08-28 13:30:14','70'),(4,3,7,7,30,'2014-08-31 21:01:41','168mart');
/*!40000 ALTER TABLE `packagedrestocklog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packagedsalelog`
--

DROP TABLE IF EXISTS `packagedsalelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `packagedsalelog` (
  `p_sale_id` int(11) NOT NULL AUTO_INCREMENT,
  `p_sale_userid` int(11) DEFAULT NULL,
  `p_sale_packagedid` int(11) DEFAULT NULL,
  `sale_cost` decimal(10,0) DEFAULT NULL,
  `sale_price` decimal(10,0) DEFAULT NULL,
  `sale_datetime` datetime DEFAULT NULL,
  `sale_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`p_sale_id`),
  KEY `p_sale_userid_idx` (`p_sale_userid`),
  KEY `p_sale_packagedid_idx` (`p_sale_packagedid`),
  CONSTRAINT `p_sale_packagedid` FOREIGN KEY (`p_sale_packagedid`) REFERENCES `packaged` (`packaged_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `p_sale_userid` FOREIGN KEY (`p_sale_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagedsalelog`
--

LOCK TABLES `packagedsalelog` WRITE;
/*!40000 ALTER TABLE `packagedsalelog` DISABLE KEYS */;
INSERT INTO `packagedsalelog` VALUES (1,3,4,20,30,'2014-09-01 12:16:59',NULL),(2,3,1,28,40,'2014-09-01 12:36:35',NULL),(3,3,7,20,15,'2014-09-01 12:40:10',NULL);
/*!40000 ALTER TABLE `packagedsalelog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `recipe` (
  `recipe_dish_id` int(11) NOT NULL,
  `recipe_ingredient_id` int(11) NOT NULL,
  `recipe_weight` float NOT NULL DEFAULT '0',
  KEY `dish_id_idx` (`recipe_dish_id`),
  KEY `ingredient_id_idx` (`recipe_ingredient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,1,0.15),(1,2,0.015),(1,3,0.04),(1,4,0.04),(1,5,0.05),(1,6,0.04),(1,7,0.02),(1,8,0.15),(2,1,0.15),(2,2,0.015),(2,3,0.04),(2,4,0.04),(2,5,0.05),(2,6,0.04),(2,7,0.02),(2,8,0.15),(3,9,0.05),(3,10,0.05),(3,11,0.04),(3,12,0.01),(3,13,0.045),(3,14,0.035),(3,15,0.2),(7,21,0.4),(7,30,0.2),(7,26,0.1),(7,16,0.1),(8,1,0.8),(8,5,0.2),(8,26,0.2),(8,29,0.2),(8,8,0.4),(8,7,0.4),(9,2,1.2),(9,26,0.3),(9,31,0.5),(9,16,0.2);
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spoillog`
--

DROP TABLE IF EXISTS `spoillog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `spoillog` (
  `spoil_id` int(11) NOT NULL AUTO_INCREMENT,
  `spoil_userid` int(11) DEFAULT NULL,
  `spoil_ingredientid` int(11) DEFAULT NULL,
  `spoil_weight` decimal(10,0) NOT NULL,
  `spoil_datetime` datetime DEFAULT NULL,
  PRIMARY KEY (`spoil_id`),
  KEY `spoil_userid_idx` (`spoil_userid`),
  KEY `spoil_ingredientid_idx` (`spoil_ingredientid`),
  CONSTRAINT `spoil_ingredientid` FOREIGN KEY (`spoil_ingredientid`) REFERENCES `ingredient` (`ingredient_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `spoil_userid` FOREIGN KEY (`spoil_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spoillog`
--

LOCK TABLES `spoillog` WRITE;
/*!40000 ALTER TABLE `spoillog` DISABLE KEYS */;
INSERT INTO `spoillog` VALUES (1,3,6,5,'2014-08-27 23:37:04'),(2,3,4,2,'2014-08-28 12:55:32'),(3,2,1,10,'2014-08-28 13:32:03');
/*!40000 ALTER TABLE `spoillog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL DEFAULT 'null',
  `user_password` varchar(45) NOT NULL DEFAULT 'null',
  `user_level` varchar(45) NOT NULL DEFAULT 'null',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'timkwok','password','admin'),(2,'alengorospe','password','user'),(3,'keikonagano','password','user'),(4,'cjreyes','password','user');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-09-01 12:48:55
