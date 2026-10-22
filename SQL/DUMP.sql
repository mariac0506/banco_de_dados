CREATE DATABASE  IF NOT EXISTS `bd_enquete` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bd_enquete`;
-- MySQL dump 10.13  Distrib 8.0.44, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bd_enquete
-- ------------------------------------------------------
-- Server version	26.7.0

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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '83b12378-ce02-11f1-a398-e8cf837b9380:1-99';

--
-- Table structure for table `enquete`
--

DROP TABLE IF EXISTS `enquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enquete` (
  `ENQ_CODIGO` int NOT NULL AUTO_INCREMENT,
  `ENQ_DATA_INICIAL` date NOT NULL,
  `ENQ_DATA_FINAL` date DEFAULT NULL,
  `ENQ_DESCRICAO` varchar(1440) DEFAULT NULL,
  `ENQ_NOME` varchar(50) NOT NULL,
  PRIMARY KEY (`ENQ_CODIGO`),
  UNIQUE KEY `ENQ_NOME` (`ENQ_NOME`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enquete`
--

LOCK TABLES `enquete` WRITE;
/*!40000 ALTER TABLE `enquete` DISABLE KEYS */;
INSERT INTO `enquete` VALUES (1,'2026-10-22',NULL,NULL,'FORMS BANCO DE DADOS'),(2,'2026-10-22',NULL,NULL,'FORMS LINGUAGEM DE MARCAÇÃO'),(3,'2026-10-22',NULL,NULL,'FORMS PROGRAMAÇÃO BACK-END'),(4,'2026-10-22',NULL,NULL,'FORMS PROJETO'),(5,'2026-10-22',NULL,NULL,'FORMS FINAL');
/*!40000 ALTER TABLE `enquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perguntas`
--

DROP TABLE IF EXISTS `perguntas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `perguntas` (
  `PER_CODIGO` int NOT NULL AUTO_INCREMENT,
  `PER_DESCRICAO` varchar(500) NOT NULL,
  `FK_ENQ_CODIGO` int NOT NULL,
  PRIMARY KEY (`PER_CODIGO`),
  KEY `FK_ENQ_CODIGO` (`FK_ENQ_CODIGO`),
  CONSTRAINT `perguntas_ibfk_1` FOREIGN KEY (`FK_ENQ_CODIGO`) REFERENCES `enquete` (`ENQ_CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perguntas`
--

LOCK TABLES `perguntas` WRITE;
/*!40000 ALTER TABLE `perguntas` DISABLE KEYS */;
INSERT INTO `perguntas` VALUES (1,'OQ É SQL?',1),(2,'OQ É SELECT?',1),(3,'OQ É UPDATE?',1),(4,'OQ É TABLE?',2),(5,'OQ É SQL?',2);
/*!40000 ALTER TABLE `perguntas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `respostas`
--

DROP TABLE IF EXISTS `respostas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `respostas` (
  `RES_CODIGO` int NOT NULL AUTO_INCREMENT,
  `RES_DESCRICAO` varchar(500) NOT NULL,
  `RES_CERTA` varchar(1) NOT NULL,
  `FK_PER_CODIGO` int NOT NULL,
  PRIMARY KEY (`RES_CODIGO`),
  KEY `FK_PER_CODIGO` (`FK_PER_CODIGO`),
  CONSTRAINT `respostas_ibfk_1` FOREIGN KEY (`FK_PER_CODIGO`) REFERENCES `perguntas` (`PER_CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `respostas`
--

LOCK TABLES `respostas` WRITE;
/*!40000 ALTER TABLE `respostas` DISABLE KEYS */;
INSERT INTO `respostas` VALUES (1,'A) BANCO DE DADOS','C',1),(2,'B) PHP','E',1),(3,'C) HTML','E',1),(4,'A) SELECT RETORNA DADOS','C',2),(5,'B) SELECT ALTERAR DADOS','E',2);
/*!40000 ALTER TABLE `respostas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_responde_enquete`
--

DROP TABLE IF EXISTS `usuario_responde_enquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_responde_enquete` (
  `URE_CODIGO` int NOT NULL AUTO_INCREMENT,
  `URE_DATA` date NOT NULL,
  `FK_USU_CODIGO` int NOT NULL,
  `FK_ENQ_CODIGO` int NOT NULL,
  PRIMARY KEY (`URE_CODIGO`),
  KEY `FK_ENQ_CODIGO` (`FK_ENQ_CODIGO`),
  KEY `IDX_URE_USUARIO_ENQUETE` (`FK_USU_CODIGO`,`FK_ENQ_CODIGO`),
  CONSTRAINT `usuario_responde_enquete_ibfk_1` FOREIGN KEY (`FK_USU_CODIGO`) REFERENCES `usuarios` (`USU_CODIGO`) ON DELETE CASCADE,
  CONSTRAINT `usuario_responde_enquete_ibfk_2` FOREIGN KEY (`FK_ENQ_CODIGO`) REFERENCES `enquete` (`ENQ_CODIGO`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_responde_enquete`
--

LOCK TABLES `usuario_responde_enquete` WRITE;
/*!40000 ALTER TABLE `usuario_responde_enquete` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_responde_enquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `USU_CODIGO` int NOT NULL AUTO_INCREMENT,
  `USU_DATA_CADASTRO` date NOT NULL,
  `USU_LOGIN` varchar(67) NOT NULL,
  `USU_AREA_ATUACAO` varchar(50) DEFAULT NULL,
  `USU_PROFISSAO` varchar(50) DEFAULT NULL,
  `USU_AREA_FORMACAO` varchar(50) DEFAULT NULL,
  `USU_DATANASC` date NOT NULL,
  `USU_ESTADO_CIVIL` enum('SOLTEIRO','CASADO','DIVORCIADO','VIÚVO') NOT NULL,
  `USU_ESTADO` varchar(2) NOT NULL,
  `USU_ESCOLARIDADE` enum('FUNDAMENTAL COMPLETO','MEDIO COMPLETO','SUPERIOR') NOT NULL,
  `USU_EMAIL` varchar(50) NOT NULL,
  `USU_SENHA` varchar(255) NOT NULL,
  `USU_NOME` varchar(100) NOT NULL,
  PRIMARY KEY (`USU_CODIGO`),
  UNIQUE KEY `USU_LOGIN` (`USU_LOGIN`),
  UNIQUE KEY `USU_EMAIL` (`USU_EMAIL`),
  KEY `IDX_USUARIO_AREA_ATUACAO` (`USU_AREA_ATUACAO`),
  KEY `IDX_USUARIO_AREA_FORMACAO` (`USU_AREA_FORMACAO`),
  KEY `ID_USUARIO_ESCOLARIDADE` (`USU_ESCOLARIDADE`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'2026-10-22','MARIA.CLARA',NULL,NULL,NULL,'2009-06-05','SOLTEIRO','SP','MEDIO COMPLETO','M@GMAIL','123','MARIA CLARA'),(2,'2026-10-22','BEA.TRIZ',NULL,NULL,NULL,'2009-11-20','SOLTEIRO','SP','MEDIO COMPLETO','B@GMAIL','123','BEATRIZ'),(3,'2026-10-22','LAH.FERNANDES',NULL,NULL,NULL,'2010-03-13','SOLTEIRO','SP','MEDIO COMPLETO','L@GMAIL','123','LAVINIA'),(4,'2026-10-22','MARIA.CECILIA',NULL,NULL,NULL,'2011-06-28','SOLTEIRO','SP','MEDIO COMPLETO','MC@GMAIL','123','MARIA CECILIA'),(5,'2026-10-22','VITORIA',NULL,NULL,NULL,'2020-11-24','SOLTEIRO','SP','SUPERIOR','V@GMAIL','123','VITORIA');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-10-22  8:04:24
