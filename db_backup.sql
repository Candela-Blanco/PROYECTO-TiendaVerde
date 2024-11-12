-- MariaDB dump 10.19  Distrib 10.11.6-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: tiendaverde
-- ------------------------------------------------------
-- Server version	10.11.6-MariaDB-0+deb12u1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ensalada_ingrediente`
--

DROP TABLE IF EXISTS `ensalada_ingrediente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensalada_ingrediente` (
  `id_ensalada` int(11) NOT NULL,
  `id_ingrediente` int(11) NOT NULL,
  PRIMARY KEY (`id_ensalada`,`id_ingrediente`),
  KEY `id_ingrediente` (`id_ingrediente`),
  CONSTRAINT `ensalada_ingrediente_ibfk_1` FOREIGN KEY (`id_ensalada`) REFERENCES `ensaladas` (`id`),
  CONSTRAINT `ensalada_ingrediente_ibfk_2` FOREIGN KEY (`id_ingrediente`) REFERENCES `ingredientes` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensalada_ingrediente`
--

LOCK TABLES `ensalada_ingrediente` WRITE;
/*!40000 ALTER TABLE `ensalada_ingrediente` DISABLE KEYS */;
INSERT INTO `ensalada_ingrediente` VALUES
(16,3),
(16,9),
(16,10),
(18,7),
(18,9),
(19,9),
(19,25),
(19,29),
(19,30),
(19,31),
(20,3),
(20,10),
(20,17),
(20,28),
(20,29),
(21,14),
(21,19),
(21,20),
(21,21),
(21,25),
(21,32),
(22,7),
(22,10),
(22,13),
(22,29),
(22,32),
(22,37),
(22,38),
(23,3),
(23,9),
(23,10),
(23,13),
(23,17),
(23,28),
(23,29),
(24,7),
(24,9),
(24,16),
(24,18),
(24,24),
(24,38),
(25,9),
(25,10),
(25,14),
(25,25),
(25,29),
(26,21),
(26,29),
(26,32),
(26,38),
(26,39),
(26,40),
(26,41);
/*!40000 ALTER TABLE `ensalada_ingrediente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ensaladas`
--

DROP TABLE IF EXISTS `ensaladas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ensaladas` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `precio` float NOT NULL,
  `peso` float NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ensaladas`
--

LOCK TABLES `ensaladas` WRITE;
/*!40000 ALTER TABLE `ensaladas` DISABLE KEYS */;
INSERT INTO `ensaladas` VALUES
(16,'Mixta',1200.5,450),
(18,'Cruda',1200,500),
(19,'César',8000,250),
(20,'Mediterránea',9000,250),
(21,'Tropical',10000,280),
(22,'Quinoa',11000,320),
(23,'Griega',8500,250),
(24,'Atún y Manzana',7000,260),
(25,'Pollo y Aguacate',9000,300),
(26,'Frutos Rojos',10500,270);
/*!40000 ALTER TABLE `ensaladas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredientes`
--

DROP TABLE IF EXISTS `ingredientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ingredientes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredientes`
--

LOCK TABLES `ingredientes` WRITE;
/*!40000 ALTER TABLE `ingredientes` DISABLE KEYS */;
INSERT INTO `ingredientes` VALUES
(3,'Cebolla'),
(7,'Zanahoria'),
(9,'Lechuga'),
(10,'Tomate'),
(12,'Sandía'),
(13,'Pepino'),
(14,'Aguacate'),
(15,'Rábanos'),
(16,'Apio'),
(17,'Pimiento'),
(18,'Manzana'),
(19,'Mango'),
(20,'Piña'),
(21,'Fresas'),
(22,'Uvas'),
(23,'Granada'),
(24,'Atún'),
(25,'Pollo'),
(26,'Huevo Cocido'),
(27,'Tofu'),
(28,'Aceitunas'),
(29,'Queso'),
(30,'Limon'),
(31,'Crutones'),
(32,'Espinaca'),
(37,'Quinoa'),
(38,'Nueces'),
(39,'Rúcula'),
(40,'Arándanos'),
(41,'Frambuesas');
/*!40000 ALTER TABLE `ingredientes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-12 11:49:26
