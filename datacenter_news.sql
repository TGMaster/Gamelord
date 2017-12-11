-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: datacenter
-- ------------------------------------------------------
-- Server version	5.7.20-log

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
-- Table structure for table `news`
--

DROP TABLE IF EXISTS `news`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `news` (
  `idnews` int(11) NOT NULL,
  `titlenews` varchar(45) NOT NULL,
  `contentnews` longtext NOT NULL,
  `datepost` date NOT NULL,
  `author` varchar(45) NOT NULL,
  `picture` blob NOT NULL,
  PRIMARY KEY (`idnews`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `news`
--

LOCK TABLES `news` WRITE;
/*!40000 ALTER TABLE `news` DISABLE KEYS */;
INSERT INTO `news` VALUES (1,'abc','xyz','2012-10-10','gick','C:	est.jpg'),(2,'abc','xyz','2012-10-10','gick','C:	est.jpg'),(3,'abc','xyz','2012-10-10','gick','C:	est.jpg'),(4,'abc','xyz','2012-10-10','gick','C:	est.jpg'),(5,'abc','xyz','2012-10-10','gick','C:	est.jpg'),(22,'sss','aa','2011-11-11','ken','C:	est.jpg'),(33,'sss','aa','2011-11-11','ken','C:	est.jpg'),(222,'null','null','2011-11-11','null','C:	est.jpg'),(444,'sss','ss','9999-09-09','ss',''),(1234,'null','null','3333-03-03','null',''),(4321,'wwww','wqw','2011-12-12','wqw',''),(332211,'wwww','sss','2016-01-01','akali',''),(666666,'asff',' Circus Comes to Church\r\n\r\nWhen my son, William, was young, we belonged to a small country church. On Communion day, deacons would pass around the bread and juice.\r\n\r\nOne Sunday, we attended &#8232;a church out of town that was more formal. What our church called bread and juice, this one referred to as elements, a word William didnt understand.\r\nAs Communion began, the pastor said, If the deacons will come forward, the elements will pass among us.\r\nWilliam was suddenly excited and I didnt know why. Then he leaned toward me, whispering something that caused me to burst out laughing. With all eyes on us, I took him by the hand and we made a hasty exit.\r\nAll the way to the car, he protested. Mom, were going to miss the circus. The pastor said the elephants were going to pass among us!','2017-12-11','sdsd',''),(22222222,'null','null','2222-02-02','null','C:	est.jpg');
/*!40000 ALTER TABLE `news` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-12-11 22:41:32
