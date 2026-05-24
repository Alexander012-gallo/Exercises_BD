-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: ex_veterinaria
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
-- Table structure for table `auxiliar`
--

DROP TABLE IF EXISTS `auxiliar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auxiliar` (
  `cedula_auxiliar` varchar(10) NOT NULL,
  `base_cotizacion` double NOT NULL,
  PRIMARY KEY (`cedula_auxiliar`),
  CONSTRAINT `fk_auxiliar_personal_clinia` FOREIGN KEY (`cedula_auxiliar`) REFERENCES `personal_clinica` (`cedula_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auxiliar`
--

LOCK TABLES `auxiliar` WRITE;
/*!40000 ALTER TABLE `auxiliar` DISABLE KEYS */;
INSERT INTO `auxiliar` VALUES ('0590000008',890),('0790000007',900),('1190000005',850),('1390000006',875);
/*!40000 ALTER TABLE `auxiliar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consulta`
--

DROP TABLE IF EXISTS `consulta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `consulta` (
  `id_consulta` int NOT NULL AUTO_INCREMENT,
  `id_mascota` varchar(10) NOT NULL,
  `cedula_veterinaria` varchar(10) NOT NULL,
  PRIMARY KEY (`id_consulta`),
  KEY `fk_consulta_mascota` (`id_mascota`),
  KEY `fk_consulta_veterinaria` (`cedula_veterinaria`),
  CONSTRAINT `fk_consulta_mascota` FOREIGN KEY (`id_mascota`) REFERENCES `mascota` (`id_mascota`),
  CONSTRAINT `fk_consulta_veterinaria` FOREIGN KEY (`cedula_veterinaria`) REFERENCES `veterinario` (`cedula_veterinaria`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consulta`
--

LOCK TABLES `consulta` WRITE;
/*!40000 ALTER TABLE `consulta` DISABLE KEYS */;
INSERT INTO `consulta` VALUES (1,'MAS-01','1790000001'),(2,'MAS-02','0990000002'),(3,'MAS-03','0190000003'),(4,'MAS-04','1890000004');
/*!40000 ALTER TABLE `consulta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `familiar`
--

DROP TABLE IF EXISTS `familiar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `familiar` (
  `cedula_familiar` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `cedula_propietario` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula_familiar`),
  KEY `fk_familiar_propietario` (`cedula_propietario`),
  CONSTRAINT `fk_familiar_propietario` FOREIGN KEY (`cedula_propietario`) REFERENCES `propietario` (`cedula_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `familiar`
--

LOCK TABLES `familiar` WRITE;
/*!40000 ALTER TABLE `familiar` DISABLE KEYS */;
INSERT INTO `familiar` VALUES ('0110000003','Manuel Pauta','0953333334','0103333333'),('0510000008','Patricia Guerrero','0951112223','0508888888'),('0710000007','Lucía Rios','0997777778','0707777777'),('0910000002','Sofía Cevallos','0992222223','0902222222'),('1110000005','Diego Gallo','0965555556','1105555555'),('1310000006','Andrés Mendoza','0986666667','1306666666'),('1710000001','Pedro Andrade','0981111112','1701111111'),('1810000004','Carlos Samaniego','0974444445','1804444444');
/*!40000 ALTER TABLE `familiar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mascota`
--

DROP TABLE IF EXISTS `mascota`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mascota` (
  `id_mascota` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `tipo` varchar(25) NOT NULL,
  `cedula_propietario` varchar(10) NOT NULL,
  PRIMARY KEY (`id_mascota`),
  KEY `fk_mascota_propietario` (`cedula_propietario`),
  CONSTRAINT `fk_mascota_propietario` FOREIGN KEY (`cedula_propietario`) REFERENCES `propietario` (`cedula_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mascota`
--

LOCK TABLES `mascota` WRITE;
/*!40000 ALTER TABLE `mascota` DISABLE KEYS */;
INSERT INTO `mascota` VALUES ('MAS-01','Thor','2022-03-15','Perro (Golden)','1701111111'),('MAS-02','Luna','2023-06-20','Gato (Persa)','0902222222'),('MAS-03','Max','2021-01-10','Perro (Pastor)','0103333333'),('MAS-04','Mia','2024-02-01','Gato (Siamés)','1804444444'),('MAS-05','Rocky','2020-11-12','Perro (Pug)','1105555555'),('MAS-06','Simba','2022-08-05','León pequeño','1306666666'),('MAS-07','Bella','2023-05-18','Perro (Poodle)','0707777777'),('MAS-08','Coco','2021-07-25','Loro','0508888888');
/*!40000 ALTER TABLE `mascota` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_clinica`
--

DROP TABLE IF EXISTS `personal_clinica`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_clinica` (
  `cedula_personal` varchar(10) NOT NULL,
  `codigo` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  PRIMARY KEY (`cedula_personal`),
  UNIQUE KEY `uk_personal_clinica` (`codigo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_clinica`
--

LOCK TABLES `personal_clinica` WRITE;
/*!40000 ALTER TABLE `personal_clinica` DISABLE KEYS */;
INSERT INTO `personal_clinica` VALUES ('0190000003','VET-03','Francisco','Solano'),('0590000008','AUX-04','Verónica','Silva'),('0790000007','AUX-03','Santiago','Castro'),('0990000002','VET-02','Camila','Vargas'),('1190000005','AUX-01','Claudio','Rojas'),('1390000006','AUX-02','Fernanda','Mejía'),('1790000001','VET-01','Roberto','Mora'),('1890000004','VET-04','Gabriela','Paz');
/*!40000 ALTER TABLE `personal_clinica` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietario`
--

DROP TABLE IF EXISTS `propietario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietario` (
  `cedula_propietario` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  PRIMARY KEY (`cedula_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietario`
--

LOCK TABLES `propietario` WRITE;
/*!40000 ALTER TABLE `propietario` DISABLE KEYS */;
INSERT INTO `propietario` VALUES ('0103333333','Juan','Pauta','Calle Larga y Benigno Malo'),('0508888888','Elena','Guerrero','Calle Quito'),('0707777777','Jorge','Rios','Av. Madero Vargas'),('0902222222','María','Cevallos','Urdesa Central Calle 5ta'),('1105555555','Luis','Gallo','Calle Bolívar y Azuay'),('1306666666','Diana','Mendoza','Barrio Tarqui'),('1701111111','Carlos','Andrade','Av. De los Shyris'),('1804444444','Ana','Samaniego','Av. Miraflores');
/*!40000 ALTER TABLE `propietario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `telefono`
--

DROP TABLE IF EXISTS `telefono`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `telefono` (
  `cedula` varchar(10) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`cedula`,`telefono`),
  CONSTRAINT `fk_telefono_propietario` FOREIGN KEY (`cedula`) REFERENCES `propietario` (`cedula_propietario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `telefono`
--

LOCK TABLES `telefono` WRITE;
/*!40000 ALTER TABLE `telefono` DISABLE KEYS */;
INSERT INTO `telefono` VALUES ('0103333333','0953333333'),('0707777777','0997777777'),('0902222222','0992222222'),('1105555555','0965555555'),('1306666666','0986666666'),('1701111111','022444555'),('1701111111','0981111111'),('1804444444','0974444444');
/*!40000 ALTER TABLE `telefono` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `veterinario`
--

DROP TABLE IF EXISTS `veterinario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `veterinario` (
  `cedula_veterinaria` varchar(10) NOT NULL,
  `fecha_alta` date NOT NULL,
  `especialidad` varchar(25) NOT NULL,
  PRIMARY KEY (`cedula_veterinaria`),
  CONSTRAINT `fk_veterinario_personal_clinica` FOREIGN KEY (`cedula_veterinaria`) REFERENCES `personal_clinica` (`cedula_personal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `veterinario`
--

LOCK TABLES `veterinario` WRITE;
/*!40000 ALTER TABLE `veterinario` DISABLE KEYS */;
INSERT INTO `veterinario` VALUES ('0190000003','2025-06-01','Animales Exóticos'),('0990000002','2025-03-15','Cardiología Canina'),('1790000001','2025-01-10','Cirugía General'),('1890000004','2025-08-20','Dermatología');
/*!40000 ALTER TABLE `veterinario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 17:18:32
