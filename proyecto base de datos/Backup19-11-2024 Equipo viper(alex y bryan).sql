-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto_bebidas
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `agua`
--

DROP TABLE IF EXISTS `agua`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agua` (
  `ID_Agua` int NOT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int NOT NULL,
  `Precios` int DEFAULT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int NOT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Agua`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `agua_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agua`
--

LOCK TABLES `agua` WRITE;
/*!40000 ALTER TABLE `agua` DISABLE KEYS */;
INSERT INTO `agua` VALUES (1,'glaciar',1,2000,'2030-08-27','2-L',45,1),(2,'villavicencio',1,1700,'2025-03-02','1,5-L',30,1),(3,'smartwater',2,2250,'2024-11-24','1-L',15,1),(4,'villa_del_sur',2,2500,'2025-12-02','2,5-L',4,1),(5,'eco',2,1500,'2022-06-07','2-L',2,1),(7,'aguita',1,2500,'2026-11-23','1-L',12,1);
/*!40000 ALTER TABLE `agua` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `agua_saborizadas`
--

DROP TABLE IF EXISTS `agua_saborizadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `agua_saborizadas` (
  `ID_Jugos` int NOT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `Gustos` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int NOT NULL,
  `Precios` int NOT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Jugos`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `agua_saborizadas_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `agua_saborizadas`
--

LOCK TABLES `agua_saborizadas` WRITE;
/*!40000 ALTER TABLE `agua_saborizadas` DISABLE KEYS */;
INSERT INTO `agua_saborizadas` VALUES (1,'placer','manzana',3,1400,'2026','1,5-L',47,1),(2,'baggio','multifruti',1,3000,'2026','2-L',100,1),(3,'ades','pera',2,2500,'2026','1-L',57,1),(4,'cepita','naranja',4,2000,'2026','1,5-L',29,1),(5,'tutti','frutilla',5,1200,'2026','1-L',10,1),(6,'baggio','manzana',1,3000,'2026','2-L',43,1),(7,'baggio','multifruta',1,1500,'2026-11-24','1-L',23,1),(8,'baggio','pera',2,3000,'2026-11-25','1-L',40,1),(9,'MarcaX','Limón',1,150,'2024-12-31','1.5L',100,1);
/*!40000 ALTER TABLE `agua_saborizadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_agua_saborizadas`
--

DROP TABLE IF EXISTS `auditoria_agua_saborizadas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_agua_saborizadas` (
  `ID_Auditoria` int NOT NULL AUTO_INCREMENT,
  `ID_Jugos` int DEFAULT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `Gustos` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int DEFAULT NULL,
  `Precios` int DEFAULT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  `Operacion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_agua_saborizadas`
--

LOCK TABLES `auditoria_agua_saborizadas` WRITE;
/*!40000 ALTER TABLE `auditoria_agua_saborizadas` DISABLE KEYS */;
INSERT INTO `auditoria_agua_saborizadas` VALUES (1,9,'MarcaX','Limón',1,150,'2024-12-31','1.5L',100,1,'INSERT','2024-11-12 18:19:48',NULL);
/*!40000 ALTER TABLE `auditoria_agua_saborizadas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auditoria_gaseosas`
--

DROP TABLE IF EXISTS `auditoria_gaseosas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auditoria_gaseosas` (
  `ID_Auditoria` int NOT NULL AUTO_INCREMENT,
  `ID_Gaseosas` int DEFAULT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `Gustos` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int DEFAULT NULL,
  `Precios` int DEFAULT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  `Operacion` enum('INSERT','UPDATE','DELETE') DEFAULT NULL,
  `Fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `Usuario` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_Auditoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auditoria_gaseosas`
--

LOCK TABLES `auditoria_gaseosas` WRITE;
/*!40000 ALTER TABLE `auditoria_gaseosas` DISABLE KEYS */;
INSERT INTO `auditoria_gaseosas` VALUES (1,14,'Tai','Naranja',1,150,'2024-12-31','1.5L',100,1,'INSERT','2024-11-14 19:30:16',NULL);
/*!40000 ALTER TABLE `auditoria_gaseosas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `baggio_info`
--

DROP TABLE IF EXISTS `baggio_info`;
/*!50001 DROP VIEW IF EXISTS `baggio_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `baggio_info` AS SELECT 
 1 AS `Marcas`,
 1 AS `gustos`,
 1 AS `Precios`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `bebidas_alcohólicas`
--

DROP TABLE IF EXISTS `bebidas_alcohólicas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebidas_alcohólicas` (
  `ID_Alcohol` int NOT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `Gustos` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int NOT NULL,
  `Precios` int NOT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Alcohol`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `bebidas_alcohólicas_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebidas_alcohólicas`
--

LOCK TABLES `bebidas_alcohólicas` WRITE;
/*!40000 ALTER TABLE `bebidas_alcohólicas` DISABLE KEYS */;
INSERT INTO `bebidas_alcohólicas` VALUES (1,'brama','normal',1,2200,'2026-10-24','1-L',350,1),(2,'quilmes','light',2,2200,'2026-07-04','1-L',120,1),(3,'doña_paula','blanco',2,4700,'2027-01-09','1-L',57,1),(4,'fernet_branca','normal',7,9000,'2027-09-11','1-L',15,1),(5,'gancia','pomelo',1,5000,'2027-02-14','1-L',10,1),(6,'fernet_buhonero','original',7,6000,'11/9/2027','1-L',30,1),(7,'gancia','original',8,4000,'14/2/2027','1-L',21,1),(8,'viñas_de_alvino','tinto',9,3000,'9/1/2027','1-L',70,1),(9,'fernet_1882','original',7,7000,'11/9/2027','1-L',40,1),(10,'fernet_branca','menta',7,8000,'11/9/2027','1-L',65,1);
/*!40000 ALTER TABLE `bebidas_alcohólicas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bebidas_energizante`
--

DROP TABLE IF EXISTS `bebidas_energizante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bebidas_energizante` (
  `ID_Energizante` int NOT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `Gustos` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int NOT NULL,
  `Precios` int NOT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Energizante`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `bebidas_energizante_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bebidas_energizante`
--

LOCK TABLES `bebidas_energizante` WRITE;
/*!40000 ALTER TABLE `bebidas_energizante` DISABLE KEYS */;
INSERT INTO `bebidas_energizante` VALUES (2,'geitorade','naranja',4,2400,'2028-07-20','1-L',80,1),(3,'redbull','normal',10,3000,'2026-10-23','750-ml',80,1),(4,'speed','normal',1,1500,'2028-02-21','1-L',80,1),(6,'geitorade','uva',4,2400,'2028-07-20','1-L',80,1),(7,'geitorade','manzana',4,2400,'2028-07-20','1-L',80,1),(8,'geitorade','cereza',4,2400,'2028-07-20','1-L',80,1),(9,'geitorade','durazno',4,2400,'2028-07-20','1-L',80,1),(10,'Prime','Limón',5,2000,'2025-12-12','1-L',80,1),(11,'aguadetamarindo','tamarindo',6,2000,'2024-06-07',NULL,80,1);
/*!40000 ALTER TABLE `bebidas_energizante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `clientes_info`
--

DROP TABLE IF EXISTS `clientes_info`;
/*!50001 DROP VIEW IF EXISTS `clientes_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `clientes_info` AS SELECT 
 1 AS `nombre_cliente`,
 1 AS `edad_cliente`,
 1 AS `documento`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `detalles_pedidos`
--

DROP TABLE IF EXISTS `detalles_pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `detalles_pedidos` (
  `ID_Productos` int NOT NULL,
  `ID_Pedidos` int DEFAULT NULL,
  `Precios` int DEFAULT NULL,
  `Cantidad` int DEFAULT NULL,
  `Descuentos` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Productos`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `detalles_pedidos_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalles_pedidos`
--

LOCK TABLES `detalles_pedidos` WRITE;
/*!40000 ALTER TABLE `detalles_pedidos` DISABLE KEYS */;
INSERT INTO `detalles_pedidos` VALUES (1,1,2000,2,1000,1),(2,2,3000,4,1500,1),(3,3,2000,6,6000,1),(4,4,2800,2,1400,1),(5,5,9000,1,0,1);
/*!40000 ALTER TABLE `detalles_pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `distribuidores`
--

DROP TABLE IF EXISTS `distribuidores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `distribuidores` (
  `ID_distribuidor` int NOT NULL,
  `marca_distribuidor` varchar(20) DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_distribuidor`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `distribuidores_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `distribuidores`
--

LOCK TABLES `distribuidores` WRITE;
/*!40000 ALTER TABLE `distribuidores` DISABLE KEYS */;
INSERT INTO `distribuidores` VALUES (1,'baggio',1),(2,'manaos',1),(3,'ades',1),(4,'geitorade',1),(5,'z',1),(6,'monster',1),(7,'fernets',1),(8,'gancia',1),(9,'vinos',1),(10,'redbull',1);
/*!40000 ALTER TABLE `distribuidores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `fernecito_info`
--

DROP TABLE IF EXISTS `fernecito_info`;
/*!50001 DROP VIEW IF EXISTS `fernecito_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `fernecito_info` AS SELECT 
 1 AS `Marcas`,
 1 AS `gustos`,
 1 AS `Precios`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `gaseosas`
--

DROP TABLE IF EXISTS `gaseosas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gaseosas` (
  `ID_Gaseosas` int NOT NULL,
  `Marcas` varchar(20) DEFAULT NULL,
  `Gustos` varchar(20) DEFAULT NULL,
  `ID_Distribuidor` int NOT NULL,
  `Precios` int NOT NULL,
  `Fecha_de_vencimientos` varchar(20) DEFAULT NULL,
  `Embase_por_litro` varchar(20) DEFAULT NULL,
  `stock_lote` int NOT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Gaseosas`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `gaseosas_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gaseosas`
--

LOCK TABLES `gaseosas` WRITE;
/*!40000 ALTER TABLE `gaseosas` DISABLE KEYS */;
INSERT INTO `gaseosas` VALUES (1,'manaos','uva',1,1200,'2028-07-01','1-L',129,1),(2,'fanta','naranja',2,2300,'2028-07-01','2-L',20,1),(3,'coca-cola','cola',3,2800,'2028-07-01','3-L',10,1),(4,'sprite','lima',4,2500,'2028-09-01','2,25-L',28,1),(5,'pepsi','cola',5,1800,'2028-09-01','1,5-L',10,1),(6,'manao','manzana',1,1200,'2028-07-01','1-L',24,1),(7,'manaos','naranja',1,2800,'2026-11-25','1-L',400,1),(8,'manaos','pomelo_blanco',1,1200,'2026-11-24','1-L',78,1),(9,'manaos','pomelo_rosado',2,1200,'2026-11-24','1L',40,1),(10,'manaos','pomelo_amarillo',2,1200,'2026-11-24','1L',40,1),(11,'manaos','lima',2,1200,'2026-11-24','1L',40,1),(12,'manaos','cola',2,1200,'2026-11-24','1L',10,1),(13,'manaos','limon',2,1200,'2026-11-24','1L',50,1),(14,'Tai','Naranja',1,150,'2024-12-31','1.5L',100,1);
/*!40000 ALTER TABLE `gaseosas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `geitorade_info`
--

DROP TABLE IF EXISTS `geitorade_info`;
/*!50001 DROP VIEW IF EXISTS `geitorade_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `geitorade_info` AS SELECT 
 1 AS `Marcas`,
 1 AS `gustos`,
 1 AS `Precios`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `local_viper`
--

DROP TABLE IF EXISTS `local_viper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_viper` (
  `ID_local` int NOT NULL,
  `ID_Gaseosas` int NOT NULL,
  `ID_agua` int NOT NULL,
  `ID_Jugo` int NOT NULL,
  `ID_Alcohol` int NOT NULL,
  `ID_Energizante` int NOT NULL,
  `ID_Ventas` int NOT NULL,
  `ID_Productos` int NOT NULL,
  `ID_Clientes` int NOT NULL,
  `Direccion` varchar(20) DEFAULT NULL,
  `Nombre_Local` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`ID_local`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_viper`
--

LOCK TABLES `local_viper` WRITE;
/*!40000 ALTER TABLE `local_viper` DISABLE KEYS */;
INSERT INTO `local_viper` VALUES (1,4,1,2,5,3,1,1,1,'avenida siempre viva','Local_Viper');
/*!40000 ALTER TABLE `local_viper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidad_clientes`
--

DROP TABLE IF EXISTS `localidad_clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidad_clientes` (
  `ID_localidad_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre_cliente` varchar(20) DEFAULT NULL,
  `edad_cliente` int DEFAULT NULL,
  `documento` varchar(20) DEFAULT NULL,
  `ID_localidad` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_localidad_cliente`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `localidad_clientes_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidad_clientes`
--

LOCK TABLES `localidad_clientes` WRITE;
/*!40000 ALTER TABLE `localidad_clientes` DISABLE KEYS */;
INSERT INTO `localidad_clientes` VALUES (1,'sandro',27,'45982674',1,1),(2,'tomas',76,'63512486',2,1),(3,'juanito',20,'46512364',2,1),(4,'ramon',47,'12109897',1,1);
/*!40000 ALTER TABLE `localidad_clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localidades`
--

DROP TABLE IF EXISTS `localidades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localidades` (
  `ID_localidades` int NOT NULL AUTO_INCREMENT,
  `nombre_localidad` varchar(20) DEFAULT NULL,
  `ID_localidad` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_localidades`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `localidades_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localidades`
--

LOCK TABLES `localidades` WRITE;
/*!40000 ALTER TABLE `localidades` DISABLE KEYS */;
INSERT INTO `localidades` VALUES (1,'matanza',1,1),(2,'san francisco',2,NULL),(3,'moron',3,NULL);
/*!40000 ALTER TABLE `localidades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `manaos_info`
--

DROP TABLE IF EXISTS `manaos_info`;
/*!50001 DROP VIEW IF EXISTS `manaos_info`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `manaos_info` AS SELECT 
 1 AS `Marcas`,
 1 AS `gustos`,
 1 AS `Precios`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `ID_Productos` int NOT NULL,
  `Nombre_de_Productos` varchar(20) DEFAULT NULL,
  `Cantidad_por_Unidad` int DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Productos`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'agua',12,1),(2,'agua saborizada',12,1),(3,'energizante',12,1),(4,'gaseosa',12,1),(5,'bebidas_alcoholicas',12,1);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `ID_Ventas` int NOT NULL,
  `ID_Clientes` int NOT NULL,
  `Precios` int NOT NULL,
  `Fiado` varchar(20) DEFAULT NULL,
  `Descuentos` int DEFAULT NULL,
  `Unidades_Vendidas` int DEFAULT NULL,
  `Pedidos` varchar(20) DEFAULT NULL,
  `Formas_de_Pago` varchar(20) DEFAULT NULL,
  `ID_local` int DEFAULT NULL,
  PRIMARY KEY (`ID_Ventas`),
  KEY `ID_local` (`ID_local`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_local`) REFERENCES `local_viper` (`ID_local`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,1,2000,'si',1000,2,'no','Fiado',1),(2,2,3000,'no',1500,4,'no','Efectivo',1),(3,3,2000,'no',6000,6,'no','Debito',1),(4,4,2800,'no',1400,2,'no','Mercado Pago',1),(5,5,9000,'no',0,1,'no','Credito',1);
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `baggio_info`
--

/*!50001 DROP VIEW IF EXISTS `baggio_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `baggio_info` AS select `agua_saborizadas`.`Marcas` AS `Marcas`,`agua_saborizadas`.`Gustos` AS `gustos`,`agua_saborizadas`.`Precios` AS `Precios` from `agua_saborizadas` where (`agua_saborizadas`.`ID_Distribuidor` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `clientes_info`
--

/*!50001 DROP VIEW IF EXISTS `clientes_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `clientes_info` AS select `localidad_clientes`.`nombre_cliente` AS `nombre_cliente`,`localidad_clientes`.`edad_cliente` AS `edad_cliente`,`localidad_clientes`.`documento` AS `documento` from `localidad_clientes` where (`localidad_clientes`.`ID_localidad` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `fernecito_info`
--

/*!50001 DROP VIEW IF EXISTS `fernecito_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `fernecito_info` AS select `bebidas_alcohólicas`.`Marcas` AS `Marcas`,`bebidas_alcohólicas`.`Gustos` AS `gustos`,`bebidas_alcohólicas`.`Precios` AS `Precios` from `bebidas_alcohólicas` where (`bebidas_alcohólicas`.`ID_Distribuidor` = 7) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `geitorade_info`
--

/*!50001 DROP VIEW IF EXISTS `geitorade_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `geitorade_info` AS select `bebidas_energizante`.`Marcas` AS `Marcas`,`bebidas_energizante`.`Gustos` AS `gustos`,`bebidas_energizante`.`Precios` AS `Precios` from `bebidas_energizante` where (`bebidas_energizante`.`ID_Distribuidor` = 4) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `manaos_info`
--

/*!50001 DROP VIEW IF EXISTS `manaos_info`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `manaos_info` AS select `gaseosas`.`Marcas` AS `Marcas`,`gaseosas`.`Gustos` AS `gustos`,`gaseosas`.`Precios` AS `Precios` from `gaseosas` where (`gaseosas`.`ID_Distribuidor` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-19 16:16:40
