CREATE DATABASE  IF NOT EXISTS `commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `commerce`;
-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (x86_64)
--
-- Host: localhost    Database: commerce
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `bill`
--

DROP TABLE IF EXISTS `bill`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bill` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `cart_id` int DEFAULT NULL,
  `coupon_id` int DEFAULT NULL,
  `total_cart` int DEFAULT NULL,
  `price_total` double DEFAULT NULL,
  `status` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `receiver_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `phone_number` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `shipping_address` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `confirm_time` datetime DEFAULT NULL,
  `delivery_time` datetime DEFAULT NULL,
  `received_time` datetime DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_bill_user_idx` (`user_id`),
  KEY `fk_bill_cart_idx` (`cart_id`),
  KEY `fk_bill_coupon_idx` (`coupon_id`),
  CONSTRAINT `fk_bill_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_bill_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `fk_bill_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (105,29,18,NULL,16,320,'WAIT','Dung','0347705659','30','2023-03-24 02:01:17',NULL,NULL,NULL,0),(107,29,19,NULL,1,35,'WAIT','Dung','0347705659','30','2023-03-24 02:35:31',NULL,NULL,NULL,0),(113,29,20,NULL,9,590,'WAIT','Dung','0347705659','30','2023-03-24 15:33:52',NULL,NULL,NULL,0),(115,29,21,NULL,3,360,'WAIT','Dung','0347705659','30','2023-03-24 15:37:25',NULL,NULL,NULL,0),(117,29,22,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 15:42:31',NULL,NULL,NULL,0),(119,29,23,NULL,1,40,'WAIT','Dung','0347705659','30','2023-03-24 15:54:48',NULL,NULL,NULL,0),(121,29,24,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:00:53',NULL,NULL,NULL,0),(123,29,25,NULL,1,120,'WAIT','Dung','0347705659','30','2023-03-24 16:05:24',NULL,NULL,NULL,0),(125,29,27,NULL,1,120,'WAIT','Dung','0347705659','30','2023-03-24 16:06:49',NULL,NULL,NULL,0),(127,29,28,NULL,1,35,'WAIT','Dung','0347705659','30','2023-03-24 16:09:01',NULL,NULL,NULL,0),(129,29,29,NULL,1,120,'WAIT','Dung','0347705659','30','2023-03-24 16:12:34',NULL,NULL,NULL,0),(131,29,30,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:41:23',NULL,NULL,NULL,0),(133,29,31,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:42:48',NULL,NULL,NULL,0),(135,29,32,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:44:58',NULL,NULL,NULL,0),(137,29,33,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:48:03',NULL,NULL,NULL,0),(139,29,34,NULL,1,100,'WAIT','Dung','0347705659','30','2023-03-24 16:57:30',NULL,NULL,NULL,0),(141,29,35,NULL,1,40,'WAIT','Dung','0347705659','30','2023-03-24 17:16:26',NULL,NULL,NULL,0),(145,29,36,NULL,4,160,'WAIT','Dung','0347705659','30','2023-03-24 21:57:45',NULL,NULL,NULL,0),(149,146,37,74,3,30,'WAIT','Tran Duy Anh Tu','','','2023-03-25 13:33:49',NULL,NULL,NULL,0),(152,146,38,NULL,2,420,'WAIT','Tran Duy Anh Tu','','','2023-03-25 13:42:39',NULL,NULL,NULL,0),(157,146,39,74,4,167.5,'WAIT','Tran Duy Anh Tu','','','2023-03-27 23:36:19',NULL,NULL,NULL,0);
/*!40000 ALTER TABLE `bill` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog`
--

DROP TABLE IF EXISTS `blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `category_blog_id` int DEFAULT NULL,
  `title` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `content` varchar(5000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_time` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_day` int DEFAULT NULL,
  `created_month` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `image` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_blog_category_idx` (`category_blog_id`),
  CONSTRAINT `fk_blog_cate` FOREIGN KEY (`category_blog_id`) REFERENCES `categories_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (1,1,'8 Inspiring Ways to Wear Dresses in the Winter','Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sit amet est vel orci luctus sollicitudin. Duis eleifend vestibulum justo, varius semper lacus condimentum dictum. Donec pulvinar a magna ut malesuada. In posuere felis diam, vel sodales metus accumsan in. Duis viverra dui eu pharetra pellentesque. Donec a eros leo. Quisque sed ligula vitae lorem efficitur faucibus. Praesent sit amet imperdiet ante. Nulla id tellus auctor, dictum libero a, malesuada nisi. Nulla in porta nibh, id vestibulum ipsum. Praesent dapibus tempus erat quis aliquet. Donec ac purus id sapien condimentum feugiat.','23:21:57',2,'MARCH','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676098967/wallpaperflare.com_wallpaper_4_jqueet.jpg',_binary ''),(3,2,'The Great Big List of Men’s Gifts for the Holidays','Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius','23:33:52',10,'May','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676098993/blog-05_mrjigt.jpg',_binary ''),(4,3,'5 Winter-to-Spring Fashion Trends to Try Now','Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Fusce eget dictum tortor. Donec dictum vitae sapien eu varius','07:44:18',9,'July','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099012/blog-06_mpwlvn.jpg',_binary '\0'),(49,1,'Facebook','The God has given humankind above the animal','08:05:26',28,'September','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099040/24_ewjemi.jpg',_binary ''),(50,2,'Toronto-Based Artist Collaborates with Emporio Armani + More Fashion News','To mark the 40th anniversary of Emporio Armani, Toronto-based artist Maxwell N. Burnstein was tapped to interpret the storied fashion brand’s history and future. Burnstein, who is self-taught, has done so in a series of collages that illustrate how the Italian fashion house has stayed true to its heritage while simultaneously adapting to metropolitan living. The masterful collages are set to be displayed on the W1 Screens along Oxford Street in London, England, as a site-specific installation. Yet another instance of Canadian talent being carried across the world.','09:44:12',29,'September','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099059/wallpaperflare.com_wallpaper_2_araoyo.jpg',_binary ''),(51,3,'Recyclable Sneaker Brand Thousand Fell Comes to Canada','Thousand Fell, a NYC-based brand, says it has created the world’s “first recyclable sneaker.” Made of materials like upcycled clothing, plastic water bottles and even food waste, the brand has filled a gap in the notoriously wasteful footwear industry. The minimalistic vegan shoes have generated a lot of buzz and racked up hefty waitlists — and as of September 22, they’re available in Canada, too.','09:45:16',29,'September','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099073/19_mz17fa.jpg',_binary '\0'),(88,4,'t','t','23:20:0',10,'MARCH','http://res.cloudinary.com/dpvehgfmo/image/upload/v1678465303/bun3da85o19ydq57kto3.png',_binary '\0'),(89,4,'t','t','23:21:57',10,'MARCH','http://res.cloudinary.com/dpvehgfmo/image/upload/v1678465320/yvqjh0macfwsbihq2q2w.png',_binary ''),(214,4,'Chụp ảnh màn hình','cmd ship 4',NULL,NULL,NULL,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1682225439/pyhzpf1rua9xs1l2u3vs.jpg',_binary ''),(215,1,'test','1234hhh',NULL,NULL,NULL,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1682240203/j5adys4bxpjfpdf7bfy7.jpg',_binary ''),(216,1,'abcd','abcd',NULL,NULL,NULL,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1682240647/wojfeqcc2ehfb24tasfy.jpg',_binary ''),(217,1,'1','14102001','16:8:30',23,'APRIL','http://res.cloudinary.com/dpvehgfmo/image/upload/v1682240912/wa2swi5xfw7oh22blxkk.jpg',_binary '\0');
/*!40000 ALTER TABLE `blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `blog_tag`
--

DROP TABLE IF EXISTS `blog_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `blog_tag` (
  `blog_id` int NOT NULL,
  `tag_id` int NOT NULL,
  `id` bigint NOT NULL AUTO_INCREMENT,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_blog_idx` (`blog_id`),
  KEY `fk_tag_idx` (`tag_id`),
  CONSTRAINT `fk_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `fk_tag` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (3,1,1,_binary ''),(4,1,2,_binary '\0'),(1,44,3,_binary ''),(49,1,4,_binary ''),(49,4,5,_binary ''),(49,7,6,_binary ''),(49,44,7,_binary ''),(49,45,8,_binary ''),(50,6,9,_binary ''),(50,7,10,_binary ''),(50,45,11,_binary ''),(51,4,12,_binary '\0'),(51,5,13,_binary '\0'),(51,6,14,_binary '\0'),(1,1,15,_binary ''),(1,2,16,_binary ''),(1,3,17,_binary ''),(88,1,18,_binary '\0'),(88,2,19,_binary '\0'),(88,5,20,_binary '\0'),(88,44,21,_binary '\0'),(88,45,22,_binary '\0'),(89,1,23,_binary ''),(89,2,24,_binary ''),(89,5,25,_binary ''),(89,44,26,_binary ''),(89,45,27,_binary ''),(214,1,28,_binary ''),(214,5,29,_binary ''),(214,2,30,_binary ''),(214,45,31,_binary ''),(214,3,32,_binary ''),(215,1,33,_binary ''),(216,2,34,_binary ''),(216,3,35,_binary ''),(217,4,36,_binary '\0');
/*!40000 ALTER TABLE `blog_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_cart_user_idx` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (18,29,_binary '\0'),(19,29,_binary '\0'),(20,29,_binary '\0'),(21,29,_binary '\0'),(22,29,_binary '\0'),(23,29,_binary '\0'),(24,29,_binary '\0'),(25,29,_binary '\0'),(26,29,_binary '\0'),(27,29,_binary '\0'),(28,29,_binary '\0'),(29,29,_binary '\0'),(30,29,_binary '\0'),(31,29,_binary '\0'),(32,29,_binary '\0'),(33,29,_binary '\0'),(34,29,_binary '\0'),(35,29,_binary '\0'),(36,29,_binary '\0'),(37,146,_binary '\0'),(38,146,_binary '\0'),(39,146,_binary '\0');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL,
  `cart_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cart_idx` (`cart_id`),
  KEY `fk_cart_p_idx` (`product_id`),
  CONSTRAINT `fk_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_cart_p` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (101,18,1,4,0),(102,18,68,4,0),(103,18,52,2,0),(104,18,62,6,0),(106,19,42,1,0),(108,20,1,2,0),(109,20,3,3,0),(110,20,52,1,0),(111,20,9,1,0),(112,20,45,2,0),(114,21,5,3,0),(116,22,1,1,0),(118,23,2,1,0),(120,24,1,1,0),(122,25,5,1,0),(124,27,5,1,0),(126,28,42,1,0),(128,29,5,1,0),(130,30,1,1,0),(132,31,1,1,0),(134,32,1,1,0),(136,33,1,1,0),(138,34,92,1,0),(140,35,2,1,0),(142,36,1,1,0),(143,36,68,2,0),(144,36,9,1,0),(147,37,1,2,0),(148,37,52,1,0),(150,38,5,1,0),(151,38,21,1,0),(153,39,19,1,0),(154,39,7,1,0),(155,39,42,1,0),(156,39,10,1,0);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=214 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Polo',_binary '\0'),(2,'T-Shirt',_binary '\0'),(3,'Bag',_binary '\0'),(4,'Shoes',_binary '\0'),(5,'Watches',_binary '\0'),(39,'Test',_binary '\0'),(77,'Hoodi',_binary '\0'),(78,'Hood',_binary '\0'),(79,'Wome',_binary '\0'),(80,'Hoo An',_binary '\0'),(81,'Da',_binary '\0'),(213,'An',_binary '\0');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_blog`
--

DROP TABLE IF EXISTS `categories_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=213 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_blog`
--

LOCK TABLES `categories_blog` WRITE;
/*!40000 ALTER TABLE `categories_blog` DISABLE KEYS */;
INSERT INTO `categories_blog` VALUES (1,'Fashion',_binary '\0'),(2,'Beauty',_binary '\0'),(3,'Street Style',_binary '\0'),(4,'Life Style',_binary '\0'),(5,'DIY & Crafts',_binary '\0'),(82,'Beaut',_binary ''),(210,'Test 15/05',_binary ''),(211,'An Nguyễn',_binary ''),(212,'Minh An',_binary '');
/*!40000 ALTER TABLE `categories_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comment_blog`
--

DROP TABLE IF EXISTS `comment_blog`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment_blog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `blog_id` int DEFAULT NULL,
  `reviewer_id` int DEFAULT NULL,
  `comment` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_comment_blog_idx` (`blog_id`),
  KEY `fk_comment_user_idx` (`reviewer_id`),
  CONSTRAINT `fk_comment_blog` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`),
  CONSTRAINT `fk_comment_user` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_blog`
--

LOCK TABLES `comment_blog` WRITE;
/*!40000 ALTER TABLE `comment_blog` DISABLE KEYS */;
INSERT INTO `comment_blog` VALUES (1,51,29,'Very useful article',_binary ''),(3,51,52,'This blog is so nice',_binary ''),(76,1,29,'hay',_binary ''),(83,50,29,'hay',_binary ''),(218,217,146,'Hay qua',_binary '\0'),(219,4,146,'Like',_binary '\0'),(220,51,29,'10đ',_binary '\0');
/*!40000 ALTER TABLE `comment_blog` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coupon`
--

DROP TABLE IF EXISTS `coupon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coupon` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `discount` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `expiration_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (74,'an',50,_binary '\0','2024-02-09 00:00:00');
/*!40000 ALTER TABLE `coupon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequence`
--

DROP TABLE IF EXISTS `hibernate_sequence`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hibernate_sequence` (
  `next_val` bigint DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequence`
--

LOCK TABLES `hibernate_sequence` WRITE;
/*!40000 ALTER TABLE `hibernate_sequence` DISABLE KEYS */;
INSERT INTO `hibernate_sequence` VALUES (221);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persistent_logins`
--

DROP TABLE IF EXISTS `persistent_logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persistent_logins` (
  `username` varchar(64) NOT NULL,
  `series` varchar(64) NOT NULL,
  `token` varchar(64) NOT NULL,
  `last_used` timestamp NOT NULL,
  PRIMARY KEY (`series`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persistent_logins`
--

LOCK TABLES `persistent_logins` WRITE;
/*!40000 ALTER TABLE `persistent_logins` DISABLE KEYS */;
INSERT INTO `persistent_logins` VALUES ('surivato98@gmail.com','1/CFabvMgvGkyoah60RMdw==','D4Z0OXVc5ERYsCv5m8Y2tw==','2023-04-23 15:17:51'),('duyanhtutran@gmail.com','Fsk/BTCSRvBGnwPahhpOuw==','c5UIjXLzSA5vDIUM7xllMA==','2023-04-23 15:17:04'),('surivato98@gmail.com','PQZ/RSsSmcMqZIzSvlJJLw==','ijGYz+V6A6KD4UvBaIIFXQ==','2023-04-23 18:17:11');
/*!40000 ALTER TABLE `persistent_logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin NOT NULL,
  `price` bigint NOT NULL,
  `description` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `categories_id` int DEFAULT NULL,
  `img_main` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `img_hover` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `img_sub` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `material` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `color` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `size` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_pro_cate_idx` (`categories_id`),
  CONSTRAINT `fk_pro_cate` FOREIGN KEY (`categories_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=210 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'Áo T-Shirt Oversize',20,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391054/v5crvb36wfhikzfauqub.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391058/ebyhgftb9oojerxvmukl.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672802747/p6t2seun6qqf9qehbamw.jpg','60% cotton','Blue','XL',2,_binary '\0'),(2,'Áo T-Shirt Blood Diamond',40,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040588/blooddiamond2_gohdrw.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040588/blooddiamond1_jboxqc.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040590/blooddiamond3_ghmvfx.jpg','70% cotton','Black','L',60,_binary '\0'),(3,'Áo T-Shirt Basic Over',120,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover1_u2lxrz.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover2_kszafe.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover3_lhu0uq.jpg','60% cotton','Blue','L',100,_binary '\0'),(4,'Áo T-Shirt Racing',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing1_rtsesg.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing2_otfzcr.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing3_fcrjam.jpg','60% cotton','Black','L',100,_binary '\0'),(5,'Áo T-Shirt Teddie',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040865/teddie1_jeug8i.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040865/teddie2_imoy7e.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040864/teddie3_ezr6y1.jpg','60% cotton','Black','L',100,_binary '\0'),(6,'Áo T-Shirt King of School ',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/KingofSchool1_g4gsfx.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/kingofschool2_cm2dww.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/kingofschool3_adixlb.jpg','60% cotton','Black','L',100,_binary '\0'),(7,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull1_hyi9oz.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull2_bx7ng5.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull3_gj3gzn.jpg','60% cotton','Black','L',100,_binary '\0'),(8,'Áo T-Shirt Agent',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent1_w0ocpb.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent2_lqhvde.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent3_y6fdks.jpg','60% cotton','Black','L',100,_binary '\0'),(9,'Áo T-Shirt Waster',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123728/8.1_ad4yh8.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123728/8.2_kioxd8.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123729/8.3_udvb73.jpg','60% cotton','Gray','L',100,_binary '\0'),(10,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-1_nej46r.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-2_xscql5.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-3_tyttzn.jpg','60% cotton','White','L',100,_binary '\0'),(11,'Áo T-Shirt Skull ',100,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',1,' không bị bong tróc khi giặt','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123819/skull2_dwh0co.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123819/skull3_y5o2rv.jpg','60% cotton','Blue','L',100,_binary '\0'),(14,'Áo T-Shirt Basic',35,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',1,' không bị bong tróc khi giặt','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123853/product-012_i3sjzw.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123852/product-013_buupck.jpg','60% cotton','White','L',100,_binary ''),(15,'Áo T-Shirt Slevee',35,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',1,' không bị bong tróc khi giặt','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123886/product-162_tvwzdq.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123886/product-163_wyjirc.jpg','60% cotton','Black','L',100,_binary ''),(16,'Áo T-Shirt Black',35,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',1,' không bị bong tróc khi giặt','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123918/chi-ghi-sau_mn4gwv.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123918/chi-trang-sau_c0j4yh.jpg','60% cotton','Black','L',100,_binary ''),(17,'Áo T-Shirt Color',70,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123969/v1-vang_gntcvh.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123969/0c530625-700d-4923-8268-43af5e699580_didhsp.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123969/58bb88e1-5dbe-44de-a5a1-77ad1aff1131_n1ppyc.jpg','60% cotton','Yellow','L',100,_binary ''),(18,'Áo COAST Brown',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124017/clowz-5-1-2_dxwbdy.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124018/clowz-5-9_gciixt.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124017/clowz-5-3_fqc9ev.jpg','60% cotton','Black','L',100,_binary ''),(19,'Converse Basic',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',4,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product-09_hw4wvu.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product092_ckvhle.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product-093_jjkjrf.jpg','60% cotton','Black','L',100,_binary '\0'),(20,'Đồng hồ Basic',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-06_drsuty.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-062_mzxtmt.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-063_cggdai.jpg','60% cotton','Black','L',100,_binary '\0'),(21,'Đồng hồ BlackPanther',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-15_e6cxqq.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-152_cbwxnn.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-153_yfermx.jpg','60% cotton','Black','L',100,_binary '\0'),(42,'Túi Utility',35,'Size: 23x16x8 cm\r , Mô tả: Túi 3 ngăn in logo\r,  Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag1_h8qrrp.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag2_biiwqu.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag3_iltabx.jpg','60% cotton','Yellow','L',100,_binary '\0'),(43,'Túi Ulitity SATCHEL',40,'Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo. Dây đeo có thể điều chỉnh hoặc tháo rời, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz-1-1_rjl8hy.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz1-2_iqirfp.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz-3-1_ck5xq7.jpg','60% cotton','Black','L',100,_binary '\0'),(45,'Túi Crytal Clear',35,'Dây đeo: Chữ \"CLOWNZ\" thiết kế theo phong cách graphic in chìm, dây đeo dài có thể điều chỉnh và tháo rời.Chất liệu: Nhựa PU, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/clear-bag-black_jniksa.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/1a7ff27f-75e2-4917-98bb-6d62bd9c3518_zml2bn.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/35e41285-3b94-4dca-96de-fff0b8b19273_kqk4em.jpg','60% cotton','Black','L',100,_binary '\0'),(52,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391054/v5crvb36wfhikzfauqub.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391058/ebyhgftb9oojerxvmukl.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672802747/p6t2seun6qqf9qehbamw.jpg','60% cotton','Blue','L',21,_binary '\0'),(56,'Đồng hồ Rolex Luxury',1000,'Đồng hồ Rolex Luxury',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/mua-%C4%90%E1%BB%93ng-h%E1%BB%93-Rolex-Deepsea-%C4%91en_varxqj.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/Daytona-2-1580886196_qzqo0c.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/dong-ho-rolex-nam-nu-chinh-hang-gia-bao-nhieu-danh-gia-chi-tiet_censot.jpg','60% cotton','Black','L',100,_binary '\0'),(62,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','M',80,_binary '\0'),(68,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','XL',80,_binary '\0'),(69,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','S',0,_binary '\0'),(92,' Áo Polo nam Excool',100,'',1,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243219/ux7btgdexzbvd5wglrti.webp','http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243222/mzsza6ewf9lnnllzv01o.webp','http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243224/lw5rzlwvxkwgpuzpzphs.webp','Cotton','White','L',500,_binary '\0'),(205,'Nguyen Minh An',1,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',1,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1680629140/om1xnsvz3s5qsmoq3b6k.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680629142/hnye0kgwuf41gu4sjl99.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680629145/lmw5ml5y4iqqom1bxd99.png','60% cotton','Black','L',50,_binary ''),(206,'Test',1,'ok',3,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1680797248/ujj69bfntb7efjwasvqm.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680797249/qrl3ndwtnoo37uqhbpqa.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680797294/tsqtxwhvdbgw1qpk8cya.png','60% cotton','Black','L',2,_binary ''),(207,'Test',1,'ok',3,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1680797248/ujj69bfntb7efjwasvqm.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680797249/qrl3ndwtnoo37uqhbpqa.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680797294/tsqtxwhvdbgw1qpk8cya.png','60% cotton','Blue','XXL',222,_binary ''),(208,'an',1,'1',1,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1680936141/ifvwz6sq3qbp0kirzcvq.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680936142/onyvizojk8hozrkcowm0.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680936144/wc3ze1zysqspou22yoly.png','60% cotton','Black','XXL',1,_binary ''),(209,'Áo T-Shirt Oversize',1,'1',1,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1680936521/hnhq7uwny4hne0uji3nh.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680936524/neguv3r1jzy0ygq4737l.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1680936527/usnhdib31l7nkszwbzne.png','60% cotton','White','XXL',1,_binary '');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `review` (
  `id` int NOT NULL AUTO_INCREMENT,
  `review` varchar(300) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `star_number` int DEFAULT NULL,
  `review_date` datetime DEFAULT NULL,
  `reviewer_id` int DEFAULT NULL,
  `product_id` int DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_review_user_idx` (`reviewer_id`),
  KEY `fk_review_product_idx` (`product_id`) /*!80000 INVISIBLE */,
  CONSTRAINT `fk_review_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`),
  CONSTRAINT `fk_review_user` FOREIGN KEY (`reviewer_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=204 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (16,'There\'s nothing left to criticize',4,'2021-08-31 21:41:14',52,2,_binary '\0'),(17,'That\'s cool',4,'2021-09-02 16:58:59',52,2,_binary '\0'),(18,'Nice ',2,'2021-09-02 17:16:00',52,5,_binary '\0'),(19,'Okay',1,'2021-09-02 17:16:27',52,5,_binary '\0'),(20,'I\'m really like it',5,'2021-09-02 17:17:14',52,5,_binary '\0'),(21,'Everything is so nice',5,'2021-09-14 16:16:11',52,3,_binary '\0'),(22,'Material of this shirt?',5,'2021-09-14 16:18:59',52,4,_binary '\0'),(24,'It\'s really nice and worth the money, I bought one',5,'2021-09-30 02:19:31',54,56,_binary '\0'),(70,'Dep',4,NULL,29,1,_binary ''),(71,'Dep',4,NULL,29,52,_binary '\0'),(72,'Dep',4,NULL,29,62,_binary '\0'),(73,'Dep',4,NULL,29,68,_binary '\0'),(192,'11',4,'2023-03-31 00:21:48',146,19,_binary '\0'),(193,'dep',3,'2023-03-31 11:10:08',29,92,_binary ''),(194,'10',3,'2023-03-31 11:29:57',29,92,_binary ''),(195,'ưersd',0,'2023-03-31 11:32:24',29,92,_binary ''),(196,'xx',3,'2023-03-31 11:34:12',29,92,_binary ''),(197,'xx',3,'2023-03-31 11:34:14',29,92,_binary ''),(198,'xx',3,'2023-03-31 11:34:15',29,92,_binary ''),(199,'xx',3,'2023-03-31 11:34:16',29,92,_binary ''),(200,'xx',3,'2023-03-31 11:34:16',29,92,_binary ''),(201,'xx',3,'2023-03-31 11:34:22',29,92,_binary '\0'),(202,'xx',3,'2023-03-31 11:34:24',29,92,_binary ''),(203,'xx',3,'2023-03-31 11:34:33',29,92,_binary '');
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tag` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` VALUES (1,'Fashion',_binary '\0'),(2,'Lifestyle',_binary '\0'),(3,'Denim',_binary '\0'),(4,'Streetstyle',_binary '\0'),(5,'Crafts',_binary '\0'),(6,'Couple',_binary '\0'),(7,'Trending',_binary '\0'),(44,'Car',_binary '\0'),(45,'Collections',_binary '\0');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `password` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `name` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `phone` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `address` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `state` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `city` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `created_time` timestamp NULL DEFAULT NULL,
  `role` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `auth_provider` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `one_time_password` varchar(64) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `otp_requested_time` datetime DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `verification_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `verification_code_expiry` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=205 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (21,'ghtkannm7@gmail.com',NULL,'An Nguyễn',NULL,NULL,NULL,NULL,NULL,NULL,'ADMIN',1,'GOOGLE',NULL,'https://lh3.googleusercontent.com/a/AEdFTp71Ztch70v85qEjolR6xM1gDzF2ymcdySCtD29P=s96-c',NULL,NULL,_binary '\0',NULL,NULL),(29,'surivato98@gmail.com','$2a$10$Atg/FvU/AOeNbCmaxzH9NewnqfABw6M9zmAZ3FLcl/spS96.L/4xO','Dung','0347705659','30','31','32',NULL,NULL,'ADMIN',1,'LOCAL',33,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png',NULL,NULL,_binary '\0',NULL,NULL),(52,'iamghost06@gmail.com','$2a$10$Atg/FvU/AOeNbCmaxzH9NewnqfABw6M9zmAZ3FLcl/spS96.L/4xO','Nguyen Ngoc Bach',NULL,NULL,NULL,NULL,0,NULL,'USER',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png',NULL,NULL,_binary '',NULL,NULL),(54,'iamghost827@gmail.com','$2a$10$Atg/FvU/AOeNbCmaxzH9NewnqfABw6M9zmAZ3FLcl/spS96.L/4xO','Nguyễn Ngọc Bách','0969374719','64, Nguyễn Văn Trỗi, Hà Đông, Hà Nội','Ha Noi','Ha Noi',100000,NULL,'ADMIN',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png','',NULL,_binary '\0',NULL,NULL),(87,'anmusic1410@gmail.com',NULL,'Minh An Nguyễn',NULL,NULL,NULL,NULL,NULL,NULL,'USER',1,'GOOGLE',NULL,'https://lh3.googleusercontent.com/a/AGNmyxanjRO2E8sFwTMa6xCp1F0QHqKGPhh1Z1LQT9ca=s96-c',NULL,NULL,_binary '\0',NULL,NULL),(90,'ngocbachnguyen100@gmail.com','$2a$10$Atg/FvU/AOeNbCmaxzH9NewnqfABw6M9zmAZ3FLcl/spS96.L/4xO','Nguyễn Ngọc Bách',NULL,NULL,NULL,NULL,0,'2021-09-24 09:08:31','USER',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png',NULL,NULL,_binary '',NULL,NULL),(91,'buivanhung124@gmail.com','$2a$10$4FkdxuynWWU.vPWQAByiDOkXQvxuaW25bjzaUfLlaV6YZW5KuR2ji','Bui Van Hung',NULL,NULL,NULL,NULL,NULL,NULL,'USER',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png',NULL,NULL,_binary '\0','','2023-03-11 23:43:26'),(146,'duyanhtutran@gmail.com','$2a$10$Q4E1eL5Iqid/3tk8oV5dhu3SIMqLn/xQMqXTOVv43uPEfpAGFnEau','Tran Duy Anh Tu',NULL,NULL,NULL,NULL,NULL,NULL,'USER',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1664851327/nightfury5387113c0adc6_bik2si.png',NULL,NULL,_binary '\0',NULL,NULL),(204,'minhan14102001@gmail.com',NULL,'Nguyễn An',NULL,NULL,NULL,NULL,NULL,NULL,'USER',1,'FACEBOOK',NULL,'https://scontent.fsgn2-9.fna.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=12b3be&_nc_ohc=Yehm_7dYxBQAX-68S2N&_nc_ht=scontent.fsgn2-9.fna&edm=AP4hL3IEAAAA&oh=00_AfD5Zc8W9KDFTuHG2xQDe7rpyv4sSu9vSSJjgDBuWynu4g&oe=644FF419',NULL,NULL,_binary '\0',NULL,NULL);
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

-- Dump completed on 2023-04-24  1:24:45
