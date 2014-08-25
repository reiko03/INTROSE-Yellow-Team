CREATE DATABASE  IF NOT EXISTS `cns` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `cns`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: localhost    Database: cns
-- ------------------------------------------------------
-- Server version	5.6.15-log

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
-- Table structure for table `dish`
--

DROP TABLE IF EXISTS `dish`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dish` (
  `id_dish` int(8) NOT NULL AUTO_INCREMENT,
  `dishName` varchar(45) NOT NULL,
  PRIMARY KEY (`id_dish`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dish`
--

LOCK TABLES `dish` WRITE;
/*!40000 ALTER TABLE `dish` DISABLE KEYS */;
INSERT INTO `dish` VALUES (1,'Pancit Bihin Guisado'),(2,'Sweet and Sour Pork'),(3,'Yang Chow Fried Rice');
/*!40000 ALTER TABLE `dish` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dishrecipe`
--

DROP TABLE IF EXISTS `dishrecipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dishrecipe` (
  `id_recipe.dish` int(8) NOT NULL,
  `id_recipe.item` int(8) NOT NULL,
  `need_quantity` int(8) NOT NULL,
  PRIMARY KEY (`id_recipe.dish`,`id_recipe.item`),
  KEY `id_item_idx` (`id_recipe.item`),
  KEY `id_dish_idx` (`id_recipe.dish`),
  CONSTRAINT `id_dish` FOREIGN KEY (`id_recipe.dish`) REFERENCES `dish` (`id_dish`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_item` FOREIGN KEY (`id_recipe.item`) REFERENCES `item` (`id_item`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dishrecipe`
--

LOCK TABLES `dishrecipe` WRITE;
/*!40000 ALTER TABLE `dishrecipe` DISABLE KEYS */;
INSERT INTO `dishrecipe` VALUES (1,1,2),(1,4,3),(1,6,2),(2,3,2),(2,6,2);
/*!40000 ALTER TABLE `dishrecipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item`
--

DROP TABLE IF EXISTS `item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `item` (
  `id_item` int(8) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(45) NOT NULL,
  `itemWeight` int(8) NOT NULL,
  `itemQuantity` int(8) NOT NULL,
  PRIMARY KEY (`id_item`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item`
--

LOCK TABLES `item` WRITE;
/*!40000 ALTER TABLE `item` DISABLE KEYS */;
INSERT INTO `item` VALUES (1,'Pancit Bihon',100,3),(2,'Pancit Canton',200,1),(3,'Pork Chop',100,3),(4,'Beef',50,2),(5,'C2 Apple 500ml',0,10),(6,'Carrot',100,20);
/*!40000 ALTER TABLE `item` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-07-13 15:39:47
