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
) ENGINE=InnoDB AUTO_INCREMENT=693 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (620,614,125,74,6,220,'WAIT','Nguyễn Minh An','0965240637','thường tín','2023-07-07 01:42:53',NULL,NULL,NULL,0,440,220),(623,614,126,NULL,1,20,'WAIT','Nguyễn Minh An','0965240637','thường tín','2023-07-08 23:24:03',NULL,NULL,NULL,0,20,NULL),(627,614,127,74,2,170,'WAIT','Nguyễn Minh An','0965240637','thường tín','2023-07-08 23:24:30',NULL,NULL,NULL,0,340,170),(632,614,128,NULL,2,240,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:22:58',NULL,NULL,NULL,0,240,NULL),(638,614,129,74,4,650,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:23:51',NULL,NULL,NULL,0,1300,650),(642,614,130,NULL,3,300,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:38:06',NULL,NULL,NULL,0,300,NULL),(647,614,131,74,8,620,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:38:50',NULL,NULL,NULL,0,1240,620),(650,614,132,74,3,450,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:43:44',NULL,NULL,NULL,0,900,450),(655,614,133,74,7,120,'WAIT','Nguyễn Minh An','0965240637','xóm 2, đội 3, xã Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:47:52',NULL,NULL,NULL,0,240,120),(657,614,134,NULL,0,0,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:09:54',NULL,NULL,NULL,0,0,NULL),(660,614,135,NULL,1,20,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:11:23',NULL,NULL,NULL,0,20,NULL),(662,614,136,NULL,0,0,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:13:20',NULL,NULL,NULL,0,0,NULL),(666,614,137,74,3,30,'DELIVERY','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:53:02','2023-07-09 11:23:15','2023-07-09 11:23:18',NULL,0,60,30),(670,29,138,NULL,1,20,'RECEIVED','Nguyễn Dũng','0347705659','30','2023-07-09 14:28:14','2023-07-09 17:05:14','2023-07-09 17:05:17','2023-07-09 17:05:19',0,20,NULL),(674,146,139,NULL,4,480,'CONFIRM','Trần Duy Anh Tú','0988888888','abc','2023-07-09 15:26:40','2023-07-09 17:05:11',NULL,NULL,0,480,NULL),(678,146,140,74,2,30,'WAIT','Trần Duy Anh Tú','0988888888','abc','2023-07-09 17:15:05',NULL,NULL,NULL,0,60,30),(682,614,141,74,2,70,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 17:19:56',NULL,NULL,NULL,0,140,70),(689,614,142,74,8,200,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 17:26:35',NULL,NULL,NULL,0,400,200),(692,604,143,74,1,10,'RECEIVED','Nguyễn An','0965240637','tự nhiên','2023-07-09 21:49:29','2023-07-09 21:51:37','2023-07-09 21:51:44','2023-07-09 21:51:46',0,20,10);
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
INSERT INTO `blog` VALUES (4,3,'5 Winter-to-Spring Fashion Trends to Try Now','5 Winter-to-Spring Fashion Trends to Try Now','07:44:18',9,'July','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099012/blog-06_mpwlvn.jpg',_binary '\0'),(51,3,'Recyclable Sneaker Brand Thousand Fell Comes to Canada','Thousand Fell, a NYC-based brand, says it has created the world’s “first recyclable sneaker.” Made of materials like upcycled clothing, plastic water bottles and even food waste, the brand has filled a gap in the notoriously wasteful footwear industry. The minimalistic vegan shoes have generated a lot of buzz and racked up hefty waitlists — and as of September 22, they’re available in Canada, too.','09:45:16',29,'September','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099073/19_mz17fa.jpg',_binary '\0'),(88,4,'test','Cái này để test','23:20:0',10,'MARCH','http://res.cloudinary.com/dpvehgfmo/image/upload/v1688893327/np8jsdhavtr8ill21z9a.jpg',_binary '\0'),(217,1,'1','14102001','16:8:30',23,'APRIL','http://res.cloudinary.com/dpvehgfmo/image/upload/v1682240912/wa2swi5xfw7oh22blxkk.jpg',_binary '\0');
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
INSERT INTO `blog_tag` VALUES (4,1,2,_binary '\0'),(51,4,12,_binary '\0'),(51,5,13,_binary '\0'),(51,6,14,_binary '\0'),(88,1,18,_binary '\0'),(88,2,19,_binary '\0'),(88,5,20,_binary '\0'),(88,44,21,_binary '\0'),(88,45,22,_binary '\0'),(217,4,36,_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (103,29,_binary '\0'),(105,146,_binary '\0'),(106,146,_binary '\0'),(107,29,_binary '\0'),(108,146,_binary '\0'),(109,29,_binary '\0'),(110,146,_binary '\0'),(111,21,_binary '\0'),(112,21,_binary '\0'),(113,146,_binary '\0'),(114,21,_binary '\0'),(115,204,_binary '\0'),(116,204,_binary '\0'),(117,29,_binary '\0'),(118,29,_binary '\0'),(119,29,_binary '\0'),(120,29,_binary '\0'),(121,29,_binary '\0'),(122,29,_binary '\0'),(123,29,_binary '\0'),(124,146,_binary '\0'),(125,614,_binary '\0'),(126,614,_binary '\0'),(127,614,_binary '\0'),(128,614,_binary '\0'),(129,614,_binary '\0'),(130,614,_binary '\0'),(131,614,_binary '\0'),(132,614,_binary '\0'),(133,614,_binary '\0'),(134,614,_binary '\0'),(135,614,_binary '\0'),(136,614,_binary '\0'),(137,614,_binary '\0'),(138,29,_binary '\0'),(139,146,_binary '\0'),(140,146,_binary '\0'),(141,614,_binary '\0'),(142,614,_binary '\0'),(143,604,_binary '\0');
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
INSERT INTO `cart_item` VALUES (530,103,1,1,0),(537,105,62,1,0),(540,106,2,1,0),(543,107,20,1,0),(546,108,56,1,0),(549,109,19,1,0),(550,109,5,1,0),(553,110,1,2,0),(556,111,2,4,0),(559,112,1,1,0),(560,112,19,1,0),(561,112,7,1,0),(562,112,9,1,0),(565,113,3,1,0),(568,114,92,1,0),(571,115,20,3,0),(574,116,2,1,0),(578,117,2,2,0),(579,118,2,2,0),(584,119,3,3,0),(587,120,2,2,0),(590,121,2,1,0),(593,122,1,1,0),(594,122,19,1,0),(597,123,2,2,0),(601,124,68,1,0),(615,125,1,1,0),(616,125,2,1,0),(617,125,3,2,0),(618,125,19,1,0),(619,125,43,1,0),(622,126,1,1,0),(625,127,2,1,0),(626,127,20,1,0),(630,128,3,1,0),(631,128,6,1,0),(634,129,19,1,0),(635,129,7,1,0),(636,129,56,1,0),(637,129,92,1,0),(640,130,7,1,0),(641,130,10,2,0),(644,131,3,2,0),(645,131,20,2,0),(646,131,9,4,0),(649,132,20,3,0),(652,133,3,1,0),(653,133,68,5,0),(654,133,62,1,0),(659,135,1,1,0),(664,137,1,1,0),(665,137,52,2,0),(669,138,1,1,0),(673,139,6,4,0),(676,140,1,1,0),(677,140,2,1,0),(680,141,2,1,0),(681,141,7,1,0),(684,142,1,1,0),(685,142,52,2,0),(686,142,68,2,0),(687,142,7,2,0),(688,142,9,1,0),(691,143,1,1,0);
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
INSERT INTO `categories` VALUES (1,'Polo',_binary '\0'),(2,'T-Shirt',_binary '\0'),(3,'Bag',_binary '\0'),(4,'Shoes',_binary '\0'),(5,'Watches',_binary '\0');
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
INSERT INTO `categories_blog` VALUES (1,'Fashion',_binary '\0'),(2,'Beauty',_binary '\0'),(3,'Street Style',_binary '\0'),(4,'Life Style',_binary '\0'),(5,'DIY & Crafts',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=601 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_blog`
--

LOCK TABLES `comment_blog` WRITE;
/*!40000 ALTER TABLE `comment_blog` DISABLE KEYS */;
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
INSERT INTO `coupon` VALUES (74,'an',50,'2024-02-09 00:00:00',_binary '\0',_binary '\0'),(221,'30/05',50,'2023-05-30 00:00:00',_binary '',_binary '\0'),(222,'test',20,'2023-05-01 00:00:00',_binary '',_binary '\0');
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
INSERT INTO `hibernate_sequence` VALUES (694);
/*!40000 ALTER TABLE `hibernate_sequence` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `from_user` bigint DEFAULT NULL,
  `is_seen` bit(1) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (679,'2023-07-09 17:15:05',146,_binary '','Trần Duy Anh Tú placed an order'),(683,'2023-07-09 17:19:56',614,_binary '','Nguyễn Minh An placed an order'),(690,'2023-07-09 17:26:35',614,_binary '\0','Nguyễn Minh An placed an order'),(693,'2023-07-09 21:49:29',604,_binary '\0','Nguyễn An placed an order');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
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
INSERT INTO `persistent_logins` VALUES ('surivato98@gmail.com','soGFK/mwTpWVreujzcl3YA==','4NSPsM1xz7bvzo1h4h44zA==','2023-07-09 15:38:50');
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
INSERT INTO `product` VALUES (1,'Áo T-Shirt Oversize',20,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391054/v5crvb36wfhikzfauqub.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391058/ebyhgftb9oojerxvmukl.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672802747/p6t2seun6qqf9qehbamw.jpg','60% cotton','Blue','XL',97,_binary '\0'),(2,'Áo T-Shirt Blood Diamond',40,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040588/blooddiamond2_gohdrw.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040588/blooddiamond1_jboxqc.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040590/blooddiamond3_ghmvfx.jpg','70% cotton','Black','L',43,_binary '\0'),(3,'Áo T-Shirt Basic Over',120,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover1_u2lxrz.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover2_kszafe.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover3_lhu0uq.jpg','60% cotton','Blue','L',90,_binary '\0'),(4,'Áo T-Shirt Racing',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing1_rtsesg.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing2_otfzcr.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing3_fcrjam.jpg','60% cotton','Black','L',100,_binary '\0'),(5,'Áo T-Shirt Teddie',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040865/teddie1_jeug8i.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040865/teddie2_imoy7e.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040864/teddie3_ezr6y1.jpg','60% cotton','Black','L',99,_binary '\0'),(6,'Áo T-Shirt King of School ',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/KingofSchool1_g4gsfx.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/kingofschool2_cm2dww.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/kingofschool3_adixlb.jpg','60% cotton','Black','L',95,_binary '\0'),(7,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull1_hyi9oz.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull2_bx7ng5.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull3_gj3gzn.jpg','60% cotton','Black','L',94,_binary '\0'),(8,'Áo T-Shirt Agent',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent1_w0ocpb.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent2_lqhvde.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent3_y6fdks.jpg','60% cotton','Black','L',100,_binary '\0'),(9,'Áo T-Shirt Waster',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123728/8.1_ad4yh8.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123728/8.2_kioxd8.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123729/8.3_udvb73.jpg','60% cotton','Gray','L',94,_binary '\0'),(10,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-1_nej46r.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-2_xscql5.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-3_tyttzn.jpg','60% cotton','White','L',98,_binary '\0'),(18,'Áo COAST Brown',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124017/clowz-5-1-2_dxwbdy.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124018/clowz-5-9_gciixt.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124017/clowz-5-3_fqc9ev.jpg','60% cotton','Black','L',100,_binary '\0'),(19,'Converse Basic',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',4,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product-09_hw4wvu.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product092_ckvhle.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product-093_jjkjrf.jpg','60% cotton','Black','L',95,_binary '\0'),(20,'Đồng hồ Basic',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-06_drsuty.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-062_mzxtmt.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-063_cggdai.jpg','60% cotton','Black','L',90,_binary '\0'),(21,'Đồng hồ BlackPanther',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-15_e6cxqq.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-152_cbwxnn.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-153_yfermx.jpg','60% cotton','Black','L',100,_binary '\0'),(42,'Túi Utility',35,'Size: 23x16x8 cm\r , Mô tả: Túi 3 ngăn in logo\r,  Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag1_h8qrrp.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag2_biiwqu.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag3_iltabx.jpg','60% cotton','Yellow','L',100,_binary '\0'),(43,'Túi Ulitity SATCHEL',40,'Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo. Dây đeo có thể điều chỉnh hoặc tháo rời, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz-1-1_rjl8hy.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz1-2_iqirfp.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz-3-1_ck5xq7.jpg','60% cotton','Black','L',99,_binary '\0'),(45,'Túi Crytal Clear',35,'Dây đeo: Chữ \"CLOWNZ\" thiết kế theo phong cách graphic in chìm, dây đeo dài có thể điều chỉnh và tháo rời.Chất liệu: Nhựa PU, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/clear-bag-black_jniksa.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/1a7ff27f-75e2-4917-98bb-6d62bd9c3518_zml2bn.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/35e41285-3b94-4dca-96de-fff0b8b19273_kqk4em.jpg','60% cotton','Black','L',100,_binary '\0'),(52,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391054/v5crvb36wfhikzfauqub.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391058/ebyhgftb9oojerxvmukl.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672802747/p6t2seun6qqf9qehbamw.jpg','60% cotton','Blue','L',17,_binary '\0'),(56,'Đồng hồ Rolex Luxury',1000,'Đồng hồ Rolex Luxury',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/mua-%C4%90%E1%BB%93ng-h%E1%BB%93-Rolex-Deepsea-%C4%91en_varxqj.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/Daytona-2-1580886196_qzqo0c.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/dong-ho-rolex-nam-nu-chinh-hang-gia-bao-nhieu-danh-gia-chi-tiet_censot.jpg','60% cotton','Black','L',98,_binary '\0'),(62,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','M',0,_binary '\0'),(68,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','XL',72,_binary '\0'),(69,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','S',0,_binary '\0'),(92,' Áo Polo nam Excool',100,'',1,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243219/ux7btgdexzbvd5wglrti.webp','http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243222/mzsza6ewf9lnnllzv01o.webp','http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243224/lw5rzlwvxkwgpuzpzphs.webp','Cotton','White','L',498,_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=673 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (668,'áo đẹp lắm',5,'2023-07-09 14:21:12',614,1,_binary '\0'),(672,'mặc thích lắm',4,'2023-07-09 14:29:41',29,1,_binary '\0');
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
  `role` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `enabled` tinyint DEFAULT NULL,
  `auth_provider` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `postal_code` int DEFAULT NULL,
  `avatar` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  `verification_code` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `verification_code_expiry` datetime DEFAULT NULL,
  `avatar_default` varchar(255) COLLATE utf8mb3_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=630 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (29,'surivato98@gmail.com','$2a$10$Atg/FvU/AOeNbCmaxzH9NewnqfABw6M9zmAZ3FLcl/spS96.L/4xO','Nguyễn Dũng','0347705659','xóm 2, đội 3, xã Tự Nhiên, Thường Tín, Hà Nội','Tự Nhiện','Hà Nội',NULL,'ADMIN',1,'LOCAL',84,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0',NULL,NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png'),(91,'buivanhung124@gmail.com','$2a$10$4FkdxuynWWU.vPWQAByiDOkXQvxuaW25bjzaUfLlaV6YZW5KuR2ji','Bui Van Hung',NULL,NULL,NULL,NULL,NULL,'ADMIN',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0','','2023-03-11 23:43:26',NULL),(146,'duyanhtutran@gmail.com','$2a$10$Q4E1eL5Iqid/3tk8oV5dhu3SIMqLn/xQMqXTOVv43uPEfpAGFnEau','Trần Duy Anh Tú','0988888888','abc','','',NULL,'USER',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0',NULL,NULL,NULL),(604,'minhan14102001@gmail.com',NULL,'Nguyễn An',NULL,NULL,NULL,NULL,NULL,'USER',1,'FACEBOOK',NULL,'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=12b3be&_nc_ohc=LvilGwJWx2gAX_a49fC&_nc_ht=scontent.fhan14-2.fna&edm=AP4hL3IEAAAA&oh=00_AfD5jdiK3hN5pv3HjA4QGHxoeJs1K9TmWeS-Afovclzs7Q&oe=64C905D9',_binary '\0',NULL,NULL,NULL),(605,'anmusic1410@gmail.com',NULL,'Minh An Nguyễn',NULL,NULL,NULL,NULL,NULL,'USER',1,'GOOGLE',NULL,'https://lh3.googleusercontent.com/a/AAcHTtfzbhV6tnZOH1UOeZiWZDKGZFokQB6ha80iOphY-bTc=s96-c',_binary '\0',NULL,NULL,NULL),(614,'tienantn85@gmail.com','$2a$10$SHiRihjqAX2AzPv3UJibSePqSPeoK./5.NQLMSbSPpIuQsyKoaXHC','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','','',NULL,'ADMIN',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0',NULL,NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png');
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

-- Dump completed on 2023-07-09 23:35:56
