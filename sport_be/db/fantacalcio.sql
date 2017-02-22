-- MySQL dump 10.13  Distrib 5.6.34, for Win32 (AMD64)
--
-- Host: 127.0.0.1    Database: fantacalcio
-- ------------------------------------------------------
-- Server version	5.6.34

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
-- Current Database: `fantacalcio`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `fantacalcio` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `fantacalcio`;

--
-- Table structure for table `calciatore`
--

DROP TABLE IF EXISTS `calciatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calciatore` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `ruolo` varchar(50) NOT NULL,
  `squadra_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `squadra_id` (`squadra_id`),
  KEY `squadra_id_2` (`squadra_id`),
  CONSTRAINT `calciatore_ibfk_1` FOREIGN KEY (`squadra_id`) REFERENCES `squadra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calciatore`
--

LOCK TABLES `calciatore` WRITE;
/*!40000 ALTER TABLE `calciatore` DISABLE KEYS */;
INSERT INTO `calciatore` VALUES (1,'Robert Lewandowski','attaccante',1),(2,'Alberto Gilardino','attaccante',2),(3,'Gianluigi Buffon','portiere',3),(4,'Paul Pogba','centrocampista',4);
/*!40000 ALTER TABLE `calciatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calendario`
--

DROP TABLE IF EXISTS `calendario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `calendario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `data` datetime NOT NULL,
  `goal_casa` int(11) NOT NULL,
  `goal_ospite` int(11) NOT NULL,
  `squadra_id` int(11) NOT NULL,
  `ospite_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data` (`data`,`squadra_id`,`ospite_id`),
  KEY `squadra_id` (`squadra_id`),
  KEY `ospite_id` (`ospite_id`),
  CONSTRAINT `calendario_ibfk_1` FOREIGN KEY (`squadra_id`) REFERENCES `squadra` (`id`),
  CONSTRAINT `calendario_ibfk_2` FOREIGN KEY (`ospite_id`) REFERENCES `squadra` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calendario`
--

LOCK TABLES `calendario` WRITE;
/*!40000 ALTER TABLE `calendario` DISABLE KEYS */;
INSERT INTO `calendario` VALUES (1,'2017-01-17 00:00:00',2,0,1,2),(2,'2017-02-04 00:00:00',3,5,4,2),(3,'2017-02-19 00:00:00',1,1,3,1),(4,'2016-12-29 00:00:00',0,4,4,3),(5,'2017-01-04 00:00:00',0,0,1,4),(6,'2017-01-10 00:00:00',2,5,2,3);
/*!40000 ALTER TABLE `calendario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `squadra`
--

DROP TABLE IF EXISTS `squadra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `squadra` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `allenatore` varchar(50) NOT NULL,
  `denominazione` varchar(50) NOT NULL,
  `datafondazione` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `squadra`
--

LOCK TABLES `squadra` WRITE;
/*!40000 ALTER TABLE `squadra` DISABLE KEYS */;
INSERT INTO `squadra` VALUES (1,'ancelotti','Bayern Monaco','1900-02-27 00:00:00'),(2,'zeman','Pescara','1936-02-12 00:00:00'),(3,'allegri','Juventus','1897-11-01 00:00:00'),(4,'mourinho','Manchester United','1878-02-22 00:00:00');
/*!40000 ALTER TABLE `squadra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `votazione`
--

DROP TABLE IF EXISTS `votazione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `votazione` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `calciatore_id` int(11) NOT NULL,
  `calendario_id` int(11) NOT NULL,
  `voto` decimal(10,0) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `calciatore_id` (`calciatore_id`,`calendario_id`),
  KEY `calendario_id` (`calendario_id`),
  CONSTRAINT `votazione_ibfk_1` FOREIGN KEY (`calciatore_id`) REFERENCES `calciatore` (`id`),
  CONSTRAINT `votazione_ibfk_2` FOREIGN KEY (`calendario_id`) REFERENCES `calendario` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `votazione`
--

LOCK TABLES `votazione` WRITE;
/*!40000 ALTER TABLE `votazione` DISABLE KEYS */;
INSERT INTO `votazione` VALUES (1,1,1,8),(2,2,2,7),(3,3,3,6),(4,4,4,5),(5,1,5,6),(6,2,6,6);
/*!40000 ALTER TABLE `votazione` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-21 10:10:46
