-- MySQL dump 10.13  Distrib 5.6.24, for osx10.8 (x86_64)
--
-- Host: 127.0.0.1    Database: carcompany
-- ------------------------------------------------------
-- Server version	5.7.17

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
-- Table structure for table `building`
--

DROP TABLE IF EXISTS `building`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `building` (
  `idbuilding` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `managerId` int(11) NOT NULL,
  PRIMARY KEY (`idbuilding`),
  KEY `managerId_idx` (`managerId`),
  CONSTRAINT `managerId` FOREIGN KEY (`managerId`) REFERENCES `personnel` (`idpersonnel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `building`
--

LOCK TABLES `building` WRITE;
/*!40000 ALTER TABLE `building` DISABLE KEYS */;
INSERT INTO `building` VALUES (1,'garage',1),(2,'repairStation',2),(3,'garage',4),(4,'repairStation',5),(5,'garage',6),(6,'repairStation',8),(7,'garage',1),(8,'repairStation',12),(9,'garage',15),(10,'repairStation',13);
/*!40000 ALTER TABLE `building` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personnel`
--

DROP TABLE IF EXISTS `personnel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personnel` (
  `idpersonnel` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `teamId` int(11) DEFAULT NULL,
  `assignedBuildingId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idpersonnel`),
  KEY `buildingId_idx` (`assignedBuildingId`),
  KEY `teamId_idx` (`teamId`),
  CONSTRAINT `assignedBId` FOREIGN KEY (`assignedBuildingId`) REFERENCES `building` (`idbuilding`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `teamId` FOREIGN KEY (`teamId`) REFERENCES `team` (`idteam`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personnel`
--

LOCK TABLES `personnel` WRITE;
/*!40000 ALTER TABLE `personnel` DISABLE KEYS */;
INSERT INTO `personnel` VALUES (1,'\"manager\"',1,NULL),(2,'\"manager\"',2,NULL),(3,' \"worker\"',1,NULL),(4,'\"manager\"',3,3),(5,'\"manager\"',4,NULL),(6,'\"manager\"',NULL,NULL),(7,' \"worker\"',2,NULL),(8,'\"manager\"',NULL,NULL),(9,' \"worker\"',3,3),(10,' \"worker\"',4,NULL),(11,' \"worker\"',3,3),(12,'\"manager\"',NULL,NULL),(13,'\"manager\"',NULL,NULL),(14,' \"worker\"',NULL,NULL),(15,'\"manager\"',NULL,NULL),(16,'\"manager\"',NULL,NULL),(17,' \"worker\"',NULL,NULL),(18,' \"worker\"',NULL,NULL),(19,'\"manager\"',NULL,NULL),(20,'\"manager\"',NULL,NULL);
/*!40000 ALTER TABLE `personnel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repair`
--

DROP TABLE IF EXISTS `repair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repair` (
  `idrepair` int(11) NOT NULL AUTO_INCREMENT,
  `cost` double NOT NULL DEFAULT '0',
  `whatChanged` varchar(45) DEFAULT NULL,
  `repairBuildingId` int(11) DEFAULT NULL,
  `dateComplete` date DEFAULT NULL,
  PRIMARY KEY (`idrepair`),
  KEY `repairBuildingId_idx` (`repairBuildingId`),
  CONSTRAINT `repairBuildingId` FOREIGN KEY (`repairBuildingId`) REFERENCES `building` (`idbuilding`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repair`
--

LOCK TABLES `repair` WRITE;
/*!40000 ALTER TABLE `repair` DISABLE KEYS */;
INSERT INTO `repair` VALUES (1,27236607.2,' \"glass\"',NULL,'2013-01-01'),(2,41235553,' \"engine\"',NULL,'2013-02-02'),(3,0,'\"tires\"',NULL,'2013-03-03'),(4,105100441.78491,' \"engine\"',NULL,'2013-04-04'),(5,3949.167,' \"brains\"',NULL,NULL),(6,77499349.218963,' \"brains\"',NULL,NULL),(7,561860.8127419,'\"tires\"',NULL,NULL),(8,4174.95,'\"tires\"',NULL,NULL),(9,215763.226882,'\"tires\"',NULL,'2014-01-01'),(10,0,' \"engine\"',NULL,NULL),(11,3459.82809411,' \"glass\"',NULL,NULL),(12,135.976398,' \"glass\"',NULL,NULL),(13,42,' \"glass\"',NULL,NULL),(14,3019.479315657,' \"brains\"',NULL,NULL),(15,9.723,' \"glass\"',NULL,NULL),(16,210.3336,' \"engine\"',NULL,'2015-01-01'),(17,469.213550407,' \"brains\"',NULL,NULL),(18,158130567.9,' \"glass\"',NULL,NULL),(19,2113038.4775676,' \"glass\"',NULL,NULL),(20,9090.050662162,'\"tires\"',NULL,NULL);
/*!40000 ALTER TABLE `repair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `route`
--

DROP TABLE IF EXISTS `route`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `route` (
  `idroute` int(11) NOT NULL AUTO_INCREMENT,
  `effectivenessCount` int(11) NOT NULL DEFAULT '0',
  `mileage` int(11) NOT NULL DEFAULT '0',
  `routeType` varchar(45) NOT NULL,
  `assignedTransport` int(11) DEFAULT NULL,
  `fromDate` date DEFAULT NULL,
  `toDate` date DEFAULT NULL,
  PRIMARY KEY (`idroute`),
  KEY `assignedTransport_idx` (`assignedTransport`),
  CONSTRAINT `assignedTransport` FOREIGN KEY (`assignedTransport`) REFERENCES `transport` (`idtransport`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `route`
--

LOCK TABLES `route` WRITE;
/*!40000 ALTER TABLE `route` DISABLE KEYS */;
INSERT INTO `route` VALUES (1,6,1,'\"cargo\"',2,'2014-06-03',NULL),(2,1,4,' \"passenger\"',3,'2015-03-12',NULL),(3,9,1,'\"cargo\"',NULL,NULL,NULL),(4,5,9,' \"passenger\"',NULL,'2013-04-12',NULL),(5,3,9,'\"cargo\"',NULL,NULL,NULL),(6,8,5,' \"passenger\"',NULL,NULL,NULL),(7,9,9,' \"passenger\"',NULL,NULL,NULL),(8,8,2,' \"passenger\"',4,NULL,NULL),(9,9,7,' \"passenger\"',NULL,NULL,NULL),(10,9,1,' \"passenger\"',1,NULL,NULL),(11,8,6,' \"passenger\"',NULL,NULL,NULL),(12,2,4,' \"passenger\"',NULL,'2016-03-12',NULL),(13,1,3,'\"cargo\"',NULL,NULL,NULL),(14,2,4,'\"cargo\"',NULL,NULL,NULL),(15,9,3,'\"cargo\"',NULL,NULL,NULL),(16,9,2,'\"cargo\"',NULL,NULL,NULL),(17,6,4,'\"cargo\"',NULL,NULL,NULL),(18,7,8,' \"passenger\"',NULL,NULL,NULL),(19,4,3,'\"cargo\"',NULL,NULL,NULL),(20,9,4,'\"cargo\"',NULL,NULL,NULL);
/*!40000 ALTER TABLE `route` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tags` (
  `idtags` int(11) NOT NULL AUTO_INCREMENT,
  `tags` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`idtags`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,' \"white\"'),(2,'\"green glass\"'),(3,' \"white\"'),(4,' \"white\"'),(5,' \"white\"'),(6,' \"white\"'),(7,' \"white\"'),(8,' \"white\"'),(9,'\"green glass\"'),(10,' \"white\"'),(11,'\"green glass\"'),(12,' \"white\"'),(13,' \"white\"'),(14,' \"white\"'),(15,'\"green glass\"'),(16,'\"green glass\"'),(17,'\"green glass\"'),(18,'\"green glass\"'),(19,'\"green glass\"'),(20,' \"white\"');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team`
--

DROP TABLE IF EXISTS `team`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team` (
  `idteam` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) DEFAULT NULL,
  `assignedManId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idteam`),
  KEY `assignedManId_idx` (`assignedManId`),
  CONSTRAINT `assignedManId` FOREIGN KEY (`assignedManId`) REFERENCES `personnel` (`idpersonnel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team`
--

LOCK TABLES `team` WRITE;
/*!40000 ALTER TABLE `team` DISABLE KEYS */;
INSERT INTO `team` VALUES (1,'brigada',1),(2,'master',2),(3,'uchastok',4),(4,'ceh',5);
/*!40000 ALTER TABLE `team` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transport`
--

DROP TABLE IF EXISTS `transport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transport` (
  `idtransport` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(45) NOT NULL,
  `model` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL,
  `numOfRepairs` double NOT NULL DEFAULT '0',
  `costOfRepairs` double NOT NULL DEFAULT '0',
  `buildingId` int(11) DEFAULT NULL,
  `transportToBuildingId` int(11) DEFAULT NULL,
  `personnelId` int(11) DEFAULT NULL,
  `repairId` int(11) DEFAULT NULL,
  `tagsId` int(11) DEFAULT NULL,
  PRIMARY KEY (`idtransport`),
  KEY `repairs_idx` (`repairId`),
  KEY `tags_idx` (`tagsId`),
  KEY `transportDriver_idx` (`personnelId`),
  CONSTRAINT `repairs` FOREIGN KEY (`repairId`) REFERENCES `repair` (`idrepair`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `tags` FOREIGN KEY (`tagsId`) REFERENCES `tags` (`idtags`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transportDriver` FOREIGN KEY (`personnelId`) REFERENCES `personnel` (`idpersonnel`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transport`
--

LOCK TABLES `transport` WRITE;
/*!40000 ALTER TABLE `transport` DISABLE KEYS */;
INSERT INTO `transport` VALUES (1,' \"passenger\"','\"mercedes\"',' \"working\"',6,140501424.844,NULL,NULL,3,NULL,NULL),(2,'\"cargo\"',' \"gazel\"',' \"working\"',1,0,1,NULL,7,1,NULL),(3,'\"cargo\"',' \"gazel\"','\"off\"',4,38.92,NULL,NULL,6,10,NULL),(4,' \"passenger\"',' \"volvo\"',' \"working\"',6,23.47,NULL,NULL,8,NULL,NULL),(5,'\"cargo\"',' \"gazel\"',' \"working\"',2,56.8,NULL,NULL,9,NULL,NULL),(6,' \"passenger\"',' \"volvo\"','\"off\"',6,18.65419861,3,NULL,10,NULL,NULL),(7,' \"passenger\"','\"mercedes\"',' \"working\"',7,704859.283931,NULL,NULL,2,NULL,NULL),(8,'\"cargo\"',' \"volvo\"',' \"working\"',1,44.61951521,NULL,NULL,1,NULL,NULL),(9,'\"cargo\"',' \"gazel\"','\"off\"',5,0,NULL,NULL,3,4,NULL),(10,' \"passenger\"',' \"volvo\"',' \"working\"',4,1.05071787,NULL,NULL,5,NULL,NULL),(11,' \"passenger\"',' \"volvo\"','\"off\"',8,81990.8,NULL,NULL,4,NULL,NULL),(12,' \"passenger\"',' \"volvo\"',' \"working\"',4,4665.3,NULL,NULL,6,NULL,NULL),(13,' \"passenger\"',' \"volvo\"','\"off\"',4,33.5,NULL,NULL,11,NULL,NULL),(14,'\"cargo\"',' \"gazel\"',' \"working\"',2,1136.34952483,NULL,NULL,12,NULL,NULL),(15,' \"passenger\"',' \"volvo\"',' \"working\"',8,311686,NULL,NULL,NULL,NULL,NULL),(16,' \"passenger\"',' \"gazel\"','\"off\"',2,283395869.02203,NULL,NULL,NULL,NULL,NULL),(17,'\"cargo\"','\"mercedes\"','\"off\"',4,47972674.449,NULL,NULL,NULL,NULL,NULL),(18,'\"cargo\"',' \"volvo\"',' \"working\"',6,2626.647,NULL,NULL,NULL,NULL,NULL),(19,' \"passenger\"',' \"volvo\"','\"off\"',7,1633.2,NULL,NULL,NULL,NULL,NULL),(20,' \"passenger\"',' \"gazel\"',' \"working\"',9,0,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `transport` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportToBuilding`
--

DROP TABLE IF EXISTS `transportToBuilding`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportToBuilding` (
  `transportId` int(11) NOT NULL DEFAULT '0',
  `buildingId` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`transportId`,`buildingId`),
  KEY `buildingId_idx` (`buildingId`),
  CONSTRAINT `buildingId` FOREIGN KEY (`buildingId`) REFERENCES `building` (`idbuilding`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `transportId` FOREIGN KEY (`transportId`) REFERENCES `transport` (`idtransport`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportToBuilding`
--

LOCK TABLES `transportToBuilding` WRITE;
/*!40000 ALTER TABLE `transportToBuilding` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportToBuilding` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transportToRepair`
--

DROP TABLE IF EXISTS `transportToRepair`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `transportToRepair` (
  `idTransport` int(11) NOT NULL DEFAULT '0',
  `idRepair` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`idTransport`,`idRepair`),
  KEY `idRepair_idx` (`idRepair`),
  CONSTRAINT `idRepair` FOREIGN KEY (`idRepair`) REFERENCES `repair` (`idrepair`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `idTransport` FOREIGN KEY (`idTransport`) REFERENCES `transport` (`idtransport`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transportToRepair`
--

LOCK TABLES `transportToRepair` WRITE;
/*!40000 ALTER TABLE `transportToRepair` DISABLE KEYS */;
/*!40000 ALTER TABLE `transportToRepair` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'carcompany'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-20 21:03:00
