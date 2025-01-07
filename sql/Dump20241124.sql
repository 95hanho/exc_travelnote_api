-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: travelnote
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `company_url` varchar(45) NOT NULL,
  `custom_id_placeholder` varchar(100) DEFAULT NULL,
  `custom_pw_placeholder` varchar(100) DEFAULT NULL,
  `custom_top_title_plain` varchar(100) DEFAULT NULL,
  `custom_top_title_bold` varchar(100) DEFAULT NULL,
  `list_title` varchar(100) DEFAULT NULL,
  `limit_value` int DEFAULT NULL,
  `reflection_title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`company_id`,`company_url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `file`
--

DROP TABLE IF EXISTS `file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `file` (
  `file_num` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `filePath` varchar(200) DEFAULT NULL,
  `type` varchar(100) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `lecture_idx` int DEFAULT NULL,
  `question_id` int DEFAULT NULL,
  PRIMARY KEY (`file_num`),
  KEY `company_file_idx` (`company_id`),
  KEY `travelnote_file_idx` (`lecture_idx`),
  KEY `question_file_idx` (`question_id`),
  CONSTRAINT `company_file` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`),
  CONSTRAINT `question_file` FOREIGN KEY (`question_id`) REFERENCES `question` (`id`),
  CONSTRAINT `travelnote_file` FOREIGN KEY (`lecture_idx`) REFERENCES `travelnote` (`lecture_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `file`
--

LOCK TABLES `file` WRITE;
/*!40000 ALTER TABLE `file` DISABLE KEYS */;
/*!40000 ALTER TABLE `file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `menu_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `code` varchar(45) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`menu_id`),
  KEY `company_menu_idx` (`company_id`),
  CONSTRAINT `company_menu` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notice` (
  `id` int NOT NULL,
  `title` varchar(100) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `content` varchar(300) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `company_notice_idx` (`company_id`),
  CONSTRAINT `company_notice` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `question`
--

DROP TABLE IF EXISTS `question`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `question` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `type` varchar(45) DEFAULT NULL,
  `contents` varchar(500) DEFAULT NULL,
  `lecture_idx` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `travelnote_question_idx` (`lecture_idx`),
  CONSTRAINT `travelnote_question` FOREIGN KEY (`lecture_idx`) REFERENCES `travelnote` (`lecture_idx`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `question`
--

LOCK TABLES `question` WRITE;
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reflection`
--

DROP TABLE IF EXISTS `reflection`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reflection` (
  `sc_id` int NOT NULL AUTO_INCREMENT,
  `reflection_content` varchar(300) DEFAULT NULL,
  `s_id` int DEFAULT NULL,
  PRIMARY KEY (`sc_id`),
  KEY `schedule_reflection_idx` (`s_id`),
  CONSTRAINT `schedule_reflection` FOREIGN KEY (`s_id`) REFERENCES `schedule` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reflection`
--

LOCK TABLES `reflection` WRITE;
/*!40000 ALTER TABLE `reflection` DISABLE KEYS */;
/*!40000 ALTER TABLE `reflection` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schedule`
--

DROP TABLE IF EXISTS `schedule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `schedule` (
  `s_id` int NOT NULL AUTO_INCREMENT,
  `html_raw` varchar(300) DEFAULT NULL,
  `sc_date` datetime DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`s_id`),
  KEY `company_schedule_idx` (`company_id`),
  CONSTRAINT `company_schedule` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schedule`
--

LOCK TABLES `schedule` WRITE;
/*!40000 ALTER TABLE `schedule` DISABLE KEYS */;
/*!40000 ALTER TABLE `schedule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token`
--

DROP TABLE IF EXISTS `token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token` (
  `token_num` int NOT NULL AUTO_INCREMENT,
  `refresh_token` varchar(200) DEFAULT NULL,
  `agent` varchar(200) DEFAULT NULL,
  `connect_ip` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`token_num`),
  KEY `user_token_idx` (`member_id`),
  CONSTRAINT `user_token` FOREIGN KEY (`member_id`) REFERENCES `user` (`member_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token`
--

LOCK TABLES `token` WRITE;
/*!40000 ALTER TABLE `token` DISABLE KEYS */;
/*!40000 ALTER TABLE `token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelnote`
--

DROP TABLE IF EXISTS `travelnote`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelnote` (
  `lecture_idx` int NOT NULL AUTO_INCREMENT,
  `program_description` varchar(100) DEFAULT NULL,
  `program_title` varchar(100) DEFAULT NULL,
  `week` int DEFAULT NULL,
  `s_id` int DEFAULT NULL,
  PRIMARY KEY (`lecture_idx`),
  KEY `schedule_travelnote_idx` (`s_id`),
  CONSTRAINT `schedule_travelnote` FOREIGN KEY (`s_id`) REFERENCES `schedule` (`s_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelnote`
--

LOCK TABLES `travelnote` WRITE;
/*!40000 ALTER TABLE `travelnote` DISABLE KEYS */;
/*!40000 ALTER TABLE `travelnote` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `member_id` varchar(100) NOT NULL,
  `member_password` varchar(200) DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  KEY `company_user_idx` (`company_id`),
  CONSTRAINT `company_user` FOREIGN KEY (`company_id`) REFERENCES `company` (`company_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 22:24:17
