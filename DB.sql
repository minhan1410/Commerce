CREATE DATABASE  IF NOT EXISTS `commerce` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `commerce`;
-- MySQL dump 10.13  Distrib 8.0.30, for macos12 (x86_64)
--
-- Host: localhost    Database: commerce
-- ------------------------------------------------------
-- Server version	8.0.30

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
  `total_price` double DEFAULT NULL,
  `total_apply` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bill_user_idx` (`user_id`),
  KEY `fk_bill_cart_idx` (`cart_id`),
  KEY `fk_bill_coupon_idx` (`coupon_id`),
  CONSTRAINT `fk_bill_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  CONSTRAINT `fk_bill_coupon` FOREIGN KEY (`coupon_id`) REFERENCES `coupon` (`id`),
  CONSTRAINT `fk_bill_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=415 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (105,29,18,NULL,16,320,'WAIT','Dung','0347705659','30','2023-03-24 02:01:17',NULL,NULL,NULL,0,NULL,NULL),(107,29,19,NULL,1,35,'WAIT','Dung','0347705659','30','2023-03-24 02:35:31',NULL,NULL,NULL,0,NULL,NULL),(113,29,20,NULL,9,590,'WAIT','Dung','0347705659','30','2023-03-24 15:33:52',NULL,NULL,NULL,0,NULL,NULL),(115,29,21,NULL,3,360,'WAIT','Dung','0347705659','30','2023-03-24 15:37:25',NULL,NULL,NULL,0,NULL,NULL),(117,29,22,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 15:42:31',NULL,NULL,NULL,0,NULL,NULL),(119,29,23,NULL,1,40,'WAIT','Dung','0347705659','30','2023-03-24 15:54:48',NULL,NULL,NULL,0,NULL,NULL),(121,29,24,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:00:53',NULL,NULL,NULL,0,NULL,NULL),(123,29,25,NULL,1,120,'WAIT','Dung','0347705659','30','2023-03-24 16:05:24',NULL,NULL,NULL,0,NULL,NULL),(125,29,27,NULL,1,120,'WAIT','Dung','0347705659','30','2023-03-24 16:06:49',NULL,NULL,NULL,0,NULL,NULL),(127,29,28,NULL,1,35,'WAIT','Dung','0347705659','30','2023-03-24 16:09:01',NULL,NULL,NULL,0,NULL,NULL),(129,29,29,NULL,1,120,'WAIT','Dung','0347705659','30','2023-03-24 16:12:34',NULL,NULL,NULL,0,NULL,NULL),(131,29,30,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:41:23',NULL,NULL,NULL,0,NULL,NULL),(133,29,31,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:42:48',NULL,NULL,NULL,0,NULL,NULL),(135,29,32,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:44:58',NULL,NULL,NULL,0,NULL,NULL),(137,29,33,NULL,1,20,'WAIT','Dung','0347705659','30','2023-03-24 16:48:03',NULL,NULL,NULL,0,NULL,NULL),(139,29,34,NULL,1,100,'WAIT','Dung','0347705659','30','2023-03-24 16:57:30',NULL,NULL,NULL,0,NULL,NULL),(141,29,35,NULL,1,40,'WAIT','Dung','0347705659','30','2023-03-24 17:16:26',NULL,NULL,NULL,0,NULL,NULL),(145,29,36,NULL,4,160,'WAIT','Dung','0347705659','30','2023-03-24 21:57:45',NULL,NULL,NULL,0,NULL,NULL),(149,146,37,74,3,30,'WAIT','Tran Duy Anh Tu','','','2023-03-25 13:33:49',NULL,NULL,NULL,0,NULL,NULL),(152,146,38,NULL,2,420,'WAIT','Tran Duy Anh Tu','','','2023-03-25 13:42:39',NULL,NULL,NULL,0,NULL,NULL),(157,146,39,74,4,167.5,'WAIT','Tran Duy Anh Tu','','','2023-03-27 23:36:19',NULL,NULL,NULL,0,NULL,NULL),(333,146,40,NULL,3,180,'WAIT','Tran Duy Anh Tu','k noi','k noi','2023-05-14 23:09:13',NULL,NULL,NULL,0,NULL,NULL),(335,146,41,NULL,1,100,'WAIT','Tran Duy Anh Tu','k noi','k noi','2023-05-14 23:12:11',NULL,NULL,NULL,0,NULL,NULL),(337,146,42,NULL,1,120,'WAIT','Tran Duy Anh Tu','k noi','k noi','2023-05-14 23:18:04',NULL,NULL,NULL,0,NULL,NULL),(339,146,43,NULL,1,120,'WAIT','Tran Duy Anh Tu','k noi','k noi','2023-05-14 23:22:27',NULL,NULL,NULL,0,NULL,NULL),(342,146,44,NULL,2,1100,'WAIT','Tran Duy Anh Tu','k noi','k noi','2023-05-14 23:23:35',NULL,NULL,NULL,0,NULL,NULL),(348,146,45,NULL,11,1095,'WAIT','Tran Duy Anh Tu','','K noi','2023-05-22 00:42:02',NULL,NULL,NULL,0,1095,NULL),(351,146,46,74,6,60,'WAIT','Tran Duy Anh Tu','123','K noi','2023-05-22 00:43:14',NULL,NULL,NULL,0,120,60),(354,146,47,74,1,50,'WAIT','Tran Duy Anh Tu','','','2023-05-28 23:00:55',NULL,NULL,NULL,0,100,50),(357,146,48,NULL,1,100,'WAIT','Tran Duy Anh Tu','','','2023-05-28 23:06:37',NULL,NULL,NULL,0,100,NULL),(360,146,49,74,1,60,'WAIT','Tran Duy Anh Tu','','','2023-05-28 23:37:27',NULL,NULL,NULL,0,120,60),(363,146,50,74,1,50,'WAIT','Tran Duy Anh Tu','','','2023-05-28 23:52:15',NULL,NULL,NULL,0,100,50),(366,146,51,NULL,1,100,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:00:36',NULL,NULL,NULL,0,100,NULL),(369,146,52,NULL,1,100,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:14:21',NULL,NULL,NULL,0,100,NULL),(372,146,53,NULL,1,120,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:17:22',NULL,NULL,NULL,0,120,NULL),(375,146,54,74,1,150,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:27:50',NULL,NULL,NULL,0,300,150),(378,146,55,NULL,3,300,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:42:27',NULL,NULL,NULL,0,300,NULL),(381,146,56,NULL,4,400,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:51:12',NULL,NULL,NULL,0,400,NULL),(384,146,57,NULL,1,35,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:55:50',NULL,NULL,NULL,0,35,NULL),(387,146,58,NULL,1,40,'WAIT','Tran Duy Anh Tu','','','2023-05-29 00:57:01',NULL,NULL,NULL,0,40,NULL),(390,146,59,NULL,1,1000,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:00:59',NULL,NULL,NULL,0,1000,NULL),(393,146,60,NULL,1,100,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:04:20',NULL,NULL,NULL,0,100,NULL),(396,146,61,NULL,1,300,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:09:21',NULL,NULL,NULL,0,300,NULL),(399,146,62,NULL,1,120,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:10:07',NULL,NULL,NULL,0,120,NULL),(402,146,63,NULL,3,120,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:10:55',NULL,NULL,NULL,0,120,NULL),(408,146,64,NULL,5,180,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:12:38',NULL,NULL,NULL,0,180,NULL),(411,146,65,NULL,1,120,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:13:10',NULL,NULL,NULL,0,120,NULL),(414,146,66,NULL,1,100,'WAIT','Tran Duy Anh Tu','','','2023-05-29 01:19:55',NULL,NULL,NULL,0,100,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (18,29,_binary '\0'),(19,29,_binary '\0'),(20,29,_binary '\0'),(21,29,_binary '\0'),(22,29,_binary '\0'),(23,29,_binary '\0'),(24,29,_binary '\0'),(25,29,_binary '\0'),(26,29,_binary '\0'),(27,29,_binary '\0'),(28,29,_binary '\0'),(29,29,_binary '\0'),(30,29,_binary '\0'),(31,29,_binary '\0'),(32,29,_binary '\0'),(33,29,_binary '\0'),(34,29,_binary '\0'),(35,29,_binary '\0'),(36,29,_binary '\0'),(37,146,_binary '\0'),(38,146,_binary '\0'),(39,146,_binary '\0'),(40,146,_binary '\0'),(41,146,_binary '\0'),(42,146,_binary '\0'),(43,146,_binary '\0'),(44,146,_binary '\0'),(45,146,_binary '\0'),(46,146,_binary '\0'),(47,146,_binary '\0'),(48,146,_binary '\0'),(49,146,_binary '\0'),(50,146,_binary '\0'),(51,146,_binary '\0'),(52,146,_binary '\0'),(53,146,_binary '\0'),(54,146,_binary '\0'),(55,146,_binary '\0'),(56,146,_binary '\0'),(57,146,_binary '\0'),(58,146,_binary '\0'),(59,146,_binary '\0'),(60,146,_binary '\0'),(61,146,_binary '\0'),(62,146,_binary '\0'),(63,146,_binary '\0'),(64,146,_binary '\0'),(65,146,_binary '\0'),(66,146,_binary '\0');
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
INSERT INTO `cart_item` VALUES (101,18,1,4,0),(102,18,68,4,0),(103,18,52,2,0),(104,18,62,6,0),(106,19,42,1,0),(108,20,1,2,0),(109,20,3,3,0),(110,20,52,1,0),(111,20,9,1,0),(112,20,45,2,0),(114,21,5,3,0),(116,22,1,1,0),(118,23,2,1,0),(120,24,1,1,0),(122,25,5,1,0),(124,27,5,1,0),(126,28,42,1,0),(128,29,5,1,0),(130,30,1,1,0),(132,31,1,1,0),(134,32,1,1,0),(136,33,1,1,0),(138,34,92,1,0),(140,35,2,1,0),(142,36,1,1,0),(143,36,68,2,0),(144,36,9,1,0),(147,37,1,2,0),(148,37,52,1,0),(150,38,5,1,0),(151,38,21,1,0),(153,39,19,1,0),(154,39,7,1,0),(155,39,42,1,0),(156,39,10,1,0),(331,40,2,2,0),(332,40,10,1,0),(334,41,92,1,0),(336,42,5,1,0),(338,43,5,1,0),(340,44,56,1,0),(341,44,9,1,0),(343,45,6,3,0),(344,45,7,2,0),(345,45,10,4,0),(346,45,92,1,0),(347,45,45,1,0),(350,46,1,6,0),(353,47,92,1,0),(356,48,19,1,0),(359,49,3,1,0),(362,50,9,1,0),(365,51,7,1,0),(368,52,8,1,0),(371,53,6,1,0),(374,54,20,1,0),(377,55,9,3,0),(380,56,9,4,0),(383,57,42,1,0),(386,58,43,1,0),(389,59,56,1,0),(392,60,92,1,0),(395,61,21,1,0),(398,62,3,1,0),(401,63,2,3,0),(404,64,1,1,0),(405,64,68,2,0),(406,64,92,1,0),(407,64,62,1,0),(410,65,5,1,0),(413,66,19,1,0);
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
  `expiration_date` datetime DEFAULT NULL,
  `expires` bit(1) DEFAULT b'0',
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `code_UNIQUE` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=223 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coupon`
--

LOCK TABLES `coupon` WRITE;
/*!40000 ALTER TABLE `coupon` DISABLE KEYS */;
INSERT INTO `coupon` VALUES (74,'an',50,'2024-02-09 00:00:00',_binary '\0',_binary '\0'),(221,'30/05',50,'2023-05-30 00:00:00',_binary '\0',_binary '\0'),(222,'test',20,'2023-05-01 00:00:00',_binary '',_binary '\0');
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
INSERT INTO `hibernate_sequence` VALUES (416);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `message`
--

DROP TABLE IF EXISTS `message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `message` (
  `id` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `from_user` bigint DEFAULT NULL,
  `is_seen` bit(1) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `message`
--

LOCK TABLES `message` WRITE;
/*!40000 ALTER TABLE `message` DISABLE KEYS */;
INSERT INTO `message` VALUES (349,'2023-05-22 00:42:02',146,_binary '','Tran Duy Anh Tu placed an order'),(352,'2023-05-22 00:43:14',146,_binary '','Tran Duy Anh Tu placed an order'),(355,'2023-05-28 23:00:55',146,_binary '','Tran Duy Anh Tu placed an order'),(358,'2023-05-28 23:06:37',146,_binary '','Tran Duy Anh Tu placed an order'),(361,'2023-05-28 23:37:27',146,_binary '','Tran Duy Anh Tu placed an order'),(364,'2023-05-28 23:52:15',146,_binary '','Tran Duy Anh Tu placed an order'),(367,'2023-05-29 00:00:36',146,_binary '','Tran Duy Anh Tu placed an order'),(370,'2023-05-29 00:14:21',146,_binary '','Tran Duy Anh Tu placed an order'),(373,'2023-05-29 00:17:22',146,_binary '','Tran Duy Anh Tu placed an order'),(376,'2023-05-29 00:27:50',146,_binary '','Tran Duy Anh Tu placed an order'),(379,'2023-05-29 00:42:27',146,_binary '','Tran Duy Anh Tu placed an order'),(382,'2023-05-29 00:51:12',146,_binary '','Tran Duy Anh Tu placed an order'),(385,'2023-05-29 00:55:50',146,_binary '','Tran Duy Anh Tu placed an order'),(388,'2023-05-29 00:57:01',146,_binary '','Tran Duy Anh Tu placed an order'),(391,'2023-05-29 01:00:59',146,_binary '','Tran Duy Anh Tu placed an order'),(394,'2023-05-29 01:04:20',146,_binary '','Tran Duy Anh Tu placed an order'),(397,'2023-05-29 01:09:21',146,_binary '','Tran Duy Anh Tu placed an order'),(400,'2023-05-29 01:10:07',146,_binary '','Tran Duy Anh Tu placed an order'),(403,'2023-05-29 01:10:55',146,_binary '\0','Tran Duy Anh Tu placed an order'),(409,'2023-05-29 01:12:38',146,_binary '\0','Tran Duy Anh Tu placed an order'),(412,'2023-05-29 01:13:10',146,_binary '\0','Tran Duy Anh Tu placed an order'),(415,'2023-05-29 01:19:55',146,_binary '\0','Tran Duy Anh Tu placed an order');
/*!40000 ALTER TABLE `message` ENABLE KEYS */;
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
INSERT INTO `persistent_logins` VALUES ('surivato98@gmail.com','JhD1/WOlii/q+Ut9URIGjA==','3dmSugjfLORHMoWPMnfqlg==','2023-05-29 18:34:17'),('surivato98@gmail.com','jIyhVZGuGAkFhfru27KApw==','27OMjsCcFXZc+lLGLoswCQ==','2023-05-29 18:03:49'),('duyanhtutran@gmail.com','qj61K2W6vSwwQNAdnom+ow==','vdE4z09k3m3tyuFyGR0sYw==','2023-05-29 15:47:40');
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
) ENGINE=InnoDB AUTO_INCREMENT=331 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (271,'1',2,'2023-05-07 21:33:23',29,1,_binary '\0'),(272,'2',2,'2023-05-07 21:33:52',29,1,_binary '\0'),(273,'3',2,'2023-05-07 21:34:12',29,1,_binary '\0'),(274,'4',4,'2023-05-07 21:36:00',146,52,_binary '\0'),(275,'5',4,'2023-05-07 21:36:16',146,52,_binary '\0'),(276,'6',2,'2023-05-07 21:36:37',29,1,_binary '\0'),(277,'7',0,'2023-05-07 22:16:59',87,1,_binary '\0'),(278,'8',0,'2023-05-07 22:19:37',29,1,_binary '\0'),(279,'9',0,'2023-05-07 22:19:46',87,1,_binary '\0'),(280,'11',0,'2023-05-07 22:32:21',87,1,_binary '\0'),(281,'12',0,'2023-05-07 22:38:47',87,52,_binary '\0'),(282,'10',0,'2023-05-07 22:39:16',29,1,_binary '\0'),(283,'dep day',0,'2023-05-08 23:27:54',87,2,_binary '\0'),(284,'nai sừ',0,'2023-05-08 23:42:08',29,2,_binary '\0'),(285,'3',0,'2023-05-09 00:03:42',29,2,_binary '\0'),(286,'4',0,'2023-05-09 00:07:28',29,2,_binary '\0'),(287,'5',0,'2023-05-09 00:11:43',87,2,_binary '\0'),(288,'6',0,'2023-05-09 00:11:57',87,2,_binary '\0'),(289,'7',0,'2023-05-09 00:12:01',87,2,_binary '\0'),(290,'8',0,'2023-05-09 00:12:06',87,2,_binary '\0'),(291,'9',0,'2023-05-09 00:12:16',29,2,_binary '\0'),(292,'10',0,'2023-05-09 00:12:21',29,2,_binary '\0'),(293,'11',0,'2023-05-09 00:12:24',29,2,_binary '\0'),(294,'12',0,'2023-05-09 00:12:30',87,2,_binary '\0'),(295,'13',0,'2023-05-09 00:38:58',29,2,_binary '\0'),(296,'kkkk 14',0,'2023-05-09 00:51:12',146,2,_binary '\0'),(297,'kkk 14',0,'2023-05-09 00:51:49',146,2,_binary '\0'),(298,'14',0,'2023-05-09 00:52:23',146,2,_binary '\0'),(299,'17',0,'2023-05-09 00:55:26',29,2,_binary '\0'),(300,'18',0,'2023-05-09 01:03:43',146,2,_binary '\0'),(301,'19',0,'2023-05-09 01:06:35',146,2,_binary '\0'),(302,'20',0,'2023-05-09 01:18:05',146,2,_binary '\0'),(303,'21',0,'2023-05-09 01:18:56',146,2,_binary '\0'),(304,'22',0,'2023-05-09 01:19:03',146,2,_binary '\0'),(305,'23\n',0,'2023-05-09 01:19:41',87,2,_binary '\0'),(306,'24',0,'2023-05-09 01:19:45',87,2,_binary '\0'),(307,'25',0,'2023-05-09 01:19:48',87,2,_binary '\0'),(308,'26',0,'2023-05-09 01:19:52',87,2,_binary '\0'),(309,'27',0,'2023-05-09 01:20:04',29,2,_binary '\0'),(310,'100',0,'2023-05-09 01:21:57',29,1,_binary '\0'),(311,'0000',0,'2023-05-09 01:22:04',87,1,_binary '\0'),(312,'200000',0,'2023-05-09 01:22:42',29,1,_binary '\0'),(313,'snsn',0,'2023-05-09 01:25:54',29,1,_binary '\0'),(314,'okok',0,'2023-05-09 01:29:27',29,62,_binary '\0'),(315,'sss',4,'2023-05-09 01:30:55',29,62,_binary '\0'),(316,'19',0,'2023-05-09 01:39:34',87,1,_binary '\0'),(317,'20',5,'2023-05-09 01:40:03',29,62,_binary '\0'),(318,'21',4,'2023-05-09 01:40:35',87,1,_binary '\0'),(319,'22',0,'2023-05-09 01:40:45',29,62,_binary '\0'),(320,'23',0,'2023-05-09 01:42:02',87,1,_binary '\0'),(321,'mm',0,'2023-05-09 01:44:00',29,3,_binary '\0'),(322,'z',0,'2023-05-09 01:44:43',29,3,_binary '\0'),(323,'s',0,'2023-05-09 01:45:25',29,3,_binary '\0'),(324,'a',0,'2023-05-09 01:46:08',29,3,_binary '\0'),(325,'a',0,'2023-05-09 01:46:49',29,3,_binary '\0'),(326,'a',0,'2023-05-09 01:48:47',29,3,_binary '\0'),(327,'s',0,'2023-05-09 01:49:26',29,3,_binary '\0'),(328,'ư',0,'2023-05-09 01:50:15',29,3,_binary '\0'),(329,'okok',5,'2023-05-09 01:53:59',146,3,_binary '\0'),(330,'z',3,'2023-05-09 01:54:12',29,3,_binary '\0');
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

--
-- Dumping events for database 'commerce'
--

--
-- Dumping routines for database 'commerce'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-30  1:37:09