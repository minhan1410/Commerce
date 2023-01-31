-- MySQL dump 10.13  Distrib 8.0.29, for Win64 (x86_64)
--
-- Host: localhost    Database: team_1
-- ------------------------------------------------------
-- Server version	8.0.29

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
-- Table structure for table `designs`
--

DROP TABLE IF EXISTS `designs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `designs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `type` tinyint NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  `background_type` tinyint NOT NULL,
  `background_color` varchar(45) DEFAULT NULL,
  `background_image` varchar(255) DEFAULT NULL,
  `font` varchar(255) NOT NULL,
  `button_type` tinyint NOT NULL,
  `button_color` varchar(45) NOT NULL,
  `text_color` varchar(45) NOT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `designs`
--

LOCK TABLES `designs` WRITE;
/*!40000 ALTER TABLE `designs` DISABLE KEYS */;
INSERT INTO `designs` VALUES (1,'Carbon',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1657513989/bph71ax2laharftthnol.png',0,'#000000','','Cursive',0,'rgb(38, 38, 38)','#FFFFFF',1),(2,'Basics',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1657513889/ykirgbg8awfehclocmpw.png',0,'#FFFFFF','','Cursive',0,'#FFFFFF','#000000',1),(3,'Cloudy',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1657513889/ev0vcud0gbue1jogkbfh.png',0,'rgb(216, 216, 216)','','Cursive',2,'#FFFFFF','#000000',1),(4,'Minimal',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1657513889/qtcqpwn9in0kmsse2kya.png',0,'#FFFFFF','','Cursive',3,'#000000','#000000',1),(5,'Shadow',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1657513889/ztetsi65j1t7dssy8jh7.png',0,'#FFFFFF','','Cursive',2,'rgb(216, 216, 216)','#000000',1),(8,'Nature',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1658722218/zxb7xp45pncogykspqtm.gif',1,NULL,'https://res.cloudinary.com/anhtuanbui/image/upload/v1658722218/zxb7xp45pncogykspqtm.gif','Cursive',2,'#FFFFFF','#000000',1),(9,'Windy',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1658720172/tsbfxs25xo5lt8ztckri.gif',1,NULL,'https://res.cloudinary.com/anhtuanbui/image/upload/v1658720172/tsbfxs25xo5lt8ztckri.gif','Cursive',3,'#000000','#000000',1),(10,'Windy2',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1658734321/ivh8symqurhazzvnxbpn.gif',1,NULL,'https://res.cloudinary.com/anhtuanbui/image/upload/v1658734321/ivh8symqurhazzvnxbpn.gif','Cursive',0,'#FFFFFF','#000000',1),(11,'admin',1,'undefined',0,'#a89e34','http://res.cloudinary.com/anhtuanbui/image/upload/v1660536309/lqvt3ud8sy698jeoevfo.jpg','Papyrus',1,'#44a4ee','#f5f5f5',1),(13,'tuanba59',1,NULL,0,'#FFFFFF','','Cursive',0,'#FFFFFF','#000000',1),(14,'tuankid2k',1,NULL,0,'#FFFFFF','http://res.cloudinary.com/anhtuanbui/image/upload/v1660206775/tlaczcenasbjuemp1e5q.jpg','Papyrus',1,'#050505','#000000',1),(17,'test1',0,NULL,1,NULL,NULL,'',0,'','',0),(18,'test2',0,NULL,0,NULL,NULL,'',0,'','',0),(19,'anhnv182',1,'undefined',0,'#884a3a','','Papyrus',1,'#6c1a14','#c6de12',1),(20,'trongnghiavu',1,'undefined',1,'#d7f05c','http://res.cloudinary.com/anhtuanbui/image/upload/v1660546958/cgspvuz9gxaoqjcvq6x1.jpg','Georgia',1,'#8e7cc0','#ffffff',1),(21,'quyet19',1,'undefined',0,'#FFFFFF','','Papyrus',3,'#778a14','#31999b',1),(22,'sheep',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1660548661/kzfd4dldp3udrkfcssly.gif',1,'#000000','https://res.cloudinary.com/anhtuanbui/image/upload/v1660548661/kzfd4dldp3udrkfcssly.gif','Cursive',2,'#FFFFFF','#000000',1),(23,'Lake',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1660549236/rjpoer8ntlqtpgmffu6m.gif',1,'#000000','https://res.cloudinary.com/anhtuanbui/image/upload/v1660549236/rjpoer8ntlqtpgmffu6m.gif','Cursive',2,'#FFFFFF','#000000',1),(24,'Park',0,'https://res.cloudinary.com/anhtuanbui/image/upload/v1660549534/hjffwsumzbaqbynx0as1.gif',1,'#000000','https://res.cloudinary.com/anhtuanbui/image/upload/v1660549534/hjffwsumzbaqbynx0as1.gif','Cursive',2,'#FFFFFF','#000000',1);
/*!40000 ALTER TABLE `designs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (74),(1);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` tinyint NOT NULL,
  `title` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(200) DEFAULT NULL,
  `picture` varchar(200) DEFAULT NULL,
  `profile_id` int NOT NULL,
  `click_count` int DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (19,0,'Instagram','instagram.com','https://res.cloudinary.com/anhtuanbui/image/upload/v1658114566/stpzxormx6qcasiwb4it.jpg',1,13,NULL),(26,0,'Facebook','facebook.com','https://res.cloudinary.com/anhtuanbui/image/upload/v1657709665/untanb9qsxkcl2l38b5h.jpg',1,7,NULL),(27,0,'Youtube','youtube.com','https://res.cloudinary.com/anhtuanbui/image/upload/v1657882569/c7pgkt1fojx0cjgus8ow.png',1,4,NULL),(34,1,'Bùi Anh Tuấn','null','null',1,0,NULL),(41,0,'FACEBOOK','facebook.com','http://res.cloudinary.com/anhtuanbui/image/upload/v1658893540/a17fsttmyuskarvtvled.jpg',19,0,NULL),(42,1,'Bui anh tuan','null','http://res.cloudinary.com/anhtuanbui/image/upload/v1658893551/lk7qxg0vaiympovflbgf.jpg',19,0,NULL),(49,0,'Facebook','Facebook.com','http://res.cloudinary.com/anhtuanbui/image/upload/v1659155038/bgxsme2qb3adnwpwhzmt.png',3,2,NULL),(60,0,'fb cua t ','https://www.instagram.com/p/CR1MRRoFu0a/','http://res.cloudinary.com/anhtuanbui/image/upload/v1659510455/h3q8l6a1h9bqfxu0etst.jpg',45,1,NULL),(67,1,'tuan','null','null',41,0,NULL),(68,0,'facebook','facebook.com','http://res.cloudinary.com/anhtuanbui/image/upload/v1660206367/ft207leyrldiy4qxwfjw.jpg',41,0,NULL),(69,0,'ABC','https://soundcloud.com/discover','http://res.cloudinary.com/anhtuanbui/image/upload/v1660358668/h6mi1oy9a7mtkfy7fgt2.jpg',56,1,NULL),(71,0,'Nguyen Huong','tiktok.com/@huong.roll01','http://res.cloudinary.com/anhtuanbui/image/upload/v1660376340/d5lvvj94exx4uyu8frl2.jpg',4,3,NULL),(72,0,'Truong My Nhan','tiktok.com/@hana.mynhan','http://res.cloudinary.com/anhtuanbui/image/upload/v1660375957/dfhbqebmq08p6pjvst8q.jpg',4,4,NULL),(73,0,'lam_mot','tiktok.com/@lanie_0814','http://res.cloudinary.com/anhtuanbui/image/upload/v1660376026/jqvj6c5cwirooethabqu.jpg',4,0,NULL),(81,0,'Instagram','www.instagram.com/trongnghia._.vu/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660534844/miahmkarykizbw6mhbip.png',60,1,NULL),(83,0,'github','github.com/minhan1410','http://res.cloudinary.com/anhtuanbui/image/upload/v1660534807/u96dlvz6rcoxs6moievn.png',47,3,NULL),(84,0,'Github','github.com/nghiavt1302','http://res.cloudinary.com/anhtuanbui/image/upload/v1660534871/daz1gyzalhfxmgzotsk1.png',60,0,NULL),(85,1,'List hot girl instagram','null','null',4,0,NULL),(86,0,'miss.wu95','instagram.com/miss.wu95/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535380/nvylq8asvgruxwvqvmb2.jpg',4,2,NULL),(87,0,'hya.0923','instagram.com/hya.0923/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535548/snvtfmozm25pzpaefrtt.jpg',4,0,NULL),(88,0,'_lchi.521','instagram.com/_lchi.521/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535620/vsx8g7mwcqv3nachll6u.jpg',4,0,NULL),(89,0,'tthlinh.18','https://www.instagram.com/tthlinh.18/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535674/nxzxziwxmjdyqxrzahyj.jpg',4,0,NULL),(90,0,'sunnie.tr','instagram.com/sunnie.tr/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535732/b7djquendxzv52r8jmc9.jpg',4,3,NULL),(91,0,'_lingchii','instagram.com/_lingchii/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535791/yhspcpvtupa3lw2kscr4.jpg',4,1,NULL),(92,0,'lylychuu','instagram.com/lylychuu/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535873/mfx80ixt6m0cdee8vzec.jpg',4,0,NULL),(93,0,'nhunggumiho','instagram.com/nhunggumiho/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660535926/dv9bvfxq3ka4emmcd7p3.jpg',4,0,NULL),(94,0,'Instagram','https://www.instagram.com/sunnie.tr/','http://res.cloudinary.com/anhtuanbui/image/upload/v1660537085/d9zo6z5e2lz2ugbcfxgx.png',3,0,NULL),(95,1,'Socials','null','http://res.cloudinary.com/anhtuanbui/image/upload/v1660537119/xrqd3yhpzjqc85c2ds6v.png',3,0,NULL),(97,1,'Header 1','null','null',60,0,NULL);
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profiles`
--

DROP TABLE IF EXISTS `profiles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profiles` (
  `id` int NOT NULL,
  `fullname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `short_bio` varchar(255) NOT NULL,
  `about` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` datetime NOT NULL,
  `gender` tinyint NOT NULL,
  `location` varchar(255) DEFAULT NULL,
  `click_count` int NOT NULL,
  `design_id` int NOT NULL,
  `avatar_link` varchar(255) DEFAULT NULL,
  `status` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short_bio_UNIQUE` (`short_bio`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profiles`
--

LOCK TABLES `profiles` WRITE;
/*!40000 ALTER TABLE `profiles` DISABLE KEYS */;
INSERT INTO `profiles` VALUES (1,'Bui Anh Tuan','anhtuanbui','abc','2000-12-25 00:00:00',0,'abc',97,24,'http://res.cloudinary.com/anhtuanbui/image/upload/v1660010893/v6na4jcnpagsy5wkgmei.jpg',1),(2,'vietanh','vadz.bio','cba','2001-01-21 00:00:00',0,'mnc',8,2,'https://res.cloudinary.com/anhtuanbui/image/upload/v1657105879/o6pfbipycjz0cpcicwus.png',1),(3,'Nguyen Viet Anh','vietanh','hihi','2001-01-21 00:00:00',0,'vnn',116,22,'http://res.cloudinary.com/anhtuanbui/image/upload/v1660536776/aclg7azbnjvvpldvffux.jpg',1),(4,'quyet19','quyet','Specialized in sharing hot girl','2005-08-08 00:00:00',2,'Ha Noi',38,21,'http://res.cloudinary.com/anhtuanbui/image/upload/v1660537049/r5tswklen37khlnw2nyl.jpg',1),(47,'Nguyen Minh An','minhan14102001','','2022-08-03 00:00:00',0,'',7,5,'http://res.cloudinary.com/anhtuanbui/image/upload/v1660534692/pnbyzcefzs1o3igrkjxw.jpg',1),(59,'Bùi Anh Tu?n','anhtuanbui0','Anh Tu?n Bùi','2000-12-25 00:00:00',0,'VP',0,22,'http://res.cloudinary.com/anhtuanbui/image/upload/v1660547109/alphs8errdrbg12okqst.png',1),(60,'Vu Trong Nghia','trongnghiavu','Java Backend','2001-02-13 00:00:00',0,'Ha Noi',12,20,'http://res.cloudinary.com/anhtuanbui/image/upload/v1660533689/nfiuzde33jatjjrwygbk.png',1);
/*!40000 ALTER TABLE `profiles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socials`
--

DROP TABLE IF EXISTS `socials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socials` (
  `id` bigint NOT NULL,
  `click_count` bigint DEFAULT NULL,
  `social_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `links` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `social_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL,
  `profile_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socials`
--

LOCK TABLES `socials` WRITE;
/*!40000 ALTER TABLE `socials` DISABLE KEYS */;
INSERT INTO `socials` VALUES (52,0,'facebook','/anhtuanbui25','Facebook',1),(53,1,'instagram','anhtuanbui','Instagram',1),(54,0,'github','123','Github',41),(66,1,'facebook','NghiaxVT/','Facebook',60),(67,1,'youtube','channel/UCaUDrVaym1fDgDjidvNRGPw','Youtube',60),(68,1,'instagram','trongnghia._.vu/','Instagram',60),(69,1,'github','/nghiavt1302','Github',60),(70,0,'linkedin','in/nghia-vu-trong-463b661','Linkedin',60),(71,0,'instagram','vietanh2101','Instagram',3),(72,0,'facebook','vietanh21','Facebook',3),(73,0,'github','vietanh1311','Github',3);
/*!40000 ALTER TABLE `socials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statistics`
--

DROP TABLE IF EXISTS `statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `statistics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `click_count` bigint DEFAULT NULL,
  `profile_id` int DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statistics`
--

LOCK TABLES `statistics` WRITE;
/*!40000 ALTER TABLE `statistics` DISABLE KEYS */;
INSERT INTO `statistics` VALUES (1,8,2,'2022-06-21 00:00:00'),(2,55,1,'2022-07-13 17:32:12'),(3,116,3,'2022-08-01 15:45:32'),(4,38,4,'2022-08-01 15:45:32'),(19,2,19,'2022-08-01 15:45:32'),(47,7,47,'2022-08-01 15:45:32'),(48,42,1,'2022-08-10 11:29:26'),(49,7,56,'2022-08-13 09:39:50'),(50,4,57,'2022-08-13 09:59:05'),(51,13,60,'2022-08-15 10:21:30'),(52,8,59,'2022-08-15 10:49:44'),(53,1,59,'2022-08-15 14:05:10');
/*!40000 ALTER TABLE `statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(200) DEFAULT NULL,
  `role` varchar(200) NOT NULL DEFAULT 'ROLE_USER',
  `enabled` tinyint NOT NULL DEFAULT '1',
  `mail` varchar(255) NOT NULL,
  `verification_code` varchar(64) DEFAULT NULL,
  `provider` varchar(45) DEFAULT NULL,
  `update_password_token` varchar(64) DEFAULT NULL,
  `is_profile` tinyint NOT NULL,
  `is_upgrade_role` tinyint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_sb8bbouer5wak8vyiiy4pf2bx` (`username`),
  UNIQUE KEY `UK_r43af9ap4edm43mmtq01oddj6` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin','$2a$10$gZrhS36iuQ84Oz/XIA5rHupsJwBY8tF2.dMDn4W4XPTIikXIVC8Dq','2',1,'annm7@ghtk.co',NULL,'DEFAULT','',1,0),(3,'anhnv182','$2a$10$RWrFSgpLnb.RW5hktphkQeD8P4YriwK7Xo5ihZLSHHXjAZaqPKWEy','2',1,'vietanhzz2101@gmail.com',NULL,'DEFAULT',NULL,1,0),(4,'quyet19','$2a$10$msuJrz10a8Ottcddn/DWOeR9aVzsW5L4z49Ca3VR/f36jrC9.wpPm','2',1,'aeweb21@gmail.com',NULL,'DEFAULT',NULL,1,0),(47,'minhan14102001','$2a$10$l4dKgqzlAdx/9yJ4OBJ9F.4B750EJIAkp32ziF.P4inREpa1SBmDK','2',1,'minhan14102001@gmail.com',NULL,'FACEBOOK','o6SVc5pIJEc8O1c82bAhfCSRI5Xt06fllVK0Pb2UxQtTSZC0ezzxrB4F2K7JQcfT',1,0),(55,'nva0372206089',NULL,'0',1,'nva0372206089@gmail.com',NULL,'FACEBOOK',NULL,0,1),(58,'ghtkannm7',NULL,'0',1,'ghtkannm7@gmail.com',NULL,'FACEBOOK',NULL,0,1),(59,'anhtuanbui',NULL,'0',0,'tuankid2k@gmail.com',NULL,'FACEBOOK',NULL,1,0),(60,'trongnghiavu','$2a$10$MLIssrX9U58V0J5aezoKdemV1kJWMsV5NpJHCjSjPJSPH4rpVSvB2','1',1,'vtnghia01.bchkl@gmail.com',NULL,'FACEBOOK',NULL,1,0);
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

-- Dump completed on 2022-12-20 11:22:15
