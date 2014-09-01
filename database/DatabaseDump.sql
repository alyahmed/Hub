CREATE DATABASE  IF NOT EXISTS `CustomerSupport` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci */;
USE `CustomerSupport`;
-- MySQL dump 10.13  Distrib 5.6.19, for debian-linux-gnu (x86_64)
--
-- Host: 127.0.0.1    Database: CustomerSupport
-- ------------------------------------------------------
-- Server version	5.6.19-0ubuntu0.14.04.1

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
-- Table structure for table `Attachment`
--

DROP TABLE IF EXISTS `Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Attachment` (
  `AttachmentId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `AttachmentName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MimeContentType` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Contents` blob NOT NULL,
  PRIMARY KEY (`AttachmentId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Attachment`
--

LOCK TABLES `Attachment` WRITE;
/*!40000 ALTER TABLE `Attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket`
--

DROP TABLE IF EXISTS `Ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket` (
  `TicketId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` bigint(20) unsigned NOT NULL,
  `Subject` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Body` text COLLATE utf8_unicode_ci,
  `DateCreated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `Ticket_UserId` (`UserId`),
  FULLTEXT KEY `Ticket_Search` (`Subject`,`Body`),
  CONSTRAINT `Ticket_UserId` FOREIGN KEY (`UserId`) REFERENCES `UserPrincipal` (`UserId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket`
--

LOCK TABLES `Ticket` WRITE;
/*!40000 ALTER TABLE `Ticket` DISABLE KEYS */;
INSERT INTO `Ticket` VALUES (1,4,'test','test','2014-08-14 18:38:14'),(2,6,'OMG','That is so funny!','2014-08-14 20:26:47');
/*!40000 ALTER TABLE `Ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketComment`
--

DROP TABLE IF EXISTS `TicketComment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketComment` (
  `CommentId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `TicketId` bigint(20) unsigned NOT NULL,
  `UserId` bigint(20) unsigned NOT NULL,
  `Body` text COLLATE utf8_unicode_ci,
  `DateCreated` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`CommentId`),
  KEY `TicketComment_UserId` (`UserId`),
  KEY `TicketComment_TicketId` (`TicketId`),
  FULLTEXT KEY `TicketComment_Search` (`Body`),
  CONSTRAINT `TicketComment_TicketId` FOREIGN KEY (`TicketId`) REFERENCES `Ticket` (`TicketId`) ON DELETE CASCADE,
  CONSTRAINT `TicketComment_UserId` FOREIGN KEY (`UserId`) REFERENCES `UserPrincipal` (`UserId`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketComment`
--

LOCK TABLES `TicketComment` WRITE;
/*!40000 ALTER TABLE `TicketComment` DISABLE KEYS */;
INSERT INTO `TicketComment` VALUES (1,1,4,'test','2014-08-14 18:38:17'),(2,1,4,'tatgagas','2014-08-14 18:38:19');
/*!40000 ALTER TABLE `TicketComment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TicketComment_Attachment`
--

DROP TABLE IF EXISTS `TicketComment_Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TicketComment_Attachment` (
  `SortKey` smallint(6) NOT NULL,
  `CommentId` bigint(20) unsigned NOT NULL,
  `AttachmentId` bigint(20) unsigned NOT NULL,
  KEY `TicketComment_Attachment_Attachment` (`AttachmentId`),
  KEY `TicketComment_OrderedAttachments` (`CommentId`,`SortKey`,`AttachmentId`),
  CONSTRAINT `TicketComment_Attachment_Comment` FOREIGN KEY (`CommentId`) REFERENCES `TicketComment` (`CommentId`) ON DELETE CASCADE,
  CONSTRAINT `TicketComment_Attachment_Attachment` FOREIGN KEY (`AttachmentId`) REFERENCES `Attachment` (`AttachmentId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TicketComment_Attachment`
--

LOCK TABLES `TicketComment_Attachment` WRITE;
/*!40000 ALTER TABLE `TicketComment_Attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `TicketComment_Attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ticket_Attachment`
--

DROP TABLE IF EXISTS `Ticket_Attachment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ticket_Attachment` (
  `SortKey` smallint(6) NOT NULL,
  `TicketId` bigint(20) unsigned NOT NULL,
  `AttachmentId` bigint(20) unsigned NOT NULL,
  KEY `Ticket_Attachment_Attachment` (`AttachmentId`),
  KEY `Ticket_OrderedAttachments` (`TicketId`,`SortKey`,`AttachmentId`),
  CONSTRAINT `Ticket_Attachment_Ticket` FOREIGN KEY (`TicketId`) REFERENCES `Ticket` (`TicketId`) ON DELETE CASCADE,
  CONSTRAINT `Ticket_Attachment_Attachment` FOREIGN KEY (`AttachmentId`) REFERENCES `Attachment` (`AttachmentId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ticket_Attachment`
--

LOCK TABLES `Ticket_Attachment` WRITE;
/*!40000 ALTER TABLE `Ticket_Attachment` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ticket_Attachment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPrincipal`
--

DROP TABLE IF EXISTS `UserPrincipal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPrincipal` (
  `UserId` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `Username` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `HashedPassword` binary(60) NOT NULL,
  `AccountNonExpired` tinyint(1) NOT NULL,
  `AccountNonLocked` tinyint(1) NOT NULL,
  `CredentialsNonExpired` tinyint(1) NOT NULL,
  `Enabled` tinyint(1) NOT NULL,
  `first_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `last_name` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `UserPrincipal_Username` (`Username`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPrincipal`
--

LOCK TABLES `UserPrincipal` WRITE;
/*!40000 ALTER TABLE `UserPrincipal` DISABLE KEYS */;
INSERT INTO `UserPrincipal` VALUES (1,'Nicholas','$2a$10$x0k/yA5qN8SP8JD5CEN.6elEBFxVVHeKZTdyv.RPra4jzRR5SlKSC',1,1,1,1,'Nicholas','The Great'),(2,'Sarah','$2a$10$JSxmYO.JOb4TT42/4RFzguaTuYkZLCfeND1bB0rzoy7wH0RQFEq8y',1,1,1,1,'Sarah','Conner'),(3,'Mike','$2a$10$Lc0W6stzND.9YnFRcfbOt.EaCVO9aJ/QpbWnfjJLcMovdTx5s4i3G',1,1,1,1,'Mike','Jordan'),(4,'John','$2a$10$vacuqbDw9I7rr6RRH8sByuktOzqTheQMfnK3XCT2WlaL7vt/3AMby',1,1,1,1,'John','Green'),(6,'alyahmed220','$2a$10$9hyHA9LD0YUNer9CjPZK4OB1l1u0O9DvIDEkbOJf7WxT94yGmnHiu',1,1,1,1,'Ahmed','Aly'),(7,'John24@gmail.com','$2a$10$IY7eiBgTvG5OnbddTF9GI.RvUQdOCHGte.1WzNIAW/1fBiCVlk0AW',1,1,1,1,'John','green'),(8,'John257','$2a$10$RrqubhrGFGbfkPBY.6Lz8uqkihGmMdccHp1bO4NoQu1FPEN.w//5u',1,1,1,1,'John','Doe'),(9,'John24242@gmail.com','$2a$10$Xp/NdusrvzCp7Cg4cH.7ou0jQByw11f/iiyQmjwRm1xbGy.UW6xP2',1,1,1,1,'Ahmed','Aly'),(10,'Ahmed','$2a$10$H7EKy1XE0qT.cx7wLha8IeN0f/ieQmBSzMUt8Jy.rFU35.BGs3U5K',1,1,1,1,'Aly','alyahmed2220'),(12,'ahmed224','$2a$10$sZP3Uir/5IVKSJijqEPlYOhUgLDjRofWRd0iPbe.VtgTOU2mVStMG',1,1,1,1,'ahmed','aly'),(13,'john25252','$2a$10$Tt4Atfies.mRgX8c2ZifLOK7QNF4bRG.zgYnrPR5qGQqVp1uR27B6',1,1,1,1,'John','green'),(14,'Ahmed9090','$2a$10$v5tvVFO/icSpA6mg2WQyjeKEMEoAbPHTWEsNtOpDEx1kW4ky/y4NS',1,1,1,1,'ahmed','aly'),(15,'Ahmed910591','$2a$10$/rYFEVzQIDbMy/E38axtgeck7eN7vorPPGrHIasnTEdg0WnDaCs/.',1,1,1,1,'ahmed','aly'),(16,'Alyahmed999','$2a$10$Lv67jgmtLTckfEXLV24TF.nem7GqYAwiR4RkDfqUQ31DpPkXhQUWm',1,1,1,1,'Ahmed','Aly'),(17,'JohnJohn','$2a$10$9GBP0ssCzdLlpCYaFbBuWuYs.E5abchCwWmV43KRxf7mrTeiLwmY2',1,1,1,1,'Ahmed','Aly'),(18,'John90151902','$2a$10$DvK0hRAsHgKB.QjU1EMv4umMpkP0F.iszaiJ5ZPIyTa2a4K/k9gHm',1,1,1,1,'john','doe'),(19,'test','$2a$10$nCslb3u0ErruyABrUb7w0.uVGeWGg9/OisD.hS5IO0Yri4vhxWnfO',1,1,1,1,'test','test'),(20,'Test22','$2a$10$/UrCYVTBbLucVmSLl5c7nusn8mQ/4UURITKlHRxYZWsG217nfz4Se',1,1,1,1,'test','test'),(21,'Ahme909041','$2a$10$8Z8v8et8AnLDXf0WM3W7fOs2zuWKh0ge/3wyizeFNwb.v8QGtLaWi',1,1,1,1,'alya','alh'),(22,'blah','$2a$10$UFS2/rndo3ZhL02Lrc4td.djcQiK3aHTjiIZXf/9.Asmd23LekpQe',1,1,1,1,'blah','blah'),(25,'blah2','$2a$10$QOPf/u94o8BGKNKXR.yrzuHEcKFSdKGuulibv5jTeJDcLYIxwx86W',1,1,1,1,'blah2','blah2');
/*!40000 ALTER TABLE `UserPrincipal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `UserPrincipal_Authority`
--

DROP TABLE IF EXISTS `UserPrincipal_Authority`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `UserPrincipal_Authority` (
  `UserId` bigint(20) unsigned NOT NULL,
  `Authority` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `UserPrincipal_Authority_User_Authority` (`UserId`,`Authority`),
  CONSTRAINT `UserPrincipal_Authority_UserId` FOREIGN KEY (`UserId`) REFERENCES `UserPrincipal` (`UserId`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `UserPrincipal_Authority`
--

LOCK TABLES `UserPrincipal_Authority` WRITE;
/*!40000 ALTER TABLE `UserPrincipal_Authority` DISABLE KEYS */;
INSERT INTO `UserPrincipal_Authority` VALUES (1,'CHAT'),(1,'CREATE_CHAT_REQUEST'),(1,'CREATE_COMMENT'),(1,'CREATE_TICKET'),(1,'EDIT_OWN_COMMENT'),(1,'EDIT_OWN_TICKET'),(1,'VIEW_ATTACHMENT'),(1,'VIEW_COMMENTS'),(1,'VIEW_TICKET'),(1,'VIEW_TICKETS'),(2,'CHAT'),(2,'CREATE_CHAT_REQUEST'),(2,'CREATE_COMMENT'),(2,'CREATE_TICKET'),(2,'EDIT_OWN_COMMENT'),(2,'EDIT_OWN_TICKET'),(2,'VIEW_ATTACHMENT'),(2,'VIEW_COMMENTS'),(2,'VIEW_TICKET'),(2,'VIEW_TICKETS'),(3,'CHAT'),(3,'CREATE_CHAT_REQUEST'),(3,'CREATE_COMMENT'),(3,'CREATE_TICKET'),(3,'EDIT_OWN_COMMENT'),(3,'EDIT_OWN_TICKET'),(3,'VIEW_ATTACHMENT'),(3,'VIEW_COMMENTS'),(3,'VIEW_TICKET'),(3,'VIEW_TICKETS'),(4,'CHAT'),(4,'CREATE_CHAT_REQUEST'),(4,'CREATE_COMMENT'),(4,'CREATE_TICKET'),(4,'DELETE_COMMENT'),(4,'DELETE_TICKET'),(4,'EDIT_ANY_COMMENT'),(4,'EDIT_ANY_TICKET'),(4,'EDIT_OWN_COMMENT'),(4,'EDIT_OWN_TICKET'),(4,'START_CHAT'),(4,'VIEW_ATTACHMENT'),(4,'VIEW_CHAT_REQUESTS'),(4,'VIEW_COMMENTS'),(4,'VIEW_TICKET'),(4,'VIEW_TICKETS'),(4,'VIEW_USER_SESSIONS'),(6,'CREATE_COMMENT'),(6,'CREATE_TICKET'),(6,'VIEW_ATTACHMENT'),(6,'VIEW_COMMENT'),(6,'VIEW_TICKET'),(6,'VIEW_TICKETS'),(7,'CREATE_COMMENT'),(7,'CREATE_TICKET'),(7,'VIEW_ATTACHMENT'),(7,'VIEW_COMMENT'),(7,'VIEW_TICKET'),(7,'VIEW_TICKETS'),(8,'CREATE_COMMENT'),(8,'CREATE_TICKET'),(8,'VIEW_ATTACHMENT'),(8,'VIEW_COMMENT'),(8,'VIEW_TICKET'),(8,'VIEW_TICKETS'),(9,'CREATE_COMMENT'),(9,'CREATE_TICKET'),(9,'VIEW_ATTACHMENT'),(9,'VIEW_COMMENT'),(9,'VIEW_TICKET'),(9,'VIEW_TICKETS'),(10,'CREATE_COMMENT'),(10,'CREATE_TICKET'),(10,'VIEW_ATTACHMENT'),(10,'VIEW_COMMENT'),(10,'VIEW_TICKET'),(10,'VIEW_TICKETS'),(12,'CREATE_COMMENT'),(12,'CREATE_TICKET'),(12,'VIEW_ATTACHMENT'),(12,'VIEW_COMMENT'),(12,'VIEW_TICKET'),(12,'VIEW_TICKETS'),(13,'CREATE_COMMENT'),(13,'CREATE_TICKET'),(13,'VIEW_ATTACHMENT'),(13,'VIEW_COMMENT'),(13,'VIEW_TICKET'),(13,'VIEW_TICKETS'),(14,'CREATE_COMMENT'),(14,'CREATE_TICKET'),(14,'VIEW_ATTACHMENT'),(14,'VIEW_COMMENT'),(14,'VIEW_TICKET'),(14,'VIEW_TICKETS'),(15,'CREATE_COMMENT'),(15,'CREATE_TICKET'),(15,'VIEW_ATTACHMENT'),(15,'VIEW_COMMENT'),(15,'VIEW_TICKET'),(15,'VIEW_TICKETS'),(16,'CREATE_COMMENT'),(16,'CREATE_TICKET'),(16,'VIEW_ATTACHMENT'),(16,'VIEW_COMMENT'),(16,'VIEW_TICKET'),(16,'VIEW_TICKETS'),(17,'CREATE_COMMENT'),(17,'CREATE_TICKET'),(17,'VIEW_ATTACHMENT'),(17,'VIEW_COMMENT'),(17,'VIEW_TICKET'),(17,'VIEW_TICKETS'),(18,'CREATE_COMMENT'),(18,'CREATE_TICKET'),(18,'VIEW_ATTACHMENT'),(18,'VIEW_COMMENT'),(18,'VIEW_TICKET'),(18,'VIEW_TICKETS'),(19,'CREATE_COMMENT'),(19,'CREATE_TICKET'),(19,'VIEW_ATTACHMENT'),(19,'VIEW_COMMENT'),(19,'VIEW_TICKET'),(19,'VIEW_TICKETS'),(20,'CREATE_COMMENT'),(20,'CREATE_TICKET'),(20,'VIEW_ATTACHMENT'),(20,'VIEW_COMMENT'),(20,'VIEW_TICKET'),(20,'VIEW_TICKETS'),(21,'CREATE_COMMENT'),(21,'CREATE_TICKET'),(21,'VIEW_ATTACHMENT'),(21,'VIEW_COMMENT'),(21,'VIEW_TICKET'),(21,'VIEW_TICKETS'),(22,'CREATE_COMMENT'),(22,'CREATE_TICKET'),(22,'VIEW_ATTACHMENT'),(22,'VIEW_COMMENT'),(22,'VIEW_TICKET'),(22,'VIEW_TICKETS'),(25,'CREATE_COMMENT'),(25,'CREATE_TICKET'),(25,'VIEW_ATTACHMENT'),(25,'VIEW_COMMENT'),(25,'VIEW_TICKET'),(25,'VIEW_TICKETS');
/*!40000 ALTER TABLE `UserPrincipal_Authority` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-08-15  2:19:14
