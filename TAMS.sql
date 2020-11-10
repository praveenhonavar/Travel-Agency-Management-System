-- MySQL dump 10.13  Distrib 8.0.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.17

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `booked_for`
--

DROP TABLE IF EXISTS `booked_for`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `booked_for` (
  `VID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `BDATE` date DEFAULT NULL,
  PRIMARY KEY (`VID`,`CID`,`TID`),
  KEY `cfk_tid1_idx` (`TID`),
  KEY `cfk_cid1_idx` (`CID`),
  CONSTRAINT `cfk_cid1` FOREIGN KEY (`CID`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cfk_tid1` FOREIGN KEY (`TID`) REFERENCES `trip` (`tid`) ON DELETE CASCADE ON UPDATE RESTRICT,
  CONSTRAINT `cfk_vid1` FOREIGN KEY (`VID`) REFERENCES `vechicle` (`vid`) ON DELETE CASCADE ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `cid` int(11) NOT NULL,
  `cname` varchar(45) DEFAULT NULL,
  `caddress` varchar(45) DEFAULT NULL,
  `cphone` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `driven_by`
--

DROP TABLE IF EXISTS `driven_by`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `driven_by` (
  `VID` int(11) NOT NULL,
  `EID` int(11) NOT NULL,
  `TID` int(11) NOT NULL,
  `DDATE` date DEFAULT NULL,
  PRIMARY KEY (`VID`,`EID`,`TID`),
  KEY `cfk_eid1_idx` (`EID`),
  KEY `cfk_tid2_idx` (`TID`),
  CONSTRAINT `cfk_eid1` FOREIGN KEY (`EID`) REFERENCES `employee` (`eid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cfk_tid2` FOREIGN KEY (`TID`) REFERENCES `trip` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cfk_vid2` FOREIGN KEY (`VID`) REFERENCES `vechicle` (`vid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `eid` int(11) NOT NULL AUTO_INCREMENT,
  `ename` varchar(45) NOT NULL,
  `ephone` varchar(20) NOT NULL,
  `eaddress` varchar(45) DEFAULT NULL,
  `eJdate` date NOT NULL,
  PRIMARY KEY (`eid`),
  UNIQUE KEY `eid_UNIQUE` (`eid`),
  CONSTRAINT `du_che_con` CHECK (((`ejdate` >= _utf8mb4'1990-01-01') and (`ejdate` <= _utf8mb4'2019-12-25')))
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=COMPACT;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`password`,`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `TID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `DISTANCETRAVEL` varchar(45) DEFAULT NULL,
  `AMOUNT` varchar(45) DEFAULT NULL,
  `PDATE` date DEFAULT NULL,
  PRIMARY KEY (`TID`,`CID`),
  KEY `cfk_cid_idx` (`CID`),
  CONSTRAINT `cfk_cid` FOREIGN KEY (`CID`) REFERENCES `customer` (`cid`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `cfk_tid` FOREIGN KEY (`TID`) REFERENCES `trip` (`tid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `places`
--

DROP TABLE IF EXISTS `places`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `places` (
  `idplaces` int(11) NOT NULL,
  `city` varchar(45) NOT NULL,
  `distance` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `trip`
--

DROP TABLE IF EXISTS `trip`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trip` (
  `tid` int(11) NOT NULL,
  `source` varchar(45) DEFAULT NULL,
  `dest` varchar(45) DEFAULT NULL,
  `sdate` date DEFAULT NULL,
  `edate` date DEFAULT NULL,
  PRIMARY KEY (`tid`),
  CONSTRAINT `dateconstraint` CHECK (((`sdate` >= sysdate()) and (`sdate` <= _utf8mb4'2025-12-30'))),
  CONSTRAINT `dateconstraintsdb` CHECK (((`edate` >= `sdate`) and (`edate` <= _utf8mb4'2025-12-30')))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `vechicle`
--

DROP TABLE IF EXISTS `vechicle`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vechicle` (
  `vid` int(11) NOT NULL AUTO_INCREMENT,
  `vname` varchar(50) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `vtype` varchar(50) DEFAULT NULL,
  `regno` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`vid`),
  CONSTRAINT `cap` CHECK ((`capacity` < 60))
) ENGINE=InnoDB AUTO_INCREMENT=4473 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-09 20:49:01
