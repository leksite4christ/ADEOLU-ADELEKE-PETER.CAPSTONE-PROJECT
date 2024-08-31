-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: localhost    Database: weatherapp
-- ------------------------------------------------------
-- Server version	8.0.39

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
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `CityID` int NOT NULL,
  `CityName` varchar(255) DEFAULT NULL,
  `Country` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Seattle','United States'),(2,'Lagos','Nigeria'),(3,'Tokyo','Japan');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vwcitydetails`
--

DROP TABLE IF EXISTS `vwcitydetails`;
/*!50001 DROP VIEW IF EXISTS `vwcitydetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwcitydetails` AS SELECT 
 1 AS `CityID`,
 1 AS `CityName`,
 1 AS `Country`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vwweatherdetails`
--

DROP TABLE IF EXISTS `vwweatherdetails`;
/*!50001 DROP VIEW IF EXISTS `vwweatherdetails`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vwweatherdetails` AS SELECT 
 1 AS `ConditionID`,
 1 AS `CityName`,
 1 AS `Date`,
 1 AS `Temperature`,
 1 AS `Humidity`,
 1 AS `WindSpeed`,
 1 AS `WeatherDescription`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `weatherconditions`
--

DROP TABLE IF EXISTS `weatherconditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `weatherconditions` (
  `ConditionID` int NOT NULL,
  `CityID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `Temperature` decimal(5,2) DEFAULT NULL,
  `Humidity` decimal(5,2) DEFAULT NULL,
  `WindSpeed` decimal(5,2) DEFAULT NULL,
  `WeatherDescription` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ConditionID`),
  KEY `FK_WeatherConditions_Cities` (`CityID`),
  CONSTRAINT `FK_WeatherConditions_Cities` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`),
  CONSTRAINT `weatherconditions_ibfk_1` FOREIGN KEY (`CityID`) REFERENCES `cities` (`CityID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weatherconditions`
--

LOCK TABLES `weatherconditions` WRITE;
/*!40000 ALTER TABLE `weatherconditions` DISABLE KEYS */;
INSERT INTO `weatherconditions` VALUES (1,1,'2024-08-26',25.50,70.20,8.30,'Partly cloudy'),(2,2,'2024-08-26',30.00,85.00,6.70,'Thunderstorms'),(3,3,'2024-08-26',28.80,60.50,12.10,'Sunny');
/*!40000 ALTER TABLE `weatherconditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'weatherapp'
--

--
-- Dumping routines for database 'weatherapp'
--

--
-- Final view structure for view `vwcitydetails`
--

/*!50001 DROP VIEW IF EXISTS `vwcitydetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwcitydetails` AS select `c`.`CityID` AS `CityID`,`c`.`CityName` AS `CityName`,`c`.`Country` AS `Country` from `cities` `c` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vwweatherdetails`
--

/*!50001 DROP VIEW IF EXISTS `vwweatherdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vwweatherdetails` AS select `wc`.`ConditionID` AS `ConditionID`,`c`.`CityName` AS `CityName`,`wc`.`Date` AS `Date`,`wc`.`Temperature` AS `Temperature`,`wc`.`Humidity` AS `Humidity`,`wc`.`WindSpeed` AS `WindSpeed`,`wc`.`WeatherDescription` AS `WeatherDescription` from (`weatherconditions` `wc` join `cities` `c` on((`wc`.`CityID` = `c`.`CityID`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-30 14:38:17
