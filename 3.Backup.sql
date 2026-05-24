-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: ex_discos
-- ------------------------------------------------------
-- Server version	8.0.45-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `cancion`
--

DROP TABLE IF EXISTS `cancion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cancion` (
  `id_cancion` varchar(10) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  PRIMARY KEY (`id_cancion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cancion`
--

LOCK TABLES `cancion` WRITE;
/*!40000 ALTER TABLE `cancion` DISABLE KEYS */;
INSERT INTO `cancion` VALUES ('CAN-01','Bohemian Rhapsody'),('CAN-02','Thriller'),('CAN-03','Gasolina'),('CAN-04','Llorarás'),('CAN-05','Fly Me to the Moon'),('CAN-06','Do I Wanna Know?'),('CAN-07','Wake Me Up'),('CAN-08','Lose Yourself');
/*!40000 ALTER TABLE `cancion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cantante`
--

DROP TABLE IF EXISTS `cantante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cantante` (
  `id_cantante` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `país` varchar(25) NOT NULL,
  PRIMARY KEY (`id_cantante`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cantante`
--

LOCK TABLES `cantante` WRITE;
/*!40000 ALTER TABLE `cantante` DISABLE KEYS */;
INSERT INTO `cantante` VALUES ('CANT-01','Freddie','Mercury','Reino Unido'),('CANT-02','Michael','Jackson','Estados Unidos'),('CANT-03','Daddy','Yankee','Puerto Rico'),('CANT-04','Oscar','D León','Venezuela'),('CANT-05','Frank','Sinatra','Estados Unidos'),('CANT-06','Alex','Turner','Reino Unido'),('CANT-07','Avicii','Tim','Suecia'),('CANT-08','Eminem','Marshall','Estados Unidos');
/*!40000 ALTER TABLE `cantante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disco`
--

DROP TABLE IF EXISTS `disco`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `disco` (
  `id_disco` varchar(10) NOT NULL,
  `titulo` varchar(50) NOT NULL,
  `precio` double NOT NULL,
  `id_genero` varchar(10) NOT NULL,
  `id_cantante` varchar(10) NOT NULL,
  PRIMARY KEY (`id_disco`),
  KEY `pk_disco_genero` (`id_genero`),
  KEY `pk_disco_cantante` (`id_cantante`),
  CONSTRAINT `pk_disco_cantante` FOREIGN KEY (`id_cantante`) REFERENCES `cantante` (`id_cantante`),
  CONSTRAINT `pk_disco_genero` FOREIGN KEY (`id_genero`) REFERENCES `genero_musical` (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disco`
--

LOCK TABLES `disco` WRITE;
/*!40000 ALTER TABLE `disco` DISABLE KEYS */;
INSERT INTO `disco` VALUES ('DISC-01','A Night at the Opera',25.99,'ROCK','CANT-01'),('DISC-02','Thriller Album',29.99,'POP','CANT-02'),('DISC-03','Barrio Fino',19.99,'REGGAETON','CANT-03'),('DISC-04','Dimension Latina 75',15.5,'SALSA','CANT-04'),('DISC-05','It Had to Be You',22,'JAZZ','CANT-05'),('DISC-06','AM',24.5,'INDIE','CANT-06'),('DISC-07','True',20,'ELECTRONIC','CANT-07'),('DISC-08','The Eminem Show',18.99,'RAP','CANT-08');
/*!40000 ALTER TABLE `disco` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genero_musical`
--

DROP TABLE IF EXISTS `genero_musical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genero_musical` (
  `id_genero` varchar(10) NOT NULL,
  PRIMARY KEY (`id_genero`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genero_musical`
--

LOCK TABLES `genero_musical` WRITE;
/*!40000 ALTER TABLE `genero_musical` DISABLE KEYS */;
INSERT INTO `genero_musical` VALUES ('ELECTRONIC'),('INDIE'),('JAZZ'),('POP'),('RAP'),('REGGAETON'),('ROCK'),('SALSA');
/*!40000 ALTER TABLE `genero_musical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posicion`
--

DROP TABLE IF EXISTS `posicion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posicion` (
  `id_posicion` int NOT NULL AUTO_INCREMENT,
  `id_disco` varchar(10) NOT NULL,
  `id_cancion` varchar(10) NOT NULL,
  PRIMARY KEY (`id_posicion`),
  KEY `fk_posicion_disco` (`id_disco`),
  KEY `fk_posicion_cancion` (`id_cancion`),
  CONSTRAINT `fk_posicion_cancion` FOREIGN KEY (`id_cancion`) REFERENCES `cancion` (`id_cancion`),
  CONSTRAINT `fk_posicion_disco` FOREIGN KEY (`id_disco`) REFERENCES `disco` (`id_disco`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posicion`
--

LOCK TABLES `posicion` WRITE;
/*!40000 ALTER TABLE `posicion` DISABLE KEYS */;
INSERT INTO `posicion` VALUES (1,'DISC-01','CAN-01'),(2,'DISC-02','CAN-02'),(3,'DISC-03','CAN-03'),(4,'DISC-04','CAN-04'),(5,'DISC-05','CAN-05'),(6,'DISC-06','CAN-06'),(7,'DISC-07','CAN-07'),(8,'DISC-08','CAN-08');
/*!40000 ALTER TABLE `posicion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 16:45:45
