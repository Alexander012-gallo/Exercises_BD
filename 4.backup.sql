-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: ex_camion
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
-- Table structure for table `asignacion`
--

DROP TABLE IF EXISTS `asignacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asignacion` (
  `id_asignacion` int NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) NOT NULL,
  `matricula` varchar(10) NOT NULL,
  PRIMARY KEY (`id_asignacion`),
  KEY `pk_asignacion_camionero` (`cedula`),
  KEY `pk_asignacion_camion` (`matricula`),
  CONSTRAINT `pk_asignacion_camion` FOREIGN KEY (`matricula`) REFERENCES `camion` (`matricula`),
  CONSTRAINT `pk_asignacion_camionero` FOREIGN KEY (`cedula`) REFERENCES `camionero` (`cedula`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignacion`
--

LOCK TABLES `asignacion` WRITE;
/*!40000 ALTER TABLE `asignacion` DISABLE KEYS */;
INSERT INTO `asignacion` VALUES (1,'1712345678','PBA-1024'),(2,'0912345678','GBA-5501'),(3,'0112345678','ABA-3412'),(4,'1812345678','TBB-9876'),(5,'1112345678','LAA-4321'),(6,'1312345678','MBA-8822'),(7,'0712345678','OBA-1144'),(8,'0512345678','XBA-7755');
/*!40000 ALTER TABLE `asignacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camion`
--

DROP TABLE IF EXISTS `camion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camion` (
  `matricula` varchar(10) NOT NULL,
  `modelo` varchar(20) NOT NULL,
  `tipo` varchar(20) NOT NULL,
  `potencia` double NOT NULL,
  PRIMARY KEY (`matricula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camion`
--

LOCK TABLES `camion` WRITE;
/*!40000 ALTER TABLE `camion` DISABLE KEYS */;
INSERT INTO `camion` VALUES ('ABA-3412','Scania R450','Tráiler',450),('GBA-5501','Volvo FH16','Articulado',750),('LAA-4321','Isuzu Forward','Plataforma',210),('MBA-8822','Chevrolet FVR','Furgón',300),('OBA-1144','DAF XF','Cisterna',530),('PBA-1024','Hino GH','Rígido Pesado',280),('TBB-9876','Mercedes-Benz Atego','Caja Cerrada',240),('XBA-7755','MAN TGX','Articulado',640);
/*!40000 ALTER TABLE `camion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camionero`
--

DROP TABLE IF EXISTS `camionero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camionero` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `salario` double NOT NULL,
  `poblacion` varchar(30) NOT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camionero`
--

LOCK TABLES `camionero` WRITE;
/*!40000 ALTER TABLE `camionero` DISABLE KEYS */;
INSERT INTO `camionero` VALUES ('0112345678','Luis','Sánchez','0956543210','Av. Solano 4-12',1100,'Cuenca'),('0512345678','Andrés','Tovar','0951472583','Calle Belisario Quevedo',1180,'Latacunga'),('0712345678','Pedro','Reyes','0996325874','Av. 25 de Junio',1220,'Machala'),('0912345678','Alejandro','Gallo','0998765432','Calle Malecón 2000',1350,'Guayaquil'),('1112345678','Diego','Puri','0963258741','Av. Universitaria',1150.8,'Loja'),('1312345678','Juan','Cedeño','0987412536','Calle 13 y Av. 24',1400,'Manta'),('1712345678','Manuel','Ortiz','0981234567','Av. Gran Colombia',1200.5,'Quito'),('1812345678','Carlos','Meza','0974125896','Calle Cevallos 89',1250,'Ambato');
/*!40000 ALTER TABLE `camionero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paquete`
--

DROP TABLE IF EXISTS `paquete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `paquete` (
  `codigo_paquete` varchar(10) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `destinatario` varchar(50) NOT NULL,
  `direccion_destinatario` varchar(50) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `codigo_provincia` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo_paquete`),
  KEY `pk_paquete_camionero` (`cedula`),
  KEY `pk_paquete_provincia` (`codigo_provincia`),
  CONSTRAINT `pk_paquete_camionero` FOREIGN KEY (`cedula`) REFERENCES `camionero` (`cedula`),
  CONSTRAINT `pk_paquete_provincia` FOREIGN KEY (`codigo_provincia`) REFERENCES `provincia` (`codigo_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paquete`
--

LOCK TABLES `paquete` WRITE;
/*!40000 ALTER TABLE `paquete` DISABLE KEYS */;
INSERT INTO `paquete` VALUES ('PAQ-001','Caja de repuestos automotrices','Andrés Vivanco','Av. Amazonas N32','1712345678','PROV-17'),('PAQ-002','Lote de ropa de algodón','Marta Estévez','Urdesa Central Mz 4','0912345678','PROV-09'),('PAQ-003','Documentos confidenciales','Roberto Luzuriaga','Calle Larga 12-45','0112345678','PROV-01'),('PAQ-004','Electrodomésticos de cocina','Lucía Paredes','Av. Miraflores 404','1812345678','PROV-18'),('PAQ-005','Computadora portátil y accesorios','Kevin Jaramillo','Calle Bolívar y Colón','1112345678','PROV-11'),('PAQ-006','Cajas de pescado congelado','Sofía Barreto','Barrio El Murciélago','1312345678','PROV-13'),('PAQ-007','Insumos agrícolas','Fernando Aguilar','Panamericana Sur Km 5','0712345678','PROV-07'),('PAQ-008','Materiales de construcción ligeros','Elena Castro','Frente al Parque Central','0512345678','PROV-05');
/*!40000 ALTER TABLE `paquete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provincia`
--

DROP TABLE IF EXISTS `provincia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `provincia` (
  `codigo_provincia` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  PRIMARY KEY (`codigo_provincia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provincia`
--

LOCK TABLES `provincia` WRITE;
/*!40000 ALTER TABLE `provincia` DISABLE KEYS */;
INSERT INTO `provincia` VALUES ('PROV-01','Azuay'),('PROV-05','Cotopaxi'),('PROV-07','El Oro'),('PROV-09','Guayas'),('PROV-11','Loja'),('PROV-13','Manabí'),('PROV-17','Pichincha'),('PROV-18','Tungurahua');
/*!40000 ALTER TABLE `provincia` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 16:56:13
