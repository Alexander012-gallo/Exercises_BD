-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: ex_discografica
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
-- Table structure for table `artista`
--

DROP TABLE IF EXISTS `artista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artista` (
  `NIF` varchar(15) NOT NULL,
  `nombre_completo` varchar(50) NOT NULL,
  `id_manager` varchar(10) NOT NULL,
  PRIMARY KEY (`NIF`),
  KEY `fk_artista_manager` (`id_manager`),
  CONSTRAINT `fk_artista_manager` FOREIGN KEY (`id_manager`) REFERENCES `manager` (`id_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artista`
--

LOCK TABLES `artista` WRITE;
/*!40000 ALTER TABLE `artista` DISABLE KEYS */;
INSERT INTO `artista` VALUES ('NIF-A100','Dua Lipa','MNG-01'),('NIF-B200','Bruno Mars','MNG-01'),('NIF-C300','Rosalía','MNG-02'),('NIF-D400','The Weeknd','MNG-03'),('NIF-E500','Coldplay','MNG-04'),('NIF-F600','Bad Bunny','MNG-05'),('NIF-G700','Billie Eilish','MNG-06'),('NIF-H800','Eminem','MNG-07');
/*!40000 ALTER TABLE `artista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento_promocion`
--

DROP TABLE IF EXISTS `evento_promocion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evento_promocion` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `numero_asistentes` int NOT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento_promocion`
--

LOCK TABLES `evento_promocion` WRITE;
/*!40000 ALTER TABLE `evento_promocion` DISABLE KEYS */;
INSERT INTO `evento_promocion` VALUES (1,'2026-06-15',15000),(2,'2026-07-20',45000),(3,'2026-08-05',8000),(4,'2026-09-12',22000),(5,'2026-10-18',30000),(6,'2026-11-02',12000),(7,'2026-12-05',50000),(8,'2027-01-25',18000);
/*!40000 ALTER TABLE `evento_promocion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manager`
--

DROP TABLE IF EXISTS `manager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `manager` (
  `id_manager` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  PRIMARY KEY (`id_manager`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manager`
--

LOCK TABLES `manager` WRITE;
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
INSERT INTO `manager` VALUES ('MNG-01','Carlos','Mendoza'),('MNG-02','Elena','Ramos'),('MNG-03','Ricardo','Gómez'),('MNG-04','Sofia','Fernández'),('MNG-05','Andrés','Castro'),('MNG-06','Lucía','Martínez'),('MNG-07','Diego','Ortega'),('MNG-08','Valeria','Ruiz');
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `participacion`
--

DROP TABLE IF EXISTS `participacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `participacion` (
  `id_participacion` int NOT NULL AUTO_INCREMENT,
  `NIF` varchar(15) NOT NULL,
  `id_evento` int NOT NULL,
  PRIMARY KEY (`id_participacion`),
  KEY `fk_participacion_artista` (`NIF`),
  KEY `fk_participacion_evento` (`id_evento`),
  CONSTRAINT `fk_participacion_artista` FOREIGN KEY (`NIF`) REFERENCES `artista` (`NIF`),
  CONSTRAINT `fk_participacion_evento` FOREIGN KEY (`id_evento`) REFERENCES `evento_promocion` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `participacion`
--

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;
INSERT INTO `participacion` VALUES (1,'NIF-A100',1),(2,'NIF-C300',1),(3,'NIF-B200',2),(4,'NIF-E500',3),(5,'NIF-D400',4),(6,'NIF-F600',5),(7,'NIF-G700',6),(8,'NIF-H800',7);
/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 16:09:05
