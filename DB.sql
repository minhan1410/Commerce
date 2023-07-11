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
) ENGINE=InnoDB AUTO_INCREMENT=698 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bill`
--

LOCK TABLES `bill` WRITE;
/*!40000 ALTER TABLE `bill` DISABLE KEYS */;
INSERT INTO `bill` VALUES (620,614,125,74,6,220,'WAIT','Nguyễn Minh An','0965240637','thường tín','2023-07-07 01:42:53',NULL,NULL,NULL,0,440,220),(623,614,126,NULL,1,20,'WAIT','Nguyễn Minh An','0965240637','thường tín','2023-07-08 23:24:03',NULL,NULL,NULL,0,20,NULL),(627,614,127,74,2,170,'WAIT','Nguyễn Minh An','0965240637','thường tín','2023-07-08 23:24:30',NULL,NULL,NULL,0,340,170),(632,614,128,NULL,2,240,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:22:58',NULL,NULL,NULL,0,240,NULL),(638,614,129,74,4,650,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:23:51',NULL,NULL,NULL,0,1300,650),(642,614,130,NULL,3,300,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:38:06',NULL,NULL,NULL,0,300,NULL),(647,614,131,74,8,620,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:38:50',NULL,NULL,NULL,0,1240,620),(650,614,132,74,3,450,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:43:44',NULL,NULL,NULL,0,900,450),(655,614,133,74,7,120,'WAIT','Nguyễn Minh An','0965240637','xóm 2, đội 3, xã Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 01:47:52',NULL,NULL,NULL,0,240,120),(657,614,134,NULL,0,0,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:09:54',NULL,NULL,NULL,0,0,NULL),(660,614,135,NULL,1,20,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:11:23',NULL,NULL,NULL,0,20,NULL),(662,614,136,NULL,0,0,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:13:20',NULL,NULL,NULL,0,0,NULL),(666,614,137,74,3,30,'DELIVERY','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 10:53:02','2023-07-09 11:23:15','2023-07-09 11:23:18',NULL,0,60,30),(670,29,138,NULL,1,20,'RECEIVED','Nguyễn Dũng','0347705659','30','2023-07-09 14:28:14','2023-07-09 17:05:14','2023-07-09 17:05:17','2023-07-09 17:05:19',0,20,NULL),(674,146,139,NULL,4,480,'CONFIRM','Trần Duy Anh Tú','0988888888','abc','2023-07-09 15:26:40','2023-07-09 17:05:11',NULL,NULL,0,480,NULL),(678,146,140,74,2,30,'WAIT','Trần Duy Anh Tú','0988888888','abc','2023-07-09 17:15:05',NULL,NULL,NULL,0,60,30),(682,614,141,74,2,70,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 17:19:56',NULL,NULL,NULL,0,140,70),(689,614,142,74,8,200,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-09 17:26:35',NULL,NULL,NULL,0,400,200),(692,604,143,74,1,10,'RECEIVED','Nguyễn An','0965240637','tự nhiên','2023-07-09 21:49:29','2023-07-09 21:51:37','2023-07-09 21:51:44','2023-07-09 21:51:46',0,20,10),(697,614,144,NULL,3,60,'WAIT','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','2023-07-10 17:20:58',NULL,NULL,NULL,0,60,NULL);
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
  `title` varchar(1000) COLLATE utf8mb3_bin DEFAULT NULL,
  `content` varchar(10000) COLLATE utf8mb3_bin DEFAULT NULL,
  `created_time` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `created_day` int DEFAULT NULL,
  `created_month` varchar(45) CHARACTER SET utf8mb3 COLLATE utf8mb3_bin DEFAULT NULL,
  `image` varchar(2000) COLLATE utf8mb3_bin DEFAULT NULL,
  `deleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`id`),
  KEY `fk_blog_category_idx` (`category_blog_id`),
  CONSTRAINT `fk_blog_cate` FOREIGN KEY (`category_blog_id`) REFERENCES `categories_blog` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=700 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog`
--

LOCK TABLES `blog` WRITE;
/*!40000 ALTER TABLE `blog` DISABLE KEYS */;
INSERT INTO `blog` VALUES (4,3,'How to Make and Sell Merch Your Fans Will Love (2023)','Why do people buy merch?\r\nWhen done right, merch helps fans feel connected to what your brand embodies and to others in your community.\r\n\r\nIt can create opportunities to:\r\n\r\nIdentify and build more meaningful relationships with your true fans \r\nDelight (and grow) your audience with free giveaways\r\nPartner with other creators and brands for product drops\r\nEncourage fans to post content featuring your merch\r\nGenerate free word-of-mouth advertising \r\nFor example, fans of Yes Theory have shared stories about wearing merch from the creators’ sub-brand, Seek Discomfort, under their suit on their first day at a new job. Others have even worn it for the birth of their first child, because of the optimism and personal growth the brand represents.\r\n\r\n“One of our fans wrote to us about how their flight got canceled and the next flight was hours away,” Zack says. “They saw someone at the gate wearing a Seek Discomfort hoodie. While stranded at the airport, the two strangers ended up becoming good friends, strictly over the fact that they were mutual fans of the channel.”While diehard fans might get their wallets out for a t-shirt featuring your logo, Zack says the most meaningful merch has the potential to transcend your fanbase and reach new audiences.\r\nComing up with a merch strategy\r\nMerch is as versatile as you want it to be. It can be a source of sustained revenue through your own store, the catalyst for a collaboration with another brand, or simply free swag you offer to loyal customers.\r\n\r\nOne of the biggest decisions you’ll make with your merch strategy is whether to sell under your existing brand or launch it under a sub-brand (like Yes Theory’s Seek Discomfort).\r\n\r\nSelling merch under a sub-brand\r\nA sub-brand typically features the parent brand’s attributes (color palette, messaging, and imagery), but usually has its own logo, products, and services.\r\n\r\n“The advantage of this approach is that it can grow an audience beyond your existing customer base,” says Zack. A sub-brand may also facilitate collaboration or co-branding.\r\n\r\nFor example, Seek Discomfort pursued collaborations with brands including Bose, Lululemon, and Timbuk2 backpacks—opportunities Zack thinks they may have missed had the brand been portrayed as “Yes Theory merch.”\r\n\r\nSelling merch under your existing brand\r\nIn the case of Atticus the poet, another client of Zack’s, it made sense to leverage the name he made as a writer with an ecommerce website where fans can find his books, t-shirts, hats, jewelry, and own brand of wine.','07:44:18',9,'July','https://res.cloudinary.com/dpvehgfmo/image/upload/v1676099012/blog-06_mpwlvn.jpg',_binary '\0'),(51,3,'What Is Market Segmentation? Definition, Example, and Types (2023)','What is market segmentation?\r\nMarket segmentation is the process of dividing a target market into groups or subgroups. These smaller segments of consumers will share similar needs, interests, and characteristics.By targeting a smaller group of a large market, you can tap into customers who are more likely to pay for products that appeal directly to them.\r\n\r\nMarket segmentation vs. customer segmentation\r\nBoth types of segmentation divide people based on their shared traits—be that their age, interest, or purchasing habits. The key difference between the two is that market segmentation divides the entire market, whereas customer segmentation only divides a brand’s existing customer base.\r\n\r\nTypes of market segmentation\r\nDemographic segmentation\r\nGeographic segmentation\r\nBehavioral segmentation\r\nPsychographic segmentation\r\nFirmographic segmentation\r\nDemographic segmentation\r\nDemographic segmentation is the process of dividing a market based on shared demographic data, such as:\r\n\r\nAge\r\nGender\r\nIncome\r\nEducation\r\nOccupation\r\nMarital status\r\nDemographic segmentation is effective because people who share each trait have things in common. If you’re a sneaker retailer, for example, targeting the market segment of people who work as medical professionals can help you better speak to the level of comfort your sneakers provide. \r\n\r\nGeographic segmentation\r\nGeographic segmentation involves dividing consumers based on their physical location, such as their:\r\n\r\nCountry\r\nRegion\r\nCity\r\nZIP code\r\nEcommerce brands can use geographic segmentation to promote local events or physical retail stores. It’s also a smart way to promote products when linked with the weather. An ecommerce-only brand that sells coats, for example, could promote raincoats to customers in a city that has high levels of rainfall.\r\n\r\nBehavioral segmentation\r\nBehavioral segmentation categorizes consumers based on their behaviors, such as their:\r\n\r\nBrowsing history\r\nPurchasing habits\r\nProduct usage\r\nEmail engagement \r\nLoyalty\r\n“We’ve opted for behavioral segmentation as it allows us to comprehend and address customers’ desires based on their online activities, such as browsing habits, purchasing history, and product preferences,” says Kevin Wang, co-owner of Inyouths. “By adopting behavioral segmentation, Inyouths has witnessed impressive growth in conversion rates, customer satisfaction, and long-term customer allegiance.” \r\n\r\nPsychographic segmentation\r\nPsychographic segmentation brings consumers together based on personality traits, such as their:\r\n\r\nSocial status\r\nValues\r\nAttitudes\r\nInterests\r\nBeliefs and opinions\r\nSegmenting your audience based on their personality traits can help you craft campaigns that speak to your target customer. If you’re a clothing retailer, for example, segment the market based on people who care about sustainability. Promote your ethically sourced materials, resale program, and carbon-neutral shipping options to maximize revenue.','09:45:16',29,'September','http://res.cloudinary.com/dpvehgfmo/image/upload/v1689069210/fuuuqgywebhlsezxgjgu.webp',_binary '\0'),(88,4,'Element Brooklyn Ships Orders Faster and for Less With Smart Order Routing','Element Brooklyn is an eco-friendly luxury products company created by founder and CEO Andrew Nicol out of a desire to help the environment. \r\n\r\nAndrew, who comes from a family of scientists and has a background in corporate law, found that environmentally conscious options were limited at the high end of the soaps and candles market. Many brands package goods with excessive plastic and don’t offer refills, which means the customer pays for the same expensive, wasteful packaging each time they make a repeat purchase. So Andrew set out to provide an alternative.\r\n\r\nClick here to start selling online now with Shopify\r\nWhat’s more, he noticed that although many brands use terms like “vegan,” “eco-friendly,” or “clean,” they are defined differently by different companies, withs no real standardization for what these claims mean.\r\n\r\nTo solve this problem, Element Brooklyn provides alternatives for its customers’ favorite luxury items that better serve the environment, providing refillable, cruelty-free products that use less plastic and packaging materials.\r\n\r\n Element Brooklyn\'s refillable soaps next to packed orders\r\nElement Brooklyn\'s refillable soap pouches reduce plastic usage by over 85%, providing customers with a more environmentally friendly alternative.\r\nOne of the bigger challenges Andrew faced in starting Element Brooklyn was figuring out how to ship a heavy liquid product in a way that would meet his goals of fast delivery, affordable shipping, and sustainability.\r\n\r\nThanks to Shopify and the launch of its smart order routing feature, Element Brooklyn found a better way to address these challenges, allowing the company to:\r\n\r\nBring fulfillment closer to the end customer, reducing the carbon footprint on the environment with fewer delivery miles\r\nReduce delivery time by an average of 1.2 days and use next-day shipping for 94% of orders\r\nSave $1.14 on average per order in shipping costs\r\nImprove the customer experience and reduce average shipping costs by eliminating split fulfillments\r\nSave employee time that was previously spent on manual fulfillment and order routing workflows\r\nChallenge\r\nWith inventory that consists mostly of heavy, fragile products filled with liquid, keeping shipping costs down while delivering items intact was a challenge. Element Brooklyn needed a cost-effective and sustainable method to get products to its customers.\r\n\r\nTo address this, the company opened its own fulfillment centers across the United States, with locations in New York, Florida, and Arizona. By fulfilling and shipping orders in house, Element Brooklyn is able to package orders more carefully, reducing the likelihood of damage during transit, while also bringing fulfillment closer to the customer in order to minimize impact on the environment. \r\n\r\nElement Brooklyn\'s logo on the wall next to boxes, shelves and a computer at their Arizona warehouse.\r\nAn inside view of Element Brooklyn\'s fulfillment area in their Arizona warehouse.\r\n“Shipping is by far our number one expense—it’s more than the cost of the product and more than the cost of labor,” says Andrew. “Whether the business was going to be successful really kind of depended on whether we were going to be able to get these items to our customer affordably and without any damage happening.”\r\n\r\nShipping is by far our number one expense—it’s more than the cost of the product and more than the cost of labor.\r\n\r\nAndrew Nicol, Founder and CEO, Element Brooklyn\r\nUsing Shopify’s previous delivery settings, the company could specify that West Coast orders be fulfilled from the Arizona warehouse, and East Coast orders from the Brooklyn warehouse. However, if the Arizona warehouse was out of stock for a specific order item, the customer would be prevented from checking out, which was a problem. In many cases, the Element Brooklyn team would override this issue with some manual workarounds, but it was a tedious, imperfect process. \r\n\r\nSolution\r\nTo streamline shipping and fulfillment processes, as well as lower costs, Element Brooklyn turned to Shopify’s smart order routing. This feature automatically routes orders to the best fulfillment location based on a series of rules set and ranked by the merchant. Merchants can prioritize these rules based on different criteria, like staying within the destination market of the customer, shipping from the closest location to the customer, minimizing split fulfillments, or prioritizing certain locations. As an order comes through, Shopify automatically checks which fulfillment locations have that inventory available, applying the order routing logic set to determine which location that order gets sent to.\r\n\r\n\r\nIn Element Brooklyn’s case, order routing parameters are set up for US-based orders, whereas Canada-based orders use shipping profiles to ship exclusively from the Brooklyn warehouse.\r\n\r\nFor US orders, Element Brooklyn set its order routing logic to:\r\n\r\n1.   Stay within the destination market\r\n2.   Minimize split fulfillments\r\n3.   Ship from the closest location\r\nWith this order routing logic in place, Element Brooklyn no longer needs to worry about items being out of stock when a customer checks out. Orders are now automatically assigned to the best possible location where those inventory items are available, as well as the location closest to the customer’s delivery address. \r\n\r\n“Before using smart order routing in Shopify, getting to the point where we could deliver orders quickly within one day required a lot of messing around with the system’s configuration and manually changing the way orders were being handled,” says Andrew. “Now we can deliver over 94% of our orders in one business day.”','23:20:0',10,'MARCH','http://res.cloudinary.com/dpvehgfmo/image/upload/v1689068906/tbu8dli7njm7o94mydqd.webp',_binary '\0'),(217,1,'What Is a Mastermind Group? Guide For Entrepreneurs (2023)','What is a mastermind group? \r\nA mastermind group is made up of peers who meet on a regular basis (in person or virtually) to offer advice and support. They push each other to work to their highest potential and hold each other accountable. Mastermind groups can revolve around your personal or professional life. \r\n\r\nClick here to start selling online now with Shopify\r\nThere is a regular meetup or a retreat, as well as ongoing support through Slack channels, email, and private forums. \r\n\r\nThese focused, supportive communities have stood the test of time, with the likes of Bill Gates, MrBeast, and Pat Flynn attributing their success to mastermind groups. Even J.R.R. Tolkien and C.S. Lewis were part of the most famous mastermind group of all time, the Inklings. \r\n\r\n\r\nHow to find a mastermind group \r\nMasterminds hinge on the people involved. This is why it’s critical to research your options and choose a mastermind group that is relevant to your needs and made up of inspiring, motivated people. \r\n\r\nStart with the people you know\r\nLook around you—what you’re looking for might be right under your nose. Ask colleagues, friends, and those in your professional network if they know or are part of a mastermind group. Use social media to seek out people who are on a similar path as you and reach out to your most successful connections. \r\n\r\nYou might find you have the right people in your immediate circle—in which case, why not start your own mastermind? \r\n\r\nFind online or offline resources\r\nGoogle is your friend. Run a simple search for relevant mastermind groups. There are lots of mastermind groups online, so you don’t have to find a local one. You can also try networking sites like Meetup, dedicated industry forums, or Facebook groups designed for entrepreneurs and ecommerce owners.\r\n\r\nMastermind events listings in Verizon, New York. \r\nUse Meetup to find masterminds in your local area.\r\nDon’t settle for a group that isn’t right\r\nIn an ideal world, the mastermind group you join should be full of motivated entrepreneurs you admire. It’s easy to settle for a group of peers, but try to aim higher. Look for mastermind groups made up of people who are further along in growing their business. Their experience will be valuable when you’re seeking advice or making decisions about your business.\r\n\r\nMastermind group online for remote collaboration\r\nMeeting in person helps provide a human connection, but you can also find mastermind groups online. Virtual tools make it possible to connect, chat, and work with entrepreneurs from all over the world—perfect if you live in a small town or have exhausted your local resources. \r\n\r\nOnline groups are more flexible, which means they are likely to be more successful and engaging. It allows for members to meet when they are traveling and can be recorded, so you can rewatch a meeting or catch up later. \r\n\r\nThere’s also the added benefit of learning from business owners in different markets, and unique challenges, giving you a wider breadth of experience and advice to draw from. \r\n\r\nWhy join a mastermind group? \r\nAccountability \r\nMastermind groups will hold you accountable for doing the things you say you will and moving your business forward. It’s helpful to have people on your side who are rooting for you to succeed and who can offer advice and tips. \r\n\r\nIt’s harder to let someone down than it is to let yourself down, which means you’re more likely to do the tasks you promised. \r\n\r\nFeedback \r\nA mastermind group provides feedback from people who are trying to build a business just like you. They have insight and a mindset that is hard to find. Like-minded entrepreneurs will tell you what’s wrong or right about your ideas with no bias. They aren’t your customers and they aren’t your competitors, which means you can trust their mentorship and guidance.\r\n\r\nCollaboration\r\nNot only does your mastermind group allow you to collaborate on ideas, but you can also ask group members to help you with projects or tasks. This isn’t the main function of a peer-mentoring group, but you might find opportunities to work with other members of your mastermind group.\r\n\r\nThere’s also an opportunity for you to cross-promote your brand with other brands. Most members use social media and might even have a blog you can cross-promote on. \r\n\r\nNetworking\r\nMastermind groups are also a great way to network in your industry. When you connect with people, you gain access to their network. They may know people who could help you with a project or growth strategy. The more you expand your network, the more doors open up for you.\r\n\r\nHaving connections in various industries can come in handy when you least expect it.\r\n\r\nResources\r\nThe members of your mastermind group will have different specialties and areas of expertise. You may have knowledge in marketing but need help with design. You and a group member may be able to help each other out.\r\n\r\nThe blending of different backgrounds, skills, and knowledge creates an environment for you to learn, play to your strengths, and address your weaknesses. \r\n\r\nSupport\r\nYour mastermind is a support group to encourage you and keep you going when you encounter hard times in your business. It can also be a place to get your questions answered and find solutions. If you have a problem, chances are a member has dealt with the same thing already. You can learn from their experiences and discuss next steps with your group.\r\n\r\nHow to run a mastermind group in 7 steps \r\nIf you can’t find a group that works for you, start your own. Here are the main steps to gett you going.\r\n\r\n1. Decide what your mastermind group is about\r\nPick a topic that your mastermind revolves around. It could be broad, like ecommerce, or narrow, like creating subscriptions. \r\n\r\n2. Pick your partners\r\nYou want your mastermind group members to be committed. Choose people who have the drive and a diverse set of skills, and who are problem solvers. Seek people who are committed to learning and sharing with the community they are part of.\r\n\r\n3. Establish some ground rules\r\nDecide how you’ll run each session and what boundaries will be in place. For example, while you can seek support for your business problems, you might create a rule that conversations should be solutions-focused.\r\n\r\n4. Meet regularly\r\nMaintain consistency by meeting regularly, whether that’s virtually or in person. Ensure you have enough time to cover everything you need to. An agenda or schedule can make sure everyone is getting the support and time they need.\r\n\r\n5. Include a mastermind group facilitator\r\nIt can help to have someone to facilitate mastermind groups. They can share the meeting agenda, keep people on track, and document the outcomes of each session. This can help keep members accountable for their actions and know what their next steps are.\r\n\r\n6. Take (and share) notes of each meeting\r\nCapture what goes on at each meetup, including challenges, wins, questions, and goals for next time. This will help keep everyone accountable and ensure you have a written document of the session. Remember to share the notes or a recording with other members. \r\n\r\n7. Gather feedback from members of the group\r\nMake sure your mastermind continues to deliver value by regularly checking in with group members to determine what works and what could be improved. Consider the meeting time, the experience, the conversation, and the format as features that can evolve to meet the group’s needs.\r\n\r\nMastermind group examples \r\nCreatives, entrepreneurs, and everyday people benefit from having a supportive group of peers. Let’s explore how successful mastermind groups have brought their members to the next level.\r\n\r\nThe Indie Brand Builder\r\nThe Indie Brand Builder mastermind was designed to help consumer product entrepreneurs grow faster and learn processes to sell their products. It’s made up of small ecommerce owners from all over the world who want to stop feeling overwhelmed and better understand their businesses. There is a weekly training session, interviews with successful entrepreneurs, and ongoing support from the community. \r\n\r\nThe Human Gathering Network\r\nUnlike many masterminds hyper-focused on growing revenue, The Human Gathering Network is all about building long-lasting relationships. Entrepreneurs are invited to support other members’ ambitions and find ways to get along with business owners from all walks of life. The network provides a private safe space that fosters curated connections, behind-the-scenes conversations, and exclusive content from today’s most prominent leaders. \r\n\r\nEntrepreneurs’ Organization \r\nEntrepreneurs’ Organization (EO) is one of the most famous masterminds for business owners. It has more than 13,000 like-minded entrepreneurs from all over the world.There’s just one caveat: Members’ businesses must generate over $1 million in revenue. If you qualify, you can access in-person meetings and conversations, as well as ongoing online support. \r\n\r\nFind or create your mastermind group \r\nMastermind groups are a great way to meet like-minded people and get support as you grow and develop your business. It’s important to choose the right mastermind. Decide what your main goals are and ask around to see if anyone in your network can recommend the right group. You can start a mastermind group yourself. Pick your people, choose a topic, and decide on a meeting cadence that works for everyone. ','16:8:30',23,'APRIL','http://res.cloudinary.com/dpvehgfmo/image/upload/v1689068990/mkwgp4lg09gwio0s5bu8.webp',_binary '\0'),(699,1,'5 Tips for Landing Celebrity Endorsements and Brand Partnerships','1. Establish a clear vision \r\nIt’s important to be confident in the messaging behind your brand before gifting your products to celebrities or creators you hope to work with. “From day one we set out to create [jewelry] of great quality, at all the different price points, even at the entry level, which is something that was unique to us in the early days,” Christian says. \r\n\r\nOnce Christian was clear about his vision for The GLD Shop, he gifted Wiz Khalifa some of his merchandise to wear onstage. Wiz Khalifa was able to connect with the brand because of its clear vision, to work your hardest and change the game. The rapper went on to post about the brand to his large Instagram following and bring a lot of exposure to the business. \r\n\r\n2. Create a story people believe in \r\nAfter The GLD Shop was introduced to Khalifa’s following, it was up to the team to convince this new audience to stick around and become paying customers. This became a possibility thanks to personal and consistent brand storytelling. \r\n\r\nChristian says his jewelry appeals to customers of all ages and professions. “If you’re an athlete, artist, entrepreneur, whatever it is, you wanna be great at it,” Christian says. “At The GLD Shop you can start off with a little piece or pendant, and maybe as you get promoted or you graduate you go up to the next level of jewelry and keep growing with the brand.”\r\n\r\nCelebrity endorsements are great exposure, but Christian suggests sticking to your core practices and not straying from your brand values when you gain a new following. “When you do get someone at that level posting for you [like Wiz Khalifa], I think it’s really important to stay on brand and not change, because their audience will flow to you,” Christian says. “Just keep doing what you’re doing. If you got them in the first place then you probably did something right.”\r\n\r\n3. Pay attention to details \r\nA huge part of turning any endorsement into a long-term partnership or collaboration is to hone in on your craft and ensure all of the small details are ironed out. \r\n\r\n“We find little ways to add details to [each piece] just to show the customer that even as we grow … we care about all parts of the process, and all parts of the product,” Christian says.\r\n\r\nThe GLD Shop president and co-founder Christian Johnston posing next to Cardi B. \r\nCardi B is a longtime supporter of The GLD Shop and has been a customer since before she gained international fame. The GLD Shop\r\nHaving more eyes on your company means you should be taking a meticulous look at all of your products and ensuring the quality remains the same as you expand. \r\n\r\n4. Work methodically, keep track of data, and stay organized \r\nBefore entering into partnerships, larger brands will want to ensure your finances are sound and that you understand the full production process from start to finish. “The key was being hands-on in production from day one,” Christian says. \r\n\r\nChristian knew the creative and production side of the business extremely well, and was organized financially so he could appeal to the larger brands and corporations. “They will always want to know that you can report your finances accurately and timely, they’ll want to see market spend, a forecast of what SKUs you’re going to make over what period of time, and how you plan to get there,” Christian says. Your potential partners will want to see your release schedules, and understand the unique value that you can provide for them too.\r\n\r\nThe GLD Shop teamed up with Subway to create its official Super Bowl LVII Subway ring in 2023. \r\nThe GLD Shop created the official Super Bowl LVII Subway ring in 2023, with more than 500 handset natural diamonds and emeralds. The GLD Shop\r\n \r\n\r\n5. Lean into your strengths \r\nIt’s important to keep the competition in mind when dealing with established companies. “They’re a bigger entity, and can go to a hundred different brands that probably do something somewhat similar to what you do or reach a similar customer as you, so you have to provide them some type of value,” Christian says.\r\n\r\nAnother key element to securing licensing deals is recognizing the value your brand brings to the table that another company may lack. “We’re agile, we’re a smaller business, and we could do things that are culturally relevant that oftentimes bigger entities have a harder time doing because they’re bigger and it’s harder to move quickly,” Christian says.','16:42:0',11,'JULY','http://res.cloudinary.com/dpvehgfmo/image/upload/v1689068522/dpswje6pcpy0ucx2xitv.webp',_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `blog_tag`
--

LOCK TABLES `blog_tag` WRITE;
/*!40000 ALTER TABLE `blog_tag` DISABLE KEYS */;
INSERT INTO `blog_tag` VALUES (4,1,2,_binary ''),(51,4,12,_binary '\0'),(51,5,13,_binary '\0'),(51,6,14,_binary '\0'),(88,1,18,_binary '\0'),(88,2,19,_binary '\0'),(88,5,20,_binary '\0'),(88,44,21,_binary '\0'),(88,45,22,_binary '\0'),(217,4,36,_binary '\0'),(4,2,37,_binary '\0'),(4,4,38,_binary '\0'),(4,1,39,_binary '\0'),(699,1,40,_binary '\0'),(699,2,41,_binary '\0');
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
) ENGINE=InnoDB AUTO_INCREMENT=145 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (103,29,_binary '\0'),(105,146,_binary '\0'),(106,146,_binary '\0'),(107,29,_binary '\0'),(108,146,_binary '\0'),(109,29,_binary '\0'),(110,146,_binary '\0'),(111,21,_binary '\0'),(112,21,_binary '\0'),(113,146,_binary '\0'),(114,21,_binary '\0'),(115,204,_binary '\0'),(116,204,_binary '\0'),(117,29,_binary '\0'),(118,29,_binary '\0'),(119,29,_binary '\0'),(120,29,_binary '\0'),(121,29,_binary '\0'),(122,29,_binary '\0'),(123,29,_binary '\0'),(124,146,_binary '\0'),(125,614,_binary '\0'),(126,614,_binary '\0'),(127,614,_binary '\0'),(128,614,_binary '\0'),(129,614,_binary '\0'),(130,614,_binary '\0'),(131,614,_binary '\0'),(132,614,_binary '\0'),(133,614,_binary '\0'),(134,614,_binary '\0'),(135,614,_binary '\0'),(136,614,_binary '\0'),(137,614,_binary '\0'),(138,29,_binary '\0'),(139,146,_binary '\0'),(140,146,_binary '\0'),(141,614,_binary '\0'),(142,614,_binary '\0'),(143,604,_binary '\0'),(144,614,_binary '\0');
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
INSERT INTO `cart_item` VALUES (530,103,1,1,0),(537,105,62,1,0),(540,106,2,1,0),(543,107,20,1,0),(546,108,56,1,0),(549,109,19,1,0),(550,109,5,1,0),(553,110,1,2,0),(556,111,2,4,0),(559,112,1,1,0),(560,112,19,1,0),(561,112,7,1,0),(562,112,9,1,0),(565,113,3,1,0),(568,114,92,1,0),(571,115,20,3,0),(574,116,2,1,0),(578,117,2,2,0),(579,118,2,2,0),(584,119,3,3,0),(587,120,2,2,0),(590,121,2,1,0),(593,122,1,1,0),(594,122,19,1,0),(597,123,2,2,0),(601,124,68,1,0),(615,125,1,1,0),(616,125,2,1,0),(617,125,3,2,0),(618,125,19,1,0),(619,125,43,1,0),(622,126,1,1,0),(625,127,2,1,0),(626,127,20,1,0),(630,128,3,1,0),(631,128,6,1,0),(634,129,19,1,0),(635,129,7,1,0),(636,129,56,1,0),(637,129,92,1,0),(640,130,7,1,0),(641,130,10,2,0),(644,131,3,2,0),(645,131,20,2,0),(646,131,9,4,0),(649,132,20,3,0),(652,133,3,1,0),(653,133,68,5,0),(654,133,62,1,0),(659,135,1,1,0),(664,137,1,1,0),(665,137,52,2,0),(669,138,1,1,0),(673,139,6,4,0),(676,140,1,1,0),(677,140,2,1,0),(680,141,2,1,0),(681,141,7,1,0),(684,142,1,1,0),(685,142,52,2,0),(686,142,68,2,0),(687,142,7,2,0),(688,142,9,1,0),(691,143,1,1,0),(694,144,1,1,0),(695,144,52,1,0),(696,144,68,1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=701 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment_blog`
--

LOCK TABLES `comment_blog` WRITE;
/*!40000 ALTER TABLE `comment_blog` DISABLE KEYS */;
INSERT INTO `comment_blog` VALUES (700,699,29,'rất hay',_binary '\0');
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
INSERT INTO `hibernate_sequence` VALUES (701);
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
INSERT INTO `notification` VALUES (679,'2023-07-09 17:15:05',146,_binary '','Trần Duy Anh Tú placed an order'),(683,'2023-07-09 17:19:56',614,_binary '','Nguyễn Minh An placed an order'),(690,'2023-07-09 17:26:35',614,_binary '\0','Nguyễn Minh An placed an order'),(693,'2023-07-09 21:49:29',604,_binary '\0','Nguyễn An placed an order'),(698,'2023-07-10 17:20:58',614,_binary '\0','Nguyễn Minh An placed an order');
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
INSERT INTO `persistent_logins` VALUES ('tienantn85@gmail.com','hmr42UPU+VRyYMgxmeUfTA==','+k75YNJZd1gTPemCHWV1Jg==','2023-07-10 16:07:44'),('surivato98@gmail.com','nr/KnUrPqLT59iFCnVN87Q==','CsmZvwuPfN/DzUqQxIbo1g==','2023-07-11 09:23:34');
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
INSERT INTO `product` VALUES (1,'Áo T-Shirt Oversize',20,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391054/v5crvb36wfhikzfauqub.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391058/ebyhgftb9oojerxvmukl.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672802747/p6t2seun6qqf9qehbamw.jpg','60% cotton','Blue','XL',96,_binary '\0'),(2,'Áo T-Shirt Blood Diamond',40,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040588/blooddiamond2_gohdrw.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040588/blooddiamond1_jboxqc.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040590/blooddiamond3_ghmvfx.jpg','70% cotton','Black','L',43,_binary '\0'),(3,'Áo T-Shirt Basic Over',120,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover1_u2lxrz.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover2_kszafe.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040685/basicover3_lhu0uq.jpg','60% cotton','Blue','L',90,_binary '\0'),(4,'Áo T-Shirt Racing',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing1_rtsesg.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing2_otfzcr.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040825/racing3_fcrjam.jpg','60% cotton','Black','L',100,_binary '\0'),(5,'Áo T-Shirt Teddie',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040865/teddie1_jeug8i.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040865/teddie2_imoy7e.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040864/teddie3_ezr6y1.jpg','60% cotton','Black','L',99,_binary '\0'),(6,'Áo T-Shirt King of School ',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/KingofSchool1_g4gsfx.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/kingofschool2_cm2dww.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672040906/kingofschool3_adixlb.jpg','60% cotton','Black','L',95,_binary '\0'),(7,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull1_hyi9oz.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull2_bx7ng5.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044493/skull3_gj3gzn.jpg','60% cotton','Black','L',94,_binary '\0'),(8,'Áo T-Shirt Agent',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent1_w0ocpb.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent2_lqhvde.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672044538/agent3_y6fdks.jpg','60% cotton','Black','L',100,_binary '\0'),(9,'Áo T-Shirt Waster',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123728/8.1_ad4yh8.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123728/8.2_kioxd8.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123729/8.3_udvb73.jpg','60% cotton','Gray','L',94,_binary '\0'),(10,'Áo T-Shirt Skull ',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',2,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-1_nej46r.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-2_xscql5.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672123791/10-3_tyttzn.jpg','60% cotton','White','L',98,_binary '\0'),(18,'Áo COAST Brown',120,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',1,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124017/clowz-5-1-2_dxwbdy.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124018/clowz-5-9_gciixt.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124017/clowz-5-3_fqc9ev.jpg','60% cotton','Black','L',100,_binary '\0'),(19,'Converse Basic',100,'Chất liệu: Cotton 230 GSM, Sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, lộn trái áo khi giặt',4,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product-09_hw4wvu.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product092_ckvhle.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124188/product-093_jjkjrf.jpg','60% cotton','Black','L',95,_binary '\0'),(20,'Đồng hồ Basic',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-06_drsuty.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-062_mzxtmt.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124219/product-063_cggdai.jpg','60% cotton','Black','L',90,_binary '\0'),(21,'Đồng hồ BlackPanther',300,'Chất liệu 100% cotton, sử dụng công nghệ in ép nhiệt chất lượng cao. Độ bền cao, không bị bong tróc khi giặt',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-15_e6cxqq.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-152_cbwxnn.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124248/product-153_yfermx.jpg','60% cotton','Black','L',100,_binary '\0'),(42,'Túi Utility',35,'Size: 23x16x8 cm\r , Mô tả: Túi 3 ngăn in logo\r,  Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag1_h8qrrp.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag2_biiwqu.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124296/bag3_iltabx.jpg','60% cotton','Yellow','L',100,_binary '\0'),(43,'Túi Ulitity SATCHEL',40,'Dây quai đeo: Họa tiết caro đen trắng in chạy dọc quai đeo. Dây đeo có thể điều chỉnh hoặc tháo rời, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz-1-1_rjl8hy.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz1-2_iqirfp.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124353/clowz-3-1_ck5xq7.jpg','60% cotton','Black','L',99,_binary '\0'),(45,'Túi Crytal Clear',35,'Dây đeo: Chữ \"CLOWNZ\" thiết kế theo phong cách graphic in chìm, dây đeo dài có thể điều chỉnh và tháo rời.Chất liệu: Nhựa PU, Thiết kế, chất liệu, và hình in chất lượng cao.',3,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/clear-bag-black_jniksa.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/1a7ff27f-75e2-4917-98bb-6d62bd9c3518_zml2bn.png','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124440/35e41285-3b94-4dca-96de-fff0b8b19273_kqk4em.jpg','60% cotton','Black','L',100,_binary '\0'),(52,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391054/v5crvb36wfhikzfauqub.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672391058/ebyhgftb9oojerxvmukl.jpg','http://res.cloudinary.com/dpvehgfmo/image/upload/v1672802747/p6t2seun6qqf9qehbamw.jpg','60% cotton','Blue','L',16,_binary '\0'),(56,'Đồng hồ Rolex Luxury',1000,'Đồng hồ Rolex Luxury',5,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/mua-%C4%90%E1%BB%93ng-h%E1%BB%93-Rolex-Deepsea-%C4%91en_varxqj.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/Daytona-2-1580886196_qzqo0c.jpg','https://res.cloudinary.com/dpvehgfmo/image/upload/v1672124477/dong-ho-rolex-nam-nu-chinh-hang-gia-bao-nhieu-danh-gia-chi-tiet_censot.jpg','60% cotton','Black','L',98,_binary '\0'),(62,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','M',0,_binary '\0'),(68,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','XL',71,_binary '\0'),(69,'Áo T-Shirt Oversize',20,'Chất liệu: Cotton 230 GSM. Sử dụng công nghệ in ép nhiệt chất lượng cao</li><li> Độ bền cao, lộn trái áo khi giặt</li><ul></div>',2,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091378/q361hf7grcbalupwpsav.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091381/z9gnujbfzt0cdoeai6ee.png','http://res.cloudinary.com/dpvehgfmo/image/upload/v1675091384/dqs0nsbyg8vdiwncyxde.png','60% cotton','Black','S',0,_binary '\0'),(92,' Áo Polo nam Excool',100,'',1,'http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243219/ux7btgdexzbvd5wglrti.webp','http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243222/mzsza6ewf9lnnllzv01o.webp','http://res.cloudinary.com/dpvehgfmo/image/upload/v1679243224/lw5rzlwvxkwgpuzpzphs.webp','Cotton','White','L',498,_binary '\0');
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
INSERT INTO `user` VALUES (29,'surivato98@gmail.com','$2a$10$hH0KQsj60.7GO8L3tytqf.F2p7tyRR7ltqqWPfehi9.Y81URfYbvS','Nguyễn Dũng','0347705659','xóm 2, đội 3, xã Tự Nhiên, Thường Tín, Hà Nội','Tự Nhiện','Hà Nội',NULL,'ADMIN',1,'LOCAL',84,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0',NULL,NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png'),(91,'buivanhung124@gmail.com','$2a$10$4FkdxuynWWU.vPWQAByiDOkXQvxuaW25bjzaUfLlaV6YZW5KuR2ji','Bui Van Hung',NULL,NULL,NULL,NULL,NULL,'ADMIN',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0','','2023-03-11 23:43:26',NULL),(146,'duyanhtutran@gmail.com','$2a$10$Q4E1eL5Iqid/3tk8oV5dhu3SIMqLn/xQMqXTOVv43uPEfpAGFnEau','Trần Duy Anh Tú','0988888888','abc','','',NULL,'USER',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0',NULL,NULL,NULL),(604,'minhan14102001@gmail.com',NULL,'Nguyễn An',NULL,NULL,NULL,NULL,NULL,'USER',1,'FACEBOOK',NULL,'https://scontent.fhan14-2.fna.fbcdn.net/v/t1.30497-1/84628273_176159830277856_972693363922829312_n.jpg?stp=c15.0.50.50a_cp0_dst-jpg_p50x50&_nc_cat=1&ccb=1-7&_nc_sid=12b3be&_nc_ohc=LvilGwJWx2gAX_a49fC&_nc_ht=scontent.fhan14-2.fna&edm=AP4hL3IEAAAA&oh=00_AfD5jdiK3hN5pv3HjA4QGHxoeJs1K9TmWeS-Afovclzs7Q&oe=64C905D9',_binary '\0',NULL,NULL,NULL),(605,'anmusic1410@gmail.com',NULL,'Minh An Nguyễn',NULL,NULL,NULL,NULL,NULL,'USER',1,'GOOGLE',NULL,'https://lh3.googleusercontent.com/a/AAcHTtfzbhV6tnZOH1UOeZiWZDKGZFokQB6ha80iOphY-bTc=s96-c',_binary '\0',NULL,NULL,NULL),(614,'tienantn85@gmail.com','$2a$10$SHiRihjqAX2AzPv3UJibSePqSPeoK./5.NQLMSbSPpIuQsyKoaXHC','Nguyễn Minh An','0965240637','Tự Nhiên, Thường Tín, Hà Nội','','',NULL,'ADMIN',1,'LOCAL',NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png',_binary '\0',NULL,NULL,'https://res.cloudinary.com/dpvehgfmo/image/upload/v1686989829/Avatar/352873771_3563083180588820_2861082734052866640_n_w5hlau.png');
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

-- Dump completed on 2023-07-11 17:15:37
