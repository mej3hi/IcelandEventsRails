CREATE DATABASE  IF NOT EXISTS `IcelandEvents_development` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `IcelandEvents_development`;
-- MySQL dump 10.13  Distrib 5.7.22, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: IcelandEvents_development
-- ------------------------------------------------------
-- Server version	5.7.22-0ubuntu0.16.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2017-06-03 01:33:43','2017-06-03 01:33:43');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `time` time DEFAULT NULL,
  `imageurl` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `musicgenres` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_events_on_user_id` (`user_id`),
  KEY `index_events_on_user_id_and_created_at` (`user_id`,`created_at`),
  CONSTRAINT `fk_rails_0cb5590091` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (19,9,'KBE Kynnir Herra Hnetusmjör','Hard Rock Café','2018-05-25','21:00:00','1.10469.jpg','Til að fagna opnun KBE Studios ætlar Herra Hnetusmjör að halda tónleika föstudaginn 25.maí  í tónleikasal Hard Rock Cafe (staðsettur undir Hard Rock).','Other','2017-07-06 18:57:43','2017-07-13 00:03:57'),(20,9,'Reynir Hauksson – Flamenco','Reykholtskirkja, Borgarfirði','2018-05-29','20:30:00','1.10472.jpg','Reynir býr í Granada, Spáni og starfar þar sem Flamenco gítarleikari. \r\nÞað heyrir til tíðinda að Flamenco tónlist sé flutt á Íslandi, svo sjaldgæft er það. \r\nDraumur hans er að kynna og tengja þessa mögnuðu list við Ísland.','Other','2017-07-11 18:18:07','2017-07-11 18:18:07'),(21,9,'CCR Heiðurstónleikar','Bæjarbíó (Hafnarfirði)','2018-06-08','20:30:00','1.10436.jpg','Það er okkur sönn ánægja að tilkynna Heiðurstónleika CCR Bandsins í Bæjarbíói Hafnarfjarðar föstudagskvöldið 8. Júní.\r\nStrákarnir í CCR Bandinu hafa það að aðalsmerki að heiðra hina mögnuðu sveit Creedence Clearwater Revival.\r\n\r\n','Other','2017-07-11 18:47:11','2018-06-08 23:50:47'),(22,9,'Akureyri Dance Festival','Sjallinn (Akureyri)','2018-06-15','20:00:00','1.10470.jpg','Akureyri Events ehf. kynnir með stolti Akureyri Dance Festival, nýja raftónlistarhátíð sem haldin verður í Sjallanum á Akureyri dagana 15. og 16. júní 2018.','Other','2017-07-12 01:01:09','2017-07-12 01:01:09'),(23,9,'Extreme Chill Festival 2018 ','Reykjavík','2018-09-06','21:00:00','1.10457.jpg','Íslenska tónlistarhátíðin Extreme Chill Festival verður haldin 6-9 september næstkomandi og ætlum við að fagna því með því að bjóða upp á Early bird passa, 100 fyrstu passarnir á einstöku verði - 5900 Kr en fullt passa verð er 8900 kr.','Other','2017-07-12 01:46:08','2017-07-12 01:46:08'),(24,9,'The Las Vegas Christmas ','Gamla Bíó Salur','2018-06-12','20:30:00','1.10380.jpg','Þessir einstöku tónleikar eru nú orðnir fastur liður á aðventu landsmanna og hafa fengið feikna góða dóma fyrir frábæran flutning, skemmtanagildi og fagmennsku í alla staði. Geir sjálfur er frábær söngvari og skemmtikraftur.','Other','2018-06-08 23:41:03','2018-06-08 23:41:03');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20170603012405'),('20170604002324'),('20170604023413'),('20170605000712'),('20170605005301'),('20170606004453'),('20170606004732'),('20170606005104'),('20170606010157'),('20170606011248'),('20170608031509'),('20170619182425'),('20170705184017'),('20170705185404'),('20170706225615');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  `reset_digest` varchar(255) DEFAULT NULL,
  `reset_sent_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (9,'Username','User_Name','user_email@gmail.com','2018-06-02 03:24:19','2018-06-12 00:12:51','$2a$10$aUrL70OyYkOGanchVJ8AUO68dOrg5.hUcZcNKitfulDalgJaG04fi',NULL,'2018-06-12 00:11:28');
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

-- Dump completed on 2018-06-12  0:54:04
