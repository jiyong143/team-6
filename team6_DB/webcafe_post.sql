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
-- Table structure for table `post`
--

DROP TABLE IF EXISTS `post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post` (
  `po_num` int NOT NULL AUTO_INCREMENT,
  `po_title` varchar(30) NOT NULL,
  `po_content` text NOT NULL,
  `po_date` date NOT NULL,
  `po_views` int NOT NULL DEFAULT '0',
  `po_bo_num` int NOT NULL,
  `po_me_id` varchar(8) NOT NULL,
  PRIMARY KEY (`po_num`),
  KEY `FK_board_TO_post_1` (`po_bo_num`),
  KEY `FK_member_TO_post_1` (`po_me_id`),
  CONSTRAINT `FK_board_TO_post_1` FOREIGN KEY (`po_bo_num`) REFERENCES `board` (`bo_num`),
  CONSTRAINT `FK_member_TO_post_1` FOREIGN KEY (`po_me_id`) REFERENCES `member` (`me_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post`
--

LOCK TABLES `post` WRITE;
/*!40000 ALTER TABLE `post` DISABLE KEYS */;
INSERT INTO `post` VALUES (1,'공지사항 입니다.','클린 내용, 클린 댓글 부탁드립니다.','2024-03-25',8,1,'admin123'),(2,'에스파 좋아요','많이 사랑해주세요','2024-03-25',2,2,'qwer1234'),(3,'SUV 추천 부탁드려요','좋은 SUV 추천 부탁요','2024-03-25',2,4,'qwer1234'),(4,'소프트웨어쪽으로 종사하시는 분 있으신가요?','혹시 소프트웨어쪽 종사자분 있으신가요','2024-03-25',3,10,'qwer1234'),(5,'좋아하는 한식이 뭐에요?','저는 김치찌개','2024-03-25',2,6,'qwer1234'),(6,'스키즈 사랑해요','많이 사랑해주세요','2024-03-25',2,3,'asdf1234'),(7,'세단 차 추천해주실 수 있나요','좋은 세단 차 추천 부탁해요','2024-03-25',3,5,'asdf1234'),(8,'하드웨어 정의가 뭔가요?','궁금해요','2024-03-25',3,11,'asdf1234'),(9,'종로쪽에 중식 맛집 추천해주세요','지금 종로인데 중식 맛집 추천해주세요','2024-03-25',2,7,'asdf1234'),(10,'데이트 음식 추천해주세요','양식 부탁드려요','2024-03-25',2,9,'asdf1234'),(11,'카리나 누구랑 사귀나요?','누구랑 사귄다고 들었는데 누구인가요?','2024-03-25',2,2,'zxcv1234'),(12,'서울에 스시 추천할만한 곳 있을까요?','스시 땡기네요','2024-03-25',0,8,'zxcv1234'),(13,'이태원 김치찜 맛집 추천합니다.','https://naver.me/ForcsFy7\r\n\r\n이태원 김치찜 야주 추천드립니다.','2024-03-25',1,6,'zxcv1234'),(14,'프론트엔드 너무 어려워요','저는 여기서 탈출할게요','2024-03-25',5,12,'qwer1234'),(15,'백엔드의 끝은 어디일까요','배워도 끝이 없네요','2024-03-25',3,13,'qwer1234'),(16,'정보보안은 무엇을 배우나요','제곧내','2024-03-25',2,14,'qwer1234');
/*!40000 ALTER TABLE `post` ENABLE KEYS */;
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
