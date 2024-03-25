CREATE DATABASE  IF NOT EXISTS `webcafe` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `webcafe`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: webcafe
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `co_num` int NOT NULL AUTO_INCREMENT,
  `co_content` varchar(500) NOT NULL,
  `co_po_num` int NOT NULL,
  `co_me_id` varchar(8) NOT NULL,
  PRIMARY KEY (`co_num`),
  KEY `FK_post_TO_comment_1` (`co_po_num`),
  KEY `FK_member_TO_comment_1` (`co_me_id`),
  CONSTRAINT `FK_member_TO_comment_1` FOREIGN KEY (`co_me_id`) REFERENCES `member` (`me_id`),
  CONSTRAINT `FK_post_TO_comment_1` FOREIGN KEY (`co_po_num`) REFERENCES `post` (`po_num`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'네 확인했습니다.',1,'qwer1234'),(2,'확인요',1,'asdf1234'),(3,'네 저도 참 좋아하는 그룹입니다.',2,'asdf1234'),(4,'2020 기아 쏘렌토(MQ4) 중형SUV\r\n2020 현대 뉴 싼타페(TM) 중형SUV\r\n2020 현대 팰리세이드 대형SUV\r\n2021 기아 셀토스 소형SUV\r\n추천 드립니다.',3,'asdf1234'),(5,'접니다. 궁금한거 있으신가요?',4,'asdf1234'),(6,'저는 된장찌개',5,'asdf1234'),(7,'확인.',1,'zxcv1234'),(8,'네 화이팅',6,'zxcv1234'),(9,'그랜저, 아반떼, 쏘나타 추천 드립니다.',7,'zxcv1234'),(10,'아주 간단히 말해서, 컴퓨터 하드웨어는 컴퓨터 시스템이 작동하는 데 필요한 물리적 구성 요소입니다. 마더보드, 그래픽 카드, 중앙처리장치(CPU), 환기용 팬, 웹캠, 전원 공급 장치 등을 포함하여 PC 또는 노트북 내에서 작동하는 회로 기판에 있는 모든 것을 포괄합니다.',8,'zxcv1234'),(11,'빠에야 맛있어요',10,'zxcv1234'),(12,'종로에 친니가 탕수육이 진짜 맛있어요.',9,'zxcv1234'),(13,'이종욱이랑 사귄데요',11,'qwer1234'),(14,'저도요',14,'asdf1234'),(15,'그래도 스프링은 재밌네요',15,'asdf1234'),(16,'데이터의 보안을 위한 기술을 배우게 됩니다. 특히 컴퓨터 내에 존재하는 데이터를 어떻게 보호할지를 배우고, 이런 데이터가 다른 컴퓨터와 네트워크를 통해서 연결되어 공유될 때 어떻게 안전하게 전송할지를 기술적으로 배우게 됩니다. 주로 정보보안학과를 갑니다.',16,'asdf1234'),(17,'조금만 더 해보죠',14,'zxcv1234');
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-03-25 10:57:28
