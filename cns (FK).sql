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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `damagelog`
--

LOCK TABLES `damagelog` WRITE;
/*!40000 ALTER TABLE `damagelog` DISABLE KEYS */;
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
  PRIMARY KEY (`dish_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Pancit Bihon',0,180),(2,'Lomi',0,170),(3,'Sweet and Sour Pork',0,250);
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishsalelog`
--

DROP TABLE IF EXISTS `dishsalelog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishsalelog` (
  `d_sale_id` int(11) NOT NULL,
  `sale_userid` int(11) DEFAULT NULL,
  `sale_dishid` int(11) DEFAULT NULL,
  `sale_cost` decimal(10,0) NOT NULL DEFAULT '0',
  `sale_price` decimal(10,0) DEFAULT '0',
  `sale_datetime` datetime DEFAULT NULL,
  `sale_order` int(11) DEFAULT NULL,
  PRIMARY KEY (`d_sale_id`),
  KEY `sale_user_idx` (`sale_userid`),
  KEY `sale_dishid_idx` (`sale_dishid`),
  CONSTRAINT `sale_dishid` FOREIGN KEY (`sale_dishid`) REFERENCES `dish` (`dish_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `sale_userid` FOREIGN KEY (`sale_userid`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishsalelog`
--

LOCK TABLES `dishsalelog` WRITE;
/*!40000 ALTER TABLE `dishsalelog` DISABLE KEYS */;
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
  PRIMARY KEY (`ingredient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredient`
--

LOCK TABLES `ingredient` WRITE;
/*!40000 ALTER TABLE `ingredient` DISABLE KEYS */;
INSERT INTO `ingredient` VALUES (1,'Bihon',15,40,3),(2,'Shrimp',5,350,2),(3,'Kikiam',5,103,2),(4,'Squid Ball',4,103,2),(5,'Pork Liver',15,200,5),(6,'Pork Kasim',15,250,5),(7,'Carrot Sliced',8,65,3),(8,'Cabbage Sliced',25,28,5),(9,'Bell Pepper',2,60,1),(10,'Red Onion',3,30,1),(11,'Leek',2,60,1),(12,'Long Pepper',1,35,0),(13,'Pineapple Chunk',1,120,0),(14,'Carrot Design',3,65,1),(15,'Pork Sliced',15,0,5),(16,'White Onion',5,45,1),(17,'Ginger',4,10,2),(18,'scallop',200,100,20);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientrestocklog`
--

LOCK TABLES `ingredientrestocklog` WRITE;
/*!40000 ALTER TABLE `ingredientrestocklog` DISABLE KEYS */;
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
  PRIMARY KEY (`packaged_id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packaged`
--

LOCK TABLES `packaged` WRITE;
/*!40000 ALTER TABLE `packaged` DISABLE KEYS */;
INSERT INTO `packaged` VALUES (1,'C2 Apple 500ML',1,25,40,20),(2,'C2 Apple 1L',1,50,70,20),(3,'C2 Apple 1.5L',1,70,90,20),(4,'Coke Can',1,20,30,20),(5,'Coke 500ML',1,30,40,20),(6,'Coke 1.5L',1,65,80,20),(7,'Absolute 350ML',1,10,15,20),(8,'Absolute 500ML',1,10,20,20),(9,'Absolute 1L',1,34,43,20),(10,'Absolute 1,5L',1,38,52,20),(11,'Siomai',4,50,70,40),(12,'siopao',4,70,100,2),(13,'dumpling',10,50,80,2),(14,'Sprite',1,20,30,10);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagedrestocklog`
--

LOCK TABLES `packagedrestocklog` WRITE;
/*!40000 ALTER TABLE `packagedrestocklog` DISABLE KEYS */;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packagedsalelog`
--

LOCK TABLES `packagedsalelog` WRITE;
/*!40000 ALTER TABLE `packagedsalelog` DISABLE KEYS */;
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
INSERT INTO `recipe` VALUES (1,1,0.15),(1,2,0.015),(1,3,0.04),(1,4,0.04),(1,5,0.05),(1,6,0.04),(1,7,0.02),(1,8,0.15),(2,1,0.15),(2,2,0.015),(2,3,0.04),(2,4,0.04),(2,5,0.05),(2,6,0.04),(2,7,0.02),(2,8,0.15),(3,9,0.05),(3,10,0.05),(3,11,0.04),(3,12,0.01),(3,13,0.045),(3,14,0.035),(3,15,0.2);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spoillog`
--

LOCK TABLES `spoillog` WRITE;
/*!40000 ALTER TABLE `spoillog` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'timkwok','password','admin'),(2,'alengorospe','password','user'),(3,'keikonagano','password','user');
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

-- Dump completed on 2014-08-24 19:23:47
