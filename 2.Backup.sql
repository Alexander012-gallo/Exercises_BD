-- MySQL dump 10.13  Distrib 8.0.45, for Linux (x86_64)
--
-- Host: localhost    Database: ex_tienda
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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `codigo_cliente` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `numero_telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo_cliente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('CLI-001','Carlos','Mendoza','Av. Amazonas N24','0987654321'),('CLI-002','María','Espinoza','Calle Larga 456','0991234567'),('CLI-003','Juan','Andrade','Calle de los Capulíes','0959876543'),('CLI-004','Ana','Benítez','Av. Solano 789','0974561230'),('CLI-005','Luis','Chávez','Pasaje El Oro 12','0963214578'),('CLI-006','Diana','Guerrero','Av. de las Américas','0981472583'),('CLI-007','Jorge','Paredes','Calle Tarqui 890','0993692581'),('CLI-008','Elena','Cárdenas','Av. Loja 143','0951594837');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compra`
--

DROP TABLE IF EXISTS `compra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compra` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `fecha` date NOT NULL,
  `codigo_cliente` varchar(10) NOT NULL,
  `codigo_producto` varchar(10) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_compra_cliente` (`codigo_cliente`),
  KEY `fk_compra_producto` (`codigo_producto`),
  CONSTRAINT `fk_compra_cliente` FOREIGN KEY (`codigo_cliente`) REFERENCES `cliente` (`codigo_cliente`),
  CONSTRAINT `fk_compra_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compra`
--

LOCK TABLES `compra` WRITE;
/*!40000 ALTER TABLE `compra` DISABLE KEYS */;
INSERT INTO `compra` VALUES (1,'2026-05-10','CLI-001','PROD-01'),(2,'2026-05-11','CLI-002','PROD-03'),(3,'2026-05-12','CLI-003','PROD-02'),(4,'2026-05-12','CLI-004','PROD-06'),(5,'2026-05-13','CLI-005','PROD-05'),(6,'2026-05-14','CLI-006','PROD-07'),(7,'2026-05-15','CLI-007','PROD-04'),(8,'2026-05-15','CLI-008','PROD-08');
/*!40000 ALTER TABLE `compra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `codigo_producto` varchar(10) NOT NULL,
  `descripcion` varchar(50) DEFAULT NULL,
  `precio` double NOT NULL,
  `numero_existencia` int NOT NULL,
  PRIMARY KEY (`codigo_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES ('PROD-01','Teclado Mecánico RGB',45.5,120),('PROD-02','Mouse Inalámbrico Ergonómico',25,200),('PROD-03','Monitor 24 Pulgadas FHD',189.99,45),('PROD-04','Auriculares Gamer con Micrófono',35.25,85),('PROD-05','Memoria RAM DDR4 16GB',65,150),('PROD-06','Disco Duro Sólido SSD 1TB',75.9,90),('PROD-07','Tarjeta de Video RTX 4060',420,15),('PROD-08','Fuente de Poder 750W 80 Plus',89,30);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedor`
--

DROP TABLE IF EXISTS `proveedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedor` (
  `codigo_proveedor` varchar(10) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `apellido` varchar(25) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `provincia` varchar(25) NOT NULL,
  `numero_telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`codigo_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedor`
--

LOCK TABLES `proveedor` WRITE;
/*!40000 ALTER TABLE `proveedor` DISABLE KEYS */;
INSERT INTO `proveedor` VALUES ('PROV-01','Pedro','Gómez','Zona Industrial Norte','Pichincha','022345678'),('PROV-02','Lucía','Torres','Av. Juan Tanca Marengo','Guayas','042987654'),('PROV-03','Manuel','Ramos','Calle El Batán','Azuay','072154879'),('PROV-04','Sofía','Castro','Av. Cevallos','Tungurahua','032654987'),('PROV-05','Ricardo','Vargas','Calle Bolívar','Loja','072573412'),('PROV-06','Gabriela','Mora','Av. 25 de Junio','El Oro','072938475'),('PROV-07','Fernando','Ortiz','Calle Olmedo','Manabí','052634789'),('PROV-08','Patricia','Rojas','Av. 12 de Noviembre','Tungurahua','032415263');
/*!40000 ALTER TABLE `proveedor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suministra`
--

DROP TABLE IF EXISTS `suministra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `suministra` (
  `id_suministra` int NOT NULL AUTO_INCREMENT,
  `codigo_producto` varchar(10) NOT NULL,
  `codigo_proveedor` varchar(10) NOT NULL,
  PRIMARY KEY (`id_suministra`),
  KEY `fk_suministra_producto` (`codigo_producto`),
  KEY `fk_suministra_proveedor` (`codigo_proveedor`),
  CONSTRAINT `fk_suministra_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`codigo_producto`),
  CONSTRAINT `fk_suministra_proveedor` FOREIGN KEY (`codigo_proveedor`) REFERENCES `proveedor` (`codigo_proveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suministra`
--

LOCK TABLES `suministra` WRITE;
/*!40000 ALTER TABLE `suministra` DISABLE KEYS */;
INSERT INTO `suministra` VALUES (1,'PROD-01','PROV-01'),(2,'PROD-03','PROV-02'),(3,'PROD-02','PROV-03'),(4,'PROD-06','PROV-04'),(5,'PROD-05','PROV-05'),(6,'PROD-07','PROV-06'),(7,'PROD-04','PROV-07'),(8,'PROD-08','PROV-08');
/*!40000 ALTER TABLE `suministra` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-24 16:28:05
