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
-- Table structure for table `client_history`
--

DROP TABLE IF EXISTS `client_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `client_history` (
  `id_client_history` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `date` date DEFAULT NULL,
  `total_amount` float DEFAULT NULL,
  PRIMARY KEY (`id_client_history`),
  UNIQUE KEY `id_client_history_UNIQUE` (`id_client_history`),
  KEY `fk_client_history_clients1_idx` (`id_client`),
  CONSTRAINT `fk_client_history_clients1` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client_history`
--

LOCK TABLES `client_history` WRITE;
/*!40000 ALTER TABLE `client_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `client_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clients`
--

DROP TABLE IF EXISTS `clients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clients` (
  `id_client` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cpf` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_client`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clients`
--

LOCK TABLES `clients` WRITE;
/*!40000 ALTER TABLE `clients` DISABLE KEYS */;
INSERT INTO `clients` VALUES (1,'João Silva','123.456.789-10'),(2,'Maria Oliveira','987.654.321-00'),(3,'Carlos Souza','456.789.123-99'),(4,'Ana Pereira','789.123.456-88'),(5,'Pedro Lima','321.654.987-77'),(6,'Paula Costa','654.321.987-66'),(7,'Marcos Almeida','987.123.654-55'),(8,'Fernanda Gonçalves','123.987.654-44'),(9,'Ricardo Santos','456.321.789-33'),(10,'Juliana Ribeiro','789.456.123-22');
/*!40000 ALTER TABLE `clients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `companies`
--

DROP TABLE IF EXISTS `companies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `companies` (
  `id_company` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `cnpj` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_company`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `companies`
--

LOCK TABLES `companies` WRITE;
/*!40000 ALTER TABLE `companies` DISABLE KEYS */;
INSERT INTO `companies` VALUES (1,'Tech Solutions','12.345.678/0001-90','Rua das Flores, 123'),(2,'Innovative Tech','98.765.432/0001-10','Avenida Central, 456'),(3,'Gadget World','56.789.012/0001-34','Rua do Comércio, 789'),(4,'Digital Devices','23.456.789/0001-67','Avenida Paulista, 101'),(5,'Future Tech','34.567.890/0001-78','Rua da Tecnologia, 202'),(6,'Smart Gadgets','45.678.901/0001-89','Praça das Inovações, 303'),(7,'Modern Solutions','67.890.123/0001-45','Rua dos Avanços, 404'),(8,'Next Gen Tech','78.901.234/0001-56','Avenida das Descobertas, 505'),(9,'Advanced Tech','89.012.345/0001-67','Rua dos Pioneiros, 606'),(10,'Cutting Edge Devices','90.123.456/0001-78','Avenida da Revolução, 707');
/*!40000 ALTER TABLE `companies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_itens`
--

DROP TABLE IF EXISTS `order_itens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_itens` (
  `id_order_itens` int NOT NULL AUTO_INCREMENT,
  `id_order` int NOT NULL,
  `id_product` int NOT NULL,
  `quantity` float DEFAULT NULL,
  PRIMARY KEY (`id_order_itens`),
  KEY `fk_order_itens_orders1_idx` (`id_order`),
  KEY `fk_order_itens_products1_idx` (`id_product`),
  CONSTRAINT `fk_order_itens_orders1` FOREIGN KEY (`id_order`) REFERENCES `orders` (`id_order`),
  CONSTRAINT `fk_order_itens_products1` FOREIGN KEY (`id_product`) REFERENCES `products` (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_itens`
--

LOCK TABLES `order_itens` WRITE;
/*!40000 ALTER TABLE `order_itens` DISABLE KEYS */;
INSERT INTO `order_itens` VALUES (1,1,1,2),(2,1,2,1),(3,2,3,1),(4,2,4,2),(5,3,5,1),(6,3,6,3),(7,4,7,1),(8,4,8,2),(9,5,9,1),(10,5,10,1),(11,6,11,2),(12,6,12,1),(13,7,13,1),(14,7,14,2),(15,8,15,1),(16,8,1,3),(17,9,2,1),(18,9,3,2),(19,10,4,1),(20,10,5,1);
/*!40000 ALTER TABLE `order_itens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `id_order` int NOT NULL AUTO_INCREMENT,
  `id_client` int NOT NULL,
  `id_company` int NOT NULL,
  `date` date DEFAULT NULL,
  PRIMARY KEY (`id_order`),
  UNIQUE KEY `idorders_UNIQUE` (`id_order`),
  KEY `fk_orders_clients_idx` (`id_client`),
  KEY `fk_orders_companies1_idx` (`id_company`),
  CONSTRAINT `fk_orders_clients` FOREIGN KEY (`id_client`) REFERENCES `clients` (`id_client`),
  CONSTRAINT `fk_orders_companies1` FOREIGN KEY (`id_company`) REFERENCES `companies` (`id_company`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,1,'2024-01-15'),(2,2,2,'2024-02-10'),(3,3,3,'2024-03-05'),(4,4,4,'2024-04-20'),(5,5,5,'2024-05-25'),(6,6,6,'2024-06-30'),(7,7,7,'2024-07-04'),(8,8,8,'2024-08-18'),(9,9,9,'2024-09-22'),(10,10,10,'2024-10-15');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `products` (
  `id_product` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `year_manufacture` date DEFAULT NULL,
  PRIMARY KEY (`id_product`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Smartphone X',1500,'2021-06-15'),(2,'Notebook Pro',4500,'2022-01-10'),(3,'Tablet Z',1200,'2020-11-05'),(4,'Smartwatch Y',800,'2023-03-20'),(5,'Câmera W',2500,'2019-07-30'),(6,'Monitor HD',900,'2021-05-22'),(7,'Headphones',300,'2022-08-19'),(8,'Mouse Gamer',150,'2023-01-03'),(9,'Teclado Mecânico',400,'2020-12-11'),(10,'Impressora 3D',3500,'2018-11-15'),(11,'Smart TV',3200,'2021-07-25'),(12,'Console de Jogos',2500,'2020-09-14'),(13,'Drone',1500,'2019-04-05'),(14,'Bicicleta Elétrica',6000,'2023-06-20'),(15,'Projetor',1800,'2022-03-18');
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-04  9:54:22
