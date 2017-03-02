CREATE DATABASE  IF NOT EXISTS `user_events` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `user_events`;
-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: localhost    Database: user_events
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
-- Table structure for table `applications`
--

DROP TABLE IF EXISTS `applications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `applications` (
  `apikey` varchar(45) NOT NULL,
  `applicationname` varchar(45) NOT NULL,
  `releasedate` varchar(45) NOT NULL,
  `isactive` int(11) NOT NULL,
  PRIMARY KEY (`apikey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `applications`
--

LOCK TABLES `applications` WRITE;
/*!40000 ALTER TABLE `applications` DISABLE KEYS */;
INSERT INTO `applications` VALUES ('289DT6GQoRS3dR0Yj9d80gx6NadkrgSs','application6','01/01/2001',1),('6jwq7IevdT0j7wYHYQ9qS81Ya90vH0ht','application7','01/01/2001',1),('CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','application9','01/01/2001',1),('f94r2SPFp5pCWLDVA4X2n6f25Cak853F','application3','01/01/2001',1),('kaqb4Y4038XFOhIq4Xw9j0778I0HQD87','application4','01/01/2001',1),('kCo59QJlr9He7xBMFS6rQw7db0Ah5cUZ','application5','01/01/2001',1),('Lnbv07qE4M0JC5Jd6VSI495s5mS18LsX','application2','01/01/2001',1),('v0CHF4hd8zsKco2005p67939135BRM6U','application1','01/01/2001',1),('wA7IPg8w970KdmOrPEhP66bA28ekm8bL','application8','01/01/2001',1);
/*!40000 ALTER TABLE `applications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventid` int(11) NOT NULL AUTO_INCREMENT,
  `userid` int(11) NOT NULL,
  `apikey` varchar(45) NOT NULL,
  `timestamp` varchar(45) NOT NULL,
  PRIMARY KEY (`eventid`),
  KEY `apikey_idx` (`apikey`),
  KEY `userid_idx` (`userid`),
  CONSTRAINT `apikey` FOREIGN KEY (`apikey`) REFERENCES `applications` (`apikey`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `users` (`userid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,1,'289DT6GQoRS3dR0Yj9d80gx6NadkrgSs','2017-02-03 00:00:00'),(2,3,'289DT6GQoRS3dR0Yj9d80gx6NadkrgSs','2017-02-03 00:00:00'),(3,4,'289DT6GQoRS3dR0Yj9d80gx6NadkrgSs','2017-02-03 00:00:00'),(4,2,'289DT6GQoRS3dR0Yj9d80gx6NadkrgSs','2017-02-03 00:00:00'),(5,9,'6jwq7IevdT0j7wYHYQ9qS81Ya90vH0ht','2017-02-03 00:00:00'),(6,8,'6jwq7IevdT0j7wYHYQ9qS81Ya90vH0ht','2017-02-03 00:00:00'),(7,3,'6jwq7IevdT0j7wYHYQ9qS81Ya90vH0ht','2017-02-03 00:00:00'),(8,5,'6jwq7IevdT0j7wYHYQ9qS81Ya90vH0ht','2017-02-03 00:00:00'),(9,1,'f94r2SPFp5pCWLDVA4X2n6f25Cak853F','2017-02-03 00:00:00'),(10,2,'f94r2SPFp5pCWLDVA4X2n6f25Cak853F','2017-02-03 00:00:00'),(11,1,'f94r2SPFp5pCWLDVA4X2n6f25Cak853F','2017-02-03 00:00:00'),(12,1,'f94r2SPFp5pCWLDVA4X2n6f25Cak853F','2017-02-03 00:00:00'),(19,4,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(20,5,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(21,6,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(22,3,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(23,4,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(24,7,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(25,2,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(26,1,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(27,1,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(28,1,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(29,1,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(30,1,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(31,1,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(32,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(33,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(34,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(35,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(36,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(37,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00'),(38,8,'CXCH41IjTr4g0vlrXY1sC9TxKL76Spps','2017-02-03 00:00:00');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `latency`
--

DROP TABLE IF EXISTS `latency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `latency` (
  `type` varchar(45) DEFAULT NULL,
  `response` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `latency`
--

LOCK TABLES `latency` WRITE;
/*!40000 ALTER TABLE `latency` DISABLE KEYS */;
INSERT INTO `latency` VALUES ('GET',1),('GET',1),('GET',5),('GET',1),('POST',10),('POST',5),('POST',5),('POST',5),('POST',5),('POST',5),('POST',100),('POST',100),('POST',100),('POST',100),('POST',50),('POST',50),('POST',50),('POST',50),('POST',50),('POST',100),('POST',100),('POST',50),('POST',100),('POST',100),('POST',100),('POST',50),('POST',50);
/*!40000 ALTER TABLE `latency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userid` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `fullname` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'username1','fullname1','password1'),(2,'username2','fullname2','password2'),(3,'username3','fullname3','password3'),(4,'username4','fullname4','password4'),(5,'username5','fullname5','password5'),(6,'username6','fullname6','password6'),(7,'username7','fullname7','password7'),(8,'username8','fullname8','password8'),(9,'username9','fullname9','password9');
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

-- Dump completed on 2017-03-02  3:12:08
